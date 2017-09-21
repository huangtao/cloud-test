#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os
import multiprocessing
import fcntl
# if os.name == 'nt':
#     import win32con, win32file, pywintypes
#     LOCK_EX = win32con.LOCKFILE_EXCLUSIVE_LOCK
#     LOCK_SH = 0 # The default value
#     LOCK_NB = win32con.LOCKFILE_FAIL_IMMEDIATELY
#     __overlapped = pywintypes.OVERLAPPED(  )
#
#     def lock(file, flags):
#         hfile = win32file._get_osfhandle(file.fileno(  ))
#         win32file.LockFileEx(hfile, flags, 0, 0xffff0000, __overlapped)
#
#     def unlock(file):
#         hfile = win32file._get_osfhandle(file.fileno(  ))
#         win32file.UnlockFileEx(hfile, 0, 0xffff0000, __overlapped)
# elif os.name == 'posix':
from fcntl import LOCK_EX, LOCK_SH, LOCK_NB
def lock(file, flags):
    fcntl.flock(file.fileno(  ), flags)

def unlock(file):
    fcntl.flock(file.fileno(  ), fcntl.LOCK_UN)
# else:
#     raise RuntimeError("File Locker only support NT and Posix platforms!")

def writeLogfile(args):
    try:
        logfile, msg = args
        f = open(logfile, "a+")
        lock(f, LOCK_EX)
        f.write(msg + "\n")
        unlock(f)
    except Exception as ex:
        print("Error Info: %s"%(str(ex)))
    finally:
        f.close()

def multiExecute(logfile, count):
    pool = multiprocessing.Pool(processes = count)
    pool.map(writeLogfile, [(logfile, a)])	
if __name__ == "__main__":
    logfile = "login.txt"
    multiExecute(logfile, 3)
