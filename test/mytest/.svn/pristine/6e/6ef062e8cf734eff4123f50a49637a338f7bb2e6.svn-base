# -*- coding: utf-8 -*-
import os,sys,threading
from time import sleep, ctime
import subprocess
import time

def runtestcase(devicename):
    adbCommand("adb -s",devicename,"push "+configpath+" "+configpathonphome)
    closepid("uiautomator",devicename)
    #安装自动化脚本
    adbCommand("adb -s",devicename,"push "+"D:\\workspace\\HuoDong\\autoinstall.jar"+" /data/local/tmp")
    
##    cmd1 = "%s %s %s" % (command, device, args)
##    adbCommand("adb -s",devicename,"shell "+"uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall &")
    subprocess.Popen("adb -s "+devicename+" shell "+"uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall &")
    #卸载
    adbCommand("adb -s",devicename,"uninstall "+apkpackage)
    adbCommand("adb -s",devicename,"uninstall "+testapkpackage)
    #安装apk
    adbCommand("adb -s",devicename,"install -r "+apkpath)
    adbCommand("adb -s",devicename,"install -r "+testapkpath)
    #adbCommand("adb -s",devicename,"shell am broadcast -a com.boyaa.checkjar.test --es \"url\" "+huodongurl)
    #启动测试用例
    info=adbCommand("adb -s",devicename,"shell am instrument  -w com.boyaa.checkjar.test/android.test.InstrumentationTestRunner")
    print(info)
    if(info.find("OK (1 test)")):
##    if(subprocess.check_call ='0'):
        adbCommand("adb -s",devicename,"pull "+ScreenshotsPath + " "+ScreenshotsPathPC+devicename)
    else:
        print(u"测试用例执行失败，请检查后重试")
    closepid("uiautomator",devicename)
    

def adbCommand1(command,device,args,timeout):
    """
    执行adb命令
    """
    cmd = "%s %s %s" % (command, device, args)
    print(cmd)
    starttime = time.time()
    print(starttime)
##    r = os.popen(cmd)
    r = subprocess.call(cmd,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    info = fd.write(data.stdout.read())
    print(info)
    return info
    while r.poll() is None:
        time.sleep(1)
        now = datetime.datetime.now()
        if(now - starttime).seconds > timeout:
            os.kill(process.pid, signal.SIGKILL)  
            os.waitpid(-1, os.WNOHANG)  
            return None  
    #return process.stdout.readlines() 
    return info

def adbCommand(command,device,args):
    """
    执行adb命令
    """
    cmd = "%s %s %s" % (command, device, args)
    print(cmd)
    starttime = time.time()
    print(starttime)
    r = os.popen(cmd)
    info = r.read()
    print(info) 
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
    pidinfo = os.popen("adb -s "+devicename+" shell ps |grep "+pidname)
    pidinfo1 = pidinfo.read()
    print(pidinfo1)
    if(pidinfo1 == ""):
        print("no pid "+pidname)
    else:
        pid = [int(s) for s in pidinfo1.split() if s.isdigit()] 
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
    apkpath="D:\\workspace\\HuoDong\\app-debug.apk"
    testapkpath="D:\\workspace\\HuoDong\\HuoDong.apk"
    configpath="D:\\workspace\\HuoDong\\config.ini"
    configpathonphome="/sdcard/download/"
    ScreenshotsPath="/sdcard/Robotium-Screenshots/"
    apkpackage="com.boyaa.checkjar"
    testapkpackage="com.boyaa.checkjar.test"
    ScreenshotsPathPC="F:\\Screenshots\\"
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
            os.mkdir(ScreenshotsPathPC1)
        
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

   
