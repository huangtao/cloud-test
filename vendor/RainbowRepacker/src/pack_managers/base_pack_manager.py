#-*-coding:utf8 -*-

import os
import time

import cmd_tools
from config import ConfigParse

import log_utils
import manifest_utils
import my_utils
import zip_utils

from pack_exception import PackException
import pack_exception
import file_utils
import env
from time import sleep

class PackManager(object):
    """
    	打包基类
    """
    __debug = False
    _packageName = None
    _projectShorName = None
    
    def run(self):
        self.decompile()
        self.injectFilesForAutomation()
        self.pack()

    def __init__(self):
        self.sdksRootDir = os.path.join(env.SUPPORT_DIR, self._projectShorName)
        
        self.outputDir = ConfigParse.shareInstance().getOutputDir()
        if self.outputDir is None :
            raise PackException(pack_exception.PHP_PARAMS_ERROR, 'outputDir is None')        
        self.outputName = ConfigParse.shareInstance().getOutputName()
        self.apkFile = ConfigParse.shareInstance().getApkPath()
            
        timestamp_str = str(time.time())
        self.taskWorkDir = os.path.join(my_utils.getWorkDir(), self._projectShorName, timestamp_str, "temp")
        
        if not os.path.exists(self.taskWorkDir):
            os.makedirs(self.taskWorkDir)
        log_utils.getLogger().info('taskWorkDir == ' + self.taskWorkDir)
        self.decompileDir = self.taskWorkDir + '/decompile'
        self.tmpApkToolPath = os.path.join(self.taskWorkDir, 'apktooltmp')
        
    
    def __del__(self):
        if not self.__debug:
            my_utils.delete_file_folder(self.taskWorkDir)
        

    def decompile(self):
        log_utils.getLogger().info('start decompiling...')
            
        taskLogDir = os.path.join(self.taskWorkDir, 'log')
        if not os.path.exists(taskLogDir):
            os.makedirs(taskLogDir)
            
        logFileName = os.path.join(taskLogDir, 'repack.log')
        log_utils.changeLoggerFileHandler(logFileName)
            
        if not os.path.exists(self.apkFile):
            raise PackException(pack_exception.SOURCE_APK_NOT_EXIST, 'source apk file %s does not exist' % self.apkFile)
        
        tmpApkSource = self.taskWorkDir + '/temp.apk'
        my_utils.copyFile(self.apkFile,tmpApkSource)
        
        
        log_utils.getLogger().info('decompiling apk ... ')
        #apk反编译
        ret = cmd_tools.decompileApk(tmpApkSource, self.decompileDir, self.tmpApkToolPath)
        if ret:
            raise PackException(pack_exception.DECOMPLE_APK_FAILED, 'decompile apk %s failed' % tmpApkSource)
    
    
    def injectFilesForAutomation(self):
        raise NotImplementedError("请在PackManger子类里实现该方法！")
        
    
    def pack(self):
        try:   
            log_utils.getLogger().info('generating new r file ... ')
            #重新生成R文件   
            
            ret = cmd_tools.produceNewRFile(
                self._packageName,
                self.decompileDir)
            if ret:
                raise PackException(pack_exception.PRODUCE_NEW_R_FILE_FAILED, 'produce new r file failed')
            
            #重新编译成apk
            tempRecompileApkDir = self.taskWorkDir + '/tempRecompileApk'
            tempRecompileApk = '%s/nosig.apk' % (tempRecompileApkDir)
            tempSignedApkName = '%s/_sig.apk' % (tempRecompileApkDir)
            
            log_utils.getLogger().info('recompiling apk ... tempRecompileApk = ' + tempRecompileApk)
            ret = cmd_tools.recompileApk(self.decompileDir, tempRecompileApk, self.tmpApkToolPath)
            if ret:
                raise PackException(pack_exception.RECOMPILE_APK_FAILED, 'recompile apk failed')
            

            
            # self.outputName是 autotest_xxx.apk
            self.doPackWithoutChannelSymbol(tempRecompileApk, tempSignedApkName, self.outputDir, self.outputName)
            
            
            #测试桩重打包
            import env
            testbundle_apkFile = os.path.join(env.SUPPORT_DIR, self._projectShorName, 'testbundle', 'TestBundle.apk')
            #testbundle_apkFile = os.path.join(env.GOD_TOOL_DIR, 'TestBundle_base.apk')   
            if not os.path.exists(testbundle_apkFile):
                raise PackException(pack_exception.SOURCE_APK_NOT_EXIST, 'testbundle_base apk file %s does not exist' % testbundle_apkFile)
            
            # 拷贝TestBundle.apk 到  工作目录下/testbundle_temp.apk
            tmpTestBundleApk = self.taskWorkDir + '/testbundle_temp.apk'
            my_utils.copyFile(testbundle_apkFile,tmpTestBundleApk)
            
            testbundle_decompileDir = self.taskWorkDir + '/testbundle_decompile'
            testbundle_tmpApkToolPath = os.path.join(self.taskWorkDir, 'testbundle_apktooltmp')
            log_utils.getLogger().info('decompiling testbundle apk ... ')
            
            #测试桩反编译 到   工作目录下/testbundle_decompile
            ret = cmd_tools.decompileApk(tmpTestBundleApk, testbundle_decompileDir, testbundle_tmpApkToolPath)
            if ret:
                raise PackException(pack_exception.DECOMPLE_APK_FAILED, 'decompile testbundle apk %s failed' % tmpTestBundleApk)
            
            
            testbundle_packageName = "com.boyaa.application.testbundle"
            # 修改manifest.xml
            self.repackTestBundleForMatch(self.sdksRootDir, testbundle_decompileDir, self._packageName)
            
            log_utils.getLogger().info('generating new r file for testbundle... ')
            #重新生成测试桩的R文件   
            ret = cmd_tools.produceNewRFile(
                testbundle_packageName,
                testbundle_decompileDir)
            if ret:
                raise PackException(pack_exception.PRODUCE_NEW_R_FILE_FAILED, 'produce new r file for testbundle failed')
            
            #重新编译测试桩apk
            testbundle_tempRecompileApkDir = self.taskWorkDir + '/testbundle_tempRecompileApk'
            testbundle_tempRecompileApk = '%s/testbundle_nosig.apk' % (testbundle_tempRecompileApkDir)
            testbundle_tempSignedApkName = '%s/testbundle_sig.apk' % (testbundle_tempRecompileApkDir)
            
            log_utils.getLogger().info('recompiling apk ... tempRecompileApk = ' + testbundle_tempRecompileApk)
            ret = cmd_tools.recompileApk(testbundle_decompileDir, testbundle_tempRecompileApk, testbundle_tmpApkToolPath)
            if ret:
                raise PackException(pack_exception.RECOMPILE_APK_FAILED, 'recompile test bundle apk failed')
            
            self.doPackWithoutChannelSymbol(testbundle_tempRecompileApk, testbundle_tempSignedApkName, os.path.join(self.outputDir, 'testbundle'), "testbundle.apk")

            #log_utils.getLogger().info('doPack: =============================================success=============================================' + StreamHandler.terminator)

        except PackException as pe:
            log_utils.getLogger().error(pe)
            #log_utils.getLogger().info('doPack: =============================================Failed=============================================' + StreamHandler.terminator)
            return
         

    def doPackWithoutChannelSymbol(self, tempRecompileApk, tempSignedApkName, outputDir, outputName):
        '''
        @param channelId 渠道id，用于获取keystore
        @param tempRecompileApk 重打包后的未签名apk path
        @param tempSignedApkName  签名对齐后的包名称
        @param outputDir  输出路径（非完整path）
        @param outputName  输出名称（非完整path）
        '''
        log_utils.getLogger().info('doPackWithoutChannelSymbol ... ')
        #apk签名
        log_utils.getLogger().info('signing apk')
        keystoreInfo = ConfigParse.shareInstance().getKeystoreInfo()
        
        # 签名，没细看
        ret = cmd_tools.signApk(tempRecompileApk, keystoreInfo['file'], keystoreInfo['storePassword'],
                      keystoreInfo['keyAlias'], keystoreInfo['aliasPassword'])
        if ret:
            raise PackException(pack_exception.SIGN_APK_FAILED, 'sign apk failed')
        
        #apk优化
        apkName = '%s/%s' % (outputDir, outputName)
        outputDir = os.path.dirname(apkName)
        
        if not os.path.exists(outputDir):
            os.makedirs(outputDir)
        
        log_utils.getLogger().debug(outputDir)
        log_utils.getLogger().info('zipaligning and renaming apk apkName == ' + apkName);
        
        # 调用工具里的 zipalign.exe 对temRecompileApk 进行优化，生成tempSignedApkName
        ret = cmd_tools.alignAPK(tempRecompileApk, tempSignedApkName)
        
        if ret:
            raise PackException(pack_exception.ALIGN_APK_FAILED, 'align apk failed')
        import shutil
        shutil.move(tempSignedApkName, apkName)
    
    def doPackWithOneChannelSymbol(self, channelId, tempRecompileApk, tempSignedApkName, outputDir, outputName, symbol, taskWorkDir):
        '''
        @param channelId 渠道id，用于获取keystore
        @param tempRecompileApk 重打包后的未签名apk path
        @param tempSignedApkName  签名对齐后的包名称
        @param outputDir  输出路径（非完整path）
        @param outputName  输出名称（非完整path）
        @param symbol  自定义渠道标记
        @param taskWorkDir  工作目录
        '''
        log_utils.getLogger().info('doPackWithOneChannelSymbol ... ')
        #添加渠道标识
        log_utils.getLogger().info('adding channel symbol to /assets/ ... ')
        channelSymbolFileName = ConfigParse.shareInstance().getChannelSymbolFileName()
        zip_utils.addChannelSymbolFile(tempRecompileApk, symbol, channelSymbolFileName, taskWorkDir)
        
        #apk签名
        log_utils.getLogger().info('signing apk')
        keystoreInfo = ConfigParse.shareInstance().getKeystoreInfoByChannelId(channelId)
        ret = cmd_tools.signApk(tempRecompileApk, keystoreInfo['file'], keystoreInfo['storePassword'],
                      keystoreInfo['keyAlias'], keystoreInfo['aliasPassword'])
        if ret:
            raise PackException(pack_exception.SIGN_APK_FAILED, 'sign apk failed')
        
        #apk优化
        apkName = '%s/%s' % (outputDir, outputName)
        outputDir = os.path.dirname(apkName)
        
        if not os.path.exists(outputDir):
            os.makedirs(outputDir)
        
        log_utils.getLogger().debug(outputDir)
        log_utils.getLogger().info('zipaligning and renaming apk apkName == ' + apkName);
        ret = cmd_tools.alignAPK(tempRecompileApk, tempSignedApkName)
        if ret:
            raise PackException(pack_exception.ALIGN_APK_FAILED, 'align apk failed')
        os.rename(tempSignedApkName, apkName)
    
    def doBatchPackWithChannelSymols(self, channelId, unsignedApk, tempSignedApkName, outputDir, outputName, symbolList, taskWorkDir):
        '''
        @param channelId 渠道id，用于获取keystore
        @param unsignedApk 重打包后的未签名apk path
        @param tempSignedApkName  签名对齐后的包名称
        @param outputDir  输出路径（非完整path）
        @param outputName  输出名称（非完整path）
        @param symbolList  自定义渠道标记列表
        @param taskWorkDir  工作目录
        '''
        log_utils.getLogger().info('doBatchPackWithChannelSymols ... ')
        batchPackDir = os.path.join(taskWorkDir, 'batch')
        if not os.path.exists(batchPackDir):
            os.makedirs(batchPackDir)
        
        copiedUnsignedApk = os.path.join(os.path.dirname(unsignedApk), 'batchTmpApk.apk')
        
        log_utils.getLogger().info('start batch packing ... ')
        for symbol in symbolList:
            if not file_utils.copyFile(unsignedApk, copiedUnsignedApk):
                raise PackException(pack_exception.COPY_FILE_EXCEPTION,
                                    'cannot copy apk during doBatchPackWithChannelSymols')
                
            #添加渠道标识
            log_utils.getLogger().info('adding channel symbol to /assets/ ... ')
            channelSymbolFileName = ConfigParse.shareInstance().getChannelSymbolFileName()
            zip_utils.addChannelSymbolFile(copiedUnsignedApk, symbol, channelSymbolFileName, taskWorkDir)
            
            #apk签名
            log_utils.getLogger().info('signing apk')
            keystoreInfo = ConfigParse.shareInstance().getKeystoreInfoByChannelId(channelId)
            ret = cmd_tools.signApk(copiedUnsignedApk, keystoreInfo['file'], keystoreInfo['storePassword'],
                          keystoreInfo['keyAlias'], keystoreInfo['aliasPassword'])
            if ret:
                raise PackException(pack_exception.SIGN_APK_FAILED, 'sign apk failed')
            
            #apk优化
            apkName = '%s/%s' % (batchPackDir, outputName)
            basename = os.path.splitext(os.path.basename(apkName))[0]
            apkOutputDir = os.path.dirname(apkName)
            if not os.path.exists(apkOutputDir):
                os.makedirs(apkOutputDir)
            
            apkName = os.path.join(apkOutputDir, basename + '(' + symbol + ').apk')
            
            log_utils.getLogger().debug(apkOutputDir)
            log_utils.getLogger().info('zipaligning and renaming apk apkName == ' + apkName);
            ret = cmd_tools.alignAPK(copiedUnsignedApk, tempSignedApkName)
            if ret:
                raise PackException(pack_exception.ALIGN_APK_FAILED, 'align apk failed')
            os.rename(tempSignedApkName, apkName)
            
        log_utils.getLogger().info('batch packing success... ')
        log_utils.getLogger().info('zip apk files ... ')
        zip_utils.zipApks(batchPackDir, '%s/%s' % (outputDir, outputName))
        
    def repackTestBundleForMatch(self, sdksRootDir, decompileDir, targetPackageName):
        cfgResRootDir = sdksRootDir
                 
        #apk资源修改
        decompileManifest = os.path.join(decompileDir, 'AndroidManifest.xml')
         
        log_utils.getLogger().info('modifying AndroidManifest.xml ... ')
        manifest_utils.modifyManifestForTestBundle(decompileManifest, decompileManifest, targetPackageName)
        
