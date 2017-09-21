import os, time

f = '/var/stf/test/mytest/tttt.js'

filemt= time.localtime(os.stat(f).st_mtime)  
print time.strftime("%Y/%m/%d %H:%M:%S",filemt)



