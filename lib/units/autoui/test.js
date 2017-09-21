/**
 * Created by GuixiangGui on 2017/3/6.
 */

var Promise = require('bluebird')
var execSync = require('child_process').execSync
var exec = require('child_process').exec
var spawn = require('child_process').spawn
var node_ssh = require('node-ssh')
var path = require('path')
var fs = require('fs')
var util = require('util')

var logger = require('../../util/logger')
var pathutil = require('../../util/pathutil')
var testutil = require('../../util/testutil')
var installTask = require('../taskManager/installTask')
var parsereport = require('./parsereport')



module.exports = function (options, taskid, dbapi, callback) {
  var sshExec = new node_ssh()

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
  /*var appiumForBebeLogPath = uiLogPath + 'appiumForBebeLog.log'
  var appiumHybridSupportLogPath = uiLogPath + 'appiumHybridSuportLog.log'*/
  var reportPath = uiLogPath + 'report/'
  // var remotePath = remoteFilePath + taskid + '_' + serial
  // var appiumForBebeLogRPath = remotePath + '/appiumForBebeLog.log'
  // var appiumHybridSupportLogRPath = remotePath + '/appiumHybridSuportLog.log'
  var testResultFileName = 'TestReport.xml'
  // var testResult = uiLogPath + testResultFileName
  var projectName = options.projectName

  var apkPath = options.apkDecompilePath
  var testBundlePath = options.testbundlePath
  var pkg = options.manifest.package
  var testBundlePkg = 'com.boyaa.application.testbundle'
  var launchActivity = options.manifest.launchActivity
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



  rpldata.serial = serial
  rpldata.model = options.model
  rpldata.manufacturer = options.manufacturer
  // rpldata.screenCap = screenCaps
  /*rpldata.logs = {
    'appiumForBebeLog': appiumForBebeLogPath
    ,'appiumHybridSupportLog': appiumHybridSupportLogPath
    ,'report': reportPath
  }*/
  rpldata.logs = {
    'appiumLog' : appiumLogPath
    ,'report' : reportPath
  }

  var log = logger.createLogger('test:'+taskid+':'+serial)
  log.info("wwwwwwwwwwwwwwwwwwwwww" + uiLogPath)
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
      ,'report' : reportPath
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
      //安装被测apk

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

      /*log.debug('install apk ', pkg)
      log.debug('apk path:', apkPath)
      return testutil.installApkN(serial, apkPath, adb, log)
        .catch(function (err) {
          rpldata.status = 'fail'
          rpldata.statusCode = 1
          if(err.code){
            rpldata.result = {errorType : 'install failed', reson : err.code}
          }else{
            rpldata.result = {errorType : 'install failed', reson : 'unknown'}
          }
          return Promise.reject(err)
        })*/
    })
    .then(function () {
      //安装testbundle
      log.debug('install test bundle')
      return testutil.installApk(serial, testBundlePath, adb, log)
    })
    .then(function () {
      //创建report目录
      exec('mkdir -p ' + reportPath)
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

              }
              //获取测试用例项目路径，拷贝用例执行python文件到测试用例项目路径
              return execSync('cp -n ' + performCaseFileBasePath + ' ' + performCaseFilePath)
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
      exec('mkdir -p ' + runCfgPath)
      exec('mkdir -p ' + runReportPath)
      exec('mkdir -p ' + runLogPath)
      exec('mkdir -p ' + runScreenPath)
      exec('cp ' + srcPath + '/cfg/cfg.ini ' + runCfgPath)
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
    /*.then(function () {
      //启动appium for bebe
      log.debug('start appium for bebe. path:'+appiumForBebePath)
      return startAppium(appiumForBebePath, appiumForBebePort, appiumForBebeLogPath, pkg, launchActivity)
        .then(function (port) {
          log.debug('appium for bebe port:', port.appiumPort, port.bpPort)
          appiumForBebePort = port.appiumPort
          appiumBebeBPPort = port.bpPort
        })
    })
    .then(function () {
      //启动appium hybrid support
      log.debug('start appium for hybrid. path:'+appiumHybridSupportPath)
      return startAppium(appiumHybridSupportPath, appiumForBebePort+2, appiumHybridSupportLogPath)
        .then(function (port) {
          log.debug('appium for hybrid port:', port.appiumPort, port.bpPort)
          appiumHybridSupportPort = port.appiumPort
          appiumHyBPPort = port.bpPort
        })
    })*/
    .then(function () {
      log.debug('wake up phone after install apk')
      return testutil.wakeUpPhone(serial, adb, log)
        .then(function () {
          log.debug('send key event home')
          return testutil.sendKeyEvent(serial, adb, 'KEYCODE_HOME', log)
        })
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
      execSync('python '+setConfigFilePath+' '+args+' '+cfgPath + ' appium')

      //修改项目配置文件report属性
      args = 'reportFormal:XMLReport'
      execSync('python '+setConfigFilePath+' '+args+' '+cfgPath + ' report')

      //修改项目配置文件runtest属性
      args = 'cases:' + testCaseRunArgs
      return execSync('python '+setConfigFilePath+' '+args+' '+cfgPath + ' runtest')

    })
    .then(function () {
      //启动测试用例
      log.debug('Begin to execute the test case')
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
          log.debug('test cases run stderr log:', err.toString())
        })

        runTest.on('exit', function () {
          log.debug('run test exit')
          resolve('')
        })
        /*exec('python ' + performCaseFileName + ' ' + serial, {cwd:srcPath}, function (err, stdout, stderr) {
          resolve('')
        })*/

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
            return resolve('')
          }

          var parseResult = parsereport(reportPath)
          rpldata.cases = parseResult.cases
          rpldata.starttime = parseResult.starttime
          rpldata.endtime = parseResult.endtime

          log.error('mv report stderr: ', stderr)
          resolve('')
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
          if(rpldata.cases.length > casesIndex){
            rpldata.cases[casesIndex].screenCaps = []
            var caseName = rpldata.cases[casesIndex].name
            var nameArr = caseName.split('.')
            var reportScreenPath = reportPath + 'screenshot/'
            exec('ls |grep ' + nameArr[nameArr.length-1], {cwd:reportScreenPath}, function (err, stdout, stderr) {
              if(stdout) {
                stdout.toString().trim().split(/\s+|\n/).forEach(function (screenName) {
                  if(screenName.length > 0){
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
      rpldata.status = 'fail'
      rpldata.statusCode = 5
    })
    .finally(function () {

      testutil.killAndroidProceBypkg(adb, serial, 'uiautomator', log)
      /*clearAppium(appiumForBebePort)
        .then(function () {
          return clearAppium(appiumHybridSupportPort)
        })
        .then(function () {
          return releaseForwardPort(appiumBebeBPPort)
        })
        .then(function () {
          return releaseForwardPort(appiumHyBPPort)
        })
        .then(function () {
          sshExec.dispose()
        })*/

      clearAppium(appiumPort)
        .then(function () {
          return releaseForwardPort(appiumBpPort)
        })
        .then(function () {
          return releaseForwardPort(appiumTpPort)
        })
        .then(function () {
          sshExec.dispose()
        })


      /*log.debug('uninstall apk. pkg:', pkg)
      adb.uninstall(serial, pkg)
      log.debug('uninstall testbundle')
      adb.uninstall(serial, testBundlePkg)*/
      // execSync('mv ' + appiumForBebeLogRPath + ' ' + appiumForBebeLogPath)
      // execSync('mv ' + appiumHybridSupportLogRPath + ' ' + appiumHybridSupportLogPath)
      // exec('rm -r ' + remotePath)

      dbapi.saveTaskStatus(taskid, rpldata)
      callback(taskid, serial)
    })

  function sshConnect() {
    return sshExec.connect(sshOptions)
      .then(function () {
        return sshExec.execCommand('ls')
      })

  }

  function startAppium(path, p, lPath, apppkg, appactivity) {

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
          var cmd = util.format('node %s -p %s -U %s -bp %s -tp %s', appiumPath, aPort, serial, bpPort, tpPort)
          if(pkg){
            cmd = util.format('%s --app-pkg %s --app-activity %s', cmd, pkg, activity)
          }

          log.debug('statr appium cmd:' + cmd)

          sshExec.execCmdStream(cmd)
            .then(function (startAppiumStream) {
              var callB = true
              var successStartRegExp = new RegExp('Appium REST http interface listener started on.*', 'i')
              var failStartRegExp = new RegExp('Could not start.*port may already be in use', 'i')
              startAppiumStream.setEncoding('utf-8')
              startAppiumStream.on('data', function (data) {
                fs.appendFile(logPath, data)

                if(callB && successStartRegExp.test(data)){
                  callB = false
                  cb(aPort, bpPort, tpPort)
                }

              })
              startAppiumStream.on('error', function (err) {
                fs.appendFile(logPath, 'error++++'+err)
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
                  fs.appendFile(logPath, 'stderr++++'+data)

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
                  fs.appendFile(logPath, 'warn++++'+data)

                  if(callB){
                    callB = false
                    cb(aPort, bpPort, tpPort)
                  }
                }
              })
            })

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
    var tryAgain = (tryA==null ? false:tryA)
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

}
