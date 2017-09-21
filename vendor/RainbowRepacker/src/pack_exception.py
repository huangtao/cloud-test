#-*-coding:utf8 -*-

'''
Created on 2014-12-30

@author: junmeng
'''

#===============================================================================
# 主流程失败
#===============================================================================
PHP_PARAMS_ERROR = 100
SOURCE_APK_NOT_EXIST = 101
DECOMPLE_APK_FAILED = 102
GEN_CONFIG_XML_FAILED = 103
PRODUCE_NEW_R_FILE_FAILED = 104
RECOMPILE_APK_FAILED = 105
SIGN_APK_FAILED = 106
ALIGN_APK_FAILED = 107
SPECIAL_SCRIPT_EXECUTE_FAILED = 108
CHANNEL_SYMBOL_FILE_EXISTED = 109 # 母包中assets下已存在渠道标识同名文件GodSDKChannelSymbol.txt
PLUGIN_CONFIG_FILE_EXSITED = 110 # 母包中assets下已存在SDK配置同名文件GodSDKPlugins.xml
RES_NAME_CONFILIC_EXSITED = 111 #res中存在同名资源文件
RENAME_PACKAGE_EXSITED = 112 #重新命名的包名路径在母包中已存在

#===============================================================================
# 细节流程异常
#===============================================================================
COPY_RESOURCES_EXCEPTION = 1000
APPEND_RES_XML_EXCEPTION = 1001
SMALI_OPERATE_EXCEPTION = 1002
ZIP_DEFLATED_ADD_FILE_EXCEPTION = 1003
COPY_FILE_EXCEPTION = 1004

import log_utils

class PackException(Exception):
    '''用于在调用打包流程中无法打包异常抛出
    '''
    
    def __init__(self, errorCode, errorMsg):
        Exception.__init__(self)
        self.errorCode = errorCode
        self.errorMsg = errorMsg
        log_utils.getLogger().error(self)
    
    def __str__(self, *args, **kwargs):
        return 'errorCode = %s errorMsg = %s' % (str(self.errorCode), repr(self.errorMsg))
        
