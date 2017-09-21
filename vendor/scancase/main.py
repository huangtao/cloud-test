#coding: utf8

import ast
import constant
import util
import json
import sys
import re
import os, time
import hashlib

t = re.compile('testcase', re.I)

'''
    pyfile: python文件全路径
    pro_base_url: 项目根路径
    package: 包名
    module: 模块
    sub_module: 子模块
    modules: 模块和子模块数组
    module_desc: 模块描述
    version: 版本
    pycharm_project: 工程名
'''
def parsePy2Dict(pyfile, pro_base_url, package, module, sub_module, modules, module_desc, version, pycharm_project, project_kind):
    #===========================================================================
    # print 'package:' + package
    # print 'module:' + module
    # print 'sub_module:' + sub_module
    # print 'modules:' + str(modules)
    # print 'module_desc:' + str(module_desc)
    # print 'version:' + version
    #===========================================================================
    def _getAttributeValue(attribute):
        result = ''
        if type(attribute) == ast.Attribute:
            k = _getAttributeValue(attribute.value)
            result = result + k + '.' + attribute.attr
        elif type(attribute) == ast.Name:
            result = result + attribute.id
        return result
    result = []
    with open(pyfile) as f:
        try:
            p = ast.parse(f.read())
        except:
            return []
        # 把所有类选出来:  ast.ClassDef类型，且继承自TestCase及其子类
        classes = []
        for c in p.body:
            if type(c) == ast.ClassDef:
                # 先判断是否是已知列表里
                if list(set(constant.TARGET_BASE_CLASS).intersection(map(lambda name: name.id, c.bases))):
                    constant.TARGET_BASE_CLASS.append(c.name)
                    # 判断是否有run_test方法
                    if filter(lambda f: type(f) == ast.FunctionDef and f.name == 'run_test', c.body):
                        classes.append(c)
                # 再去匹配testcase
                elif filter(lambda name: t.search(name.id), c.bases):
                    constant.TARGET_BASE_CLASS.append(c.name)
                    # 判断是否有run_test方法
                    if filter(lambda f: type(f) == ast.FunctionDef and f.name == 'run_test', c.body):
                        classes.append(c)
        if module_desc == None:
            module_desc = p.body[0].value.s if p.body and type(p.body[0]) == ast.Expr else ''
        
        for c in classes:
            property = {}
            # 类名 (这个属性不会为空)
            for i in range(0, len(c.body)):
                property_object = c.body[i]
                # doc string只能是紧随类定义下面
                property['doc_string'] = property_object.value.s.strip().decode('utf-8') if i ==0 and type(property_object) == ast.Expr else property.get('doc_string', '')
                if type(property_object) == ast.Assign:
                    key = property_object.targets[0].id
                    value = property_object.value
                    if type(value) == ast.Str:
                        value = value.s
                    elif type(value) == ast.Num:
                        value = value.n
                    elif type(value) == ast.Name:
                        value = value.id
                    elif type(value) == ast.Attribute:
                        value = _getAttributeValue(value)
                    property[key] = value
            property['class_name'] = c.name
            property['local_path'] = pyfile
            property['base_url'] = pro_base_url
            property['project_name'] = util.basename(pro_base_url)
            property['package'] = package
            property['module'] = module
            property['sub_module'] = sub_module
            property['modules'] = modules
            property['module_desc'] = module_desc
            property['case_version'] = version
            property['logic_id'] = c.name.split('_')[0]
            property['name_for_query'] = '%s.%s.%s' % (package, sub_module, c.name)
            
            src = '%s%s' % (c.name, pyfile)
            m = hashlib.md5()
            m.update(src)
            property['id'] = m.hexdigest()
            
            filemt= time.localtime(os.stat(pyfile).st_mtime)
            property['mtime'] = time.strftime("%Y/%m/%d %H:%M:%S", filemt)
            
            property['pycharm_project'] = pycharm_project
            property['project_kind'] = project_kind
            result.append(property)
    return result

def checkout_or_update():
    # 是否checkout过
    code = util.exec_cmd('svn list')
    if code:
        cmd = 'svn checkout %s %s --username %s --password %s' % (constant.SVN_PROJECT_URL, constant.LOCAL_BASE_URL, constant.SVN_USER_NAME, constant.SVN_PASSWD)
        util.exec_cmd(cmd)
    else:
        # svn update
        util.exec_cmd('svn update')

def scan_cases(path):
    result = []
    # 项目种类
    project_kinds  = util.safely_list_dir(path)
    for project_kind in project_kinds:
        projects = util.safely_list_dir(path, project_kind)
        
        # 遍历项目
        for project in projects:
            versions = util.safely_list_dir(path, project_kind, project)
            # 遍历版本
            for version in versions:
                pycharm_projects = util.safely_list_dir(path, project_kind, project, version)
                # 遍历pycharm工程
                for pycharm_project in pycharm_projects:
                    case_dir = util.join(path, project_kind, project, version, pycharm_project, 'src', 'cases')
                    modules = util.safely_list_dir(case_dir)
                    for m in modules:
                        # 文件作为模块
                        if util.isfile(util.join(case_dir, m)):
                            if util.suffix(m) == '.py':
                                result.extend(parsePy2Dict(util.join(case_dir, m), util.join(path, project), 'cases', '', util.filename(m), [], None, version, pycharm_project, project_kind))
                        # 目录作为一级模块
                        else:
                            # 在目录下的__init__.py里获取模块描述
                            module_desc = ''
                            if util.isfile(util.join(case_dir, m, '__init__.py')):
                                f = open(util.join(case_dir, m, '__init__.py'))
                                p = ast.parse(f.read()).body
                                module_desc = p[0].value.s if p else ''
                                f.close()
                            for root, dirs, files in util.walk(util.join(case_dir, m)):
                                for file in files:
                                    if util.suffix(file) == '.py':
                                        modules = util.relative(util.join(root, file), case_dir)[0:-1]
                                        package = util.relative(util.join(root, file), util.dirname(case_dir))[0:-1]
                                        package = '.'.join(package)
                                        result.extend(parsePy2Dict(util.join(root, file), util.join(path, project), package, m, util.filename(file), modules, module_desc, version, pycharm_project, project_kind))

    return result

if '__main__' == __name__:
    # 没有参数
    if len(sys.argv) == 1:
        
        checkout_or_update()
        result = scan_cases(constant.LOCAL_BASE_URL)
        print json.JSONEncoder().encode(result)

    # 传入多个参数，这里只做特殊处理，规定只传文件过来
    elif len(sys.argv) >= 2:
        path = sys.argv[1]
        if util.suffix(path) != '.py':
            print []
        else:
            relative_path = util.relative(path, constant.LOCAL_BASE_URL)
            # 只有一个参数，文件跟项目同级，不考虑
            # 不满足的在特定目录下的
            if len(relative_path) < 7:
                print []
            else:
                modules = relative_path[6:-1] if relative_path[4] == 'src' and relative_path[5] == 'cases' else None
                if modules == None:
                    print []
                else:
                    try:
                        project_kind = relative_path[0]
                        project_name = relative_path[1]
                        version = relative_path[2]
                        pycharm_project = relative_path[3]
                        module = relative_path[6] if len(relative_path) > 7 else ''
                        sub_module = util.filename(relative_path[-1]) if len(relative_path) >=7  else ''
                        package = '.'.join(util.relative(path, util.join(constant.LOCAL_BASE_URL, project_kind, project_name, version, relative_path[3], 'src'))[0:-1])
                        cases = parsePy2Dict(path, util.join(constant.LOCAL_BASE_URL, project_kind, project_name), package, module, sub_module, modules, None, version, pycharm_project, project_kind)
                        print json.JSONEncoder().encode(cases)
                    except:
                        print []
        
