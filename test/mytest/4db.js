
var Promise = require('bluebird')
var db = require('../../lib/db/')
var fileutil = require('../../lib/util/fileutil')
var r = require('rethinkdb')
var _  = require('lodash')
var moment = require('moment')
var page = 1
var pageSize = 10

var taskId = '1501042692959_GuixiangGui'
var os_version = ['6.0.1']
var dpis = [[720, 1280]]
var manufacturer = []

  var dpisStr = dpis.map(function (_dpis) {
    return _dpis[0] + 'x' + _dpis[1]
  })

var query = r.db('stf').table('tasklist').get(taskId).without({ 'detail': { 'cases': 'error' } }).do(function (task) {

    return r.branch(
      task,
      {
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
        completedDevices: task('detail').map(function (detail) {
          return {
            serial: detail('serial'),
            status: detail('status'),
            sucCount: detail('cases').default([]).filter({ result: 'True' }).count(),
            failCount: detail('cases').default([]).filter({ result: 'False' }).count(),
            result: detail('result'),
          }
        })
      },
      null
    )
  })

db.run(query).then(function (obj) {

    if (obj) {
      // 过滤手机版本
      if (os_version.length > 0) {
        _.remove(obj.devices, function (d) {
          return !_.includes(os_version, d.version)
        })
      }
      // 过虑分辨率
      if (dpis.length > 0) {
        _.remove(obj.devices, function (d) {
          return !_.includes(dpisStr, d.width + 'x' + d.height)
        })
      }
      // 过滤manufacturer
      if (manufacturer.length > 0) {
        _.remove(obj.devices, function (d) {
          return !_.includes(manufacturer, d.manufacturer)
        })
      }
      var order = 0
      obj.devices.forEach(function (device) {
        order = order + 1
        device.order = order

        var target_device = _.find(obj.completedDevices, function (o) {
          return o.serial == device.serial
        })

        // 如果已经完成的
        if (target_device) {
          _.assign(device, target_device)
          device.waitCount = obj.casesCount - device.failCount - device.sucCount
          device.process = '100%'
          device.sucRate = Math.round(device.sucCount / obj.casesCount * 100) + '%'
        }
        // 未完成的去找文件数量
        else {
          // 看目录下生成的几份文件
          var completedCases = 0
          var reportPath = fileutil.join('/var/stf/testproject2', obj.projectName, obj.caseVersion, 'DFQP/src', d.serial, 'report')
          // 存在
          if (fileutil.exists(reportPath)) {
            var cs = fileutil.list(reportPath)
            _.remove(cs, function (n) {
              return n == 'screenshot' || n == 'TestReport.xml' || n == 'TestReport.xsl' || n == 'TestResult.xsl'
            })
            completedCases += cs.length
          }
          device.status = 'unfinish'
          device.completedCount = completedCases
          device.waitCount = obj.casesCount - completedCases
          device.sucCount = 0
          device.failCount = 0
          device.process = Math.round(completedCases / obj.casesCount * 100) + '%'
          device.sucRate = Math.round(obj.sucCount / obj.casesCount * 100) + '%'
        }
      })

      delete obj.completedDevices
      delete obj.serials
	console.log(obj)
    }
    else {
    }

})
