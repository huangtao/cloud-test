# coding: utf8

import os
import subprocess
import constant

def isdir(path):
    return os.path.isdir(path)

def isfile(path):
    return os.path.isfile(path)

def join(*args):
    result = args[0]
    for arg in range(1, len(args)):
        result = os.path.join(result, args[arg])
    return result

def listdir(path):
    return os.listdir(path)

def relative(start, to):
    r_p = os.path.relpath(start, to)
    result = []
    while True:
        t = os.path.split(r_p)
        result.append(t[1])
        if t[0] == '':
            break
        r_p = t[0]
    return result[::-1]

def suffix(path):
    return os.path.splitext(path)[1]

def exec_cmd(cmd='', cwd=constant.LOCAL_BASE_URL, return_type=constant.RETURN_CODE):
    print cmd
    p = subprocess.Popen(cmd, shell=True, cwd=cwd, stdout=subprocess.PIPE, stdin = subprocess.PIPE, stderr=subprocess.PIPE)
    p.wait()
    return p.returncode

