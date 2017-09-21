
var Promise = require('bluebird')
var db = require('../../lib/db/')
var fileutil = require('../../lib/util/fileutil')
var r = require('rethinkdb')
var _  = require('lodash')
var moment = require('moment')
var page = 1
var pageSize = 10

var taskId = '1500973301675_GuixiangGui'

var query = r.db('stf').table('tasklist').get('1500973301675_GuixiangGui').without({ 'detail': { 'cases': 'error' } }).do(function(task) {
  
 return {
        casesCount: task('cases').default([]).count(),
        serials: task('serials').default([]),
        projectName: task('projectName'),
        caseVersion: task('caseVersion').default('1500'),

        devices: task('serials').default([]).map(function (serial) {
          return {
            "serial": serial
          }
        }).eqJoin('serial', r.db('stf').table('devices')).map(function (d) {
          return {
            serial: d('right')('serial'),
            markName: d('right')('markName').default(''),
            version: d('right')('version'),
            manufacturer: d('right')('manufacturer'),
            width: d('right')('display')('width').default(''),
            height: d('right')('display')('height').default('')
          }
        }),
   completedDevices: task('detail').map(function(detail) {
     return {
       serial: detail('serial'),
       status: detail('status'),
       sucCount: detail('cases').default([]).filter({result: 'True'}).count(),
       failCount: detail('cases').default([]).filter({result: 'False'}).count(),
       result: detail('result'),
     }
     
   })
 }
  
})


db.run(query).then(function(obj) {


    var order = 0
    obj.devices.forEach(function (device) {
	
		if (order == 1) {
			continue
		}
	})



})
