#-*-coding:utf8 -*-

'''
Created on 2014-12-29
logging.DEBUG 输出一些琐碎的调试信息
logging.INFO 输出一些阶段性的标志
logging.WARNING 输出一些有可能出现问题的日志
logging.ERROR 输出异常
logging.CRITICAL 输出异常
@author: junmeng
'''
import logging
import sys
import platform

# 控制台输出的等级
STREAM_HANDLER_LEVEL = logging.INFO
# 文件输出的等级
FILE_HANDLER_LEVEL = logging.INFO
# 日志输出格式
LOG_FORMAT_STRING = '%(asctime)s [line %(lineno)d in %(filename)s - %(funcName)s] %(levelname)s : %(message)s'

class MyStreamHandler(logging.StreamHandler):
    def __init__(self):
        logging.StreamHandler.__init__(self, stream=sys.stdout)
    def format(self, record):
        try:
            return logging.StreamHandler.format(self, record)
        except Exception as e:
            print(e);
        
class MyFileHandler(logging.FileHandler):
    def format(self, record):
        try:
            return logging.FileHandler.format(self, record)
        except Exception as e:
            print(e)

formatter = logging.Formatter(LOG_FORMAT_STRING)

logger = logging.getLogger('GodSDK')
logger.setLevel(logging.DEBUG)

mySH = MyStreamHandler()
mySH.setLevel(STREAM_HANDLER_LEVEL)
mySH.setFormatter(formatter)

myFH = None;
# myFH = MyFileHandler(filename='test.log')
# myFH.setLevel(FILE_HANDLER_LEVEL)
# myFH.setFormatter(formatter)

logger.addHandler(mySH)
# logger.addHandler(myFH)

def changeLoggerFileHandler(filename):
    global logger
    global myFH
    if myFH is not None:
        logger.removeHandler(myFH)
        
    encoding = None
    if platform.system() == 'Linux':
        encoding = 'utf-8'
    myFH = MyFileHandler(filename, encoding = encoding)
    myFH.setLevel(FILE_HANDLER_LEVEL)
    myFH.setFormatter(formatter)
    logger.addHandler(myFH)

def getLogger():
    return logger
