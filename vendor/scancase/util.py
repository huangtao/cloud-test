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

def safely_list_dir(*args):
    path = args[0]
    for arg in range(1, len(args)):
        path = os.path.join(path, args[arg])
    return os.listdir(path) if os.path.isdir(path) else []

def filename(path):
    return os.path.basename(os.path.splitext(path)[0])

def basename(path):
    return os.path.basename(path)

def dirname(path):
    return os.path.dirname(path)

def walk(path):
    return os.walk(path)

def exist(path):
    return os.path.exists(path)

def mkdir(path):
    os.makedirs(path)

def exec_cmd(cmd='', cwd=constant.LOCAL_BASE_URL, return_type=constant.RETURN_CODE):
    if not exist(cwd):
        mkdir(cwd)
    p = subprocess.Popen(cmd, shell=True, cwd=cwd, stdout=subprocess.PIPE, stdin = subprocess.PIPE, stderr=subprocess.PIPE)
    p.wait()
    return p.returncode
