
var Promise = require('bluebird')
var db = require('../../lib/db/')
var fileutil = require('../../lib/util/fileutil')
var r = require('rethinkdb')
var _  = require('lodash')
var moment = require('moment')
var page = 1
var pageSize = 10

var query = r.db('stf').table("tasklist").without({ 'detail': { 'cases': 'error' }}).map(function (task) {
    return r.branch(
      task('tasktype').eq('activityTest'),
      {
        taskid: task('taskid'),
        appName: task('testName'),
        appVersion: '',
        appCode: '',
        projectName: task('projectName'),
        committime: task('committime').toEpochTime(),
        userName: task('userName'),
        allstatus: task('allstatus'),
        taskType: task('tasktype'),
        memo: task('memo').default(null)
      },

      r.db('stf').table('apkinfo').get(task('fileID')).do(function (apk) {
        return {
          appName: apk('appName'),
          appVersion: apk('versionName'),
          appCode: apk('versionCode').default(''),

          taskid: task('taskid'),
          projectName: task('projectName'),
          committime: task('committime').toEpochTime(),
          userName: task('userName'),
          allstatus: task('allstatus'),
          taskType: task('tasktype'),
          memo: task('memo').default(null),
          caseVersion: task('caseVersion').default('1500'),
          serials: task('serials').default([]),
          allcases: task('cases').default([]).count(),
          detail: task('detail')('serial').default([])
        }
      })

    )
  }).orderBy(r.desc('committime'))

db.run(query).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function(tasks) {


var hitCount = tasks.length
    var target_tasks = tasks.slice((page - 1) * pageSize, page * pageSize)
    target_tasks.forEach(function (task) {
      if (task.taskType == 'uiTest') {
        // 只对未完成的
        if (task.allstatus != 'finish') {
          var allcases = task.allcases * task.serials.length
          // 已经完成的用例数，这只是已经完成的手机，后面还要加上未完成的手机
          var completedCases = task.detail.length * task.allcases
          
          var pendingSerials = _.difference(task.serials, task.detail)

          pendingSerials.forEach(function (serial) {
            var reportPath = fileutil.join('/var/stf/testproject2', task.projectName, task.caseVersion, 'DFQP/src', serial, 'report')
            // 存在
            if (fileutil.exists(reportPath)) {
              var cs = fileutil.list(reportPath)
              _.remove(cs, function (n) {
                return n == 'screenshot' || n == 'TestReport.xml' || n == 'TestReport.xsl' || n == 'TestResult.xsl'
              })
              completedCases += cs.length
            }
          })
          task['process'] = Math.round(completedCases / allcases * 100) + '%'
        }

        else {
          task['process'] = '100%'
        }
      }
      delete task.allcases
      delete task.serials
    })
   console.log(target_tasks)


})
