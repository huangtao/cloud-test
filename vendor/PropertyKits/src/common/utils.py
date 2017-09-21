# -*- coding:utf-8 -*-

'''
Created on 2017年1月6日

@author: AppleWang
'''

import os
import re
import xlwt
from datetime import datetime
import xlrd
from xlutils.copy import copy
import common.constant as constant
#执行cmd命令,返回执行结果（返回的是一个分割后的数组）     
def execmd(cmd):        
    cmdlogs=os.popen(cmd)    
    return cmdlogs

def formallog(cmdlogs):
    logs=re.split('\s+',cmdlogs)    
    for log in logs:        
        if log=='':
            logs.remove(log)    
    return logs
      
#若pid不存在，则为0000  
def getPid(serial, packagename):
    # 适用于 只连一台手机的情况
    # cmd='adb shell ps | grep '    
    # cmd=cmd+packagename
    cmd = 'adb -s %s shell ps | grep %s' % (serial, packagename)
    try:
        cmdlogs=execmd(cmd).readlines() 
        pidlogs= []
        for pid_list in cmdlogs:        
#           print(pid_list)
            pidStr=formallog(pid_list)
            pacName=pidStr[8]
            if pacName==packagename:
                pidlogs=pid_list
        pidlog=formallog(pidlogs)   
        pid=pidlog[1]
    except Exception as err:  
        pid='0000'
        print(err)            
    print("pid:",pid)
    return pid   
   
#根据pid获取uid,读取proc/pid/status文件
def getUid(serial, pid):
    # cmd='adb shell cat proc/'+str(pid)+'/status'
    cmd = 'adb -s %s shell cat proc/%s/status' % (serial, str(pid))
    try:
        cmdllogs=execmd(cmd).readlines()
        #取Uid字段
        uidlogs=''
        char='Uid'
        for cmdlog in cmdllogs:
            if char in cmdlog:            
                uidlogs=cmdlog      
                break            
        uids=re.split('\s+',uidlogs)    
        uid=uids[1]        
    except Exception as err:
        uid='0000'
        print(err)    
    print("uid:",uid)
    return uid

def creat_data_excel():
    print("creat_data_excel")
    wb = xlwt.Workbook(encoding='utf-8')
    mysheet = wb.add_sheet('properties') 
    title=constant.excel_content
    num=len(title)
    for i in range(0,num):
        mysheet.write(0,i,title[i])    
    #now = datetime.now()
    #nowtime = now.strftime('%Y-%m-%d')    
    #name=constant.serial+'_'+constant.packname+'('+nowtime+')'+'.xls'
    name = constant.xlsname
    print("excelname:",name)
    constant.excelname=name
    wb.save(name)

def write_data_excel():             
    #打开已存在的excel文件
    print("write_data_excel")
    old_excel = xlrd.open_workbook(constant.excelname, formatting_info=True)    
    new_excel = copy(old_excel)    
    mysheet = new_excel.get_sheet(0)    
    #获取性能数据
    values=constant.properties    
    num=len(values)
    row=constant.row
    #循环写入行数据的每一列
    for i in range(0,num):
        mysheet.write(row,i,values[i])    
    #写完后row+1
    constant.row += 1
    new_excel.save(constant.excelname)
    

  
    




