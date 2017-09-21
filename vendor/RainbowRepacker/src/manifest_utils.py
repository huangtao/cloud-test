#-*-coding:utf8 -*-

'''
Created on 2014-11-3

@author: junmeng
'''
import os.path
from xml.etree import ElementTree

import log_utils
import text_utils


androidNS = 'http://schemas.android.com/apk/res/android'
androidN = 'android'


#===============================================================================
# getPackageName 获取包名 此代码需要优化
#===============================================================================
def getPackageName(manifest):
    ElementTree.register_namespace(androidN, androidNS)
    targetTree = ElementTree.parse(manifest)
    root = targetTree.getroot()
    package = root.attrib.get('package')
    return package

#===============================================================================
# modifyManifest 根据配置修改AndroidManifest.xml文件并保存(暂时没有考虑内容重复性)
# srcManifest 需要修改的源AndroidManifest.xml文件
# manifestCfg 用于修改的配置文件（预处理文件）
# outManifest 输出Manifest的文件
#===============================================================================
# scrManifest: 反编译apk后的
# manifestCfg: 工具里面
def modifyManifest(srcManifest, manifestCfg, outManifest):
    log_utils.getLogger().debug('Merge Manifest')
    if not os.path.exists(srcManifest):
        log_utils.getLogger().warning('modifyManifest: srcManifest %s not exist!' % srcManifest)
        return False
    if not os.path.exists(manifestCfg):
        log_utils.getLogger().warning('modifyManifest: manifestCfg %s not exist!' % manifestCfg)
        return False
    ElementTree.register_namespace(androidN, androidNS)
    srcTree = ElementTree.parse(srcManifest)
    srcRoot = srcTree.getroot()
    srcAppNode = srcRoot.find('application')
    configTree = ElementTree.parse(manifestCfg)
    configRoot = configTree.getroot()
    configAppNode = configRoot.find('application')
    
    providerNode = configAppNode.find('provider')
    providerNode.set('android:authorities', getPackageName(srcManifest)+'.providers.element')
    srcAppNode.append(providerNode)
    prettyXml(srcRoot)
    srcTree.write(outManifest, 'UTF-8')
    log_utils.getLogger().debug('Merge Manifest Done')
    

#===============================================================================
# prettyXml 美化Xml格式
#===============================================================================
def prettyXml(elem, level=0):
    i = "\n" + level*"\t"
    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        for e in elem:
            prettyXml(e, level+1)
        if not e.tail or not e.tail.strip():
            e.tail = i
    if level and (not elem.tail or not elem.tail.strip()):
        elem.tail = i
    return elem

#===============================================================================
# renameManifestPackage 重命名AndroidManifest的packageName, 不会改变代码中的逻辑结构
# manifest AndroidManifest.xml path
# newPackageName AndroidManifest.xml 需要被重命名的packageName
#===============================================================================
def renameManifestPackage(manifest, newPackageName):
    manifest = os.path.abspath(manifest)
    
    if not os.path.exists(manifest):
        log_utils.getLogger().warning('renameManifestPackage: %s not exist!' % manifest)
        return False
    
    if text_utils.isStr(newPackageName) and text_utils.isEmpty(newPackageName):
        log_utils.getLogger().warning('renameManifestPackage: newPackageName isEmpty')
        return False
    
    ElementTree.register_namespace(androidN, androidNS)
    targetTree = ElementTree.parse(manifest)
    root = targetTree.getroot()
    oldPackageName = root.attrib.get('package')
    log_utils.getLogger().debug('original packageName == %s' % oldPackageName)
    
    if oldPackageName == newPackageName:
        log_utils.getLogger().debug('original packageName is same as newPackageName')
        return True
    
    keyName = '{' + androidNS + '}name'
    keyProcess = '{' + androidNS + '}process'
    keyAuthorities = '{' + androidNS + '}authorities'
    applicationNode = root.find('application')
    
    def modifyComponentName(node):
        '''将组件名称中的旧包名替换为新包名'''
        if keyName not in node.attrib:
            return
        name = node.attrib[keyName]
        if name.startswith('.'):
            name = newPackageName + name
        elif '.' not in name:
            name = newPackageName + '.' + name
        elif name.startswith(oldPackageName):
            name = name.replace(oldPackageName, newPackageName)
        node.attrib[keyName] = name
        
    def modifyComponentProcess(node):
        '''将进程名中的旧包名替换为新包名'''
        if keyProcess not in node.attrib:
            return
        processName = node.attrib[keyProcess]
        if processName.startswith('.'):
            return
        elif processName.startswith(':'):
            return
        elif oldPackageName in processName:
            processName = processName.replace(oldPackageName, newPackageName)
            node.attrib[keyProcess] = processName
    
    def modifyComponentAuthorities(node):
        '''将Authorities中的旧包名替换为新包名'''
        if keyAuthorities not in node.attrib:
            return
        authorities = node.attrib[keyAuthorities]
        log_utils.getLogger().debug("origin authorities = {}".format(authorities))
        authorities = authorities.replace(oldPackageName, newPackageName)
        log_utils.getLogger().debug("new authorities = %s" % authorities)
        node.attrib[keyAuthorities] = authorities;
        
    
    if applicationNode != None:
        # 重名名Application节点本身android:name
        modifyComponentName(applicationNode)
        
        # 重命名四大组件
        activityList = applicationNode.findall('activity')
        if activityList != None and len(activityList) > 0:
            for node in activityList:
                modifyComponentName(node)
                modifyComponentProcess(node)
                modifyComponentAuthorities(node)

        serviceList = applicationNode.findall('service')
        if serviceList != None and len(serviceList) > 0:
            for node in serviceList:
                modifyComponentName(node)
                modifyComponentProcess(node)
                modifyComponentAuthorities(node)
        
        receiverList = applicationNode.findall('receiver')
        if receiverList != None and len(receiverList) > 0:
            for node in receiverList:
                modifyComponentName(node)
                modifyComponentProcess(node)
                modifyComponentAuthorities(node)
                
        providerList = applicationNode.findall('provider')
        if providerList != None and len(providerList) > 0:
            for node in providerList:
                modifyComponentName(node)
                modifyComponentProcess(node)
                modifyComponentAuthorities(node)

    root.attrib['package'] = newPackageName
    prettyXml(root)
    targetTree.write(manifest, 'UTF-8')
    log_utils.getLogger().debug('renameManifestPackage done')
    return True

#===============================================================================
# getAppIconName 根据AndroidManifest.xml获取应用icon
# manifest AndroidManifest.xml 的path
# enableModify 为True时，如果该Manifest中没有声明android:icon，则将其声明为@drawable/ic_launcher，并修改保存
#              为False时，不修改保存该manifest
#===============================================================================
def getAppIconName(manifest, enableModify = True):
    ElementTree.register_namespace(androidN, androidNS)
    if not os.path.exists(manifest):
        log_utils.getLogger().debug('file %s does not exits' % manifest)
        return False
    tree = ElementTree.parse(manifest)
    root = tree.getroot()
    android_name = '{' + androidNS + '}name'
    android_icon = '{' + androidNS + '}icon'
    icon = None
    applicationNode = root.find('application')
    if applicationNode is None:
        return None
    activityNodeList = applicationNode.findall('activity')
    if activityNodeList is not None:
        for activityNode in activityNodeList:
            intentFilterNodeList = activityNode.findall('intent-filter')
            if intentFilterNodeList is None:
                continue
            for intentFilterNode in intentFilterNodeList:
                hasFindAction, hasFindCategory = False, False
                actionNodeList = intentFilterNode.findall('action')
                
                '''如果actvity的intent-filter中同时存在action == 'android.intent.action.MAIN':
                category == android.intent.category.LAUNCHER，就是启动器启动activity
                '''
                for actionNode in actionNodeList:
                    if actionNode.attrib[android_name] == 'android.intent.action.MAIN':
                        # 找到action
                        hasFindAction = True
                        break
                
                if not hasFindAction:
                    continue
                
                categoryNodeList = intentFilterNode.findall('category')
                for categoryNode in categoryNodeList:
                    if categoryNode.attrib[android_name] == 'android.intent.category.LAUNCHER':
                        # 找到category
                        hasFindCategory = True
                        break
                    
                if hasFindAction and hasFindCategory:
                    # 确认此activity为启动器启动Activity
                    icon = activityNode.attrib.get(android_icon)
                    break
    
    if icon is None:
        icon = applicationNode.attrib.get(android_icon)
    if icon is None:
        icon = '@drawable/ic_launcher'
        if enableModify:
            applicationNode.attrib[android_icon] = icon
            tree.write(manifest,'UTF-8')
    
    log_utils.getLogger().debug('android:icon', icon, sep = ' == ')
    
    iconName = 'ic_launcher'
    drawable = '@drawable/'
    idxDrawable = icon.find(drawable)
    if idxDrawable != -1:
        iconName = icon[idxDrawable + len(drawable):]
    log_utils.getLogger().debug('getAppIconName iconName', iconName, sep = ' == ')
    return iconName

#===============================================================================
# modifyManifestForTestBundle 根据配置修改测试桩的AndroidManifest.xml文件并保存
# srcManifest 需要修改的源AndroidManifest.xml文件
# manifestCfg 用于修改的配置文件（预处理文件）
# outManifest 输出Manifest的文件
# targetPackageName待测
#===============================================================================
def modifyManifestForTestBundle(srcManifest, outManifest, targetPackageName):
    log_utils.getLogger().debug('Merge Manifest')
    if not os.path.exists(srcManifest):
        log_utils.getLogger().warning('modifyManifest: srcManifest %s not exist!' % srcManifest)
        return False
        return False
    ElementTree.register_namespace(androidN, androidNS)
    srcTree = ElementTree.parse(srcManifest)
    srcRoot = srcTree.getroot()
    srcInstrumentationNode = srcRoot.find('instrumentation')
    srcInstrumentationNode.clear()
    srcInstrumentationNode.set('android:name', "android.test.InstrumentationTestRunner")
    srcInstrumentationNode.set('android:targetPackage', targetPackageName)
    prettyXml(srcRoot)
    srcTree.write(outManifest, 'UTF-8')
    log_utils.getLogger().debug('Merge Manifest Done')

def getSearchedString(manifestPath, expression):
    fopen = open(manifestPath, 'r+')
    import re
    for line in fopen:
        retObj = re.search(expression, line)
        if retObj is not None:
            return retObj.group(0)
# manifestFile = 'AndroidManifest.xml'
# manifestCfg = 'ForManifest.xml'
# manifestOut = 'outManifest.xml'
# modifyManifest(manifestFile, manifestCfg, manifestOut)

# renameManifestPackage('AndroidManifest.xml', 'com.godsdk.test')
# log_utils.getLogger().debug(getAppIconName('AndroidManifest.xml', False))
if __name__ == '__main__':
    print(getSearchedString(r'D:\RainbowCenter\com\boyaa\RainbowRepacker\workspace\temp\decompile\AndroidManifest.xml', "com\\.boyaa\\.[a-z\\.]+\\.Game"))
