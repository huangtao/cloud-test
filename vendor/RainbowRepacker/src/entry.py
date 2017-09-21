#-*-coding:utf8 -*-


import sys
import os
sys.path.append(os.path.realpath(__file__))
import json
from config import ConfigParse
import env


def php_entry(arg):
    # 单例
    ConfigParse.shareInstance().initData(arg)
    
    from pack_managers.newengine_pack_manager import NewEnginePackManager
    NewEnginePackManager().run()

def windowsDebugJson(apkPath=r'E:\TestHoldemSina\apk\sina-release201607311846.apk', targetDir=None):
    #rsplit()对字符串进行切片，如果参数num 有指定值，则仅分隔 num 个子字符串
    # outputDir = apkPath.rsplit('\\',1)[0]
    if targetDir != None:
        outputDir = targetDir
    else:
        outputDir = os.path.dirname(apkPath)
    arg = {
        'apkPath':apkPath,#用户上传的母包的可访问路径
        'configDir':os.path.join(env.GOD_WORK_DIR, 'res_for_autotest'),#预处理资源路径，跟sdkLs中的sdkRelativePath拼接为最终sdk目录
        'outDir':outputDir,#外部路径
        'packageName':'com.boyaa.sina',
        'keystore':{#最终反编译二次打包时需要的签名文件,暂时写死使用龙卷风项目组签名文件，后续优化根据需求使用各个项目的签名文件
            'file':os.path.join(env.GOD_TOOL_DIR, 'debug.keystore'),
            'storePassword':'android',
            'keyAlias':'androiddebugkey',
            'aliasPassword':'android'
        },
       }
    # dict -> str
    return json.dumps(arg)

if __name__ == '__main__' :
    targetDir = None
    if len(sys.argv) == 1:
        apkPath = r'C:\Users\LukeJiang\Desktop\kk\engine_android(1)(1).apk'
    else:
        apkPath = sys.argv[1]
        if len(sys.argv) == 3:
            targetDir = sys.argv[2]
    argjson = windowsDebugJson(apkPath, targetDir)
    
    #===========================================================================
    # if platform.system() == 'Linux':
    #     apkPath = sys.argv[1]
    #     argjson = windowsDebugJson(apkPath)
    # elif platform.system() == 'Windows':
    #     argjson = windowsDebugJson(r'C:\Users\LukeJiang\Desktop\scancase\repack\engine_android(4).apk')
    #===========================================================================
    
    import log_utils
    log_utils.getLogger().info('sys.argv == %s', sys.argv)
    log_utils.getLogger().info('argjson == %s', argjson)
    php_entry(argjson)

