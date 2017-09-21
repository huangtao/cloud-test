
# -element- coding: utf-8
import sys
import time
import fcntl

class FLOCK(object):

    def __init__(self, name):
        self.fobj = open(name, 'a+')
        self.fd = self.fobj.fileno()

    def lock(self):
        try:
            fcntl.lockf(self.fobj, fcntl.LOCK_EX | fcntl.LOCK_NB)  # 给文件加锁，使用了fcntl.LOCK_NB
            print '给文件加锁，稍等 ... ...'
            time.sleep(10)
	    os.system('awk \'/2182942/{gsub($2,"False")}{print}\' login.txt 1<>login.txt')
            return True
        except:
            print '文件加锁，无法执行，请稍后运行。'
            return False


    def unlock(self):
        self.fobj.close()
        print '已解锁'

if __name__ == "__main__":
    print sys.argv[1]
    locker = FLOCK(sys.argv[1])
    a = locker.lock()
    if a:
        print '文件已加锁'
    else:
        print '无法执行，程序已锁定，请稍等'
