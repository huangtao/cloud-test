#-*-coding:utf8 -*-

'''
Created on 2014-11-4

@author: junmeng
'''
import file_utils
import os.path
import zipfile
import shutil
import tempfile

#===============================================================================
# copyAssets 拷贝资源文件
# fromAssets 从Assets根目录
# toAsset 去Assets根目录
#===============================================================================
def copyAssets(fromAssets, toAssets):
    file_utils.copyFiles(fromAssets, toAssets)
    
#===============================================================================
# copyUserUploadAssetsFiles 拷贝需要用户上传的文件至assets
# sdk sdk参数
# decompileDir 反编译包的根目录
#===============================================================================
def copyUserUploadAssetsFiles(sdk, decompileDir):
    if 'Files' in sdk and 'assets' in sdk['Files']:
        assetsFileList = sdk['Files']['assets']
        decompileAssetsDir = os.path.join(decompileDir, 'assets')
        for fileDict in assetsFileList:
            for srcFileName, savedFilePath in fileDict.items():
                file_utils.copyFile(savedFilePath, os.path.join(decompileAssetsDir, srcFileName))
                
#===============================================================================
# copyFilesToZip 拷贝文件到zip文件中，如果有同名文件则覆盖
# fromDir 拷贝的源目录
# zipFilePath zip文件路径
#===============================================================================
def copyFilesToZip(fromDir, zipFilePath):
    zipNameWithoutSuffix, tempdir, extractedDir = file_utils.extractZipInTempDir(zipFilePath)
    toDir = os.path.join(extractedDir,'update')
    file_utils.copyFiles(fromDir, toDir)
    fileName = shutil.make_archive(zipNameWithoutSuffix, 'zip', extractedDir)
    shutil.move(fileName, zipFilePath)
    shutil.rmtree(tempdir)
    
# 1.解压zip文件，copy文件到 解压目录/update
# 2.解密 globalConfig.lua --> 修改内容 --> 不加密写回 globalConfig.lua
# 3.解密 mainHandle.lua --> 修改内容 --> 不加密写回 mainHandle.lua
# 4.重新压缩为zip，覆盖原来的zip
# 5.清空临时文件夹
def copyFilesToZipAndSetDebug(fromDir, zipFilePath):
    zipNameWithoutSuffix, tempdir, extractedDir = file_utils.extractZipInTempDir(zipFilePath)
    toDir = os.path.join(extractedDir,'update')
    file_utils.copyFiles(fromDir, toDir)
    
    #modify globalConfig.lua
    import cmd_tools
    globalConfigFilePath = os.path.join(extractedDir, 'update', 'scripts', 'globalConfig.lua')
    _, globalConfigFilePath_decoded = cmd_tools.decodeLuaFile(globalConfigFilePath)
    try:
        import codecs, re
        decodedFileHandler = codecs.open(globalConfigFilePath_decoded, 'r+', 'UTF-8')
        contentString = decodedFileHandler.read()
        decodedFileHandler.close()
        
        contentString = contentString.replace("BYLUA 654 ","")  #去掉解密后的字符串前缀
        contentString = re.sub(r"_DEBUG\s*=\s*false", "_DEBUG = true", contentString, 1)  #设置_DEBUG标志为true
        
        # 写回了不加密的内容？？
        hallConfigFilePath_for_write = codecs.open(globalConfigFilePath, 'w+', 'UTF-8')
        hallConfigFilePath_for_write.write(contentString)
        hallConfigFilePath_for_write.close()
        
        #modify mainHandle.lua
        mainHandleFilePath = os.path.join(extractedDir, 'update', 'scripts', 'mainHandle.lua')
        _, mainHandleFilePath_decoded = cmd_tools.decodeLuaFile(mainHandleFilePath)
        decodedFileHandler = codecs.open(mainHandleFilePath_decoded, 'r+', 'UTF-8')
        contentString = decodedFileHandler.read()
        decodedFileHandler.close()
        
        contentString = contentString.replace("BYLUA 654 ","")  #去掉解密后的字符串前缀
        contentString = contentString.replace('if isTestUmeng', '--if isTestUmeng', 1)  #注释友盟测试账号的判断  
        mainHandleFilePath_for_write = codecs.open(mainHandleFilePath, 'w+', 'UTF-8')    
        mainHandleFilePath_for_write.write(contentString);
        mainHandleFilePath_for_write.close()
    
        #make archive
        fileName = shutil.make_archive(zipNameWithoutSuffix, 'zip', extractedDir)
        shutil.move(fileName, zipFilePath)
    finally:
        shutil.rmtree(tempdir)
    