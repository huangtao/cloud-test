var Promise = require('bluebird')
var dbapi = require('../../lib/db/apiv2')
var fileutil = require('../../lib/util/fileutil')
var httputil = require('../../lib/util/httputil')
var uitest = require('../../lib/units/autoui')

var r = require('rethinkdb')
var _  = require('lodash')
var moment = require('moment')

var taskid = '1505714830356_JessicZeng'



  var taskid = '1505802075168_JessicZeng'
  var serial = '30c3b868'

  dbapi.loadPerformDetail(taskid, serial).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    if (list.length == 0) {
      return res.json({ succes: false, result: [] })
    }
    var scene = []
    // 场景
    _.forEach(list[0].performanceScenes, function (o) {
      if (o.data) {
        o.data.cpu = o.data.cpu === 'NaN' ? 0 : o.data.cpu
        o.data.fps = o.data.fps === 'NaN' ? 0 : o.data.fps
        o.data.mem = o.data === 'NaN' ? 0 : (o.data.mem > 1024 ? (o.data.mem / 1024).toFixed(2) + 'MB' : o.data.mem + 'KB')
        o.data.netIn = o.data.netIn === 'NaN' ? 0 : (o.data.netIn > 1024 ? (o.data.netIn / 1024).toFixed(2) + 'MB' : o.data.netIn + 'KB')
        o.data.netOut = o.data.netOut === 'NaN' ? 0 : (o.data.netOut > 1024 ? (o.data.netOut / 1024).toFixed(2) + 'MB' : o.data.netOut + 'KB')
        o.data.netTotal = o.data.netTotal === 'NaN' ? 0 : (o.data.netTotal > 1024 ? (o.data.netTotal / 1024).toFixed(2) + 'MB' : o.data.netTotal + 'KB')
        _.find(list[0].cases, function (o) {

        })
        o.status = 'finish'
        scene.push(o)
      }

    })
    // 求均值即可
    if (list[0].performanceDetail.screen) {
      list[0].performanceDetail.screen = list[0].performanceDetail.screen.map(function (n) {
        return n == '' ? n : n.split('/var/stf/file')[1]
      })
    }
    if (list[0].performance) {
      _.forEach(Object.keys(list[0].performance), function(key) {
        if (isNaN(parseFloat(list[0].performance[key]))) {
          list[0].performance[key] = 0
        }
        if (key == 'launchTime') {
          list[0].performance[key] = (parseInt(list[0].performance[key]) / 1000).toFixed(2) + 's'
        }
        else if (key == 'netIn' || key == 'netOut' || key == 'netTotal') {
           list[0].performance[key] = list[0].performance[key] == 0 ? 0 : (list[0].performance[key] > 1024 ? (list[0].performance[key] / 1024).toFixed(2) + 'MB' : list[0].performance[key] + 'KB')
        }
        else if (key == 'mem') {
          list[0].performance[key] = list[0].performance[key] > 1024 ? (list[0].performance[key] / 1024).toFixed(2) + 'MB' : list[0].performance[key] + 'KB'
        }
      })
    }
    var kk = {
      success: true,
      // 手机性能数据
      performance: list[0].performance,
    }
	console.log(kk)

  })
