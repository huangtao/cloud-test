# -*- coding: utf-8 -*-
import configparser
#import ConfigParser as configparser
import sys
#reload(sys)
#sys.setdefaultencoding( "utf-8" )
global args
secs = sys.argv[3]
if secs=='runtest':
    args = [sys.argv[1]]
else:
    args = sys.argv[1].split(',')

cfgFilePath = sys.argv[2]

params = {}
for arg in args:
    strs = arg.split(':')
    params[strs[0]]=strs[1]
print params
print cfgFilePath
cf = configparser.ConfigParser()
cf.read(cfgFilePath, 'utf-8')
#cf.read(cfgFilePath)
for (key, value) in params.items():
  try:
    cf.set(secs, key, value)
  except configparser.NoSectionError:
    cf.add_section(secs)
    cf.set(secs, key, value)

fh = open(cfgFilePath, 'w+')
cf.write(fh)
fh.close()
