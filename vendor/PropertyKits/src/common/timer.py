# -*- coding:utf-8 -*-

'''
Created on 2017年1月21日

@author: AppleWang
'''
from datetime import datetime, timedelta

def work():
    print("hello world.")

def runTask(func,day=0, hour=0, min=0, second=0):   
    # Init time
    now = datetime.now()
    strnow = now.strftime('%Y-%m-%d %H:%M:%S')
#     print ("now:",strnow)
    # First next run time
    period = timedelta(days=day, hours=hour, minutes=min, seconds=second)
    next_time = now + period
    strnext_time = next_time.strftime('%Y-%m-%d %H:%M:%S')
#     print ("next run:",strnext_time)
    while True:        
        # Get system current time
        iter_now = datetime.now()
        iter_now_time = iter_now.strftime('%Y-%m-%d %H:%M:%S')
        if str(iter_now_time) == str(strnext_time):
            # Get every start work time
            print ("data get time",iter_now_time)
            # Call task func
            func()            
#             print ("task done.")
            # Get next iteration time
            iter_time = iter_now + period
            strnext_time = iter_time.strftime('%Y-%m-%d %H:%M:%S')
#             print( "next_iter: %s" % strnext_time)
            # Continue next iteration
            continue
#测试
# runTask(work, second=2)


