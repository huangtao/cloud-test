/**
 * Created by GuixiangGui on 2016/12/9.
 */
// var dbapi = require('../../db/api')
var adbkit = require('adbkit')
var Promise = require('bluebird')
var fs = require('fs')
var execSync = require('child_process').execSync
var exec = require('child_process').exec
var os = require('os')
var logger = require('../../util/logger')
var testutil = require('../../util/testutil')

module.exports = function (options, taskid, dbapi, callback) {
  var serial = options.serial
  var url = decodeURI(options.activityUrl)
  var screenOrientation = options.screenOrientation
  var screenpath = options.screenpath + serial+'/'

  var log = logger.createLogger('activityTest:' + taskid + ':' + serial)

  var activityApkpkg = 'com.boyaa.checkjar'
  var testApkpkg = 'com.boyaa.checkjar.test'
  var activityApkPath = '/var/stf/vendor/activitytest_apk/activitytest.apk'
  var testApkPath = '/var/stf/vendor/activitytest_apk/test.apk'
  var screenPathOnPhone = '/mnt/sdcard/Robotium-Screenshots/'
  var screenPathOnPhoneRegExp = new RegExp(screenPathOnPhone)

  var screenCaps = new Array()
  var rpldata = {}
  rpldata.model = options.model
  rpldata.serial = serial
  rpldata.model = options.model
  rpldata.manufacturer = options.manufacturer
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
    .then(function () {
      return new Promise(function (resolve, reject) {
        var startTestCmd = 'am instrument  -w com.boyaa.checkjar.test/android.test.InstrumentationTestRunner'
        log.debug('start test cmd:', startTestCmd)
        adb.shell(serial, startTestCmd)
          .then(adbkit.util.readAll)
          .timeout(1000*60*40)
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
              adb.readdir(serial,screenPathOnPhone)
                .then(function(files){
                  return  new Promise(function(resolve, reject) {
                  files.forEach(function(file){
                    if (file.isFile()) {
                      var path=screenPathOnPhone+file.name
                      adb.pull(serial,screenPathOnPhone+file.name)
                      .then(function(transfer){
                        return new Promise(function(resolve, reject) {
                          var fn = screenpath+file.name
                          transfer.on('progress', function(stats) {
                           log.info('Pulled %d bytes so far',stats.bytesTransferred)
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
                    })
                  resolve('pull activity photos')
                  })
                })
                .then(function(){
                  exec('ls '+screenpath, function (err, stdout, stderr) {
                    if(stdout){
                      stdout.split('\n').forEach(function (data) {
                        if(data){
                          log.info('ls path',data)
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
                    resolve('')
                    })
              })
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
          if(/Windows/i.test(os.type())){
            getAndroidActivity = 'adb -s ' + serial + ' shell dumpsys activity | findstr "mFocusedActivity"'
            var interval = setInterval(function () {
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
            var interval = setInterval(function () {
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
      testutil.killAndroidProceBypkg(adb, serial, activityApkpkg, log)
        .then(function () {
          testutil.killAndroidProceBypkg(adb, serial, testApkpkg, log)
        })
      dbapi.saveTaskStatus(taskid, rpldata)
      callback(taskid, serial)
    })

  function installTestApk(serial, pkgName, apkPath) {

    return adb.isInstalled(serial,pkgName)
      .then(function (isinstalled) {
        if(!isinstalled){
          log.debug('install apk ', pkgName)
          return testutil.installApk(serial, apkPath, adb, log)
        }
      })
  }

}


