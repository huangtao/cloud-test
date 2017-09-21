
var Promise = require('bluebird')
var db = require('../../lib/db/')
var fileutil = require('../../lib/util/fileutil')
var r = require('rethinkdb')
var _  = require('lodash')
var moment = require('moment')
var page = 1
var pageSize = 10

var taskId = '1500973301675_GuixiangGui'

var query = r.db('stf').table('tasklist').get(taskId).without({ 'detail': { 'cases': 'error' } }).do(function (task) {
    return r.branch(
      task,

      {
        cases: task('cases').default([]),
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
            display: d('right')('display')
          }
        }).map(function (cd) {
          return r.branch(
            task('detail')('serial').contains(cd('serial')),
            task('detail').filter({ serial: cd('serial') }).map(function (detail) {
              return {
                serial: cd('serial'),
                version: cd('version'),
                status: detail('status'),
                result: detail('result'),
                markName: cd('markName').default(''),
                cases: r.branch(
                  detail.hasFields('cases'),
                  detail('cases').eqJoin('name', r.db('stf').table('testCase'), { index: 'name_for_query' }
                  ).filter(function (d) {
                    return r.branch(
                      task.hasFields('caseVersion'),
                      task('caseVersion').eq(d('right')('case_version')),
                      true
                    )
                  }).map(function (d) {
                    return {
                      result: d('left')('result')
                    };
                  }), []),
                height: cd('display')('height'),
                width: cd('display')('width'),
                manufacturer: cd('manufacturer')
              }
            }).nth(0),

            {
              serial: cd('serial'),
              version: cd('version'),
              status: 'unfinish',
              markName: cd('markName'),
              result: {},
              height: cd('display')('height'),
              width: cd('display')('width'),
              manufacturer: cd('manufacturer')

            }
          )
        })
      },

      {}
    )
  })


  db.run(query).then(function (obj) {
    var order = 0
    obj.devices.forEach(function (d) {
      order = order + 1
      var successCount = 0
      var failCount = 0
      var waitCount = 0
      // 已完成的设备
      if (d.status != 'unfinish') {
        d.cases.forEach(function (c) {
          c.result == 'True' ? ++successCount : (c.result == 'False' ? ++failCount : ++waitCount)
        })
        d.order = order
        d.sucCount = successCount
        d.failCount = failCount
        d.waitCount = waitCount
        d.sucRate = Math.round(successCount / (successCount + failCount + waitCount) * 100) + '%'
        d.process = '100%'
      }
      // 未完成的设备
      else {
        d.sucCount = 0
        d.failCount = 0
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
        d.completedCount = completedCases
        d.waitCount = obj.cases.length - completedCases
        d.totalCount = obj.cases.length
        d.process = Math.round(completedCases / obj.cases.length * 100) + '%'
      }
      delete d.cases
    })
    delete obj.cases
    delete obj.serials
    console.log(obj)

  })


