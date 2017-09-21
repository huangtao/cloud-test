# -*- coding: utf-8 -*-
'''
Created on 2017年3月13日
@author: AppleWang
'''
import os
import sys
import utils.util as util
from utils.confighelper import ConfigHelper
import utils.constant as constant 
from runcenter.runner import TestRunner,TestCaseSettings
from runcenter.report import XMLTestReport,EmptyTestReport
from runcenter.testresult import StreamResult

class RunTest(object):
    '''批量执行测试用例，通过模块名来执行，如args=cases
    '''                  
    def __init__(self,device):
        self.device=device
    
    def runtest(self, args):           
        '''
        args参数为数组类型
        '''                  
        test_conf = TestCaseSettings(args)    
#         print 'test_conf:',test_conf
        #读配置
        config=ConfigHelper(constant.cfg_path)   
        report_formal=config.getValue('report','reportFormal')
        if report_formal=='XMLReport':
            if self.device == None:
                runner = TestRunner(XMLTestReport('cases'))
            else:
                runner = TestRunner(XMLTestReport(self.device))
        else:
            runner = TestRunner(EmptyTestReport(lambda tc: StreamResult()))              
        runner.run(test_conf)

if __name__ == '__main__':
    #获取device_name参数
    device = None
    try:
        device=str(sys.argv[1])
    except:
        print "no devicename"
    if device == None:
        cfg_path = os.sep.join([util.getrootpath(), 'cfg', 'cfg.ini'])
        config = ConfigHelper(cfg_path)
        cfgfile = os.sep.join([util.getrootpath(),'cfg','cfg.ini'])
        logfile = os.sep.join([util.getrootpath(),'logs'])
    else:
        #根据device写入配置
        cfgfile=os.sep.join([util.getrootpath(), device,'cfg','cfg.ini'])
        logfile=os.sep.join([util.getrootpath(), device,'logs'])
    constant.cfg_path=cfgfile
    constant.log_path=logfile
    config=ConfigHelper(constant.cfg_path) 
    cases=config.getValue('runtest','cases')
    cases=cases.split(',')
    runtest=RunTest(device)    
    runtest.runtest(cases)

