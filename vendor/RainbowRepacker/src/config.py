#-*-coding:utf8-*-
'''
Created on 2014-11-3
@author RestWang
'''
import threading
import json
import os

class ConfigParse(object):
    def __init__(self):
        pass

    __configParse = None
    __lock = threading.Lock()
    
    __productName = ''
    __productId = ''
    __productVersionCode = ''
    
    __apkPath = ''
    __configDir = ''
    __outputDir = ''
    __packageName = ''
    __keystore = {}
    
    __channelDict = {}
    __packageList = []
    __sdkDict = {}
    __keystoreDict = {}

    @staticmethod
    def shareInstance():
        ConfigParse.__lock.acquire()
        if not ConfigParse.__configParse:
            ConfigParse.__configParse = object.__new__(ConfigParse)
            object.__init__(ConfigParse.__configParse)
        ConfigParse.__lock.release()
        return ConfigParse.__configParse
    
    def initData(self,jsonStr):
        jsonData = json.loads(jsonStr)
        
        self.__apkPath = jsonData['apkPath']
        self.__configDir = jsonData['configDir']
        self.__outputDir = jsonData['outDir']
        self.__keystore = jsonData['keystore']
        self.__packageName = jsonData['packageName']
    
    # 用户自定义渠道标识名称
    def getChannelSymbolFileName(self):
        return 'GodSDKChannelSymbol.txt'
    
    # SDK配置文件名称
    def getPluginConfigFileName(self):
        return 'GodSDKPlugins.xml'
    
    def getApkPath(self):
        return self.__apkPath
    
    # auttest_xxxxx.apk
    def getOutputName(self):
        #return "autotest_"+self.__apkPath.rsplit("\\", 1)[1]
        return "autotest_" + os.path.basename(self.__apkPath)

    # SDK预处理资源文件目录
    def getConfigDir(self):
        return self.__configDir

    def getOutputDir(self):
        return self.__outputDir

    def getPackageLs(self):
        return self.__packageList
    
    def getChannelDict(self):
        return self.__channelDict
    
    def getPackageName(self):
        return self.__packageName
    
    def getTargetPackageNameByChannelId(self,channelId):
        return self.__channelDict[channelId]['packageName']
    
    def getChannelSymbolsByChannelId(self, channelId):
        '''获取用户自定义的渠道标识，返回的是以逗号分隔的字符串类似‘1,2,3,aaa,bbb,ccc’
        '''
        if 'symbols' in self.__channelDict[channelId]:
            return self.__channelDict[channelId]['symbols']
        else:
            return None
    
    def getOutputNameByChannelId(self, channelId):
        '''获取最终打包出来的文件名称，如果是批量多渠道打包则应该为zip，否则为apk
        '''
        if 'outName' in self.__channelDict[channelId]:
            return self.__channelDict[channelId]['outName']
        else:
            return None

    def getChannelInfo(self, idChannel):
        return self.__channelDict[idChannel]
    
    def getKeystoreInfo(self):
        return self.__keystore
    
    def getKeystoreInfoByChannelId(self,channelId):
        if channelId in self.__keystoreDict:
            return self.__keystoreDict[channelId]
        else:
            return self.__keystore
    
    def getSdkListByChannelId(self,channelId):
        return self.__sdkDict[channelId]

