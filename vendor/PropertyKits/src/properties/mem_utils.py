# -*- coding:utf-8 -*-

'''
Created on 2017年1月9日

@author: AppleWang
'''

import common.utils as utils

class MemUtils():
    def __init__(self, serial, pname):
        self.serial = serial
        self.pname=pname
        
    #findstr过滤方式较慢   
#     def getMemInfo(self,packname):
#         cmd='adb shell dumpsys meminfo | findstr '+packname
#         cmdlogs=utils.execmd(cmd).readline()
#         print(cmdlogs)
#         logs=utils.formallog(cmdlogs)       
#         memlog=logs[0]
#         print(memlog)
#         meminfo=str('%.2f'%(int(memlog)/1024))+'MB'        
#         print(meminfo)
       
    def getProcessMemValue(self):
        #cmd='adb shell dumpsys meminfo '+self.pname
        cmd = 'adb -s %s shell dumpsys meminfo %s' % (self.serial, self.pname)
        try:
            cmdlogs=utils.execmd(cmd).readlines()   
            totalstr='TOTAL'
            memlog=''
            for cmdlog in cmdlogs:      
                if totalstr in cmdlog:         
                    memlog=cmdlog
            logs=utils.formallog(memlog)
            memlog=logs[1]
            meminfo=float('%.2f'%(int(memlog)/1024))
        except Exception as err:
            meminfo=float(0.0)
            print(err)
        print("MEM:",meminfo)
        return meminfo

