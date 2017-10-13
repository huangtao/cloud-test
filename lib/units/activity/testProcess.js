/**
 * Created by GuixiangGui on 2016/12/9.
 */
var dbapi = require('../../db/api')
var adbkit = require('adbkit')
var Promise = require('bluebird')
// var fs = require('fs')
var execSync = require('child_process').execSync
var exec = require('child_process').exec
var os = require('os')
var logger = require('../../util/logger')
var testutil = require('../../util/testutil')

var strFormat = require('../../../res/bower_components/underscore.string')
var fs = require('fs')


var log
var pullScreenCapFinish = false

process.on('message', function (m) {
  switch (m.task){
    case 'start':
      test(m.optios, m.taskid, dbapi)
      break
    case 'pullScreenCap':
      log.debug('pull screen finish')
      pullScreenCapFinish = true
      break
    default:
      break
  }
})


function test(options, taskid, dbapi) {
  var serial = options.serial
  var url = decodeURI(options.activityUrl)
  var screenOrientation = options.screenOrientation
  var screenpath = options.screenpath + serial+'/'

  log = logger.createLogger('activityTest:' + taskid + ':' + serial)

  var activityApkpkg = 'com.boyaa.checkjar'
  var testApkpkg = 'com.boyaa.checkjar.test'
  var activityApkPath = '/var/stf/vendor/activitytest_apk/activitytest.apk'
  var testApkPath = '/var/stf/vendor/activitytest_apk/test.apk'
  var screenPathOnPhone = '/mnt/sdcard/Robotium-Screenshots/'
  var screenPathOnPhoneRegExp = new RegExp(screenPathOnPhone)

  var logcatClient
  var logcatPath = options.screenpath + serial+'/logcat.log'

  var screenCaps = new Array()
  var rpldata = {}

  rpldata.serial = serial
  rpldata.model = options.model
  rpldata.manufacturer = options.manufacturer
  rpldata.markName = options.markName
  rpldata.screenCap = screenCaps
  rpldata.status = 'fail'
  rpldata.statusCode = 4
  var host = options.host

  exec('mkdir -p ' + screenpath, function (err, stdout, stderr) {
    if(err){
      log.err('create activity test screen path failed. err:',err)
    }
  })

  log.debug('webview url replace before', url)
  url = url.replace(/"/g, '\\"')
  var adb=null

  testutil.createadb({host:host}, serial, log)
    .then(function (client) {
      adb = client
      return testutil.befortest(serial, adb, log)
    })
  .then(function () {
      return installTestApk(serial, activityApkpkg, activityApkPath)
    })
    .then(function () {
      return installTestApk(serial, testApkpkg, testApkPath)
    })
    .then(function () {
      return testutil.killAndroidProceBypkg(adb, serial, activityApkpkg, log)
    })
    .then(function () {
      return testutil.killAndroidProceBypkg(adb, serial, 'uiautomator', log)
    })
    .then(function () {
      return testutil.wakeUpPhone(serial, adb, log)
        .then(function () {
          return testutil.sendKeyEvent(serial, adb, 'KEYCODE_HOME', log)
        })
    })
    .then(function(){
      testutil.saveLogcat(adb, serial, logcatPath)
      // openLogcat()
    })
    .then(function () {
      return new Promise(function (resolve, reject) {
        var startTestCmd = 'am instrument  -w com.boyaa.checkjar.test/android.test.InstrumentationTestRunner'
        log.debug('start test cmd:', startTestCmd)
        adb.shell(serial, startTestCmd)
          .then(adbkit.util.readAll)
          .timeout(1000*60*90)
          .then(function (output) {
            var outputStr = output.toString().trim()
            if(/Failures:/.test(outputStr)){
              log.error('failures', outputStr)
              rpldata.status = 'fail'
              rpldata.statusCode = 4
              resolve('')
            }else{
              rpldata.status = 'success'
              rpldata.statusCode = 0

              // var pullScreenshotCmd = 'adb -s ' + serial + ' pull ' +
              // screenPathOnPhone + ' ' + screenpath
              // execSync(pullScreenshotCmd)
              var lsCmd = 'ls ' + screenPathOnPhone
              adb.shell(serial, lsCmd)
                .then(adbkit.util.readAll)
                .then(function (output) {
                  var data = output.toString().trim()
                  var fileNames = data.split(/\s+|\n/)
                  log.debug('ls screen :'+data)
                  log.debug('fileNames', fileNames)

                  if(data.length > 0 && !(/No such file/i.test(data))){
                    fileNames.forEach(function (data) {
                      screenCaps.push(screenpath+data.trim())
                    })
                    var option = {
                      fileNames : fileNames
                      ,fileOnPhonePath : screenPathOnPhone
                      ,fileOnPcPath : screenpath
                      ,serial : serial
                    }

                    process.send({task:'pullScreenCap', host:host, option:option})
                    var waitPullScreenCap = setInterval(function () {
                      if(pullScreenCapFinish){
                        clearInterval(waitPullScreenCap)
                        resolve('')
                      }
                    }, 1000)



                  }else {
                    log.info('screenCaps null')
                    rpldata.status = 'fail'
                    rpldata.statusCode = 4
                    resolve('')
                  }

                })
              /*adb.readdir(serial,screenPathOnPhone)
                .then(function(files){
                  log.info('files',files)
                  if(files.length>0){
                    var proc=[]
                    for(var i=0;i<files.length;i++){
                      var path=screenPathOnPhone+files[i].name
                      var fn = screenpath+files[i].name
                      if (files[i].isFile()) {
                        var getscap=function(fn){
                          return new Promise(function(resolve, reject) {
                            adb.pull(serial,path)
                              .then(function(transfer){
                                transfer.on('progress', function(stats) {
                                  //log.info('Pulled %d bytes so far',stats.bytesTransferred)
                                })
                                transfer.on('end', function() {
                                  log.info('Pull complete')
                                  resolve()
                                })
                                transfer.on('error', reject)
                                transfer.pipe(fs.createWriteStream(fn))
                              })
                          })
                        }
                        proc.push(getscap(fn))
                      }
                    }
                    Promise.all(proc).then(function(){
                      return exec('ls '+screenpath, function (err, stdout, stderr) {
                if(stdout){
                  stdout.split('\n').forEach(function (data) {
                    if(data){
                      screenCaps.push(screenpath+data.trim())
                    }
                  })
                }
                if(screenCaps.length==0){
                  rpldata.status = 'fail'
                  rpldata.statusCode = 4
                }

                log.debug('screenCaps:',screenCaps)
                rpldata.screenCap = screenCaps
                        return resolve()
                      })
                    })
                  }
                  else{
                    log.info('screenCaps null')
                    resolve()
                  }
              })*/
            }
          })
          .catch(function (err) {
            reject(err)
          });

        // log.debug('webview url ', url)
        // url = url.replace(/&/g, '\\&')
        // url = url.replace(/}/g, '\\}')
        startWebview()

        function startWebview() {
          var screenSwitchCmd = 'am broadcast -a com.boyaa.checkjar.test --es "orientation" "' + screenOrientation + '"'
          var startWebviewCmd = 'am broadcast -a com.boyaa.checkjar.test --es "url" "' + url + '"'

          var getAndroidActivity = null
          var interval
          if(/Windows/i.test(os.type())){
            getAndroidActivity = 'adb -s ' + serial + ' shell dumpsys activity | findstr "mFocusedActivity"'
            interval = setInterval(function () {
              exec(getAndroidActivity, function (err, stdout, stderr) {
                if(/com.boyaa.checkjar/.test(stdout)){
                  clearInterval(interval);
                  adb.shell (serial, screenSwitchCmd)
                    .then(function () {
                      log.debug('Toggle vertical screen');
                      return testutil.wait(500)
                    })
                    .then(function () {
                      log.debug('startWebviewCmd : ', startWebviewCmd);
                      adb.shell(serial, startWebviewCmd)
                        .then(adbkit.util.readAll)
                        .then(function (output) {
                          log.debug('start webview cmd finish. output:', output.toString())
                        })
                    })
                }
              })
            }, 500);
          }else{
            //getAndroidActivity = 'adb -s ' + serial + ' shell dumpsys activity | grep "mFocusedActivity"'
            getAndroidActivity = 'dumpsys activity | grep "mFocusedActivity"'
            interval = setInterval(function () {
              adb.shell(serial,getAndroidActivity)
                .then(adbkit.util.readAll)
                .then(function (stdout) {
                  if(/com.boyaa.checkjar/.test(stdout.toString().trim())){
                    clearInterval(interval);
                    adb.shell (serial, screenSwitchCmd)
                      .then(function () {
                        log.debug('Toggle vertical screen');
                        return testutil.wait(500)
                      })
                      .then(function () {
                        log.debug('startWebviewCmd : ', startWebviewCmd);
                        adb.shell(serial, startWebviewCmd)
                          .then(adbkit.util.readAll)
                          .then(function (output) {
                            log.debug('start webview cmd finish. output:', output.toString().trim())
                          })
                      })
                  }
                })
            }, 500);
          }
          setTimeout(function () {
            if(interval){
              clearInterval(interval)
            }
          }, 1000*20)
        }
      })
    })
    .catch(function (err) {
      log.error('activity test has error. err:',err)
    })
    .finally(function () {
      testutil.killAndroidProceBypkg(adb, serial, 'logcat', log)
      // closeLogClient()
      testutil.killAndroidProceBypkg(adb, serial, activityApkpkg, log)
        .then(function () {
          return testutil.killAndroidProceBypkg(adb, serial, testApkpkg, log)
        })
        .then(function () {
          log.debug('save task status start')
          return dbapi.saveTaskStatus(taskid, rpldata)
        })
        .then(function () {
          process.send({task:'end', taskid:taskid, serial:serial})
        })
        .catch(function(err){
          log.error('finally has error :', err.toString())
         })
        .finally(function(){
          process.exit(0)
        })
    })

  function installTestApk(serial, pkgName, apkPath) {

    return adb.isInstalled(serial,pkgName)
      .then(function (isinstalled) {
        if(!isinstalled){
          log.debug('install apk ', pkgName)
          return testutil.installApk(serial, apkPath, adb, log)
        }
      })
      .catch(function(){
        return
      })
  }



  function openLogcat() {
    var startRecordDateStr


    return adb.shell(serial, 'date "+%Y-%m-%d %H:%M:%S"')
      .then(adbkit.util.readAll)
      .then(function (output) {
        startRecordDateStr = output.toString().trim()
      })
      .then(function () {
        return adb.openLogcat(serial)
      })
      .then(function (logcat) {

        logcatClient = logcat
        var logDate
        var startRecordDate = new Date(Date.parse(startRecordDateStr))
        var isStartRecord = false

        function entryListener(entry) {
          if (!isStartRecord) {
            logDate = new Date(Date.parse(logEntryToString(entry).substring(0, 19)))
            if (startRecordDate <= logDate) {
              isStartRecord = true
            }
          } else {
            fs.appendFileSync(logcatPath, logEntryToString(entry))
          }

        }

        logcat.on('entry', entryListener)
        logcat.on('error', function (err) {
          log.error('entry error')

        })
        
        return
      })

    function logEntryToString(entry) {
      /*var logLevels = [
       'UNKNOWN',
       'DEFAULT',
       'VERBOSE',
       'DEBUG',
       'INFO',
       'WARN',
       'ERROR',
       'FATAL',
       'SILENT'
       ]*/

      var logLevels = [
        '[U]',
        '[A]',
        '[V]',
        '[D]',
        '[I]',
        '[W]',
        '[E]',
        '[F]',
        '[S]'
      ]

      var logStr = ''
      var datetime = new Date(entry.date.getTime())
      var time = datetime.getFullYear() + '-' +
        strFormat.pad(datetime.getMonth() + 1, 2, '0') + '-' +
        strFormat.pad(datetime.getDate(), 2, '0') + ' ' +
        strFormat.pad(datetime.getHours(), 2, '0') + ':' +
        strFormat.pad(datetime.getMinutes(), 2, '0') + ':' +
        strFormat.pad(datetime.getSeconds(), 2, '0') + '.' +
        strFormat.pad(datetime.getMilliseconds(), 3, '0')
      // var logStr = time+' '+ logLevels[entry.priority]+'/'+ entry.tag+' ('+ entry.pid+' '+ entry.tid+'） ：'+ entry.message+ '\n'
      entry.message.split('\n').forEach(function (str) {
        logStr = logStr + time + ' ' + logLevels[entry.priority] + '/' + entry.tag + ' (' + entry.pid + '): ' + str + '\r\n'
      })

      return logStr
    }    
  }

  function closeLogClient() {
    if (logcatClient) {
      logcatClient.end()
      logcatClient = null
    }
    /*if(logcatSpawn){
     logcatSpawn.kill()
     }*/
    return testutil.killAndroidProceBypkg(adb, serial, 'logcat', log)
  }

}

