var r = require('rethinkdb')
var util = require('util')

var db = require('./')
var stringutil = require('../util/stringutil')
var wireutil = require('../wire/util')
var logger = require('../util/logger')
var httputil = require('../util/httputil')
var path = require('path')
var dbapi = Object.create(null)

var Promise = require('bluebird')
var log = logger.createLogger('db:apiv2')

var taskid = '1489637214864_GuixiangGui'
var async = require('async')


var options = {
    hostname: '192.168.204.70',
    port: 80,
    path: '/kkpromo_new/api.php?m=tool&p=showapi&_=1490326061395',
    method: 'GET'
}


function tt() {
	var query = r.table('devices').get('101059191f643')
	return new Promise(function(resolve, reject) {

		db.run(query).then(function(cursor) {
			console.log(cursor.serial)
		})
	})

}

setInterval(tt, 1000)
