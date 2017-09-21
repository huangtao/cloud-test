#coding: utf8

# 必须继承的基类
TARGET_BASE_CLASS = ['TestCase', 'testbase.testcase.TestCase']

# 本地扫描路径
LOCAL_BASE_URL = '/var/stf/testproject/'

# svn项目路径
SVN_PROJECT_URL = 'http://svn.oa.com:24399/Rainbow/Projects/'

# svn用户名
SVN_USER_NAME = 'LukeJiang'

# svn密码
SVN_PASSWD = 'jc000000@'

RETURN_CODE = 0

# svn checkout http://svn.oa.com:24399/Rainbow/Projects /var/stf/test/mytest --username LukeJiang --password jc000000@ 

'''
root@stf-test:/var/stf/test# svn list
svn: E155007: “/var/stf/test”不是工作副本
root@stf-test:/var/stf/test# echo $?
1

'''
