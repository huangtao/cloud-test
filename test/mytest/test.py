import subprocess
import time
p = subprocess.Popen('sh count.sh', shell=True, stdout=subprocess.PIPE, stdin = subprocess.PIPE)

while p.poll() == None:  
    s = p.stdout.readline()[:-1]
    print s
    time.sleep(1)
print 'returen code:', p.returncode 

