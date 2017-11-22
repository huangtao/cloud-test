/**
 * Created by GuixiangGui on 2016/12/9.
 */

var dbapi = require('../db/api')
var Promise = require('bluebird')
var adbkit = require('adbkit')
var fs = require('fs')
var exec = require('child_process').exec
var spawn = require('child_process').spawn
var execSync = require('child_process').execSync
var promiseutil = require('./promiseutil')
var strFormat = require('../../res/bower_components/underscore.string')
var logger = require('./logger')
var testutil = module.exports = Object.create(null)

testutil.getreqdeviceserials = function (req, dbapi) {
  var widths = []
  var heights = []
  var os_versions = []
  var manufacturers = []

  if (req.body.dpis.length > 0) {
    req.body.dpis.forEach(function (dpi) {
      widths.push(parseInt(dpi.split('*')[0]))
      heights.push(parseInt(dpi.split('*')[1]))
    })
  }
  if (req.body.os_versions.length > 0) {
    req.body.os_versions.forEach((function (os_version) {
      os_versions.push(os_version)
    }))
  }
  if (req.body.manufacturers.length > 0) {
    req.body.manufacturers.forEach(function (manufacturer) {
      manufacturers.push(manufacturer)
    })
  }

  return new Promise(function (resolve, reject) {
    dbapi.searchPhoneSerial(manufacturers, os_versions, widths, heights)
      .then(function (cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function (list) {
            resolve(list)
          })
      })
  })
}

testutil.createadb = function (options, serial, log) {
  return new Promise(function (resolve, reject) {
    var adb = adbkit.createClient({
      host: options.host
      //host: '172.20.104.10'
      , port: '5037'
    })
    adb.Keycode = adbkit.Keycode
    resolve(adb)
  })
}

testutil.init = function (taskid, serial, adb, options) {
  var log = logger.createLogger('testinit:' + taskid + ':' + serial)
  return new Promise(function (resolve, reject) {

    log.debug('start befortest')
    testutil.befortest(serial, adb, log)
      .then(function () {
        log.debug('kill monkey process')
        return testutil.killAndroidProceBypkg(adb, serial, 'com.android.commands.monkey', log)
      })
      .then(function () {
        log.debug('kill monitor process')
        return testutil.killAndroidProceBypkg(adb, serial, 'app_process', log)
      })
      .then(function () {
        for (var file in options.logs) {
          log.debug('rm ' + options.logs[file])
          fs.stat(options.logs[file], function (err, stats) {
            if (stats && stats.isFile()) {
              exec('rm ' + options.logs[file])
            } else if (stats && stats.isDirectory()) {
              if (/cptlog/i.test(options.logs[file])) {
                exec('rm -r ' + options.logs[file] + '/' + serial + '*')
              } else {
                exec('rm -r *', {cwd: options.logs[file]})
              }

            }
          })

        }
        /*log.debug('rm monkeyLog')
         exec('rm ' + options.monkeyLog)
         log.debug('rm logcatLog')
         exec('rm ' + options.logcatLog)
         log.debug('rm anrLog')
         exec('rm ' + options.anrLog)
         log.debug('rm cptScreencap')
         exec('rm ' + options.cptScreencapPath + serial + '*')*/
      })
      .then(function () {
        log.debug('uninstall pkg: ', options.pkg)

        // var uninstallPkgCmd = 'adb -s ' + serial + ' uninstall ' + option.pkg
        // return execSync(uninstallPkgCmd)

        log.info('分布式相关修改')
        if (typeof options.pkg == 'string') {
          return adb.uninstall(serial, options.pkg)
        } else {
          options.pkg.forEach(function (pkg) {
            return adb.uninstall(serial, pkg)
          })
        }
      })
      .then(function () {
        return testutil.wait(1000 * 20)
      })
      .catch(function (err) {
        log.error(err, err.stack)
        if(/device.*not found/i.test(err.toString())){
          return reject(err)
        }
      })
      .finally(function () {
        log.debug('init finish')
        resolve('')
      })
  })
}

testutil.befortest = function (serial, adb, log) {
  var appiumIme = 'io.appium.android.ime'
  var appiumImeRegExp = new RegExp(appiumIme, 'i')
  return adb.shell(serial, 'settings get secure default_input_method')
    .then(adbkit.util.readAll)
    .then(function (output) {
      return new Promise(function (resolve, reject) {
        var default_input_method = output.toString().trim()
        if(appiumImeRegExp.test(default_input_method)){
          adb.shell(serial, 'ime list -s')
            .then(adbkit.util.readAll)
            .then(function (output) {
              var imeList = output.toString().trim().replace(/[\r\n]/g, ' ').split(/\s+/)
              for(var i = 0; i<imeList.length; i++){
                if(appiumImeRegExp.test(imeList[i])){
                  continue
                }
                return imeList[i]
              }
            })
            .then(function (imeID) {
              log.debug('ime id : ' + imeID)
              adb.shell(serial, 'ime set ' + imeID)
                .then(function () {
                  resolve('')
                })
            })
        }
        resolve('')
      })

    })
    .then(function () {
      return pushUiautomator(serial, adb)
    })
    .then(function () {
      var startuiautomatorCmd = 'uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall'
      log.debug('start uiautomator')
      return adb.shell(serial, startuiautomatorCmd)
        .then(function (stream){
          stream.on('data', function(data){
            log.debug('uiautomator autoInstall :', data.toString())
          })
        })
    })
    .then(function () {
      return installPerformanceAndUnlockAPK(serial, adb, log)
    })
    .then(function () {
      return testutil.wakeUpPhone(serial, adb, log)
    })
    .then(function(){
      return testutil.wait(3000)
    })
}

testutil.wait = function (times) {
  return new Promise(function (resolve, reject) {
    setTimeout(function () {
      resolve('')
    }, times)
  })
}

testutil.wakeUpPhone = function (serial, adb, log) {
  var wakeCount = 0
  log.debug('start wake up phone')
  return new Promise(function(resolve, reject){
    log.debug('in wake up phone promise function')
    wake(serial, adb, log, function(){
      resolve('')
    })
  })


  function wake(serial, adb, log, cb){
    wakeCount = wakeCount + 1
    adb.shell(serial, 'pm clear com.example.unlock')
      .then(function(){
        return adb.shell(serial, 'input keyevent KEYCODE_WAKEUP')
      })
      .then(function(){
        return testutil.wait(2000)
      })
      .then(function(){
        return adb.shell(serial, 'wm dismiss-keyguard')
          .catch(function(err){
            log.debug('unknown command dismiss-keyguard. device:' + serial)
          })
      })
      .then(function (output) {
        var wakeUpCMD = 'am start -n com.example.unlock/.Unlock'
        log.debug('wake up the phone start')
        return adb.shell(serial, wakeUpCMD)
          .then(adbkit.util.readAll)
      })
      .then(function () {
        return testutil.wait(3000)
      })
      .then(function(){
        adb.shell(serial, 'dumpsys window policy')
          .then(adbkit.util.readAll)
          .then(function(output){
            var outputStr = output.toString()
            var lockScreen = outputStr.match(/mShowingLockscreen\s*=\s*\S*/i)
            var barKeyguard = outputStr.match(/isStatusBarKeyguard\s*=\s*\S*/i)
            var mShowingLockscreen = 'false'
            var isStatusBarKeyguard = 'false'
            if(lockScreen){
              mShowingLockscreen = lockScreen[0].split('=')[1].trim()
            }
            if(barKeyguard){
              isStatusBarKeyguard = barKeyguard[0].split('=')[1].trim()
            }

            if(mShowingLockscreen == 'false' && isStatusBarKeyguard == 'false' || wakeCount > 3){
              log.debug('wake up finish call back')
              cb()
            }else{
              wake(serial, adb, log, cb)
            }
          })
      })
  }
}

testutil.sendKeyEvent = function (serial, adb, keyEvent, log) {
  log.debug('start send key event')
  return adb.shell(serial, 'input keyevent ' + keyEvent)
    .then(adbkit.util.readAll)
    .then(function (output) {
      log.debug('input keyevent ' + keyEvent)
    })
}

testutil.installApkN = function (serial, apkPath, adb, log) {
  return new Promise(function (resolve, reject) {
    adb.install(serial, apkPath)
      .timeout(1000 * 60 * 5)
      .then(function () {
        resolve('')
      })
      .catch(function (err) {
        switch (err.code) {
          case 'INSTALL_PARSE_FAILED_INCONSISTENT_CERTIFICATES':
          case 'INSTALL_FAILED_UID_CHANGED':
          case 'INSTALL_FAILED_VERSION_DOWNGRADE':
            log.info(
              'Uninstalling "%s" first due to inconsistent certificates'
              , pkg
            )
            return adb.uninstall(serial, pkg)
              .timeout(60000 * 5)
              .then(function () {
                return adb.install(serial, apkPath)
                  .timeout(60000 * 5)
                  .then(function () {
                    resolve('')
                  })
                  .catch(function (err) {

                    reject(err)
                  })
              })
            break
          default:

            reject(err)
        }
      })
  })
}

testutil.installApk = function (serial, apkPath, adb, log, waitTime) {
  return adb.install(serial, apkPath)
    .timeout(60000 * 5)
    .then(function () {
      var installWaitTime = 1000 * 5
      if (waitTime) {
        installWaitTime = waitTime
      }
      return testutil.wait(installWaitTime)
    })
    .catch(function (err) {
      log.error('apk install failed. ', err.code)
    })
}

testutil.killAndroidProceBypkg = function (adb, serial, pkg, log) {
  log.debug('start kill pkg : ', pkg)
  var pkgRegExp = new RegExp(pkg)
  return adb.shell(serial, 'ps')
    .then(adbkit.util.readAll)
    .then(function (output) {
      var outputStr = output.toString().trim()
      if (pkgRegExp.test(outputStr)) {
        var psArr = outputStr.split('\n')
        for (var i = 0; i < psArr.length; i++) {
          if (pkgRegExp.test(psArr[i])) {
            log.debug(psArr[i])
            var lineArr = psArr[i].split(/\s+/)
            if (lineArr[lineArr.length-1] == pkg){
              var pid = lineArr[1]
              log.debug('force stop start pkg:', lineArr[lineArr.length-1])
              adb.shell(serial, 'kill ' + pid)
                .then(adbkit.util.readAll)
                .then(function (output) {
                  log.debug('force stop pkg output : ', output.toString())
                  if (/Operation not permitted/i.test(output.toString())) {
                    adb.shell(serial, 'am force-stop ' + pkg)
                      .catch(function (err) {
                        log.warn('am force-stop fail ', pkg, err)
                      })
                  } else {
                    log.debug('force stop pkg  : ', lineArr[8], pid)
                  }
                })
                .catch(function (err) {
                  log.debug('force stop failed; err:', err)
                })
            }
            }

        }
        return
      }
    })
    .catch(function (err) {
      log.warn('adb shell error ; err:', err)
    })
}

testutil.monitorApp = function (serial, pkg, host, logPath) {
  var options = ['-H', host, '-s', serial, 'shell', 'am', 'monitor']
  var monitorApp = spawn('adb', options)
}

testutil.saveLogcat = function(adb, serial, logcatPath){
  var startRecordDateStr
  return adb.shell(serial, 'date "+%Y-%m-%d %H:%M:%S"')
    .then(adbkit.util.readAll)
    .then(function(output){
      startRecordDateStr = output.toString().trim()
    })
    .then(function(){
      return adb.openLogcat(serial)
    })
    .then(function(logcat){
      var logDate
      var startRecord = false
      var startRecordDate = new Date(Date.parse(startRecordDateStr))
      var logStr = ''
      logcat.on('entry', entryListener)
      logcat.on('error', function(){}) //手机发送error事件需要捕获，如不捕获会导致代码（adbkit-logcat）抛异常导致手机重新连接；捕获error后不需要处理
      logcat.on('finish', function(){
        fs.appendFileSync(logcatPath, logStr)
        logStr = ''
      })

      function entryListener(entry){
        if(!startRecord){
          logDate = new Date(Date.parse(logEntryToString(entry).substring(0, 19)))
            if (startRecordDate <= logDate) {
              startRecord = true
            }
        }else{
          logStr = logStr + logEntryToString(entry)
          if(logStr.length > 1024*1024){
            fs.appendFileSync(logcatPath, logStr)
            logStr = ''
          }
          // fs.appendFile(logcatPath, , function(){})
          // fs.appendFileSync(logcatPath, logEntryToString(entry))
        }
      }

      function logEntryToString(entry){
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

    })
}


testutil.installAppiumNeedApks =   function (adb, serial, log) {
  var appiumImePkg = 'io.appium.android.ime'
  var appiumUnlocPkg = 'io.appium.unlock'
  var appiumSettingsPkg = 'io.appium.settings'
  var appiumImePath = '/var/stf/vendor/appium_apk/UnicodeIME-debug.apk'
  var appiumUnlocPath = '/var/stf/vendor/appium_apk/unlock_apk-debug.apk'
  var appiumSettingsPath = '/var/stf/vendor/appium_apk/settings_apk-debug.apk'
  var serials = ['d07ab511b8cf']

  if(serials.indexOf(serial) != -1){
    return testutil.installApk(serial, appiumImePath, adb, log)
      .then(function(){
        return testutil.installApk(serial, appiumUnlocPath, adb, log)
      })
      .then(function(){
        return testutil.installApk(serial, appiumSettingsPath, adb, log)
      })
      .catch(function(){
        return
      })
  }else{
    return adb.isInstalled(serial, appiumImePkg)
      .then(function (isinstalled) {
        if (!isinstalled){
          return testutil.installApk(serial, appiumImePath, adb, log)
        }
      })
      .then(function () {
        return adb.isInstalled(serial, appiumUnlocPkg)
      })
      .then(function (isinstalled) {
        if (!isinstalled){
          return testutil.installApk(serial, appiumUnlocPath, adb, log)
        }
      })
      .then(function () {
        return adb.isInstalled(serial, appiumSettingsPkg)
      })
      .then(function (isinstalled) {
        if (!isinstalled){
          return testutil.installApk(serial, appiumSettingsPath, adb, log)
        }
      })
      .catch(function(){
        return
      })
  }

}



function installPerformanceAndUnlockAPK(serial, adb, log) {
  log.debug('judge unLock and performance apk is installed started')
  var unLockpkg = 'com.example.unlock'
  var performancepkg = 'com.boyaa.stf.pt'

  return adb.isInstalled(serial, unLockpkg)
    .then(function (isinstalled) {
      if (!isinstalled) {
        var source = '/var/stf/vendor/unlock_apk/unlock_apk-debug.apk'
        return adb.install(serial, source)
          .timeout(60000 * 5)
      }
    })
    .then(function () {
      return adb.isInstalled(serial, performancepkg)
        .then(function (isinstalled) {
          if (!isinstalled) {
            var source = '/var/stf/vendor/performanc/stfPT.apk'
            return adb.install(serial, source)
              .timeout(60000 * 5)
          }
        })
    })
    .catch(function (err) {
      log.error('adb isInstall error . err:', err)
      return Promise.resolve()
    })
}

function pushUiautomator(serial, adb) {
  var uiautomatorPath = '/var/stf/vendor/installuiautomator/autoinstall.jar'
  var phoneTmp = '/data/local/tmp/autoinstall.jar'
  return adb.push(serial, uiautomatorPath, phoneTmp)
    .then(function (transfer) {
      var resolver = Promise.defer()

      function endlistenter() {
        resolver.resolve()
      }

      transfer.on('end', endlistenter)

      return resolver.promise.finally(function () {
        transfer.removeListener('end', endlistenter)
      })
    })
}


