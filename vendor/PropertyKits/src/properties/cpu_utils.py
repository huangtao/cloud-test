# -*- coding:utf-8 -*-

'''
Created on 2017年1月9日

@author: AppleWang

cpu相关工具集

'''

# -*- coding:utf-8 -*-

import common.utils as utils

class CpuUtils():
    def __init__(self, serial, pid):        
        self.pCpu =self.o_pCpu = 0.0
        self.aCpu =self.o_aCpu = 0.0
        self.serial = serial
        self.pid=pid
    #获取pid的cpu信息 
    def getProcessCpuAction(self):
        pid=str(self.pid)
        #cmd='adb shell cat proc/'
        #cmd=cmd+pid
        #cmd=cmd+'/stat'
        cmd = 'adb -s %s shell cat proc/%s/stat' % (self.serial, pid)
        try:
            cmdlogs=utils.execmd(cmd).readline()
            cmdlogs=utils.formallog(cmdlogs)
            result=[]
            result.append(cmdlogs[1])
            result.append(cmdlogs[13])
            result.append(cmdlogs[14])
        except Exception as err:
            result=[]
            print(err)  
        return result
    
    #获取手机cpu信息
    def getCpuAction(self):
        #cmd='adb shell cat proc/stat'
        cmd = 'adb -s %s shell cat proc/stat' % self.serial
        try:
            cmdlogs=utils.execmd(cmd).readline()         
            cmdlogs=utils.formallog(cmdlogs)
        except Exception as err:
            cmdlogs=[]
            print(err)          
        return cmdlogs
    
    #获取pid占用的cpu
    def getProcessCpuValue(self):
        # adb shell dumpsys cpuinfo |grep pid
        result1 = self.getProcessCpuAction()
        if result1:
            self.pCpu=float(result1[1])+float(result1[2])
        
        # adb shell cat proc/stat
        result2 = self.getCpuAction();
        if result2:
            self.aCpu = 0.0
            for i in range(2,len(result2)):
                self.aCpu += float(result2[i])
        
        usage = 0.0
        if self.aCpu-self.o_aCpu!=0:
            usage=float("%.2f" %((self.pCpu - self.o_pCpu) * 100.00/(self.aCpu - self.o_aCpu)))                          
            if usage<0:
                usage = 0
            elif usage > 100:
                usage = 100
        self.o_pCpu = self.pCpu
        self.o_aCpu = self.aCpu
#         result = str(usage) + "%"
        result=usage
        self.p_jif = self.pCpu
        print("CPU:",result)
        return result
     
    #dumpsys方式获取pid的cpu信息
    def getCpuInfpByCMD(self,pid):
        #cmd='adb shell dumpsys cpuinfo |grep '
        #cmd=cmd+pid
        cmd = 'adb -s %s shell dumpsys cpuinfo | grep %s' % (self.serial, str(pid))
        try:
            cpuInfo=utils.execmd(cmd)
        except Exception as err:            
            print(err)
        return cpuInfo


