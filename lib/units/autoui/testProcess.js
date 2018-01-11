/**
 * Created by GuixiangGui on 2017/3/6.
 */

var Promise = require('bluebird')
var execSync = require('child_process').execSync
var exec = require('child_process').exec
var spawn = require('child_process').spawn
var adbkit = require('adbkit')
var node_ssh = require('node-ssh')
var path = require('path')
var fs = require('fs')
var util = require('util')
var dbapi = require('../../db/api')
var strFormat = require('../../../res/bower_components/underscore.string')

var logger = require('../../util/logger')
var pathutil = require('../../util/pathutil')
var testutil = require('../../util/testutil')
var installTask = require('../taskManager/installTask')
var parsereport = require('./parsereport')
var monitorApp = require('../../util/monitorApp')



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
      log.debug('ui auto test install rpldata err and rd:', installErr, installInfo)
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
  var sshExec = new node_ssh()
  var logcatClient

  var appiumFilePath = '/var/stf/vendor/appium'
  var appiumPort = 4723
  var appiumBpPort, appiumTpPort
  /*var appiumForBebePort = 4723
  var appiumBebeBPPort
  var appiumHybridSupportPort = 4725
  var appiumHyBPPort*/
  var serial = options.serial
  // var appiumForBebePath = appiumFilePath + 'appium_for_bebe'
  // var appiumHybridSupportPath = appiumFilePath + 'appium_hybrid_support'
  var performCaseFileName = 'runtest.py'
  var performCaseFileBasePath = '/var/stf/vendor/appium/'+performCaseFileName
  var uiLogPath = options.uiLogPath
  uiLogPath = path.normalize(uiLogPath + '/' + serial + '/')
  var appiumLogPath = uiLogPath + 'appiumLog.log'
  var monitorAppLogPath = uiLogPath + 'amMonitorLog.log'
  var logcatPath = uiLogPath + 'logcat_log.log'
  /*var appiumForBebeLogPath = uiLogPath + 'appiumForBebeLog.log'
  var appiumHybridSupportLogPath = uiLogPath + 'appiumHybridSuportLog.log'*/
  var reportPath = uiLogPath + 'report/'
  var logsPath = uiLogPath + 'logs'
  // var remotePath = remoteFilePath + taskid + '_' + serial
  // var appiumForBebeLogRPath = remotePath + '/appiumForBebeLog.log'
  // var appiumHybridSupportLogRPath = remotePath + '/appiumHybridSuportLog.log'
  var testResultFileName = 'TestReport.xml'

  var accountFilePath
  if(options.accountFilePath){
    fs.stat(options.accountFilePath, function(err, stats){
      if(stats && stats.isFile()){
        accountFilePath = options.accountFilePath
      }
    })
  }
  
  
  var testEnv = options.testEnv
  // var testResult = uiLogPath + testResultFileName
  var projectName = options.projectName

  var amMonitor = null
  
  var closeAppiumNormally = false

  var apkPath = options.apkDecompilePath
  var testBundlePath = options.testbundlePath
  var pkg = options.manifest.package
  var testBundlePkg = 'com.boyaa.application.testbundle'
  var launchActivity = options.manifest.launchActivity
  var appid = options.manifest.appid
  var testCaseRunArgs = ''
  var host = options.host
  var casesId = options.cases
  var rpldata = {result:{}}
  var projectPath = null
  var performCaseFilePath = null
  var srcPath = ''
  var runSerialPath = ''
  var runCfgPath = ''
  var runReportPath = ''
  var runLogPath = ''
  var runScreenPath = ''

  var gameIds = options.moduleId



  rpldata.serial = serial
  rpldata.model = options.model
  rpldata.manufacturer = options.manufacturer
  rpldata.markName = options.markName
  // rpldata.screenCap = screenCaps
  /*rpldata.logs = {
    'appiumForBebeLog': appiumForBebeLogPath
    ,'appiumHybridSupportLog': appiumHybridSupportLogPath
    ,'report': reportPath
  }*/
  rpldata.logs = {
    'appiumLog' : appiumLogPath
    ,'logcatLog' : logcatPath
    ,'report' : reportPath
    ,'logs' : logsPath
  }

  log = logger.createLogger('uiAutoTest:'+taskid+':'+serial)

  var adb = null

  /*var beforeOptions = {
    logs : {
      'appiumForBebeLog': appiumForBebeLogPath
      ,'appiumHybridSupportLog': appiumHybridSupportLogPath
      ,'report': reportPath
    }
    , pkg : [pkg, testBundlePkg]
  }*/
  var beforeOptions = {
    logs : {
      'appiumLog' : appiumLogPath
      ,'logcatLog' : logcatPath
      ,'report' : reportPath
      ,'logs' : logsPath
    }
    , pkg : [pkg, testBundlePkg]
  }

  log.debug('host:',host)
  var sshOptions = {username:'root', host:host, password:'boyaa!@#456'}

  exec('mkdir -p ' + uiLogPath)

  // exec('mkdir -p ' + remotePath)

  //创建adb
  testutil.createadb({host:host}, serial, log)
    .then(function (client) {
      adb = client
      log.debug('init')
      return testutil.init(taskid, serial, adb, beforeOptions)
    })
    .then(function () {
      log.debug('start install appium need apks')
      // return installAppiumNeedApks()
      return testutil.installAppiumNeedApks(adb, serial, log)
    })
    .then(function () {
      //安装被测apk

      log.debug('start install tested apk')
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
            log.debug('install apk finish')
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
      //安装testbundle
      log.debug('install test bundle')
      return testutil.installApk(serial, testBundlePath, adb, log)
    })
    .then(function () {
      //创建report目录
      exec('mkdir -p ' + reportPath)
      exec('mkdir -p ' + logsPath)
    })
    .then(function () {
      //获取要执行的测试用例列表，并转换成字符串（格式： ‘模块.用例名，模块.用例名’）
      log.debug('get cases:')
      return dbapi.getCaseByIds(casesId)
        .then(function (cursor) {
          return Promise.promisify(cursor.toArray, cursor)()
            .then(function (cases) {

              if(cases && cases.length > 0){
                projectPath = path.normalize(cases[0].base_url + '/')
                srcPath = cases[0].local_path.split('/src/')[0] + '/src/'
                performCaseFilePath = srcPath + performCaseFileName
                var isFirst = true

                cases.forEach(function (caseInfo) {

                  //获取测试用例的相对路径
                  var caseRelativePath = caseInfo.local_path.substring(srcPath.length)
                  //获取测试用例的模块名
                  var moduleName = path.dirname(path.normalize(caseRelativePath)).replace(/\//g, '.')
                  moduleName = moduleName + '.' + path.basename(caseRelativePath, '.py')
                  if(isFirst){
                    testCaseRunArgs = moduleName + '.' + caseInfo.class_name
                    isFirst = false
                  }else{
                    testCaseRunArgs = testCaseRunArgs + ',' + moduleName + '.' + caseInfo.class_name
                  }
                })

              }else {
                return Promise.reject('cases is null')
              }
              //获取测试用例项目路径，拷贝用例执行python文件到测试用例项目路径
              return
              // return execSync('cp -n ' + performCaseFileBasePath + ' ' + performCaseFilePath)
            })
        })
    })
    .then(function () {
      return new Promise(function (resolve, reject) {
        runSerialPath = srcPath + serial +'/'
        exec('rm -r ' + runSerialPath, function (err, stdout, stderr) {
          resolve('')
        })
      })

    })
    .then(function () {
      runCfgPath = runSerialPath + 'cfg/'
      runReportPath = runSerialPath + 'report/'
      runLogPath = runSerialPath + 'logs/'
      runScreenPath = runReportPath + 'screenshot/'
      exec('mkdir -p ' + runCfgPath, function(){
        exec('cp ' + srcPath + '/cfg/cfg.ini ' + runCfgPath)
      })
      exec('mkdir -p ' + runReportPath)
      exec('mkdir -p ' + runLogPath)
      exec('mkdir -p ' + runScreenPath)
    })
    .then(function () {
      return sshConnect()
    })
    .then(function () {
      //启动appium
      log.debug('start appium. path:' + appiumFilePath)
      return startAppium(appiumFilePath, appiumPort, appiumLogPath, pkg, launchActivity)
        .then(function (port) {
          appiumPort = port.appiumPort
          appiumBpPort = port.bpPort
          appiumTpPort = port.tpPort
          log.debug('appium port:', appiumPort, appiumBpPort, appiumTpPort)
        })
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
      return testutil.killAndroidProceBypkg(adb, serial, 'uiautomator', log)
    })
    .then(function () {
      //修改项目配置文件appium属性
      log.debug('change cfg file')
      var cfgPath = runCfgPath + '/cfg.ini'
      /*var args = 'luaport:'+appiumForBebePort+',nativeport:'+appiumHybridSupportPort
      +',host:'+host+',devicename:'+serial+',apppackage:'+pkg+',appactivity:'+launchActivity*/
      var args = util.format('luaport:%s,host:%s,devicename:%s,apppackage:%s,appactivity:%s'
      , appiumPort, host, serial, pkg, launchActivity)
      log.debug('cfg appium args:'+args)
      var setConfigFilePath = path.resolve(__dirname,'../../python/setConfigFile.py')
      execSync('python '+setConfigFilePath+' "'+args+'" "'+cfgPath + '" appium')

      //修改项目配置文件report属性
      args = 'reportFormal:XMLReport'
      execSync('python '+setConfigFilePath+' "'+args+'" "'+cfgPath + '" report')

      //修改项目配置文件runtest属性
      args = 'cases:' + testCaseRunArgs
      log.debug('run cases:', args)
      execSync('python '+setConfigFilePath+' "'+args+'" "'+cfgPath + '" runtest')

      //修改项目配置文件casecfg属性
      var game_id 
      log.debug('gameIds:', gameIds)
      if(gameIds && gameIds.length>0){
        game_id = ""
        for (var i = 0; i<gameIds.length; i++){
          game_id = game_id + gameIds[i].moduleId + "|"
        }
      }
      log.debug('game_id:', game_id)
      args = util.format('env:%s,user_cfg:%s,game_id:%s', testEnv, accountFilePath, game_id)
      if(appid){
        args = util.format('%s,region:%s', args, parseInt(Number(appid)/100000))
      }else{
        args = util.format('%s,region:%s', args, 'undefined')
      }
      /*if(accountFilePath){
        args = util.format('env:%s,user_cfg:%s', testEnv, accountFilePath)
      }else{
        args = util.format('env:%s', testEnv)
      }*/
      
      log.debug('case cfg:', args)
      return execSync('python '+setConfigFilePath+' "'+args+'" "'+cfgPath + '" casecfg')
      

    })
    .then(function () {
      log.debug('logcat file path:' + logcatPath)
      testutil.saveLogcat(adb, serial, logcatPath)
      // openLogcat()
      /*amMonitor = new monitorApp(serial, pkg, host, monitorAppLogPath, log)
      amMonitor.start()*/
    })
    .then(function () {
      //启动测试用例
      log.debug('Begin to execute the test case')
      log.debug('src path:', srcPath)
      return new Promise(function (resolve, reject) {
        var runTest = spawn('python', [performCaseFileName, serial], {cwd:srcPath})
        runTest.on('close', function () {
          log.debug('run test close')
          resolve('')
        })

        runTest.stdout.on('data', function (data) {
          log.debug('test cases run log:', data.toString())
        })

        runTest.stderr.on('data', function (data) {
          log.debug('test cases run stderr log:', data.toString())
        })

        runTest.on('error', function (err) {
          log.debug('test cases run error log:', err.toString())
        })

        runTest.on('exit', function () {
          log.debug('run test exit')
        })
        /*exec('python ' + performCaseFileName + ' ' + serial, {cwd:srcPath}, function (err, stdout, stderr) {
          resolve('')
        })*/

      })

    })
    // 一完成就写入已完成字段里，不然进度的值可能会变小
    .then(function() {
      return dbapi.appendCompletedDevices(taskid, rpldata.serial)
    })
    .then(function(){
      exec('mv ' + runLogPath + '* ' + logsPath, function(err, stdout, stderr){
        if(err){
            log.error('mv logs error :', err)
          }
      })
    })
    .then(function () {
      return new Promise(function (resolve, reject) {
        rpldata.status = 'finish'
        rpldata.statusCode = 0
        log.debug('start mv report')
        exec('mv '+runReportPath+'* '+reportPath, function (err, stdout, stderr) {
          if(err){
            log.error('mv report error :', err)
            resolve('')
          }else {
            var parseResult = parsereport(reportPath)
            if(parseResult.error){
              rpldata.statusCode = 5
              rpldata.result = {errorType: 'ui auto test failed', reson: parseResult.error}
            }else{
              rpldata.cases = parseResult.cases
              rpldata.starttime = parseResult.starttime
              rpldata.endtime = parseResult.endtime

            }
            
            resolve('')
          }

        })
        /*exec('mv ' + srcPath + testResultFileName + ' ' + testResult, function (err,stdout,stderr) {
         exec('rm ' + srcPath + testResultFileName)
         })*/

      })
    })
    .then(function () {
      return new Promise(function (resolve, reject) {
        var casesIndex = 0
        getScreen(function () {
          resolve('')
        })

        function getScreen(cb){
          if(rpldata.cases && rpldata.cases.length > casesIndex){
            rpldata.cases[casesIndex].screenCaps = []
            var caseName = rpldata.cases[casesIndex].name
            var nameArr = caseName.split('.')
            var reportScreenPath = reportPath + 'screenshot/'
            exec('ls -rt|grep ' + nameArr[nameArr.length-1], {cwd:reportScreenPath}, function (err, stdout, stderr) {
              if(stdout && stdout.toString().trim().length > 0) {
                stdout.toString().trim().split(/\s+|\n/).forEach(function (screenName) {
                  if(screenName && screenName.length > 0){
                    rpldata.cases[casesIndex].screenCaps.push(reportScreenPath + screenName)
                  }
                })
              }
              casesIndex++
              getScreen(cb)
            })
          }else{
            cb()
          }
        }
      })
    })
    .catch(function (err) {
      log.error(err)
      if(/cases is null/i.test(err)){
        rpldata.status = 'finish'
        rpldata.statusCode = 0
        return
      }
      rpldata.status = 'fail'
      rpldata.statusCode = 5
    })
    .finally(function () {
      /*if(amMonitor){
        amMonitor.emit('end')
      }*/
      closeAppiumNormally = true

      if(rpldata.installFailScreen){
        adb.pull(serial, rpldata.installFailScreen)
          .then(function(transfer){
            var installFailScreenName = cptScreencapPath + "installFailScreen.jpg"
            rpldata.installFailScreen = installFailScreenName
            transfer.pipe(fs.createWriteStream(installFailScreenName))
          })
      }

      testutil.killAndroidProceBypkg(adb, serial, 'logcat', log)
      // closeLogClient()

      var startuiautomatorCmd = 'uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall'
      log.debug('start uiautomator')
      adb.shell(serial, startuiautomatorCmd)
        .then(function () {
          log.debug('uninstall apk ', pkg)
          return adb.uninstall(serial, pkg)
            .then(function (err) {
              if (err && !(/true/.test(err))) {
                log.error('uninstall failed ', pkg, err)
              } else(
                log.debug('uninstall pkg finish. ')
              )
            })
            .catch(function (err) {
              log.error('uninstall failed ', pkg, err)
            })
        })
        .then(function () {
          log.debug('uninstall apk ', testBundlePkg)
          return adb.uninstall(serial, testBundlePkg)
            .then(function (err) {
              if (err && !(/true/.test(err))) {
                log.error('uninstall failed ', testBundlePkg, err)
              } else(
                log.debug('uninstall pkg finish. ')
              )
            })
            .catch(function (err) {
              log.error('uninstall failed ', testBundlePkg, err)
            })
        })
        .then(function () {
          return testutil.killAndroidProceBypkg(adb, serial, 'uiautomator', log)
        })
        .then(function () {
          return clearAppium(appiumPort)
        })
        .then(function () {
          return releaseForwardPort(appiumBpPort)
        })
        .then(function () {
          return releaseForwardPort(appiumTpPort)
        })
        .then(function(){
          log.debug('save task status start')
          return dbapi.saveTaskStatus(taskid, rpldata)
        })
        .then(function(){
          process.send({task:'end', taskid:taskid, serial:serial})
        })
        .then(function () {
          return sshExec.dispose()
        })
        .catch(function(err){
          log.error('finally has error :', err.toString())
        })
        .finally(function(){
          process.exit(0)
        })


      /*log.debug('uninstall apk. pkg:', pkg)
      adb.uninstall(serial, pkg)
      log.debug('uninstall testbundle')
      adb.uninstall(serial, testBundlePkg)*/
      // execSync('mv ' + appiumForBebeLogRPath + ' ' + appiumForBebeLogPath)
      // execSync('mv ' + appiumHybridSupportLogRPath + ' ' + appiumHybridSupportLogPath)
      // exec('rm -r ' + remotePath)


    })

  function sshConnect() {
    return sshExec.connect(sshOptions)
      .then(function () {
        return sshExec.execCommand('ls')
      })

  }

  function startAppium(path, p, lPath, apppkg, appactivity) {
    var callB = true
    var isStarted = false

    return new Promise(function (resolve, reject) {
      start(path, p, lPath, apppkg, appactivity, function (appiumPort, bpPort, tpPort) {
        resolve({appiumPort:appiumPort, bpPort:bpPort, tpPort:tpPort})
      })

    })

    function start(appiumPath, port, logPath, pkg, activity, cb) {
      var aPort, bpPort, tpPort

      getAvailablePort(port)
        .then(function (port) {
          aPort = port
          return new Promise(function (resolve, reject) {
            forwardPort(aPort + 1, function (fPort) {
              bpPort = fPort
              resolve('')
            })
          })
        })
        .then(function () {
          return new Promise(function (resolve, reject) {
            forwardPort(bpPort + 1, function (fPort) {
              tpPort = fPort
              resolve('')
            })
          })
        })
        .then(function () {
          var ecmd = util.format('node %s -p %s -U %s -bp %s -tp %s --log-timestamp --local-timezone', appiumPath, aPort, serial, bpPort, tpPort)
          if(pkg){
            ecmd = util.format('%s --app-pkg %s --app-activity %s', ecmd, pkg, activity)
          }

          log.debug('statr appium cmd:' + ecmd)
          execCmd(ecmd)

          function execCmd(cmd){
            sshExec.execCmdStream(cmd)
            .then(function (startAppiumStream) {
              var appiumLogData = ''

              var successStartRegExp = new RegExp('Appium REST http interface listener started on.*', 'i')
              var failStartRegExp = new RegExp('Could not start.*port may already be in use', 'i')
              startAppiumStream.setEncoding('utf-8')
              startAppiumStream.on('data', function (data) {
                appiumLogData = appiumLogData + data
                if(appiumLogData.length > 1024*512){
                  fs.appendFileSync(logPath, appiumLogData)
                  appiumLogData = ''
                }
                

                if(callB && successStartRegExp.test(data)){
                  callB = false
                  isStarted = true
                  cb(aPort, bpPort, tpPort)
                }

              })

              startAppiumStream.on('close', function(code, signal){
                log.debug('appium closed code:', code)
                log.debug('appium closed siginal', signal)

                fs.appendFileSync(logPath, appiumLogData)
                appiumLogData = ''

                if(!closeAppiumNormally&&isStarted){
                  execCmd(cmd)
                }
              })

              startAppiumStream.on('error', function (err) {
                // fs.appendFile(logPath, 'error++++'+err)
                appiumLogData = appiumLogData + 'error++++' + err
                if(appiumLogData.length > 1024*512){
                  fs.appendFileSync(logPath, appiumLogData)
                  appiumLogData = ''
                }
              })
              startAppiumStream.stderr.on('data',function (data) {
                if(failStartRegExp.test(data)){
                  log.debug('could not start appium  stream.stderr')
                  releaseForwardPort(bpPort)
                    .then(function () {
                      return releaseForwardPort(tpPort)
                    })
                    .then(function () {
                      start(appiumPath, aPort+3, logPath, pkg, activity, cb)
                    })
                }else{
                  // fs.appendFile(logPath, 'stderr++++'+data)

                  appiumLogData = appiumLogData + 'stderr++++' + data
                  if(appiumLogData.length > 1024*512){
                    fs.appendFileSync(logPath, appiumLogData)
                    appiumLogData = ''
                  }
                  if(callB){
                    callB = false
                    cb(aPort, bpPort, tpPort)
                  }
                }
              })
              startAppiumStream.on('warn', function (data) {
                if(failStartRegExp.test(data)){
                  log.debug('could not start appium  warn')
                  releaseForwardPort(port)
                    .then(function () {
                      start(appiumPath, aPort+3, logPath, pkg, activity, cb)
                    })
                }else{
                  // fs.appendFile(logPath, 'warn++++'+data)

                  appiumLogData = appiumLogData + 'warn++++' + data
                  if(appiumLogData.length > 1024*512){
                    fs.appendFileSync(logPath, appiumLogData)
                    appiumLogData = ''
                  }
                  if(callB){
                    callB = false
                    cb(aPort, bpPort, tpPort)
                  }
                }
              })
            })
          }

        })
    }

  }

  function clearAppium(port){
    return new Promise(function (resolve, reject) {
      closeAppiumServer(port, function () {
        resolve('')
      })
    })
  }

  function releaseForwardPort(port) {
    log.debug('release adb forward port. port:' + port)
    var cmd = util.format('adb -s %s forward --remove tcp:%s', serial, port)
    return sshExec.execCommand(cmd)
  }

  function forwardPort(port, cb) {
    getAvailablePort(port)
      .then(function (availablePort) {
        var cmd = util.format('adb -s %s forward --no-rebind tcp:%s tcp:4724', serial, availablePort)
        // var cmd = 'adb -s ' + serial + ' forward --no-rebind tcp:' + availablePort + ' tcp:4724'
        sshExec.execCommand(cmd)
          .then(function (result) {
            if(/cannot rebind existing socket/i.test(result.stderr)){
              forwardPort(availablePort+3, cb)
            }else if(/cannot bind/i.test(result.stdout)){
              forwardPort(availablePort+3, cb)
            }else{
              if(typeof cb == 'function'){
                cb(availablePort)
              }
            }
          })
      })
  }

  function getAvailablePort(port) {
    return new Promise(function(resolve, reject){
      start(port, function (port) {
        resolve(port)
      })
    })

    function start(port, cb) {
      // log.debug('netstat -anp|grep '+port)
      sshExec.execCommand('netstat -anp|grep :'+port)
        .then(function (result) {
          // log.debug('ssh output:',err, stdout, stderr)
          if(result.stdout){
            start(port+3, cb)
          }else{
            cb(port)
          }
        })
    }

  }

  function closeAppiumServer(port, cb, tryA) {
    log.debug('close appium. port:', port)
    var tryAgain = (tryA==null ? true:tryA)
    // var cmd = 'ps -ef |grep appium |grep ' + port
    var cmd = util.format('ps -ef|grep appium|grep %s|grep -v grep', port)
    sshExec.execCommand(cmd)
      .then(function (result) {
        log.debug('ps -ef|grep appium result:', result)
        if(result.stdout){
          // log.debug('close appium ', stdout.toString().trim())
          var strs = result.stdout.split('\n')
          strs.forEach(function (str) {
            if((/node.*-p/).test(str)){
              var pid = str.split(/\s+/)[1]
              log.debug('appium pid :', pid)
              killParentAndSubProcess(pid)
                .then(function (result) {
                  // log.debug('kill appium stdout:'+result.stdout)
                  // log.debug('kill appium stderr:'+result.stderr)
                  if(typeof cb == 'function'){
                    cb(null)
                  }
                })
            }
          })
        }else if(!result.stderr && tryAgain){
          setTimeout(function () {
            closeAppiumServer(port, cb, false)
          }, 1000)
        }else{
          if(typeof cb == 'function'){
            cb(null)
          }
        }

      })
      .catch(function(err){
        log.debug('close appium error. err:', err)
        sshConnect()
          .then(function(){
            closeAppiumServer(port, cb, false)
          })
      })


    function killParentAndSubProcess(parentPid){
      var getSubPidCmd = util.format('ps -ef|grep %s|grep -v grep', parentPid)
      return sshExec.execCommand(getSubPidCmd)
        .then(function (result) {
          var killProcesses = []
          if(result.stdout){
            var psDatas = result.stdout.toString().trim().split('\n')
            psDatas.forEach(function (data) {
              log.debug('ps grep parent pid data:', data)
              var dataArr = data.split(/\s+/)
              log.debug('ps grep parent pid data array:', dataArr[2], dataArr[1])
              if(dataArr[2] == parentPid){
                killProcesses.push(killProcess(dataArr[1]))
              }
            })
          }
          return Promise.all(killProcesses)
        })
        .then(function () {
          return killProcess(parentPid)
        })
    }

    function killProcess(pid){
      return sshExec.execCommand('kill -9 ' + pid)
        .then(function (result) {
          log.debug('result stderr:', pid, result.stderr)
          log.debug('result stdout:', pid, result.stdout)
        })
    }
  }

  function installAppiumNeedApks() {
    var appiumImePkg = 'io.appium.android.ime'
    var appiumUnlocPkg = 'io.appium.unlock'
    var appiumSettingsPkg = 'io.appium.settings'
    var appiumImePath = '/var/stf/vendor/appium_apk/UnicodeIME-debug.apk'
    var appiumUnlocPath = '/var/stf/vendor/appium_apk/unlock_apk-debug.apk'
    var appiumSettingsPath = '/var/stf/vendor/appium_apk/settings_apk-debug.apk'

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
