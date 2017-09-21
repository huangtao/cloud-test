# coding:utf8

import subprocess
import util
import constant

def checkout():
    # 是否checkout过
    code = util.exec_cmd('svn list')
    if code:
        cmd = 'svn checkout %s %s --username %s --password %s' % (constant.SVN_PROJECT_URL, constant.LOCAL_BASE_URL, constant.SVN_USER_NAME, constant.SVN_PASSWD)
        util.exec_cmd(cmd)
    else:
        # svn update
        util.exec_cmd('svn update')



checkout()
