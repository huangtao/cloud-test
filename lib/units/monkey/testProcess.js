/**
 * Created by GuixiangGui on 2017/5/18.
 */
/**
 * Created by GuixiangGui on 2016/8/4.
 */

var adbkit = require('adbkit')
var stream = require('stream')
var url = require('url')
var util = require('util')
var request = require('request')
var Promise = require('bluebird')
var fs = require('fs')
var spawn = require('child_process').spawn
var exec = require('child_process').exec
var execSync = require('child_process').execSync
var util = require('util')
var path = require('path')

var strFormat = require('../../../res/bower_components/underscore.string')
var dbapi = require('../../db/api')
var logger = require('../../util/logger')
var testutil = require('../../util/testutil')
var promiseutil = require('../../util/promiseutil')
var datautil = require('../../util/datautil')
var crashlogfilter = require('../../util/crashlogfilterutil')
var display = require('../device/plugins/util/display')
var installTask = require('../taskManager/installTask')
var pullScreenTask = require('../taskManager/pullScreenTask')
// var monitorApp = require('../../util/monitorApp')

var log
var installFinish = false
var installInfo
var installErr
var pullScreenCapFinish = false

process.on('message', function (m) {

  switch (m.task){
    case 'start':
      test(m.optios, m.taskid)
      break
    case 'install':
      installErr = m.err
      installInfo = m.rd
      installFinish = true
      log.debug('monkey test install rpldata err and rd:', installErr, installInfo)
      break
    case 'pullScreenCap':
      log.debug('pull screen finish')
      pullScreenCapFinish = true
      break
    default:
      break
  }


})

function test(options, taskid) {
  var filterLogClientSerials = ['GWY0216B26001020', '022AUM213A011856']

  var serial = options.serial
  var cptLogPath = options.cptLogPath + '/' + serial + '/'
  var cptScreencapPath = cptLogPath + 'screencap/'
  var cptScreencapOnphonePath = '/data/local/tmp/'
  var appLaunchTime = 0

  var manifest = options.manifest
  var pkg = manifest.package
  var launchActivity
  
  var deviceInfo = options.deviceInfo
  var resolutionHW = options.resolutionHW
  var resolutionWH = options.resolutionWH
  var deviceModel = options.model
  var deviceManufacturer = options.manufacturer
  var apkPath = options.apkPath
  log = logger.createLogger('test:' + taskid + ':' + serial)

  var entries = new Array()
  var pidArr = new Array()
  var logcatClient = null
  var luaErrorRegExp = new RegExp('call.* failed')
  var luaCrashRegExp = new RegExp('lua vm destroy')
  var luaStackRegExp = new RegExp('stack traceback[\\s\\S]*lua')
  var anrRegExp = new RegExp('ANR in ' + pkg)
  var monkeyAbortedRegExp = new RegExp('monkey aborted', 'i')
  var mOverrideDisplayInfoRegExp = new RegExp('mOverrideDisplayInfo.*', 'i')
  var rotationRegExp = new RegExp('rotation\\s*\\d', 'i')
  var isluacrash = false
  var isanr = false
  var runScreenCap = true
  var logcatSpawn = null
  var startRecordDateStr = null

  var screenCapOnPhonePath = '/data/local/tmp/cloudTestScreen.jpg'
  //var screenCapCMD = 'adb -s '+serial+' shell screencap -p ' + screenCapOnPhonePath
  //var pullScreenCapCMD = 'adb -s '+serial+' pull '+screenCapOnPhonePath+' '
  // var screenCapCMD = 'screencap -p ' + screenCapOnPhonePath
  var screenCapPreCmd =  'LD_LIBRARY_PATH=/data/local/tmp exec /data/local/tmp/minicap'
  var performanceFilePath = '/mnt/sdcard/' + taskid + '_performance.cvs'

  var stopPerformanceServiceCMD = 'am force-stop com.boyaa.stf.pt'

  var monkeyLogName = 'monkey.log'
  var logcatLogName = 'logcat.log'
  var anrLogName = 'anr.log'
  var performanceFileName = 'performance.cvs'
  var monitorLogName = 'crashmonitor.log'
  var rpldata = {result: {}}
  var screenCaps = new Array()
  var screenCapNames = new Array()
  var screenCapID = 1
  var host = options.host

  var phoneMonkeyFile = '/data/local/tmp/monkey.txt'

  //var adb=null
  var adb
  var beforeOptions = {
    logs: {
      monkeyLog: cptLogPath + monkeyLogName
      , logcatLog: cptLogPath + logcatLogName
      , anrLog: cptLogPath + anrLogName
      , crashMonitorLog: cptLogPath + monitorLogName
      , cptScreencapPath: cptScreencapPath
    }
    , pkg: pkg
  }

  rpldata.screenCap = new Array()
  rpldata.model = deviceModel
  rpldata.manufacturer = deviceManufacturer
  rpldata.markName = options.markName
  rpldata.serial = serial
  rpldata.logs = {
    'monkeyLog': cptLogPath + monkeyLogName
    , 'logcatLog': cptLogPath + logcatLogName
    , 'anrLog': cptLogPath + anrLogName
    , 'crashMonitorLog': cptLogPath + monitorLogName
  }

  exec('mkdir -p ' + cptScreencapPath)

  testutil.createadb(options, serial, log)
    .then(function (client) {
      adb = client
      return testutil.init(taskid, serial, adb, beforeOptions)
    })
    .then(function () {
      return adb.shell(serial, 'rm -f ' + cptScreencapOnphonePath + serial + '*.jpg')
        .catch(function () {

        })
    })
    .then(function(){
      adb.stat(serial, '/data/local/tmp/minicap')
        .timeout(5000)
        .then(function(stats){
          if ((stats.mode & 0x40) !== 0x40){
            screenCapPreCmd = 'LD_LIBRARY_PATH=/data/data/com.android.shell exec /data/data/com.android.shell/minicap'
          }
          log.debug('stats:  ' + stats.mode)
          log.debug('screenCapPreCmd:  ' + screenCapPreCmd)
        })
    })
    .then(function () {
      log.debug('open logcat')
      testutil.saveLogcat(adb, serial, cptLogPath + logcatLogName)
      // logcatOpen()
      log.debug('adb install start')
      log.info('serial', serial)

      return new Promise(function (resolve, reject) {
        var installOption = {
          adb: adb
          , pkg: pkg
          , serial: serial
          , apkPath: apkPath
          , log: log
          , rpldata: rpldata
        }

        process.send({task:'install', host:host, installOption:installOption})

        var waitInstall = setInterval(function () {
          if(installFinish){
            clearInterval(waitInstall)
            rpldata = installInfo
            if (installErr) {
              reject(installErr)
            } else {
              resolve('')
            }
          }
        }, 1000)

      })
    })
    .then(function () {
      // monitorAPPCrash()
      return testutil.wait(1000 * 20)
    })
    .then(function () {
      return testutil.wakeUpPhone(serial, adb, log)
        .then(function () {
          return testutil.sendKeyEvent(serial, adb, 'KEYCODE_HOME', log)
        })
    })
    .then(function(){
      
      if (manifest.launchActivity) {
        var activityName = manifest.launchActivity

        if (activityName.indexOf('.') === -1) {
          activityName = util.format('.%s', activityName)
        }

        launchActivity = pkg + '/' + activityName
      }

      
      // adb.shell(serial, startPerformanceServiceCMD)

      var cmd = 'am start -W ' + launchActivity

      log.debug('start apk ', pkg)
      return adb.shell(serial, cmd)
        .then(adbkit.util.readAll)
        .timeout(1000 * 30)
        .then(function (output) {
          // amMonitor.emit('end')
          testutil.killAndroidProceBypkg(adb, serial, 'app_process', log)

          var outputStr = output.toString().trim()

          outputStr.split('\n').forEach(function (str) {

            if (str.indexOf('ThisTime') != -1) {
              log.debug('applaunch this time: ', serial, pkg, str.split(/\s+/)[1])
              appLaunchTime = parseInt(str.split(/\s+/)[1])
            } else if (str.indexOf('TotalTime') != -1 && parseInt(str.split(/\s+/)[1]) < 30000) {
              log.debug('applaunch total time: ', serial, pkg, str.split(/\s+/)[1])
              appLaunchTime = parseInt(str.split(/\s+/)[1])
            } else if (str.indexOf('WaitTime') != -1 && parseInt(str.split(/\s+/)[1]) < 30000) {
              log.debug('applaunch wait time: ', serial, pkg, str.split(/\s+/)[1])
              appLaunchTime = parseInt(str.split(/\s+/)[1])
            }
          })

          if (appLaunchTime == 0) {
            return appLaunchFail()
            .then(function () {
              log.debug('kill app_process')
              return testutil.killAndroidProceBypkg(adb, serial, 'app_process', log)
            })
          }

          return getPids(pkg)
        })
        .catch(function (err) {
          // amMonitor.emit('end')
          return appLaunchFail()
            .then(function () {
              log.debug('kill app_process')
              return testutil.killAndroidProceBypkg(adb, serial, 'app_process', log)
            })

        })

        function appLaunchFail() {
        log.error('app launch failed')
        rpldata.status = 'fail'
        rpldata.statusCode = 2

        return screenCap()
          .then(function () {
            log.debug('start get pkg pids')
            return getPids(pkg)
          })
      }

    })
    .then(function () {
      var startPerformanceServiceCMD = 'am start --user 0 -n com.boyaa.stf.pt/.MainActivity --es "packageName" "' + pkg + '" --es "filePath" "' + performanceFilePath + '" --el "delayTime" 2000'

      log.debug('start performanece service')
      return adb.shell(serial, startPerformanceServiceCMD)
        .then(adbkit.util.readAll)
        .then(function (stdout) {
          log.info('start performanece service', stdout.toString().trim())
        })
        .then(function () {
          return testutil.wait(3000)
        })
        .then(function () {
          //获取手机横竖屏信息
          return getRotation()
        })
        .then(function (orientation) {
          return new Promise(function (resolve, reject) {
            var screenOrientation = null
            if (orientation == '1' || orientation == '3') {
              screenOrientation = 'LANDSCAPE'
            } else {
              screenOrientation = 'PORTRAIT'
            }
            var monkeyFile = cptLogPath + util.format('%s_%s_monkey.txt', taskid, serial)
            var createMonkeyFile = util.format(
              'python %s %s %s %s %s',
              path.resolve(__dirname, '../../python/customizationMonkeyTest.py'),
              screenOrientation,
              resolutionHW,
              launchActivity,
              monkeyFile)
            log.debug('create monkey file cmd :', createMonkeyFile)
            execSync(createMonkeyFile)
            adb.push(serial, monkeyFile, phoneMonkeyFile)
              .then(function (transfer) {
                transfer.on('end', function () {
                  execSync('rm ' + monkeyFile)
                  resolve('')
                })
              })

          })
        })
        .then(function () {
          monkey()
        })
    })
    .catch(function (err) {
      log.error(err, err.stack)
      adb.shell(serial, stopPerformanceServiceCMD)
      var deviceDisconn = new RegExp('device.*not found', 'i')
      if (deviceDisconn.test(err) || deviceDisconn.test(err.stack)) {
        rpldata.status = 'fail'
        rpldata.statusCode = 999
        rpldata.result = {errorType: 'device disconnect', reson: 'device disconnect'}
      }
      taskprc()
    })
  function monkey() {
    log.debug('monkey test start')

    var command = util.format(
      'monkey -p %s -f %s --throttle 500 -v -v 1',
      pkg,
      phoneMonkeyFile)

    log.debug('monkey cmd :', command)

    runMonkey()

    function runMonkey(tryA) {
      var tryAgain = (tryA==null ? true:tryA)
      log.debug(command)
      rpldata.performance = cptLogPath + performanceFileName
      var setIntervalID

      adb.shell(serial, command)
        .then(adbkit.util.readAll)
        .timeout(1000 * 60 * 40)
        .then(function (output) {
          var outputStr = output.toString().trim()
          fs.writeFileSync(cptLogPath + monkeyLogName, outputStr)
          testutil.killAndroidProceBypkg(adb, serial, 'logcat', log)
          // closeLogClient(logcatClient)

          adb.shell(serial, stopPerformanceServiceCMD)
            .then(function () {
              log.debug('pull performance file start')
              adb.stat(serial, performanceFilePath)
                .then(function (stats) {
                  log.debug('performance stat . stats:', stats)
                  if (stats && stats.isFile() && stats.size != 0) {
                    adb.pull(serial, performanceFilePath)
                      .then(function (transfer) {
                        transfer.pipe(fs.createWriteStream(cptLogPath + performanceFileName))
                        transfer.on('end', function () {
                          log.debug('rm performance file')
                          adb.shell(serial, 'rm -f ' + performanceFilePath)
                            .then(adbkit.util.readAll)
                            .then(function (output) {
                              log.debug('rm performace file finish. output:', output.toString())
                            })
                        })
                      })
                  } else {
                    log.error('performance file is not exits')
                  }
                })
                .catch(function (err) {
                  log.error('perforemance file is not exits on phone. err:', err)
                })
            })

          clearInterval(setIntervalID)
          screenCap()
            .then(function () {
              log.debug('push screen pull task')
              return new Promise(function (resolve, reject) {
                var option = {
                  fileNames: screenCapNames
                  , fileOnPhonePath: cptScreencapOnphonePath
                  , fileOnPcPath: cptScreencapPath
                  , serial: serial
                }

                process.send({task:'pullScreenCap', host:host, option:option})

                var waitPullScreenCap = setInterval(function () {
                  if(pullScreenCapFinish){
                    clearInterval(waitPullScreenCap)
                    resolve('')
                  }
                }, 1000)

              })
            })
            .then(function () {
              if (monkeyAbortedRegExp.test(outputStr)) {
                rpldata.status = 'fail'
                if(rpldata.statusCode != 2){
                  rpldata.statusCode = 3
                }

                log.error('monkey test failed')
                crashlogfilter.monkeylogfilter(outputStr, function (result) {
                  if (result && result.errorType) {
                    rpldata.result.errorType = result.errorType
                    rpldata.result.reson = result.reson
                  }
                })
              } else {
                rpldata.status = 'success'
                rpldata.statusCode = 0
              }

              if(/Failed talking with activity manager/i.test(outputStr)){
                rpldata.status = 'fail'
                if(rpldata.statusCode != 2){
                  rpldata.statusCode = 3
                }

                log.error('monkey test failed')
                rpldata.result.errorType = 'other'
                rpldata.result.reson = 'Failed talking with activity manager'
              }

              try {
                var stat = fs.statSync(rpldata.performance)
              } catch (err) {
                log.error('performance file is not exits on folder. err:', err)
              }

              rpldata.appLaunchTime = appLaunchTime
              rpldata.screenCap = screenCaps

              if (stat && stat.isFile() && stat.size != 0) {
                datautil.dealPerformanceCsv(rpldata.performance, function (totalMemoryAverage, dataflow, totalCpuAverage) {
                  rpldata.dataflow = dataflow
                  rpldata.memory = totalMemoryAverage
                  rpldata.cpu = totalCpuAverage

                  taskprc()
                })
              } else {
                taskprc()
              }
            })

        })
        .catch(function (err) {
          log.error('monkey run failed. err:', err)
          return Promise.reject(err)
        })

      setIntervalID = setInterval(function(){
        if(runScreenCap){
          screenCap()
        }

      }, 1000 * 20)
    }
  }


  function screenCap() {
    var screenCapName = serial + '_' + taskid + '_' + screenCapID + '.jpg'
    var screenCapFile = cptScreencapPath + screenCapName
    log.debug(screenCapID + ' screencap ')
    runScreenCap = false
    log.debug('start screen cap promise function')
    return new Promise(function (resolve, reject) {
      // var screenCapCMD = 'screencap -p ' + cptScreencapOnphonePath + screenCapName

      getRotation()
        .then(function (rotation) {
          switch (rotation) {
            case '0':
              return '0'
            case '1':
              return '90'
            case '2':
              return '180'
            case '3':
              return '270'
            default:
              return Promise.reject('rotation get failed')
          }
        })
        .then(function (rotation) {
          var screenCapCMD = util.format(
            '%s -P %s@%s/%s -s >%s'
            , screenCapPreCmd
            , resolutionWH
            , resolutionWH
            , rotation
            , cptScreencapOnphonePath + screenCapName)
          log.debug('screencap cmd:', screenCapCMD)
          return adb.shell(serial, screenCapCMD)
        })
        .then(adbkit.util.readAll)
        .then(function () {
          screenCapID++
          screenCaps.push(screenCapFile)
          screenCapNames.push(screenCapName)
          runScreenCap = true
          resolve('')
        })
        .catch(function (err) {
          log.warn('screen cap err:', err)
          resolve('')
        })

    })

  }

  function taskprc() {
    
    if(rpldata.installFailScreen){
      adb.pull(serial, rpldata.installFailScreen)
        .then(function(transfer){
          var installFailScreenName = cptScreencapPath + "installFailScreen.jpg"
          rpldata.screenCap.unshift(installFailScreenName)
          rpldata.installFailScreen = installFailScreenName
          transfer.pipe(fs.createWriteStream(installFailScreenName))
        })
        .then(function(){
          clearUpPhone()
        })
    }else{
      clearUpPhone()
    }
    

    if (rpldata.result.errorType && rpldata.result.errorType == 'anr') {
      adb.pull(serial, '/data/anr/traces.txt')
        .then(function (transfer) {
          transfer.pipe(fs.createWriteStream(cptLogPath + anrLogName))
        })
    }

    function clearUpPhone() {
      log.debug('uninstall pkg : ', pkg)
      adb.uninstall(serial, pkg)
        .then(function (err) {
          if (err && !(/true/.test(err))) {
            log.error('uninstall failed ', pkg, err)
          } else(
            log.debug('uninstall pkg finish. ')
          )
        })
        .catch(function (err) {
          log.error('uninstall execption err:', err)
          // setTimeout(uninstallAPKAndback, 1000*5)
        })
        .finally(function () {
          testutil.killAndroidProceBypkg(adb, serial, 'uiautomator', log)
            .then(function () {
              log.debug('closeLogClient')
              return closeLogClient(logcatClient)
            })
            .then(function(){
              log.debug('save task status start')
              return dbapi.saveTaskStatus(taskid, rpldata)
            })
            .then(function () {
              entries = null
              log.debug('monkey test finish callback')
              process.send({task:'end', taskid:taskid, serial:serial})
            })
            .catch(function(err){
              log.error('finally has error :', err.toString())
            })
            .finally(function(){
              process.exit(0)
            })
        })
    }

  }

  function getRotation() {
    //部分手机使用 dumpsys |grep SurfaceOrientation获取不到，所以用 dumpsys display
    log.debug('start get rotation')
    return adb.shell(serial, 'dumpsys display')
      .then(adbkit.util.readAll)
      .then(function (output) {
        log.debug('get rotation output data')
        var data = output.toString().trim()
        return data.match(mOverrideDisplayInfoRegExp)[0].match(rotationRegExp)[0].match(/\d/)[0]
      })
  }

  function logcatOpen() {
    return adb.shell(serial, 'date "+%Y-%m-%d %H:%M:%S"')
      .then(adbkit.util.readAll)
      .then(function (output) {
        startRecordDateStr = output.toString().trim()
        log.debug('phone date :', startRecordDateStr)
        // startRecordDateStr = new Date(Date.parse(outputStr))
        // startRecordLogRegExp = new RegExp(outputStr.substring(0,outputStr.length-1).replace(/\s+/g, '\\s+'))
      })
      .then(function () {
        return adb.openLogcat(serial)
      })
      .then(function (logcat) {
        /*if(filterLogClientSerials.indexOf(serial) != -1){
         logcat.end()
         log.debug('logcat end. spawn get log start')
         return logcatSpawnExec()
         }*/
        logcatClient = logcat
        var luaError
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
            fs.appendFileSync(cptLogPath + logcatLogName, logEntryToString(entry))
            // entries.push(entry)
          }
        }

        logcat.on('entry', entryListener)
        logcat.on('error', function (err) {
          log.error('entry error')

        })
        return
      })
  }

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

  function closeLogClient(logClient) {
    if (logClient) {
      logClient.end()
      logClient = null
    }
    /*if(logcatSpawn){
     logcatSpawn.kill()
     }*/
    return testutil.killAndroidProceBypkg(adb, serial, 'logcat', log)
  }

  function getPids(packageName) {
    return adb.shell(serial, 'ps')
      .then(adbkit.util.readAll)
      .then(function (output) {
        var outputStr = output.toString().trim()

        outputStr.split('\n').forEach(function (str) {
          if (str.indexOf(packageName) != -1) {
            pidArr.push(parseInt(str.split(/\s+/)[1]))
          }
        })
        log.debug('apk pids : ', pidArr)
      })
  }


}



