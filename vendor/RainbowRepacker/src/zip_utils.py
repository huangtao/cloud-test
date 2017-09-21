#-*-coding:utf8 -*-

'''
Created on 2014-11-3

@author: junmeng
'''
import os
import os.path
import zipfile

import file_utils
import log_utils
import pack_exception
from pack_exception import PackException


#===============================================================================
# addOneFileToApkRoot 将单个文件写进apk根目录
# apk apk(zip)文件的路径
# srcFile 需要写进apk根目录的文件
# return 是否添加成功
#===============================================================================
def addOneFileToApkRoot(apk, srcFile):
    if not file_utils.isExistFile(apk):
        log_utils.getLogger().debug('%s not exist' % apk)
        return False
    if not file_utils.isExistFile(srcFile): 
        log_utils.getLogger().debug('%s not exist' % srcFile)
        return False
    with zipfile.ZipFile(apk, 'a', zipfile.ZIP_DEFLATED) as f:
        name = os.path.basename(srcFile)
        if name in f.namelist():
            log_utils.getLogger().debug('%s was existed in root' % name)
            return False
        else:
            f.write(srcFile, name)
            log_utils.getLogger().debug('addOneFileToApkRoot done');
            return True

#===============================================================================
# addFilesToApkRoot 将某个目录中的所有文件/目录添加到apk根目录
# apk apk文件路径
# srcDir 需要写进apk根目录的文件根目录
# return 是否添加成功
#===============================================================================
def addFilesToApkRoot(apk, srcDir):
    if not file_utils.isExistFile(apk):
        log_utils.getLogger().debug('%s not exist' % apk)
        return False
    if not file_utils.isExistDir(srcDir):
        log_utils.getLogger().debug('%s not exist' % srcDir)
        return False
    with zipfile.ZipFile(apk, 'a', zipfile.ZIP_DEFLATED) as f:
        name_list = f.namelist()
        for parent, dirnames, filenames in os.walk(srcDir):
            for file in filenames:
                sourceFile = os.path.join(parent, file)
                targetFile = sourceFile[len(srcDir):]
                if targetFile in name_list:
                    log_utils.getLogger().debug('%s was existed in root' % targetFile)
                    return False
                else:
                    f.write(sourceFile, targetFile)
                    log_utils.getLogger().debug('add file %s to apk root' % targetFile);
        return True

#===============================================================================
# addRootFileToApkRoot 将srcDir目录下的文件（不包括子目录及其中文件）添加到apk根目录中
#===============================================================================
def addRootFileToApkRoot(apk, srcDir, ignoreList = ['AndroidManifest.xml', 'apktool.yml', 'plugin.xml', 'script.py', 'script.pyo', 'script.pyc']):
    if not file_utils.isExistFile(apk):
        return False
    if not file_utils.isExistDir(srcDir):
        return False
    with zipfile.ZipFile(apk, 'a', zipfile.ZIP_DEFLATED) as f:
        name_list = f.namelist()
        for file in os.listdir(srcDir):
            targetFile = os.path.join(srcDir,file)
            if os.path.isfile(targetFile):
                if file in ignoreList:
                    # 如果在忽略列表中
                    log_utils.getLogger().debug('addRootFileToApkRoot: %s is in the ignore list' % file)
                    continue
                if file in name_list:
                    log_utils.getLogger().warning('addRootFileToApkRoot :%s is in the name_list, zipFile %s has a same name file!' % (file , apk))
                    raise PackException(pack_exception.ZIP_DEFLATED_ADD_FILE_EXCEPTION, 'addRootFileToApkRoot :%s is in the name_list, zipFile %s has a same name file!' % (file , apk))
                else:
                    f.write(targetFile, file)
            else:
                continue
        return True
    
#===============================================================================
# addSDKRootFilesToApkRoot 将SDK列表中的所有SDK的特定根目录文件添加到apk根目录中
#===============================================================================
def addSDKRootFilesToApkRoot(apk, sdksRootDir, sdkList):
    for sdk in sdkList:
        cfgResRootDir = os.path.join(sdksRootDir, sdk['sdkRelativePath'])
        result = addRootFileToApkRoot(apk, cfgResRootDir)
        if result:
            continue
        else:
            return False
    return True
        

#===============================================================================
# addUserUploadRootFilesToApkRoot 将sdkList参数中要上传的特定文件添加到apk根目录中
#===============================================================================
def addUserUploadRootFilesToApkRoot(apk, sdkList):
    for sdk in sdkList:
        if 'Files' in sdk and 'root' in sdk['Files']:
            rootFileList = sdk['Files']['root']
            if len(rootFileList) > 0:
                with zipfile.ZipFile(apk, 'a', zipfile.ZIP_DEFLATED) as f:
                    name_list = f.namelist()
                    for fileDict in rootFileList:
                        for srcFileName, savedFilePath in fileDict.items():
                            if srcFileName in name_list:
                                log_utils.getLogger().warning('addUserUploadRootFilesToApkRoot: zipFile %s has a same name %s file!' % (apk, srcFileName))
                                raise PackException(pack_exception.ZIP_DEFLATED_ADD_FILE_EXCEPTION, 'addUserUploadRootFilesToApkRoot: zipFile %s has a same name %s file!' % (apk, srcFileName))
                            else:
                                f.write(savedFilePath, srcFileName)

def addChannelSymbolFile(unsignedApk, symbol, channelSymbolFileName, taskWorkDir):
    '''
            在apk的assets/中写入用户自定义的渠道标识。
    @param unsignedApk
    @param symbol
    @param channelSymbolFileName
    @param taskWorkDir
    @return
    '''
    filename = os.path.join(taskWorkDir, channelSymbolFileName)
    with open(filename, mode='w', encoding='utf-8') as symbolfile:
        symbolfile.write(symbol)
   
    if not os.path.exists(filename):
        raise PackException(pack_exception.ZIP_DEFLATED_ADD_FILE_EXCEPTION,
                            'addChannelSymbolFile: cannot find %s' (filename))
    
    with zipfile.ZipFile(unsignedApk, 'a', zipfile.ZIP_DEFLATED) as f:
        symbol_entry = 'assets/' + channelSymbolFileName
        f.write(filename, symbol_entry)

def zipApks(batchDir, outputFilePath):
    '''
            将整个目标batchDir的所有.apk文件压缩成一个压缩包
    @param batchDir 存放批量打包apk的目录
    @param outputFilePath 输出的zip文件
    '''
    if not os.path.exists(os.path.dirname(outputFilePath)):
        os.makedirs(os.path.dirname(outputFilePath))
    filenameList = os.listdir(batchDir)
    with zipfile.ZipFile(outputFilePath, 'w', zipfile.ZIP_DEFLATED) as f:
        for filename in filenameList :
            filepath = os.path.join(batchDir, filename)
            if os.path.isfile(filepath) and filepath.endswith('.apk'):
                f.write(filepath, filename)
    
# addOneFileToApkRoot('fetion.apk', 'outManifest.xml');
# addFilesToApkRoot('../fetion.apk', './')
# addRootFileToApkRoot(r'E:\WorkSpace201312\GodSDK\trunk\GodSDKPackScript\test\oppo_ddz_withoutsdk.apk', r'E:\WorkSpace201312\GodSDK\trunk\GodSDKPackScript\test2')
