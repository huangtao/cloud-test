
# -element- coding: utf-8
import sys
import os
import time
import fcntl

class FLOCK(object):

    def __init__(self, name):
        self.fobj = open(name, 'a+')
        #self.fd = self.fobj.fileno()
    def lock(self):
        try:
            fcntl.lockf(self.fobj, fcntl.LOCK_EX | fcntl.LOCK_NB)
	    print '给文件加锁，稍等 ... ...'
            #mid=os.system('cat login.txt|grep false|awk \'NR==1{print $1}\'')
            #os.system('awk \'/'+self.mid+'/{gsub($2,"CCC")}{print}\' login.txt 1<>login.txt',mid)
            #time.sleep(10)
            return True
        except:
            print '文件加锁，无法执行，请稍后运行。'
            return False


    def unlock(self):
        self.fobj.close()
        print '已解锁'

if __name__ == "__main__":
    #print sys.argv[1]
    mid = str(os.system('cat login.txt|grep TRUE|awk \'{print $1}\'|head -1'))
    print mid
    #time.sleep(1)
    locker = FLOCK(sys.argv[1])
    locker.lock()
    os.system('awk \'/'+mid+'/{gsub($2,"FALSE")}{print}\' login.txt 1<>login.txt')
    locker.unlock()
