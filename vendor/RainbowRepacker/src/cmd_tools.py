#-*-coding:utf8 -*-
'''
Created on 2014-11-3
@author: wangdongchun
'''
import os
import os.path
import re
import subprocess
import platform
import my_utils
import env

def dexTrans2Smali(dexFile, targetDir, baksmali = env.TOOL_DEF_BAKSMALI_JARFILE):
    '''
    @brief 把dex文件反编译成smali格式文件组成的内容
    @param[in] dexFile dex文件路径
    @param[in] targetDir smali文件存放
    @param[in] baksmali反编译需要的辅助jar包
    @return >0:失败; 0:成功
    '''
    dexFile = my_utils.getFullPath(dexFile)
    baksmaliFile = my_utils.getToolPath(baksmali)
    targetDir = my_utils.getFullPath(targetDir)
    
    if not os.path.exists(targetDir):
        os.mkdir(targetDir)    
        
    if not os.path.exists(dexFile) or not os.path.exists(baksmaliFile):
        my_utils.printf("dexTrans2Smali: file %s or %s not exist." % (baksmali,dexFile))
        return 1            
    
    cmd = '%s -jar "%s" -o "%s" "%s"' % (my_utils.getJavaPath('java'),
     baksmaliFile,
     targetDir,
     dexFile)
    
    print('--------xxx----' + cmd)
    ret = my_utils.execFormatCmd(cmd)
    if ret:
        #my_utils.printf("dexTrans2Smali: execFormatCmd(%s) failure ret(%d)." % (cmd,ret))
        return ret
    else:
        return 0

def smaliTrans2dex(smaliDir, targetFile, smalijarfile = env.TOOL_DEF_SMALI_JARFILE):
    '''
    @brief smali文件编译打包成dex文件
    @param[in] smaliDir smali文件存放目录
    @param[in] targetFile 生成的dex文件路径
    @return >0:失败; 0:成功
    '''
    smaliDir = my_utils.getFullPath(smaliDir)
    targetFile = my_utils.getFullPath(targetFile)
    smaliFile = my_utils.getToolPath(smalijarfile)
    
    if not os.path.exists(targetFile) or not os.path.exists(smaliFile):
        my_utils.printf("smaliTrans2dex: %s or %s file not exist." % (targetFile,smaliFile))
        return 1    
    
    cmd = '%s -jar -Xms512m -Xmx512m "%s" "%s" -o "%s"' % (my_utils.getJavaPath('java'),
     smaliFile,
     smaliDir,
     targetFile)
    ret = my_utils.execFormatCmd(cmd)
    if ret:
        #my_utils.printf("smaliTrans2dex: execFormatCmd(%s) failure ret(%d)." % (cmd,ret))
        return ret
    else:
        return 0

def signApk(apkFile, keyStore, storepassword, keyalias, aliaspassword):
    '''
    @brief 签名apk文件
    @param[in] apkFile apk文件路径
    @param[in] keyStore keystore文件路径
    @param[in] storepassword keystore文件路径
    @param[in] keyalias keystore文件路径
    @param[in] aliaspassword keystore文件路径
    @return >0:失败; 0:成功    
    '''
    apkFile = my_utils.getFullPath(apkFile)
    aapt = my_utils.getToolPath('aapt')
    keyStore = my_utils.getFullPath(keyStore)
    
    if not os.path.exists(apkFile) or not os.path.exists(keyStore):
        my_utils.printf("signApk: %s or %s file not exist." % (apkFile,keyStore))
        return 2
    
    listcmd = '%s list %s' % (aapt, apkFile)
    print('--------xxx----' + str(listcmd))
    
    output = os.popen(str(listcmd)).read()
    for filename in output.split('\n'):
        if filename.find('META-INF') == 0:
            rmcmd = '"%s" remove "%s" "%s"' % (aapt, apkFile, filename)
            
            print('    --------xxx----' + rmcmd)
            
            bReturn = my_utils.execFormatCmd(rmcmd)
    jarsingnCmd = '"%s" -keystore "%s" -storepass "%s" -keypass "%s" "%s" "%s" -sigalg SHA1withRSA -digestalg SHA1' % \
        (my_utils.getJavaPath('jarsigner'), #java的执行文件路径
         keyStore,
         storepassword,
         aliaspassword,
         apkFile,
         keyalias)
    print('--------xxx----' + jarsingnCmd)
    ret = my_utils.execFormatCmd(str(jarsingnCmd))
    
    if ret:
        #my_utils.printf("signApk: execFormatCmd(%s) failure ret(%d)." % (jarsingnCmd,ret))
        return ret
    else:
        return 0

def alignAPK(tempApkFile, apkFile):
    '''
    @brief 优化Apk二进制文件
    @param[in] tempApkFile 源apk文件路径
    @param[in] apkFile 目标apk文件名
    @return 1:失败; 0:成功    
    '''
    align = my_utils.getToolPath('zipalign')
    if platform.system() == 'Linux':
        align = 'zipalign'
    if not os.path.exists(tempApkFile):
        my_utils.printf("alignAPK: %s file not exist." % tempApkFile)
        return 1
    aligncmd = '"%s" -f 4 "%s" "%s"' % (align, tempApkFile, apkFile)
    print('--------xxx----' + aligncmd)
    ret = my_utils.execFormatCmd(aligncmd)
    if ret:
        #my_utils.printf("alignAPK: execFormatCmd(%s) failure ret=%d" % ret)
        return 2
    else:
        return 0

def decompileApk(apkFile, targetDir, tmpPath, apkTool = env.TOOL_DEF_APKTOOL_JARFILE):
    '''
    @brief 反编译apk文件
    @param[in] apkFile apk文件路径
    @param[in] targetDir 反编译文件存放目录
    @param[in] tmpPath 反编译文件apktool工具
    @param[in] apkTool 反编译工具jar包
    @return 1:失败; 0:成功    
    '''
    apkFile = my_utils.getFullPath(apkFile)
    targetDir = my_utils.getFullPath(targetDir)
    apkTool = my_utils.getToolPath(apkTool)
    if not os.path.exists(apkFile) or not os.path.exists(apkTool):
        my_utils.printf("decompileApk: %s or %s file not exist." % (apkFile,apkTool))
        return 1
    if os.path.exists(targetDir):
        my_utils.delete_file_folder(targetDir)
    os.makedirs(targetDir)
    # tmpPath 没有用
#     cmd = '"{0}" -jar "{1}" -q d --frame-path "{2}" -b -f -o "{3}" "{4}"'.format(
    cmd = '"{0}" -jar "{1}" d --frame-path "{2}" -f -o "{3}" "{4}"'.format(
     my_utils.getJavaPath('java'),
     apkTool,
     tmpPath,
     targetDir,
     apkFile)
    print(cmd)
    ret = my_utils.execFormatCmd(cmd)
    if ret:
        #my_utils.printf("decompileApk: execFormatCmd failure ret = %d." % ret)
        return ret
    else:
        return 0
  
# 调用apktool.jar 把反编译后的目录，编译成apkFile
def recompileApk(srcFolder, apkFile, tmpPath, apkTool = env.TOOL_DEF_APKTOOL_JARFILE):    
    '''重新编译生成Apk文件'''
    srcFolder = my_utils.getFullPath(srcFolder)
    apkTool = my_utils.getToolPath(apkTool)
    if not os.path.exists(apkTool) or not os.path.exists(srcFolder):
        my_utils.printf("recompileApk: %s or %s file not exist." % (srcFolder,apkTool))
        return 1
    apkFile = my_utils.getFullPath(apkFile)
#     cmd = '"{0}" -jar "{1}" -q b --frame-path "{2}" -f -o "{3}" "{4}"'.format(
    # 调用apktool.jar 把反编译后的目录，编译成apkFile
    cmd = '"{0}" -jar "{1}" b --frame-path "{2}" -f -o "{3}" "{4}"'.format(
     my_utils.getJavaPath('java'),
     apkTool,
     tmpPath,
     apkFile,
     srcFolder)
    
    print('--------xxx----' + cmd)
    ret = my_utils.execFormatCmd(cmd)
    if ret:
        #my_utils.printf("recompileApk: execFormatCmd failure ret = %d." % ret)
        return 2
    else:
        return 0

# 1.调用aapt.exe 将工程的资源编译到R.java文件
def produceNewRFile(packName, decompileFullDir, androidManiFest = 'AndroidManifest.xml'):
    '''生成R文件'''
    fullPath = decompileFullDir
    tempPath = os.path.dirname(decompileFullDir)
    tempPath = tempPath + '/tempRFile'
    if os.path.exists(tempPath):
        my_utils.delete_file_folder(tempPath)
        
    # 在跟反编译目录同目录下新建temRFile
    os.makedirs(tempPath)
    
    resPath = os.path.join(decompileFullDir, 'res')
    targetResPath = os.path.join(tempPath, 'res')
    
    # 反编译后的res目录 拷贝到  temRFile/res
    my_utils.copyFiles(resPath, targetResPath)
    
    
    # temRFile/gen目录
    genPath = os.path.join(tempPath, 'gen')
    if not os.path.exists(genPath):
        os.mkdir(genPath)
    
    androidPath = my_utils.getToolPath('android.jar')
    srcManifest = os.path.join(fullPath, androidManiFest)
    
    # 调用aapt.exe 将工程的资源编译到R.java文件
    # 把 temRFile/res下的资源 编译到 temRFile/gen目录生成R.java
    aaptPath = my_utils.getToolPath('aapt')
    cmd = '%s p -f -m -J "%s" -S "%s" -I "%s" -M "%s"' % (aaptPath,
     genPath,
     targetResPath,
     androidPath,
     srcManifest)
    print('xxxxxxxxxxxx--' + cmd)
    ret = my_utils.execFormatCmd(cmd)
    if ret:
        #my_utils.printf("produceNewRFile: execFormatCmd(%s) failure ret=%d" % (cmd,ret))
        return 1
    
    RPath = packName.replace('.', '/')
    RPath = os.path.join(genPath, RPath)
    RFile = os.path.join(RPath, 'R.java')
    
    # javac 编译 temRFile/gen/R.java文件
    cmd = '"%s" -source %s -target %s -encoding UTF-8 "%s"' % \
    	(my_utils.getJavaPath('javac'),env.JAVAC_COMPILE_VERSION,env.JAVAC_COMPILE_VERSION,RFile)
    print('--------xxx----' + cmd)
    ret = my_utils.execFormatCmd(cmd)
    if ret:
        #my_utils.printf("produceNewRFile: execFormatCmd(%s) failure ret=%d" % (cmd,ret))
        return 2
    
    dexPath = os.path.join(tempPath, 'class.dex')
    #if platform.system() == 'Windows':
        #dxTool = my_utils.getToolPath('dx.bat')
        #cmd = '"%s" --dex --output="%s" "%s"' % (dxTool, dexPath, genPath)
    #else:
    
    # 调dx.jar 把temRFile/gen/.class文件编译成 temRFile/class.dex文件
    dxTool = my_utils.getToolPath('dx.jar')
    cmd = '"%s" -jar "%s" --dex --output="%s" "%s"' % \
        (my_utils.getJavaPath('java'),dxTool, dexPath, genPath)
    ret = my_utils.execFormatCmd(cmd)
    
    
    if ret:
        #my_utils.printf("produceNewRFile: execFormatCmd(%s) failure ret=%d" % (cmd,ret))
        return 3
    smaliPath = os.path.join(fullPath, 'smali')
    
    # 用baksmali.jar 把 temRFile/class.dex 转成  反编译后的/smali目录
    ret = dexTrans2Smali(dexPath, smaliPath, 'baksmali-1.4.1.jar')
    
    if ret:
        return 4
    else:
        return 0

def getVersion(apkFile,vtype):
    '''获得sdk或者apk的版本号'''
    cmd = my_utils.getToolPath('aapt') + " d badging '" + apkFile + "'"
    cmd = cmd.replace('\\', '/')
    cmd = re.sub('/+', '/', cmd)
    ret = 0
    if platform.system() == 'Windows':
        st = subprocess.STARTUPINFO
        st.dwFlags = subprocess.STARTF_USESHOWWINDOW
        st.wShowWindow = subprocess.SW_HIDE
    else:
        cmd = str(cmd).encode('utf-8')
    s = subprocess.Popen(str(cmd), stdout=subprocess.PIPE, shell=True)
    info = s.communicate()[0]
    versionName = ''
    if vtype == 1:#apk version
        nPos = info.find('versionName')
        nEnd = info.find("'", nPos + 13)
        versionName = info[nPos + 13:nEnd]       
    elif vtype == 2:#sdk version
        nPos = info.find('targetSdkVersion')
        nEnd = info.find("'", nPos + 18)
        versionName = info[nPos + 18:nEnd]
    if versionName == '':
        versionName = 'Unknown Version'
    return versionName     

def decodeLuaFile(filePath):
    decodeToolPath = os.path.join(env.GOD_TOOL_DIR, 'BinaryEncoder', 'BinaryEncoder.exe')
    decodedFilePath = filePath.replace(".lua", "_decoded.lua")
    cmd = " ".join([decodeToolPath, "-d", filePath, decodedFilePath])
    ret = my_utils.execFormatCmd(cmd)
    return ret, decodedFilePath

def encodeLuaFile(filePath):
    encodedToolPath = os.path.join(env.GOD_TOOL_DIR, 'BinaryEncoder', 'BinaryEncoder.exe')
    encodedFilePath = filePath.replace(".lua", "_encoded.lua")
    cmd = " ".join([encodedToolPath, "-e", filePath, encodedFilePath])
    ret = my_utils.execFormatCmd(cmd)
    return ret, encodedFilePath
    
if __name__ == '__main__':
    decodeLuaFile(r'C:\Users\JonLiang\Desktop\apks\temp\gameConfig.lua');
