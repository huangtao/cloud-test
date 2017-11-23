/**
 * Created by GuixiangGui on 2016/9/8.
 */

var dbapi = require('../../db/api')
var monkeyTest = require('../monkey/test')
var Promise = require('bluebird')
var logger = require('../../util/logger')
var util = require('util')
var emailNotiecs = require('../emailNotiecs')
var report = require('../report')
var activityTest = require('../activity/test')
var uiAutoTest = require('../autoui/test')
var node_ssh = require('node-ssh')
var fs = require('fs')
var path = require('path')
var installTask = require('./installTask')
var pullScreenTask = require('./pullScreenTask')
var fork = require('child_process').fork
var exec = require('child_process').exec
var testUtil = require('../../util/testutil')

module.exports = function () {
  var log = logger.createLogger('taskManager')
  var cleanArr = new Array()
  var cleanInterval
  var isPlanRunning = false
  var isCleanPlanRunning = false
  var ssh = new node_ssh()
  var subServerHostFile = path.resolve(__dirname, '../../../subServerHost.conf')
  var monkeyTestFile = path.resolve(__dirname, '../monkey/testProcess.js')
  var activityTestFile = path.resolve(__dirname, '../activity/testProcess.js')
  var uiAutoTestFile = path.resolve(__dirname, '../autoui/testProcess.js')
  var performanceTestFile = path.resolve(__dirname, '../performance/testProcess.js')

  log.debug('sub server host file path:', subServerHostFile)
  fs.readFile(subServerHostFile, function (err, data) {
    var hostList
    if(data && data.length>0){
      hostList = data.toString().trim().split('\n')
    }
     
    initSubServer(hostList, function () {
      var localDate = new Date().toLocaleDateString()
      var nowDate
      setInterval(function () {
        if(!isPlanRunning){
          isPlanRunning = true
          plan()
        }
        nowDate = new Date().toLocaleDateString()
        console.log('localDate:'+localDate)
        console.log('nowDate:'+nowDate)
        if(localDate != nowDate){
          exec('cp test.log test' + localDate + '.log', {cwd:'/var/stf/log'}, function(err, stdout, stderr){
            exec('echo "">test.log', {cwd:'/var/stf/log'}, function(err, stdout, stderr){})
            localDate = nowDate
          })
        }

      },1000*60*2)
    })
  })

  function plan() {
    log.debug('task plan start')
    var taskArr = new Array()
    dbapi.loadFreeDevices()
      .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function(list) {
            var freeSerials=[]
            list.forEach(function(serial) {
              freeSerials.push(serial)
            })
            log.debug('free serials ', freeSerials)
            return freeSerials

          })
          .then(function (freeSerials) {
            dbapi.loaddevicetaskstatus()
              .then(function (cursor) {
                return Promise.promisify(cursor.toArray, cursor)()
                  .then(function (tasks) {
                    var pro = new Array()
                    if(tasks){
                      freeSerials.forEach(function (serial) {
                        for(var i=0;i<tasks.length;i++) {
                          if(tasks[i].serials.indexOf(serial)!=-1){

                            pro.push(taskArrPush(serial, tasks[i]))
                            // test(tasks[i], serial)
                            break
                          }
                        }
                      })
                    }

                    return Promise.all(pro)

                    function taskArrPush(serial, task) {
                      return new Promise(function (resolve, reject) {
                        dbapi.setDeviceOwner(serial,{name: 'waitTask'})
                          .then(function(){
                            taskArr.push({task:task, serial:serial})
                            var cmd = util.format('ps -ef|grep testProcess|grep %s|grep -v grep', serial)
                            exec(cmd, function (err, stdout, stderr) {
                              if(err){
                                log.debug('cmd failed ', cmd)
                                resolve('')
                              }
                              if(stdout.length>0){
                                stdout.split(/\n/).forEach(function (data) {
                                  exec('kill -9 ' + data.split(/\s+/)[1], function(){
                                    resolve('')
                                  })
                                })
                              }
                            })
                            
                          })
                      })

                    }
                  })
                  .then(function () {
                    return new Promise(function (resolve, reject) {
                      if(taskArr.length > 0){
                        var testInterval = setInterval(function () {
                          var taskInfo = taskArr.shift()
                          test(taskInfo.task, taskInfo.serial)
                          if(taskArr.length == 0){
                            clearInterval(testInterval)
                            resolve('')
                          }
                        }, 1000*10)
                      }else{
                        resolve('')
                      }
                    })
                  })
                  .then(function () {
                    isPlanRunning = false
                  })
              })
          })
      })
      .catch(function(err) {
        isPlanRunning = false
        log.error('Failed to load device list: ', err.stack)
      })
  }


  function cleanplan() {
    isCleanPlanRunning = true
    if(cleanArr.length > 0){
      var taskid = cleanArr[0].taskid
      var serial = cleanArr[0].serial
      return dbapi.loaddevicetaskserial(taskid)
        .then(function (serials) {
          log.debug('befor clean plan ', taskid, serials)
          log.debug('delete task serial ', taskid, serial)
          if(serials && serials.length > 0){
            serials.splice(serials.indexOf(serial),1)
            log.debug('after clean plan ', taskid, serials)

            if(serials.length>0){
              var newdata = {serials:serials}
              dbapi.updatedevicetaskStatus(taskid,newdata)
                .then(function(){
                  log.debug('Release %s:%s', taskid,serial)
                  dbapi.unsetDeviceOwner(serial)
                    .then(clearArray)
                })
            }
            else{
              dbapi.removedevicetask(taskid)
                .then(function () {
                  return dbapi.updateTaskReport(taskid,{allstatus:'finish'})
                    .then(function () {
                      log.debug('Release %s:%s', taskid,serial)
                      dbapi.unsetDeviceOwner(serial)
                        .then(clearArray)
                    })
                })

              var cmd = util.format('ps -ef|grep %s|grep -v grep', taskid)
              exec(cmd, function (err, stdout, stderr) {
                if(err){
                  log.debug('cmd failed ', cmd)
                }
                if(stdout.length>0){
                  stdout.split(/\n/).forEach(function (data) {
                    exec('kill ' + data.split(/\s+/)[1])
                  })
                }
              })

              report(taskid, null, dbapi, function () {
                log.info('%s pack finish', taskid)
              })
              emailNotiecs(taskid)
            }
          }


        })

        .catch(function (err) {
          log.debug('loaddevicetaskserial err :', err)
          if(/non-object non-sequence.*null/.test(err)){
            dbapi.unsetDeviceOwner(serial)
              .then(clearArray)
            log.debug('loaddevicetaskserial null clear task serial :', taskid,serial)
          }
        })
    }else{
      isCleanPlanRunning = false
      /*clearInterval(cleanInterval)
      cleanInterval = null*/
    }

    function clearArray(){
      log.debug('clear %s %s', cleanArr[0].taskid, cleanArr[0].serial)
      cleanArr.shift()
      cleanplan()
    }

  }

  function test(task, serial) {
    var testType = 'monkey'
    if(task.testType){
      testType = task.testType
    }
    dbapi.setDeviceOwner(serial,{name: testType, taskid:task.taskid})
      .then(function(){
        return dbapi.loadDevice(serial)
      })
      .then(function (device) {
        var data = task.options
        data.cases = task.cases
        data.accountFilePath = task.accountFilePath
        data.testEnv = task.testEnv
        data.moduleId = task.moduleId
        data.deviceInfo = util.format('%s , %s , %s',device.manufacturer,device.model,device.version)
        data.model = device.model
        data.manufacturer = device.manufacturer
        data.markName = device.markName
        data.serial = device.serial
        data.host = device.provider.name
        data.resolutionHW = util.format('%s*%s', device.display.height, device.display.width)
        data.resolutionWH = util.format('%sx%s', device.display.width, device.display.height)

        switch (testType){
          case 'monkey':
            startMonkeyTest()
            // monkeyTest(data, task.taskid, dbapi, testFinish)
            break
          case 'activityTest':
            startActivityTest()
            break
          case 'uiTest':
          case 'travelTest':
            startUiAutoTest()
            break
          case 'performTest':
            startPerformanceTest()
            break
          default:
            testFinish(task.taskid, device.serial)

          function startMonkeyTest() {
            var mLog = logger.createLogger('test:' + task.taskid + ':' + serial)
            mLog.debug('monkey test', task.taskid)
            forkTest(monkeyTestFile, 'monkeyTest', mLog)
          }

          function startActivityTest() {
            var mLog = logger.createLogger('activityTest:' + task.taskid + ':' + serial)
            mLog.debug('activity test')
            forkTest(activityTestFile, 'actitityTest', mLog)
          }

          function startUiAutoTest() {
            var mLog = logger.createLogger('uiAutoTest:' + task.taskid + ':' + serial)
            mLog.debug('ui auto test')
            forkTest(uiAutoTestFile, 'uiAutoTest', mLog)
          }

          function startPerformanceTest() {
            var mLog = logger.createLogger('performanceTest:' + task.taskid + ':' + serial)
            mLog.debug('performance test')
            forkTest(performanceTestFile, 'performanceTest', mLog)
          }

          function forkTest(testFile,testType, mLog) {
            var child = fork(testFile, [task.taskid, serial, testType])
            testUtil.createadb({host:data.host})
              .then(function (client) {
                child.on('close', function(){
                  client = null
                  child = null
                  mLog = null
                  dbapi.unsetDeviceOwner(serial)
                })

                child.on('message', function (m) {

                  mLog.debug('get message:', m.task)
                  switch (m.task){
                    case 'install':
                      m.installOption.adb = client
                      m.installOption.log = mLog
                      installTask.pushInstallTask(m.host, m.installOption, function (err, rd) {
                        if(mLog){
                          mLog.debug('install child send:', task.taskid, serial)
                        }
                        if(child){
                          child.send({task:'install', err:err, rd:rd})
                        }                        
                      })
                      break
                    case 'pullScreenCap':
                      mLog.debug('pull screenCap')
                      m.option.adb = client
                      m.option.log = mLog
                      pullScreenTask.pushTask(m.host, m.option, function () {
                        if(mLog){
                          mLog.debug('pull screencap child send:', task.taskid, serial)
                        }
                        if(child){
                          child.send({task:'pullScreenCap'})
                        }
                      })
                      break
                    case 'end':
                      mLog.debug('test finish', m.taskid, m.serial)
                      testFinish(m.taskid, m.serial)
                      client = null
                      child = null
                      mLog = null
                      break
                  }
                })
              })

            child.send({task:'start', optios:data, taskid:task.taskid})
          }

        }

      })
      .catch(function (err) {
        log.debug('setDeviceOwner err:',err.stack)
        dbapi.unsetDeviceOwner(serial)
      })
  }

  function testFinish(taskid, finishserial) {
    log.debug('test finish start')
    cleanArr.push({taskid:taskid, serial:finishserial})
    if(!isCleanPlanRunning){
      cleanplan()
    }

    /*if(!cleanInterval){
      log.debug('clean interval create')
      cleanInterval = setInterval(function () {
        if(!isCleanPlanRunning){
          log.debug('clean plan start')
          cleanplan()
          isCleanPlanRunning = true
        }
      }, 1000*10)
    }*/

  }

  function initSubServer(hostList, cb) {
    log.debug('host list:', hostList)
    if(hostList && hostList.length > 0){
      var host = hostList.pop()
      if(host.length > 0 && !(/^#/.test(host))){
        log.debug('ssh connect start. ', host)
        ssh.connect({username:'root', host:host, password:'boyaa!@#456'})
          .then(function () {
            log.debug('killall node start execute')
            return ssh.execCommand('killall node')
          })
          .then(function () {
            log.debug('adb forward --remove-all start execute')
            return ssh.execCommand('adb forward --remove-all')
          })
          .then(function () {
            return ssh.execCommand('ps -ef|grep adb|grep -v grep|grep -v nodaemon')
          })
          .then(function (result) {
            var killProcesses = []
            if(result.stdout){
              var psDatas = result.stdout.toString().trim().split('\n')
              psDatas.forEach(function (data) {
                var dataArr = data.split(/\s+/)
                if(/adb/i.test(dataArr[7])){
                  killProcesses.push(ssh.execCommand('kill -9 ' + dataArr[1]))
                }
              })
            }
            return Promise.all(killProcesses)
          })
          .catch(function (err) {
            log.debug('ssh error:', err)
          })
          .then(function(){
            ssh.dispose()
            initSubServer(hostList, cb)
          })
      }else{
        initSubServer(hostList, cb)
      }

    }else {
      cb()
    }
  }

}
