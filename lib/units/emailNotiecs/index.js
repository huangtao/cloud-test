/**
 * Created by GuixiangGui on 2016/10/14.
 */


var notiecs = require('../../util/notiecsutil')
var dbapi = require('../../db/api')
var logger = require('../../util/logger')


module.exports = function (taskid) {

  var log = logger.createLogger('emailNotiecs')

  var notiecsData = {}
  var type = {mail : 1}
  notiecsData.type = type
  dbapi.loadSendEmail(taskid)
    .then(function (data) {
      var sendTo
      if(data&&data.sendusers){
        var sendToArr = data.sendusers.split(',')
        for(var i = 0; i<sendToArr.length; i++){
          var str = sendToArr[i]
          if(/@boyaa.com$/.test(str)){
            if(i == 0){
              sendTo = str
            }else{
              sendTo = sendTo + ',' + str
            }
          }else{
            if(i == 0){
              sendTo = str + '@boyaa.com'
            }else{
              sendTo = sendTo + ',' + str + '@boyaa.com'
            }
          }
        }

        notiecsData.sendTo = {user: sendTo}
        notiecsData.setting = ''

        dbapi.loadtasktype(taskid)
          .then(function (tasktype) {
            switch (tasktype){
              case 'monkey' :
                    sendMonkeyTask()
                    break;
              case 'activityTest':
                    sendActivityTestTask()
                    break;
              case 'uiTest':
                    sendUITestTask()
                    break;
              default:
                    log.debug('Can not found tasktype. taskid:', taskid)
            }
          })

        function sendMonkeyTask() {
          return dbapi.loadApkinfo(data.fileID)
            .then(function (apkdata) {
              var title = 'STF云测平台提醒，' + apkdata.appName + '_已测试完成'
              notiecsData.title = title
              var reportUrl = 'http://cloud-test2.oa.com/report/monkey/detail/'+ data.fileID + '/' + taskid
              var body = apkdata.appName + '_已测试完成, 请点击这里查看： ' + '<a href="' + reportUrl + '">' + reportUrl + '</a>'
              notiecsData.body = body

              notiecs(notiecsData, function (err, response, resbody) {
                if(!err){
                  log.debug(resbody)
                  dbapi.removeSendemail(taskid)
                }else{
                  log.debug(err)
                }
              })
            })
        }

        function sendActivityTestTask() {
          var title = 'STF云测平台提醒，活动已测试完成'
          notiecsData.title = title
          var reportUrl = 'http://cloud-test2.oa.com/report/ui-activity/'+  taskid
          var body = '活动已测试完成, 请点击这里查看： ' + '<a href="' + reportUrl + '">' + reportUrl + '</a>'
          notiecsData.body = body

          notiecs(notiecsData, function (err, response, resbody) {
            if(!err){
              log.debug(resbody)
              dbapi.removeSendemail(taskid)
            }else{
              log.debug(err)
            }
          })
        }

        function sendUITestTask() {
          var title = 'STF云测平台提醒，UI自动化已测试完成'
          notiecsData.title = title
          var reportUrl = 'http://cloud-test2.oa.com/report/uiTest/'+  taskid
          var body = 'UI自动化已测试完成, 请点击这里查看： ' + '<a href="' + reportUrl + '">' + reportUrl + '</a>'
          notiecsData.body = body

          notiecs(notiecsData, function (err, response, resbody) {
            if(!err){
              log.debug(resbody)
              dbapi.removeSendemail(taskid)
            }else{
              log.debug(err)
            }
          })
        }

      }

    })
}
