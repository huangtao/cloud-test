
var Promise = require('bluebird')
//var dbapi = require('../../lib/db/api')
var fileutil = require('../../lib/util/fileutil')
var httputil = require('../../lib/util/httputil')
var r = require('rethinkdb')
var _  = require('lodash')
var moment = require('moment')



var options = {
    hostname: 'pcususus01.ifere.com',
    port: 80,
    path: '/ddfqp/?action=tools.getGameMap',
    method: 'GET'
 }
console.log('shit')
httputil.get(options).then(function (data) {
	console.log(data)
	console.log('fukc')
})

