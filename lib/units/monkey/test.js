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
// var dbapi = require('../../db/api')
var logger = require('../../util/logger')
var testutil = require('../../util/testutil')
var promiseutil = require('../../util/promiseutil')
var datautil = require('../../util/datautil')
var crashlogfilter = require('../../util/crashlogfilterutil')
var display = require('../device/plugins/util/display')
var installTask = require('../taskManager/installTask')
var pullScreenTask = require('../taskManager/pullScreenTask')

module.exports = function (options, taskid, dbapi, callback) {
  var filterLogClientSerials = ['GWY0216B26001020', '022AUM213A011856']

  var cptLogPath = options.cptLogPath
  var cptScreencapPath = options.cptScreencapPath
  var cptScreencapOnphonePath = '/data/local/tmp/'
  var appLaunchTime = 0

  var manifest = options.manifest
  var pkg = manifest.package
  var serial = options.serial
  var deviceInfo = options.deviceInfo
  var resolutionHW = options.resolutionHW
  var resolutionWH = options.resolutionWH
  var deviceModel = options.model
  var deviceManufacturer = options.manufacturer
  var deviceManuAndModel = deviceManufacturer.trim().replace(/\s+/g, '-') + '_' + deviceModel.trim().replace(/\s+/g, '-')
  var apkPath = options.apkPath
  var log = logger.createLogger('test:' + taskid + ':' + serial)

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
  var logcatFinishNormal = false
  var runScreenCap = true
  var logcatSpawn = null
  var amMonitor = null
  var startRecordDateStr = null

  var screenCapOnPhonePath = '/data/local/tmp/cloudTestScreen.jpg'
  //var screenCapCMD = 'adb -s '+serial+' shell screencap -p ' + screenCapOnPhonePath
  //var pullScreenCapCMD = 'adb -s '+serial+' pull '+screenCapOnPhonePath+' '
  // var screenCapCMD = 'screencap -p ' + screenCapOnPhonePath
  var performanceFilePath = '/mnt/sdcard/' + taskid + '_performance.cvs'

  var stopPerformanceServiceCMD = 'am force-stop com.boyaa.stf.pt'

  var monkeyLogName = deviceManuAndModel + '_monkey_' + taskid + '.log'
  var logcatLogName = deviceManuAndModel + '_logcat_' + taskid + '.log'
  var anrLogName = deviceManuAndModel + '_anr_' + taskid + '.log'
  var performanceFileName = deviceManuAndModel + '_' + taskid + '_performance.cvs'
  var monitorLogName = deviceManuAndModel + '_crashmonitor_' + taskid + '.log'
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

  rpldata.model = deviceModel
  rpldata.manufacturer = deviceManufacturer
  rpldata.serial = serial
  rpldata.logs = {
    'monkeyLog': cptLogPath + monkeyLogName
    , 'logcatLog': cptLogPath + logcatLogName
    , 'anrLog': cptLogPath + anrLogName
    , 'crashMonitorLog': cptLogPath + monitorLogName
  }

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
    .then(function () {
      log.debug('open logcat')
      logcatOpen()
      log.info('host', adb.host)
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
        installTask.pushInstallTask(host, installOption, function (err, rd) {
          log.debug('install apk finish')
          rpldata = rd
          if (err) {
            reject(err)
          } else {
            resolve('')
          }
        })
      })

      /*adb.listDevices()
       .then(function (devices) {
       console.log(devices)
       })
       */
      /*return promiseutil.periodicNotify(
       adb.install(serial, apkPath)
       .timeout(60000 * 5)
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
       .catch(function (err) {

       rpldata.status = 'fail'
       rpldata.statusCode = 1
       if (err.code) {
       rpldata.result = {errorType: 'install failed', reson: err.code}
       } else {
       rpldata.result = {errorType: 'install failed', reson: 'unknown'}
       }

       return Promise.reject(err)
       })
       })
       break
       case 'INSTALL_CANCELED_BY_USER':
       return testutil.wakeUpPhone(serial, adb, log)
       .then(function () {
       return adb.install(serial, apkPath)
       .timeout(60000 * 5)
       .catch(function (err) {

       rpldata.status = 'fail'
       rpldata.statusCode = 1
       if (err.code) {
       rpldata.result = {errorType: 'install failed', reson: err.code}
       } else {
       rpldata.result = {errorType: 'install failed', reson: 'unknown'}
       }

       return Promise.reject(err)
       })
       })
       break
       case 'INSTALL_FAILED_ABORTED':
       return adb.shell(serial, 'pm list package')
       .then(adbkit.util.readAll)
       .then(function (output) {
       var str = output.toString()
       var pkgRegExp = RegExp(pkg)
       if (pkgRegExp.test(str)) {
       return Promise.resolve('')
       }
       })
       break
       default:

       rpldata.status = 'fail'
       rpldata.statusCode = 1
       if (err.code) {
       rpldata.result = {errorType: 'install failed', reson: err.code}
       } else {
       rpldata.result = {errorType: 'install failed', reson: err}
       }

       return Promise.reject(err)
       }
       })
       , 250
       )*/
    })
    .then(function () {
      // monitorAPPCrash()
      return testutil.wait(1000 * 20)
    })
    .then(function () {
      log.debug('wake up phone after install apk')
      return testutil.wakeUpPhone(serial, adb, log)
        .then(function () {
          log.debug('send key event home')
          return testutil.sendKeyEvent(serial, adb, 'KEYCODE_HOME', log)
        })
    })
    .then(function () {

      monitorAPPCrash()

      var launchActivity
      if (manifest.launchActivity) {
        var activityName = manifest.launchActivity

        if (activityName.indexOf('.') === -1) {
          activityName = util.format('.%s', activityName)
        }

        launchActivity = pkg + '/' + activityName
      }

      var startPerformanceServiceCMD = 'am start --user 0 -n com.boyaa.stf.pt/.MainActivity --es "packageName" "' + pkg + '" --es "filePath" "' + performanceFilePath + '" --el "delayTime" 2000'
      // adb.shell(serial, startPerformanceServiceCMD)

      var cmd = 'am start -W ' + launchActivity

      log.debug('start apk ', pkg)
      return adb.shell(serial, cmd)
        .then(adbkit.util.readAll)
        .timeout(1000 * 30)
        .then(function (output) {
          log.debug('apk start kill app_process')
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

          if (appLaunchTime == 0 || isluacrash) {
            return Promise.reject(pkg + 'launch failed')
          }

          return getPids(pkg)
        })
        // .then(function () {
        //   log.info('分布式相关修改，杀死app_process进程')
        //   testutil.killAndroidProceBypkg(adb, serial, 'app_process', log)
        // })
        .then(function () {
          log.debug('start performanece service')
          adb.shell(serial, startPerformanceServiceCMD)
            .then(adbkit.util.readAll)
            .then(function (stdout) {
              log.info('start performanece service', stdout.toString().trim)
            })
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
            var monkeyFile = util.format('/var/stf/monkeyfile/%s_%s_monkey.txt', taskid, serial)
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
        /*.then(function () {
          return testutil.createadb(options, serial, log)
            .then(function (client) {
              screenCapAdb = client
            })
        })*/
        .then(function () {
          monkey()
        })
        .catch(function (err) {
          return appLaunchFail()
            .then(function () {
              log.debug('kill app_process')
              return testutil.killAndroidProceBypkg(adb, serial, 'app_process', log)
                .then(function () {
                  return Promise.reject(err)
                })
            })

        })

      function appLaunchFail() {
        log.error('app launch failed')
        rpldata.status = 'fail'
        rpldata.statusCode = 2

        return screenCap()
          .then(function () {
            return getPids(pkg)
          })
      }

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

    function runMonkey() {
      log.debug(command)
      rpldata.performance = cptLogPath + performanceFileName
      var setIntervalID

      adb.shell(serial, command)
        .then(adbkit.util.readAll)
        .timeout(1000 * 60 * 30)
        .then(function (output) {
          var outputStr = output.toString().trim()
          fs.writeFileSync(cptLogPath + monkeyLogName, outputStr)
          closeLogClient(logcatClient)

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
                  adb: adb
                  , fileNames: screenCapNames
                  , fileOnPhonePath: cptScreencapOnphonePath
                  , fileOnPcPath: cptScreencapPath
                  , serial: serial
                }

                pullScreenTask.pushTask(host, option, function () {
                  resolve('')
                })
              })
            })
            .then(function () {
              /*if(monkeyAbortedRegExp.test(outputStr)||isluacrash){
               rpldata.status = 'fail'
               rpldata.statusCode = 3
               rpldata.appLaunchTime = appLaunchTime
               rpldata.screenCap = screenCaps

               if(monkeyAbortedRegExp.test(outputStr)){
               log.error('monkey test failed')
               crashlogfilter.monkeylogfilter(outputStr, function (result) {
               if(result&&result.errorType){
               rpldata.result.errorType = result.errorType
               rpldata.result.reson = result.reson
               }
               })
               }

               }*/
              if (monkeyAbortedRegExp.test(outputStr)) {
                rpldata.status = 'fail'
                rpldata.statusCode = 3
                rpldata.appLaunchTime = appLaunchTime
                rpldata.screenCap = screenCaps

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
                rpldata.appLaunchTime = appLaunchTime
                rpldata.screenCap = screenCaps
              }

              try {
                var stat = fs.statSync(rpldata.performance)
              } catch (err) {
                log.error('performance file is not exits on folder. err:', err)
              }

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

  /*function screenCap() {
   return new Promise(function (resolve, reject) {
   var screenCapFile = cptScreencapPath+serial+'_'+taskid+'_'+screenCapID+'.png'
   var screenCapCMD = 'adb -H '+host+' -s '+serial+' shell screencap -p /data/local/tmp/cloudTestScreen'+screenCapID+'.png'
   var pullScreenCapCMD = 'adb -H '+host+' -s '+serial+' pull /data/local/tmp/cloudTestScreen'+screenCapID+'.png '+screenCapFile
   exec(screenCapCMD, function () {
   exec(pullScreenCapCMD, function () {
   screenCaps.push(screenCapFile)
   screenCapID++
   resolve('')
   })

   })
   })


   /!*return adb.screencap(serial)
   .then(function (stream) {
   var fileName = serial + '_' +  taskid + '_' + screenCapID + '.png'
   fs.appendFileSync(cptScreencapPath+fileName)
   var output = fs.createWriteStream(cptScreencapPath+fileName)
   screenCapID++

   stream.pipe(output)
   screenCaps.push(cptScreencapPath+fileName)
   })*!/
   }*/

  function screenCap() {
    var screenCapName = serial + '_' + taskid + '_' + screenCapID + '.jpg'
    var screenCapFile = cptScreencapPath + screenCapName
    log.debug(screenCapID + ' screencap ')
    runScreenCap = false
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
          }
        })
        .then(function (rotation) {
          var screenCapCMD = util.format(
            'LD_LIBRARY_PATH=/data/local/tmp exec /data/local/tmp/minicap -P %s@%s/%s -s >%s'
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

      /*adb.screencap(serial)
       .then(function (transfer) {
       transfer.on('progress', function (stats) {
       log.debug('Pulled %d bytes so far. screencapID:%s',
       stats.bytesTransferred,
       screenCapID)
       })

       transfer.on('end', function () {
       log.info('%s screencap Pull complete', screenCapID)
       screenCaps.push(screenCapFile)
       screenCapID++
       resolve('')
       // resolve()
       })

       transfer.on('warn', function (data) {
       log.debug('adb pull screencap warn :' + data)
       })

       transfer.on('error', function (err) {
       log.debug('adb pull screencap error :' + err + '   screenCapID:' + screenCapID)
       resolve('')
       })
       transfer.pipe(fs.createWriteStream(screenCapFile))
       })*/
      /*var screenCapCMD = 'screencap -p /data/local/tmp/cloudTestScreen' + screenCapID + '.jpg'
       adb.shell(serial, screenCapCMD)
       .then(adbkit.util.readAll)
       .delay(1000*2)
       .then(function () {
       // adb.pull(serial, screenCapOnPhonePath)
       var s = ''
       adb.pull(serial, '/data/local/tmp/cloudTestScreen' + screenCapID + '.jpg')
       .then(function (transfer) {
       transfer.on('progress', function(stats) {
       log.debug('Pulled %d bytes so far. screencapID:%s',
       stats.bytesTransferred,
       screenCapID)
       })

       transfer.on('data', function (data) {
       s = s+data
       })

       transfer.on('end', function () {
       log.info('%s screencap Pull complete', screenCapID)
       screenCaps.push(screenCapFile)
       fs.appendFileSync(cptScreencapPath + serial + '_' + taskid + '_' + screenCapID + '_data.jpg', s)
       s = null
       screenCapID++
       resolve('')
       // resolve()
       })

       transfer.on('warn', function (data) {
       log.debug('adb pull screencap warn :' + data)
       })

       transfer.on('error', function (err) {
       log.debug('adb pull screencap error :' + err + '   screenCapID:' + screenCapID)
       resolve('')
       })
       transfer.pipe(fs.createWriteStream(screenCapFile))

       })
       })
       .catch(function (err) {
       log.error('screencap error:' + err)
       resolve('')
       })*/
      /*testutil.createadb({host:host}, serial, log)
       .then(function (client) {
       adb = client
       log.info('分布式相关修改,获取图片')
       adb.shell(serial,screenCapCMD)
       .then(adbkit.util.readAll)
       .then(function(){
       adb.pull(serial,screenCapOnPhonePath)
       .then(function(transfer){
       new Promise(function(resolve, reject) {
       transfer.on('progress', function(stats) {
       //log.info('Pulled %d bytes so far',stats.bytesTransferred)
       })
       transfer.on('end', function() {
       //log.info('Pull complete')
       resolve()
       })
       transfer.on('error', reject)
       transfer.pipe(fs.createWriteStream(screenCapFile))
       })
       screenCaps.push(screenCapFile)
       screenCapID++
       resolve('')
       })
       })
       })*/
    })

    /*return adb.screencap(serial)
     .then(function (stream) {
     var fileName = serial + '_' +  taskid + '_' + screenCapID + '.png'
     fs.appendFileSync(cptScreencapPath+fileName)
     var output = fs.createWriteStream(cptScreencapPath+fileName)
     screenCapID++

     stream.pipe(output)
     screenCaps.push(cptScreencapPath+fileName)
     })*/
  }

  function taskprc() {

    log.debug('rpldata result ', rpldata.result, rpldata.result.errorType)
    if (rpldata.statusCode == 2 && !(rpldata.result && rpldata.result.errorType)) {
      log.debug('crashlogfilter start')
      crashlogfilter.logcatentrieslogfilter(entries, pidArr, pkg, function (result) {
        if (result.errorType) {
          rpldata.result.errorType = result.errorType
          rpldata.result.reson = result.reson
        } else {
          rpldata.result.errorType = 'crash'
          rpldata.result.reson = 'unknown'
        }


        dbapi.saveTaskStatus(taskid, rpldata)
          .finally(function () {
            clearUpPhone()
          })
      })
    } else {
      dbapi.saveTaskStatus(taskid, rpldata)
        .finally(function () {
          clearUpPhone()
        })
    }


    if (isanr) {
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
            .then(function () {
              entries = null
              log.debug('monkey test finish callback')
              callback(taskid, serial)
            })
        })
    }

  }

  function getRotation() {
    return adb.shell(serial, 'dumpsys display')
      .then(adbkit.util.readAll)
      .then(function (output) {
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
            entries.push(entry)
          }
          /*if(luaErrorRegExp.test(entry.message)){
           luaError = entry.message
           }else if(luaCrashRegExp.test(entry.message)){
           isluacrash = true
           if(luaError){
           rpldata.result.luacrash = luaError
           log.error('lua crash luaError:', luaError)
           }else {
           rpldata.result.luacrash ='lua vm destroy'
           }

           }else if(anrRegExp.test(entry.message)){
           isanr = true
           }else if(luaStackRegExp.test(entry.message)){
           isluacrash = true
           rpldata.result.luacrash = entry.message.split('\n')[0]
           log.error('lua crash stack:', entry.message.split('\n')[0])
           }*/
        }

        logcat.on('entry', entryListener)
        logcat.on('error', function (err) {
          log.error('entry error')

        })
        logcat.on('finish', function () {
          log.debug('logcat on finish')
          if (!logcatFinishNormal) {
            log.debug('get logcat by spawn')
            logcatSpawnExec()
          }
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
      logcatFinishNormal = true
      logClient.end()
      logClient = null
    }
    /*if(logcatSpawn){
     logcatSpawn.kill()
     }*/
    return testutil.killAndroidProceBypkg(adb, serial, 'logcat', log)
  }

  function logcatSpawnExec() {
    var isStartRecord = false
    var logDate
    var logDateStr
    var startRecordDate = new Date(Date.parse(startRecordDateStr.substring(5)))
    var isLastDayOfYear = /12-31/.test(startRecordDateStr)
    logcatSpawn = spawn('adb', ['-H', host, '-s', serial, 'logcat', '-v', 'time'])
    logcatSpawn.stdout.on('data', function (data) {
      var str = data.toString()
      var luaError
      logDateStr = str.substring(0, 19).match(/\d{2}-\d{2} \d{2}:\d{2}:\d{2}/)
      if (logDateStr) {
        logDate = new Date(Date.parse(logDateStr[0]))
      }
      if (!isStartRecord) {
        if ((logDate && startRecordDate <= logDate) || (isLastDayOfYear && logDateStr && /01-01/.test(logDateStr[0]))) {
          isStartRecord = true
        }
      } else {
        fs.appendFileSync(cptLogPath + logcatLogName, str)
      }

      /*if(luaErrorRegExp.test(str)){
       var strs = str.split('\n')
       for(var i = 0;i<strs.length;i++){
       if(luaErrorRegExp.test(strs[i])){
       luaError = strs[i].split(/\(\s*\d+\):/)[1]
       break;
       }
       }

       }else if(luaCrashRegExp.test(str)){
       isluacrash = true
       if(luaError){
       rpldata.result.luacrash = luaError
       log.error('lua crash luaError:', luaError)
       }else {
       rpldata.result.luacrash ='lua vm destroy'
       }
       rpldata.result.luacrash = luaError
       }else if(anrRegExp.test(str)){
       isanr = true
       }else if(luaStackRegExp.test(str)){
       isluacrash = true
       var strs = str.split('\n')
       for(var i = 0;i<strs.length;i++){
       if(luaStackRegExp.test(strs[i])){
       rpldata.result.luacrash = strs[i].split(/\(\s*\d+\):/)[1]
       }else if(luaErrorRegExp.test(strs[i])){
       rpldata.result.luacrash = strs[i].split(/\(\s*\d+\):/)[1]
       break;
       }
       }

       }*/
    })
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

  function monitorAPPCrash() {
    var processRegExp = new RegExp('processName.*' + pkg, 'i')
    var processAnrRegExp = new RegExp('ERROR.*PROCESS.*NOT.*RESPONDING', 'i')
    var processCrashRegExp = new RegExp('ERROR.*PROCESS.*CRASHED', 'i')
    var continueRegExp = new RegExp('\\(c\\)ontinue')
    var quitRegExp = new RegExp('\\(q\\)uit')
    var errorStr = ''
    var processIsError = false

    //amMonitor = spawn('adb', ['-s', serial, 'shell', 'am', 'monitor'])
    log.info('分布式相关修改，启动am monitor')
    adb.shell(serial, 'am monitor')
      .then(adbkit.util.readAll)
      .then(function (data) {
        var str = data.toString().trim()
        var isSameDate = false
        log.debug('monitor data:', str)

        if (processAnrRegExp.test(str) || processCrashRegExp.test(str)) {
          fs.appendFile(cptLogPath + monitorLogName, str)
        }
        /*if (processIsError) {
         fs.appendFileSync(cptLogPath + monitorLogName, str)
         } else {
         if (processAnrRegExp.test(str) || processCrashRegExp.test(str)) {
         errorStr = str
         isSameDate = true
         }
         if (processRegExp.test(str)) {
         if (!isSameDate) {
         fs.appendFileSync(cptLogPath + monitorLogName, errorStr)
         }
         fs.appendFileSync(cptLogPath + monitorLogName, str)
         processIsError = true
         }
         }*/
      })


    // amMonitor.on('close',function () {
    //   log.debug('adb shell am monitor close')
    // })

    // amMonitor.on('exit', function () {
    //   log.debug('adb shell am monitor exit')
    // })

    // amMonitor.on('error', function (err) {
    //   log.debug('am monitor error ; err:', err)
    // })

  }

}



