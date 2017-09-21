/**
 * Created by GuixiangGui on 2016/12/9.
 * Modified by jc on 2017/2/5
 */

var dbapi = require('../../db/api')
var logger = require('../../util/logger')
var testutil = require('../../util/testutil')
var util = require('util')
var exec = require('child_process').exec

module.exports = function (req, taskid) {
  var log = logger.createLogger('activity')
  var screenpath = '/var/stf/file/activityscreen/' + taskid + '/'
  var activityUrl = decodeURI(req.body.activityUrl)
  var screenOrientation = req.body.screenOrientation
  exec('mkdir -p ' + screenpath)

  var testName = req.body.testName
  var testDesc = req.body.testDesc
  var data = {
    activityUrl: activityUrl,
    screenpath: screenpath,
    screenOrientation: screenOrientation
  }
  var taskListData = {
    taskid: taskid,
    testName: testName,
    testDesc: testDesc,
    useremail: req.user.email,
    userName: req.user.name,
    tasktype: 'activityTest',
    allstatus: 'unfinish',
    activityUrl: activityUrl,
    screenOrientation: screenOrientation,
    projectName: req.body.projectName,
    detail: []

  }
  log.info('data:%s', data)

  var serials = req.body.serials
  if (serials.length > 0) {
    var taskdata = {
      testName: testName,
      testDesc: testDesc,
      taskid: taskid,
      options: data,
      serials: serials,
      testType: 'activityTest'
    }
    dbapi.createDevicetask(taskdata)
      .then(function () {
        dbapi.createTask(taskListData)
      })

  }
}
