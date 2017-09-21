#-*-coding:utf8 -*-

import os
import log_utils
import manifest_utils
from xml.etree import ElementTree
import file_utils
from pack_managers.base_pack_manager import PackManager


class NewEnginePackManager(PackManager):
    
    _projectShorName = 'newengine'

    def injectFilesForAutomation(self):
        cfgResRootDir = self.sdksRootDir
        
        # 1.autotest放在com.boyaa下
        decompileSmaliDir = os.path.join(self.decompileDir, 'smali')
        log_utils.getLogger().info('copying smali....')
        file_utils.copyFiles(os.path.join(cfgResRootDir, 'smali'),os.path.join(decompileSmaliDir,'com','boyaa','autotest'))
        log_utils.getLogger().info('copying smali....done!')
        
        # 2.修改assets/plugin，增加automatedTest
        decompilePluginPath = os.path.join(self.decompileDir, 'assets', 'plugin')
        # folder not exists
        if not os.path.exists(os.path.dirname(decompilePluginPath)):
            os.makedirs(os.path.dirname(decompilePluginPath))
        # file not exits
        if not os.path.exists(decompilePluginPath):
            with open(decompilePluginPath, 'w') as f:
                f.write('automatedTest')
        else:
            with open(decompilePluginPath) as f:
                lines = f.readlines()
                lines[0:0] = ['automatedTest\n']
            with open(decompilePluginPath, 'w') as f:
                f.writelines(lines)

        '''with open(decompilePluginPath) as f:
            lines = f.readlines()
            lines[0:0] = ['automatedTest\n']
        with open(decompilePluginPath, 'w') as f:
            f.writelines(lines)'''
        
        #=======================================================================
        # 现在可以不用啦
        # # 3.对应存在的libs下面，添加libautomatedTest.so
        cfgLibDir = os.path.join(cfgResRootDir, 'lib')
        decomileLibDir = os.path.join(self.decompileDir, 'lib')
        log_utils.getLogger().info('copying lib....')
        for struct in os.listdir(cfgLibDir):
             # 复制到对应目录
            if file_utils.isExistDir(os.path.join(decomileLibDir, struct)):
                file_utils.copyFiles(os.path.join(cfgLibDir, struct), os.path.join(decomileLibDir, struct))
        log_utils.getLogger().info('copying lib....done!')
        #=======================================================================
        
        # 3.1覆盖scripts
        cfgScriptDir = os.path.join(cfgResRootDir, 'scripts')
        decomileScriptDir = os.path.join(self.decompileDir, 'assets', 'scripts')
        file_utils.copyFiles(cfgScriptDir, decomileScriptDir)
            
    
        # 4.AndroidManifest.xml增加 provider
        decompileManifest = os.path.join(self.decompileDir, 'AndroidManifest.xml')
        ElementTree.register_namespace(manifest_utils.androidN, manifest_utils.androidNS)
        srcTree = ElementTree.parse(decompileManifest)
        t = ElementTree.Element('provider', {"android:name":"com.boyaa.autotest.ElementProvider",
                                     "android:authorities": "com.boyaa.test.providers.element",
                                     "android:multiprocess": "false",
                                     "android:exported": "true"})
        srcRoot = srcTree.getroot()
        srcAppNode = srcRoot.find('application')
        srcAppNode.append(t)
        manifest_utils.prettyXml(srcRoot)
        srcTree.write(decompileManifest)
        
        
        #=======================================================================
        # import xml.dom.minidom 
        # decompileManifest = os.path.join(self.decompileDir, 'AndroidManifest.xml')
        # DOMTree = xml.dom.minidom.parse(decompileManifest) 
        # manifestNode = DOMTree.documentElement
        # namespace = ''
        # for key, value in manifestNode.attributes.items():
        #     if key == 'package':
        #         self._packageName = value
        #     else:
        #         namespace = key.split(':')[1]
        # applicationNode = manifestNode.getElementsByTagName('application')[0]
        # target = {
        #     '%s:name' % namespace : 'com.boyaa.autotest.ElementProvider',
        #     '%s:exported' % namespace : 'true',
        #     '%s:authorities' % namespace : 'com.boyaa.test.providers.element',
        #     '%s:multiprocess' % namespace : 'false'
        # }
        # if applicationNode:
        #     exist = False
        #     for provider in applicationNode.getElementsByTagName('provider'):
        #         pro_keys = set(provider.attributes.keys())
        #         target_keys = set(target.keys())
        #         diff = list(pro_keys.intersection(target_keys))
        #         if len(diff) == len(target.keys()):
        #             exist = True
        #             break
        #     if not exist:
        #         x = DOMTree.createElement("provider")
        #         for key, value in target.iteritems():
        #             x.attributes[key] = value
        #             applicationNode.appendChild(x)
        #         with open(decompileManifest, 'w') as f:
        #             f.write(manifestNode.toxml(encoding='utf-8'))
        #=======================================================================

        package_name = manifest_utils.getPackageName(decompileManifest)
        self._packageName = package_name
