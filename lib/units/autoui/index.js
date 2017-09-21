

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
var httputil = require('../../util/httputil')

module.exports = function (req, taskid) {
  var log = logger.createLogger('uiTest')
  var id = req.body.fileId
  var userEmail = req.user.email
  var userName = req.user.name
  var taskReportPath = '/var/stf/file/uilog/' + taskid + '/'

  var accountFilePath = '/var/stf/file/uilog/' + taskid + '/account/'
  var accountFileName = 'user_account.json'

  var taskListData = {
    taskid: taskid,
    useremail: userEmail,
    userName: userName,
    tasktype: 'uiTest',
    fileID: id,
    projectName: req.body.projectName,
    testEnv: req.body.testEnv,
    cases: req.body.cases,
    rpturl: null,
    allstatus: 'unfinish',
    detail: [],
    caseVersion: req.body.version,
    memo: req.body.memo,
    serials: req.body.serials
  }

new Promise(function (resolve, reject) {

    if (req.body.module) {

      var options = {
        hostname: 'pcususus01.ifere.com',
        port: 80,
        path: '/ddfqp/?action=tools.getGameMap',
        method: 'GET'
      }

      httputil.get(options).then(function (data) {
		var modules = []
        if (data) {
          var assResponse = data.split('<br>')
          for (var i = 0; i < assResponse.length; i++) {
            var line = assResponse[i].split('==')
            if (line && line.length > 1) {
              var id = line[0].trim()
              var module = line[1].trim()
              //console.log('id:%sname:%s', id, module)
              if (module.indexOf(req.body.module) >= 0) {
				modules.push({ moduleId: id, moduleName: module })
              }
            }
          } // end for
        } // end if
		taskListData.moduleName = req.body.module
        taskListData.moduleId = modules
        resolve('ok')
      })
    }
    else {
      resolve('')
    }
  }).then(function(result) {

	log.info(result)
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

    dbapi.getPycharmPro(taskListData.cases).then(function(cursor) {
      return Promise.promisify(cursor.toArray, cursor)() 
    }).then(function(pycharmProjects) {
      taskListData.pycharmProject = pycharmProjects
	  taskListData.projectKind = '常规项目'
      dbapi.createTask(taskListData)
    })

    //查看反编译apk是否存在
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
          testType: "uiTest",

		  testEnv: req.body.testEnv,
        }
		if (req.body.account) {
			taskData.accountFilePath = accountFilePath + accountFileName
          // 写用户账号文件
          if (!fs.existsSync(accountFilePath)) {
            fs.mkdirSync(accountFilePath)
          }
          fs.writeFileSync(accountFilePath + accountFileName, JSON.stringify(req.body.account, null, 2))
        }
              taskData.moduleName = req.body.module
taskData.moduleId = taskListData.moduleId ? taskListData.moduleId : []

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
              testType: "uiTest",
			  testEnv: req.body.testEnv,
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
              taskData.moduleName = req.body.module
taskData.moduleId = taskListData.moduleId ? taskListData.moduleId : []
            dbapi.createDevicetask(taskData)
          }
        })

      })
    }
  })


  })


 

}

