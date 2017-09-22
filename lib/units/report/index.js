/**
 * Created by GuixiangGui on 2016/9/1.
 */

// var exec = require('child_process').exec
var execSync = require('child_process').execSync
var exec = require('child_process').exec
var logger = require('../../util/logger')
var fs = require('fs')
var os = require('os')
var fileutil = require('../../util/fileutil')
var moment = require('moment')

module.exports = function (taskid, serial, dbapi, call) {
  var log = logger.createLogger('report')
  var tmp = './' + taskid + '/'
 
  dbapi.getTaskDeviceUrl(taskid)
    .then(function (taskInfo) {
      if (taskInfo) {
        var zipFile = ''
        var zipPath = ''
        switch (taskInfo.tasktype) {
          case 'monkey':
            zipFile = '/var/stf/file/cptlog/reportzip/'
            zipPath = '/var/stf/file/cptlog/reportzip/'
            break
          case 'activityTest':
            zipFile = '/var/stf/file/activityscreen/reportzip/'
            zipPath = '/var/stf/file/activityscreen/reportzip/'
            break
          case 'uiTest':
            zipFile = '/var/stf/file/uilog/reportzip/'
            zipPath = '/var/stf/file/uilog/reportzip/'
            break
          case 'performTest':
            zipFile = '/var/stf/file/performlog/reportzip/'
            zipPath = '/var/stf/file/performlog/reportzip/'
            break
          case 'travelTest':
            zipFile = '/var/stf/file/travellog/reportzip/'
            zipPath = '/var/stf/file/travellog/reportzip/'
        }

        if (serial) {
          log.debug('serial true')
          zipFile = zipFile + taskid + '_' + serial + '.zip'
          tmp = './' + taskid + '_' + serial + '/'
        }
        else {
          zipFile = zipFile + taskid + '.zip'
        }

        fs.stat(zipFile, function (err, stat) {
          if (stat && stat.isFile()) {
            log.debug('report zip file exist')
            call(zipFile)
          }
          else {
            fs.stat(tmp, function (err, stat) {
              // if(stat){
              //   execSync('rm -r ' + tmp)
              // }
              // execSync('mkdir ' + tmp)
              if(err){
                execSync('mkdir ' + tmp)
              }
              
              if(taskInfo.tasktype == 'uiTest') {
                log.info('copy..........to', tmp)
                // 复制js/css
                fileutil.copy('/var/stf/vendor/uitestreport', tmp)
                // 复制appIcon
                fileutil.copy(taskInfo.apk.appiconpath, fileutil.join(tmp, 'static'))
                var devices = []

                taskInfo.detail.forEach(function(detail) {

                  var sucCount = 0
                  var failCount = 0
                  detail.cases.forEach(function(result) {
                    if(result == 'True') {
                      sucCount = sucCount + 1
                    }
                    else{
                      failCount = failCount + 1
                    }
                  })
                  devices.push({
                    markName: detail.markName,
                    version: detail.version,
                    width: detail.width,
                    height: detail.height,
                    sucCount: sucCount,
                    failCount: failCount,
                    sucRate: sucCount/((sucCount + failCount) == 0 ? 1 : (sucCount + failCount)) * 100 + '%'
                  })
                })
                var obj = {
                  filename: '/var/stf/vendor/uitestreport/index.html',
                  gameName: taskInfo.apk.appName,
                  apkFile: fileutil.basename(taskInfo.apk.href),
                  apkVersion: taskInfo.apk.versionName,
                  apkCode: taskInfo.apk.versionCode,
                  appIcon: 'static/' + fileutil.basename(taskInfo.apk.appiconpath),
                  terminalCount: devices.length,
                  startTime: moment(taskInfo.starttime).format('YYYY-MM-DD HH:mm:ss'),
                  endTime: moment(taskInfo.endtime).format('YYYY-MM-DD HH:mm:ss'),
                  devices: devices
                }
                fileutil.render(fileutil.join(tmp, 'index.html'), fileutil.join(tmp, 'index.html'), obj)
                log.info('render report done')
              }

              cpFiles(compressFiles)
            })


            function cpFiles(callback){
              var fileCount = 0
              var cpCount = 0

              cpfileTotmp(taskInfo.errorLog, tmp)
              taskInfo.detail.forEach(function (serialDetail) {
                var logPath
                if(serialDetail.markName){
                  logPath = tmp + serialDetail.markName.trim().replace(/\s+/g, '-')+'_'+serialDetail.serial
                }else{
                  logPath = tmp + serialDetail.serial
                }
                var screenPath = logPath + '/screenCap'

                if(serial){
                  if(serial==serialDetail.serial){
                    /*var logPath = tmp + serialDetail.manufacturer + serialDetail.model
                    var screenPath = logPath + '/screenCap'*/

                    if(serialDetail.logs){
                      execSync('mkdir -p "'+logPath+'"')
                      for(var file in serialDetail.logs){
                        cpfileTotmp(serialDetail.logs[file], logPath)
                      }
                      /*cpfileTotmp(serialDetail.logs.anrLog, logPath)
                      cpfileTotmp(serialDetail.logs.logcatLog, logPath)
                      cpfileTotmp(serialDetail.logs.monkeyLog, logPath)*/
                      cpfileTotmp(serialDetail.performance, logPath)
                    }
                    if(serialDetail.screenCap){
                      execSync('mkdir -p "'+screenPath+'"')
                      serialDetail.screenCap.forEach(function (screenCapPath) {
                        cpfileTotmp(screenCapPath, screenPath)
                      })
                    }

                  }
                }else{
                  /*var logPath = tmp + serialDetail.serial
                  var screenPath = logPath + '/screenCap'*/

                  if(serialDetail.logs){
                    execSync('mkdir -p "'+logPath+'"')
                    for(var file in serialDetail.logs){
                      cpfileTotmp(serialDetail.logs[file], logPath)
                    }
                    /*cpfileTotmp(serialDetail.logs.anrLog, logPath)
                    cpfileTotmp(serialDetail.logs.logcatLog, logPath)
                    cpfileTotmp(serialDetail.logs.monkeyLog, logPath)*/
                    cpfileTotmp(serialDetail.performance, logPath)
                  }
                  if(serialDetail.screenCap){
                    execSync('mkdir -p "'+screenPath+'"')
                    serialDetail.screenCap.forEach(function (screenCapPath) {
                      cpfileTotmp(screenCapPath, screenPath)
                    })
                  }
                }

              })

              // while(fileCount!=cpCount||fileCount==0){}
              cpfinish()

              function cpfileTotmp(fileName, targetPath) {

                if(fileName && targetPath){
                  fs.stat(targetPath, function(err, stat){
                    if(err){
                      execSync('mkdir -p "'+targetPath+'"')
                    }
                    fs.stat(fileName,function (err,stat) {
                      if(stat){
                        fileCount = fileCount+1
                        log.debug('file Exist ',fileName)
                        var cmd = 'cp -r '+ fileName + ' "' + targetPath +'"'
                        execSync(cmd)
                        cpCount = cpCount+1
                      }
                    })
                  })
                  
                }

              }

              function cpfinish() {
                setTimeout(function () {
                  if(fileCount!=cpCount){
                    cpfinish()
                  }
                  else {
                    log.debug('fileCount : %s , cpCount : %s',fileCount,cpCount)
                    callback()
                  }
                },500)
              }

            }

            function compressFiles() {
              fs.stat(zipPath, function (err, stat) {
                if(err){
                  execSync('mkdir -p '+zipPath)
                }
                var cmd = 'zip -rm ' + zipFile + ' ' +tmp
                setTimeout(function () {
                  // execSync(cmd)
                  exec(cmd, function(error, stdout, stderr){
                    log.info('compressFiles finish')
                    call(zipFile)
                  })
                  
                }, 1000*1)
              })

            }

          }
        })
      }
    })

}
