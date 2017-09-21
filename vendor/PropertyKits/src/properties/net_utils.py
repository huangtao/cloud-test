# -*- coding:utf-8 -*-

'''
Created on 2017年1月9日

@author: AppleWang

'''

import common.utils as utils
import common.constant as constant
import os

#读文件获取进程流量方法
#(1)proc/net/xt_qtaguid/stats|grep 10101  (uid)
#(2)proc/20897/net/dev                    (pid)
#(3)proc/uid_stat/10101/tcp_rcv           (uid)

class NetUtils():
    def __init__(self, serial, pid, uid):        
        #流量参数
        self.p_t_base = 0
        self.p_r_base = 0        
        
        self.p_t_base_pid = 0
        self.p_r_base_pid = 0

        self.p_t_add = 0
        self.p_r_add = 0
        self.p_add=0   
        
        self.p_t_add_pid = 0
        self.p_r_add_pid = 0
        self.p_add_pid=0       
        
        self.serial = serial
        self.pid=pid
        self.uid=uid
           
        self.initNetMethod()   
        self.initProcessNetValue()
    
    # 填充constant
    def initNetMethod(self):
        uid=str(self.uid)
        # cmd="adb shell ls /proc/uid_stat/"+uid+"|grep 'tcp_snd'"
        cmd = 'adb -s %s shell ls /proc/uid_stat/%s | grep tcp_snd' % (self.serial, uid)
        try:
            cmdlogs=os.popen(cmd).readline()            
            cmdlog=utils.formallog(cmdlogs)[0]                  
            if cmdlog=='tcp_snd':
                print("use uid get net")
                constant.net_method='uid'
            else:
                print("use pid get net")
                constant.net_method='pid'
        except Exception as err:
            print("use pid get net")
            constant.net_method='pid'
            print(err)   
        
    def initProcessNetValue(self):
        if constant.net_method=='uid':
            # 获取上行流量    adb shell cat /proc/uid_stat/'+uid+'/tcp_snd'
            self.p_t_base=self.getOutNet_uid()
            # 获取下行流量    adb shell cat /proc/uid_stat/'+uid+'/tcp_rcv'
            self.p_r_base=self.getInNet_uid()
	    try:
	        self.p_t_base = int(self.p_t_base)
	    except ValueError as e:
	        self.p_t_base = 0
	    try:
		self.p_r_base = int(self.p_r_base)
	    except ValueError as e:
		self.p_r_base = 0
              
        if constant.net_method=='pid':
            # adb shell cat proc/'+pid+'/net/dev'
            self.p_t_base_pid=self.getOutNet_pid()
            self.p_r_base_pid=self.getInNet_pid()
            try:
	        self.p_t_base_pid = int(self.p_t_base_pid)
	    except ValueError as e:
	        self.p_t_base_pid = 0
	    try:
		self.p_r_base_pid = int(self.p_r_base_pid)
	    except ValueError as e:
		self.p_r_base_pid = 0
        
        # 多余了
        self.p_t_add = 0
        self.p_r_add = 0 
        
        self.p_t_add_pid = 0
        self.p_r_add_pid = 0 
        
           
    # 返回的是增量?? 为什么是返回增量
    def getProcessNetValue(self):        
        if constant.net_method=='uid':
            p_t_cur = self.getOutNet_uid()
            p_r_cur = self.getInNet_uid()
	    p_t_cur = (int(p_t_cur) if p_t_cur else 0)
	    p_r_cur = (int(p_r_cur) if p_r_cur else 0)
	    #print(p_t_cur, type(p_t_cur))
	    #print(self.p_t_base, type(self.p_t_base))
            self.p_t_add = float("%.2f" %((int(p_t_cur) - int(self.p_t_base))/1024))
            self.p_r_add = float("%.2f" %((int(p_r_cur) - int(self.p_r_base))/1024))       
            self.p_add=float("%.2f" %(self.p_t_add + self.p_r_add))
            print("NET:",self.p_t_add,self.p_r_add,self.p_add)           
            return self.p_t_add,self.p_r_add,self.p_add
        if constant.net_method=='pid':
            p_t_cur_pid = self.getOutNet_pid()        
            p_r_cur_pid = self.getInNet_pid()
            self.p_t_add_pid = float("%.2f" %((int(p_t_cur_pid) - int(self.p_t_base_pid))/1024))
            self.p_r_add_pid = float("%.2f" %((int(p_r_cur_pid) - int(self.p_r_base_pid))/1024))       
            self.p_add_pid=float("%.2f" %(self.p_t_add_pid + self.p_r_add_pid))   
            print("NET:",self.p_t_add_pid,self.p_r_add_pid,self.p_add_pid)             
            return self.p_t_add_pid,self.p_r_add_pid,self.p_add_pid
        else:
            return float(0.0),float(0.0),float(0.0)
        
        
    #****************************第一种方法获取***************************
    # 根据pid获取网络接收流量proc/uid_stat/10101/tcp_rcv
    # 根据pid获取网络发送流量proc/uid_stat/10101/tcp_snd
    def getOutNet_uid(self):
        uid=str(self.uid)
        # cmd='adb shell cat /proc/uid_stat/'+uid+'/tcp_snd'
        cmd = 'ad -s %s shell cat /proc/uid_stat/%s/tcp_snd' % (self.serial, uid)
        try:
            cmdlogs=utils.execmd(cmd).readline()
            sndnet=cmdlogs
        except Exception as err:
            sndnet=0
            print(err)
        return sndnet    
    
    def getInNet_uid(self):
        uid=str(self.uid)       
        # cmd='adb shell cat /proc/uid_stat/'+uid+'/tcp_rcv'
        cmd = 'adb -s %s shell cat /proc/uid_stat/%s/tcp_rcv' % (self.serial, uid)  
        try:
            cmdlogs=utils.execmd(cmd).readline()
            sndnet=cmdlogs
        except Exception as err:
            sndnet=0
            print(err)
        return sndnet
    
    
    #****************************第二种方法获取***************************根据pid获取网络发送流量proc/20897/net/dev    
    def getOutNet_pid(self):
        pid=str(self.pid)
        # cmd='adb shell cat proc/'+pid+'/net/dev'
        cmd = 'adb -s %s shell cat proc/%s/net/dev' % (self.serial, pid)
        try:
            cmdlogs=utils.execmd(cmd).readlines()            
            wlanstr='wlan0'
            wlan0log=''
            for cmdlog in cmdlogs:            
                if wlanstr in cmdlog:
                    wlan0log=cmdlog            
            wlan0log=utils.formallog(wlan0log)            
            rebytes=wlan0log[1]                                
        except Exception as err:
            rebytes=0
            print(err)
        print(rebytes)
        return rebytes
        
    def getInNet_pid(self):
        pid=str(self.pid)
        # cmd='adb shell cat proc/'+pid+'/net/dev'
        cmd = 'adb -s %s shell cat proc/%s/net/dev' % (self.serial, pid)
        try:
            cmdlogs=utils.execmd(cmd).readlines()            
            wlanstr='wlan0'
            wlan0log=''
            for cmdlog in cmdlogs:            
                if wlanstr in cmdlog:
                    wlan0log=cmdlog            
            wlan0log=utils.formallog(wlan0log)                   
            trbytes=wlan0log[9]        
            print(trbytes)
        except Exception as err:
            trbytes=0
            print(err)
        return trbytes


