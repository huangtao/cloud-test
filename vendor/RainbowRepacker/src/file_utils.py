#-*-coding:utf8 -*-

'''
Created on 2014-11-3

@author: junmeng
'''
import os.path

import log_utils


#===============================================================================
# copyFile 复制单个文件
#===============================================================================
def copyFile(sourceFile, targetFile):
    sourceFile = os.path.abspath(sourceFile)
    targetFile = os.path.abspath(targetFile)
    if not os.path.exists(sourceFile):
        log_utils.getLogger().debug('copyFile: sourceFile %s does not exist' % sourceFile)
        return False
    else:
        if os.path.exists(targetFile):
            log_utils.getLogger().warning('copyFile: target file %s exists, overwrite' % targetFile)
        targetDir = os.path.dirname(targetFile)
        if not os.path.exists(targetDir):
            os.makedirs(targetDir)
        print(targetFile)
        targetFileHandle = open(targetFile, 'wb')
        sourceFileHandle = open(sourceFile, 'rb')
        targetFileHandle.write(sourceFileHandle.read())
        targetFileHandle.close()
        sourceFileHandle.close()
        log_utils.getLogger().debug('copyFile: copy from %s to %s' % (sourceFile, targetFile))
        return True

#===============================================================================
# copyFiles 递归复制文件，如果sourceDir是文件，则复制单个文件
#===============================================================================
def copyFiles(sourceDir, targetDir):
    if not os.path.exists(sourceDir):
        log_utils.getLogger().debug('source %s does not exist' % sourceDir)
        return False
    if os.path.isfile(sourceDir):
        return copyFile(sourceDir, targetDir)
    for file in os.listdir(sourceDir):
        sourceFile = os.path.join(sourceDir, file)
        targetFile = os.path.join(targetDir, file)
        if os.path.isfile(sourceFile):
            copyFile(sourceFile, targetFile)
        else:
            copyFiles(sourceFile, targetFile)
    return True

#===============================================================================
# isExistDir 判断路径是否为已存在的目录
#===============================================================================
def isExistDir(dirpath):
    return os.path.exists(dirpath) and os.path.isdir(dirpath)

#===============================================================================
# isExistFile 判断路径是否为已存在文件
#===============================================================================
def isExistFile(f):
    return os.path.exists(f) and os.path.isfile(f)

def extractZipInTempDir(zipFilePath):
    import tempfile, zipfile
    zipNameWithoutSuffix = os.path.basename(zipFilePath).replace('.zip', '')
    tempdir = tempfile.mkdtemp()
    targetZipFile = zipfile.ZipFile(zipFilePath)
    extractedDir = os.path.join(tempdir, zipNameWithoutSuffix);
    targetZipFile.extractall(extractedDir)
    return zipNameWithoutSuffix, tempdir, extractedDir
            
# copyFile('./error_opsserate.py', './testcopy.py')
# copyFiles('./', 'D:/test/test')