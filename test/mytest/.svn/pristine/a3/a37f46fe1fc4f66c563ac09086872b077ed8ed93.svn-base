# -*- coding: utf-8 -*-
import os,sys,threading
from time import sleep, ctime
import subprocess
import time

def runtestcase(devicename):
    timeout=1200000
    adbCommand("adb -s",devicename,"push "+configpath+" "+configpathonphome)
    adbCommand("adb -s",devicename,"install -r "+unlockapkpath)
    closepid("uiautomator",devicename)    
    #安装自动化脚本
    adbCommand("adb -s",devicename,"push "+"/var/stf/vendor/installuiautomator/autoinstall.jar"+" /data/local/tmp")
    adbCommand("adb -s",devicename,"shell am start -n com.example.unlock/.Unlock")
    subprocess.Popen("adb -s "+devicename+" shell "+"uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall &",shell=True)
    #卸载
    adbCommand("adb -s",devicename,"uninstall "+apkpackage)
    adbCommand("adb -s",devicename,"uninstall "+testapkpackage)
    #安装apk
    
    adbCommand("adb -s",devicename,"install -r "+apkpath)
    adbCommand("adb -s",devicename,"install -r "+testapkpath)

    #启动测试用例
    info=adbCommand("adb -s",devicename,"shell am instrument  -w com.boyaa.checkjar.test/android.test.InstrumentationTestRunner")
    print(info)
    if(info.find("OK (1 test)")):
        adbCommand("adb -s",devicename,"pull "+ScreenshotsPath + " "+ScreenshotsPathPC+devicename)
    else:
        print(u"测试用例执行失败，请检查后重试")
    closepid(devicename,"uiautomator")
    #卸载
    adbCommand("adb -s",devicename,"uninstall "+apkpackage)
    adbCommand("adb -s",devicename,"uninstall "+testapkpackage)

def adbCommand(command,device,args):
    """
    执行adb命令
    """
    cmd = "%s %s %s" % (command, device, args)
    print(cmd)
    r = os.popen(cmd)
    info = r.read()    
    print(info,' '+device)
    return info
    
def deviceslist():
    cmd="adb devices"
    r = os.popen(cmd)
    info = r.read()
    info = info[25:]
    info = info.strip()
##    print(info)
    deviceslist = info.split("device")
##    print(deviceslist)
    devices=[]
    for i in deviceslist:
        if(i!=''):
            i=i.replace('\r','').replace('\n','').replace('\t','')
            devices.append(i)
    print(devices)
    return devices

def closepid(pidname,devicename):
    pidinfo = adbCommand("adb -s",devicename,"shell ps |grep "+pidname)
    print(pidinfo)
    if(pidinfo == ""):
        print("no pid "+pidname)
    else:
        pid = [int(s) for s in pidinfo.split() if s.isdigit()] 
        print("pid:"+str(pid[0]))
        cmd = "adb -s "+devicename+" shell kill -9 "+str(pid[0])
        print(cmd)
        os.popen("adb -s "+devicename+" shell kill -9 "+str(pid[0]))

class MyThread(threading.Thread):
    def __init__(self,device):
        threading.Thread.__init__(self)
        self.device = device
    def run(self):
        runtestcase(self.device)
                
if __name__ == '__main__':
    print("===开始测试===")
    apkpath="/tmp/HuoDong/app-debug.apk"
    testapkpath="/tmp/HuoDong/HuoDong.apk"
    configpath="/tmp/HuoDong/config.ini"
    configpathonphome="/sdcard/download/"
    ScreenshotsPath="/sdcard/Robotium-Screenshots/"
    apkpackage="com.boyaa.checkjar"
    testapkpackage="com.boyaa.checkjar.test"
    ScreenshotsPathPC="/tmp/HuoDong/Screenshots/"
    unlockapkpath="/tmp/HuoDong/unlock_apk-debug.apk"
    threads = []
    #获取设备列表
    deviceslist=deviceslist()    
    for devicename in deviceslist:
        ScreenshotsPathPC1=ScreenshotsPathPC+devicename
        print(ScreenshotsPathPC1)
        #文件夹
        if os.path.exists(ScreenshotsPathPC1):
            print("file is exist")
        else:
            os.makedirs(ScreenshotsPathPC1)
    print("程序开始运行%s" % ctime())
    for devicename in deviceslist:
##        for i in range(len(deviceslist)):
        print(devicename)
        th=MyThread(devicename)
        th.start()
        threads.append(th)
        # 等待线程运行完毕
    for th in threads:
        th.join()
         
    print("程序结束运行%s" % ctime())

   
