#-*-coding:utf8-*-
'''
Created on 2014-11-3
@author RestWang
'''
import os.path
import platform
import re
import subprocess
import threading
import time
import zipfile

import env
import log_utils


bAddPath = False

def delete_file_folder(src):
    if not os.path.exists(src):
        return
    
    if os.path.isfile(src):
        try:
            src = src.replace('\\', '/')
            os.remove(src)
        except:
            pass
    elif os.path.isdir(src):
        for item in os.listdir(src):
            itemsrc = os.path.join(src, item)
            delete_file_folder(itemsrc)
        try:
            os.rmdir(src)
        except:
            pass

def copyFiles(sourceDir, targetDir):
    if not os.path.exists(sourceDir) and not os.path.exists(targetDir):
        printf('copy Files from %s to %s Fail:file not found' % (sourceDir, targetDir))
        return
    if os.path.isfile(sourceDir):
        copyFile(sourceDir, targetDir)
        return
    for file in os.listdir(sourceDir):
        sourceFile = os.path.join(sourceDir, file)
        targetFile = os.path.join(targetDir, file)
        if os.path.isfile(sourceFile):
            if not os.path.exists(targetDir):
                os.makedirs(targetDir)
            if not os.path.exists(targetFile) or os.path.exists(targetFile) and os.path.getsize(targetFile) != os.path.getsize(sourceFile):
                targetFileHandle = open(targetFile, 'wb')
                sourceFileHandle = open(sourceFile, 'rb')
                targetFileHandle.write(sourceFileHandle.read())
                targetFileHandle.close()
                sourceFileHandle.close()
        if os.path.isdir(sourceFile):
            copyFiles(sourceFile, targetFile)


def copyFile(sourceFile, targetFile):
    sourceFile = getFullPath(sourceFile)
    targetFile = getFullPath(targetFile)
    if not os.path.exists(sourceFile):
        return
    if not os.path.exists(targetFile) or os.path.exists(targetFile) and os.path.getsize(targetFile) != os.path.getsize(sourceFile):
        targetDir = os.path.dirname(targetFile)
        if not os.path.exists(targetDir):
            os.makedirs(targetDir)
        targetFileHandle = open(targetFile, 'wb')
        sourceFileHandle = open(sourceFile, 'rb')
        targetFileHandle.write(sourceFileHandle.read())
        targetFileHandle.close()
        sourceFileHandle.close()

def decompression(filename, unziptodir):
    delete_file_folder(unziptodir)
    if not os.path.exists(unziptodir):
        os.mkdir(unziptodir, 511)
    f = zipfile.ZipFile(filename)
    f.extractall(unziptodir)
    printf('decompression success!')
    f.close()
    delete_file_folder(filename)
    
def validateStr(ts):
    ts = ts.replace('\\', '/')
    ts = re.sub('/+', '/', ts) 
    if os.path.isabs(ts):
        return ts
    else:
        return os.path.abspath(ts)

def getFullPath(filename):
    return validateStr(filename)

def getWorkDir():
    tpath = env.GOD_WORK_DIR.strip() + '/'
    return validateStr(tpath)

def getJavaBinDir():
    if env.GOD_JAVA_DIR is None:
        return ''
    else:
        javadir = str(env.GOD_JAVA_DIR).strip()
        if javadir == '':
            return javadir
        else:
            return javadir + '/bin'

def getJavaPath(name):
    if bAddPath:
        return name
    else:
        bindir = getJavaBinDir()
        tpath = os.path.join(bindir,name)
        return validateStr(tpath)

def getToolDir():
    if env.GOD_TOOL_DIR is None:
        return ''
    else:
        return str(env.GOD_TOOL_DIR).strip()

def getToolPath(name):
    tooldir = getToolDir()
    tpath = os.path.join(tooldir,name)
    return validateStr(tpath)

def execFormatCmd(cmd):
    cmd = cmd.replace('\\', '/')
    cmd = re.sub('/+', '/', cmd)
    if platform.system() == 'Windows':
        st = subprocess.STARTUPINFO
        st.dwFlags = subprocess.STARTF_USESHOWWINDOW
        st.wShowWindow = subprocess.SW_HIDE
    else:
        cmd = cmd.encode('utf-8').decode('iso-8859-1')

    # findret = cmd.find('jarsigner')
    # if findret > -1:        
    #     import shlex
    #     cmds = shlex.split(cmd)
    #     log_utils.getLogger().debug('the execformatCmd cmds:'+str(cmds))
    #     s = subprocess.Popen(cmds)
    # else:
    #     s = subprocess.Popen(cmd, shell=True)

    import shlex
    cmds = shlex.split(cmd)
    s = subprocess.Popen(cmds)
    ret = s.wait()
    if ret:
        # 为什么还要这里??
        s = subprocess.Popen(str(cmd), stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
        stdoutput, erroutput = s.communicate()
        reportError(str(cmd), stdoutput, erroutput)
        cmd = 'ERROR:' + str(cmd) + ' ===>>> exec Fail <<<=== '
    else:
        cmd += ' ===>>> exec success <<<=== '
    log_utils.getLogger().debug(cmd)
    return ret

def printf(s):
    log_utils.getLogger().debug(s)

def reportError(cmd, stdoutput='', erroutput=''):
    """
    """
    newline = '\n'
    errorOuput = newline + '==================>>>> CMD ERROR <<<<==================' + newline
    errorOuput += '[cmd]: ' + cmd + newline
    errorOuput += '[ThreadName]: ' + threading.currentThread().getName() + newline
    errorOuput += '[Time]: ' + time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time())) + newline
    errorOuput += '[stdout]: ' + str(stdoutput) + newline
    errorOuput += '[stderr]: ' + str(erroutput) + newline
    errorOuput += '================================================='
    log(errorOuput)

def log(msg):
    log_utils.getLogger().error(msg)
    
def addLibPath():
    global bAddPath
    if not bAddPath:
        seperator = ';'
        if platform.system() == 'Linux':
            seperator = ':'
        libPath = getToolDir()
        if os.path.exists(libPath):
            if 'PATH' in os.environ:
                os.environ['PATH'] = os.environ['PATH'] + seperator + libPath   #工具路径放在PATH最后，避免影响现有环境
            else:
                os.environ['PATH'] = libPath
            if 'LD_LIBRARY_PATH' in os.environ:
                os.environ['LD_LIBRARY_PATH'] = os.environ['LD_LIBRARY_PATH'] + seperator + libPath #工具路径放在PATH最后，避免影响现有环境
            else:
                os.environ['LD_LIBRARY_PATH'] = libPath
        jrePath = getJavaBinDir()
        if os.path.exists(jrePath):
            if 'PATH' in os.environ:
                os.environ['PATH'] = os.environ['PATH'] + seperator + jrePath   #自带JRE路径放在PATH最后，避免影响现有环境
            else:
                os.environ['PATH'] = jrePath
    bAddPath = True
    
addLibPath()