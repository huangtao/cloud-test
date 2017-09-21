# -*- coding:utf-8 -*-


'''
Created on 2017年1月9日

@author: AppleWang
'''
import time
import sys
from datetime import datetime
import common.utils as utils
import common.timer as timer
import common.constant as constant
from properties.cpu_utils import CpuUtils
from properties.mem_utils import MemUtils
from properties.net_utils import NetUtils

def getproperties():
    
    # adb shell dumpsys meminfo '+self.pname
    mem=memutils.getProcessMemValue()
    
    cpu=cpuUtils.getProcessCpuValue()
    
    # 增加
    net_t,net_r,net_add=netutils.getProcessNetValue()
    now = datetime.now()
    now_time = now.strftime('%Y-%m-%d %H:%M:%S')
    constant.properties=[now_time,mem,cpu,net_t,net_r,net_add]
    print("properties data:",constant.properties)
    utils.write_data_excel()

if __name__ == "__main__":
    serial = str(sys.argv[1])
    pname= str(sys.argv[2])
    graptime = int(sys.argv[3])
    xlsname =  sys.argv[4]
    print("包名:",pname,"采集间隔:",graptime)
#     pname='com.boyaa.sina'
#     graptime=5
    constant.serial = serial
    constant.packname = pname
    constant.xlsname = xlsname
    #根据packagename获取pids 
    '''只能用于一台手机   adb shell ps | grep '''
    pid=utils.getPid(serial, pname)
    
    # adb shell cat proc/'+str(pid)+'/status'
    uid=utils.getUid(serial, pid)
    #若pid=0000，则重新获取pid,知道pid不等于0000
    while pid=='0000':
        pid=utils.getPid(serial, pname)
        uid=utils.getUid(serial, pid)
        time.sleep(3)
    
    # 创建的时候会获取一次
    netutils=NetUtils(serial, pid, uid)
    
    # 普通的赋值
    cpuUtils=CpuUtils(serial, pid)
    
    # 普通的赋值
    memutils=MemUtils(serial, pname)
    
    #创建excel表
    utils.creat_data_excel()
    
    timer.runTask(getproperties,second=graptime) 


