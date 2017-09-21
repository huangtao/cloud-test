/**
 * Created 2017/3/7
 */

var dbapi = require('../../db/api')
var logger = require('../../util/logger')
var fs = require('fs')
var path = require('path')
var exec = require('child_process').exec
var repack = require('./repack')
var Promise = require('bluebird')


module.exports = function (req, taskid) {
  var log = logger.createLogger('travelTest')
  var id = req.body.fileId
  var userEmail = req.user.email
  var userName = req.user.name
  var taskReportPath = '/var/stf/file/travellog/' + taskid + '/'

  var accountFilePath = '/var/stf/file/travellog/' + taskid + '/account/'
  var accountFileName = 'user_account.json'

  var taskListData = {
    taskid: taskid,
    useremail: userEmail,
    userName: userName,
    tasktype: 'travelTest',
    fileID: id,
    projectName: req.body.projectName,
    testEnv: req.body.testEnv,
    rpturl: null,
    allstatus: 'unfinish',
    detail: [],
    caseVersion: req.body.version,
    memo: req.body.memo,
    cases: req.body.cases,
    serials: req.body.serials
  }


  if (req.body.account) {
    taskListData.account = req.body.account
    taskListData.accountFilePath = accountFilePath + accountFileName
  }
  var data = {}
  dbapi.loadApkinfo(id).then(function (apkinfo) {
    if (apkinfo) {
      data.manifest = {
        package: apkinfo.package,
        launchActivity: apkinfo.launchActivity,
        appid: apkinfo.appid ? apkinfo.appid : null
      }
      data.href = apkinfo.href
      data.apkPath = apkinfo.filePath

      // 把apk的三个信息存入taskListData
      taskListData.appName = apkinfo.appName ? apkinfo.appName : ''
      taskListData.appVersion = apkinfo.versionName ? apkinfo.versionName : ''
      taskListData.appCode = apkinfo.versionCode ? apkinfo.versionCode : ''
    }
    else {
      log.error('apkinfo is not exist.  apkid :', id)
      return
    }
    data.uiLogPath = taskReportPath
    data.uiScreencapPath = taskReportPath + 'screencap/'

    data.errorLog = data.uiLogPath + 'error_' + taskid + '.log'
    exec('mkdir -p ' + data.uiScreencapPath)
    taskListData.apkurl = data.href

    dbapi.getPycharmPro(taskListData.cases).then(function (cursor) {
      return Promise.promisify(cursor.toArray, cursor)()
    }).then(function (pycharmProjects) {
      taskListData.pycharmProject = pycharmProjects
      taskListData.projectKind = '遍历测试'
      dbapi.createTask(taskListData)
    })

    //查看重打包文件是否存在
    if (apkinfo.apkDecompilePath && fs.existsSync(apkinfo.apkDecompilePath)) {
      data.apkDecompilePath = apkinfo.apkDecompilePath
      data.testbundlePath = apkinfo.testbundlePath
      if (req.body.serials.length > 0) {
        var taskData = {
          taskid: taskid,
          serials: req.body.serials,
          cases: req.body.cases,
          projectName: req.body.projectName,
          options: data,
          testType: "travelTest",
          testEnv: req.body.testEnv
        }
        if (req.body.account) {
          taskData.accountFilePath = accountFilePath + accountFileName
          // 写用户账号文件
          if (!fs.existsSync(accountFilePath)) {
            fs.mkdirSync(accountFilePath)
          }
          fs.writeFileSync(accountFilePath + accountFileName, JSON.stringify(req.body.account, null, 2))
        }
        dbapi.createDevicetask(taskData)

      }
    }
    else {
      var dir = path.join(path.dirname(apkinfo.filePath), apkinfo.filePath.split('_').pop())
      exec('mkdir -p ' + dir, function (err, stdout, stderr) {

        repack(apkinfo.filePath, dir, dbapi).then(function (result) {
          if (result) {
            data.apkDecompilePath = result.apkDecompilePath
            data.testbundlePath = result.testbundlePath
          }
          if (req.body.serials.length > 0) {
            var taskData = {
              taskid: taskid,
              serials: req.body.serials,
              cases: req.body.cases,
              projectName: req.body.projectName,
              options: data,
              testType: "travelTest",
              testEnv: req.body.testEnv
            }
            // 写用户账号文件
            if (req.body.account) {
              taskData.accountFilePath = accountFilePath + accountFileName
              // 写用户账号文件
              if (!fs.existsSync(accountFilePath)) {
                fs.mkdirSync(accountFilePath)
              }
              fs.writeFileSync(accountFilePath + accountFileName, JSON.stringify(req.body.account, null, 2))
            }
            dbapi.createDevicetask(taskData)

          }
        })

      })
    }
  })

}

