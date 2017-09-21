/**
 * Created by GuixiangGui on 2016/8/30.
 */

var dbapi = require('../../db/api')
var logger = require('../../util/logger')
var testutil = require('../../util/testutil')
var monkeyTest = require('./test')
var Promise = require('bluebird')
var util = require('util')
var exec = require('child_process').exec

module.exports = function (req,taskid,testversion) {
  var log = logger.createLogger('monkey')

  var id = req.body.id

  var userEmail = req.user.email
  var userName = req.user.name
  var taskReportPath = '/var/stf/file/cptlog/' + taskid + '/'

  var taskListData = {
    taskid: taskid,
    useremail:userEmail,
    userName:userName,
    tasktype:'monkey',
    fileID:id,
    projectName:req.body.projectName,
    rpturl:null,
    allstatus:'unfinish',
    detail:[],
  }

  var data = {}
  dbapi.loadApkinfo(id)
    .then(function (apkinfo) {
      if(apkinfo){
        data.manifest = {
          package: apkinfo.package
          ,launchActivity: apkinfo.launchActivity
        }
        data.href = apkinfo.href
        data.apkPath = apkinfo.filePath
      // 把apk的三个信息存入taskListData
      taskListData.appName = apkinfo.appName ? apkinfo.appName : ''
      taskListData.appVersion = apkinfo.versionName ? apkinfo.versionName : ''
      taskListData.appCode = apkinfo.versionCode ? apkinfo.versionCode : ''

      }
      else{
        log.error('apkinfo is not exist.  apkid :', id)
        return
      }

      data.cptLogPath = taskReportPath
      data.cptScreencapPath = taskReportPath+'screencap/'
      exec('mkdir -p '+data.cptScreencapPath)

      data.errorLog = data.cptLogPath + 'error_' + taskid + '.log'

      taskListData.apkurl = data.href
      dbapi.createTask(taskListData)
      // var updateTask = {errorLog:data.errorLog, fileID: id, userName: userName}
      // dbapi.updateTaskReport(taskid, updateTask)
      log.info('testversion',testversion)
      if(testversion=='apiv2')
      {
        if(req.body.serials.length > 0){
            var taskData = {
              taskid:taskid
              , serials:req.body.serials
              , projectName: req.body.projectName
              , options:data
              , testType: "monkey"
            }
        dbapi.createDevicetask(taskData)
        return req.body.serials
      }
    }else{
      testutil.getreqdeviceserials(req, dbapi)
        .then(function (list) {
          var serials = []
          list.forEach(function (serial) {
            serials.push(serial)
          })
          if(serials.length > 0){
            var taskData = {
              taskid:taskid
              , serials:serials
              ,projectName:req.body.projectName
              , options:data
              , testType: "monkey"
            }
            dbapi.createDevicetask(taskData)
          }
          return serials
        })
      }
    })

  // data.serial = '7N2RDQ1484001994'

}
