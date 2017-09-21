#!/usr/bin
# -*- coding:utf-8 -*-

import rethinkdb as r


with r.connect(host='172.20.137.13',port=28015,db='stf') as conn:
    r.table('devices').run(conn)

