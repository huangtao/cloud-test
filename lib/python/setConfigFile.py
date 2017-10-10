# -*- coding: utf-8 -*-
import configparser
import sys

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

cf = configparser.ConfigParser()
cf.read(cfgFilePath, 'utf-8')

for (key, value) in params.items():
  try:
    cf.set(secs, key, value)
  except configparser.NoSectionError:
    cf.add_section(secs)
    cf.set(secs, key, value)

fh = open(cfgFilePath, 'w+')
cf.write(fh)
fh.close()
