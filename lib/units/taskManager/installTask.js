/**
 * Created by GuixiangGui on 2017/5/8.
 */

var adbkit = require('adbkit')

var testutil = require('../../util/testutil')

var _this

function installTask() {
  this.installTaskObj = {}
  _this = this
}

installTask.prototype.pushInstallTask = function (host, option, cb) {
  var taskInfo = {option: option, cb: cb}
  if (!this.installTaskObj[host]) {
    this.installTaskObj[host] = {taskRun: false, taskArr: [taskInfo]}
  } else {
    this.installTaskObj[host].taskArr.push(taskInfo)
  }

  if (!this.installTaskObj[host].taskRun) {
    this.installTaskObj[host].taskRun = true
    // runTask(host, this.installTaskObj[host].taskArr.shift())
    run(host)
  }


  function run(host){
    var installTaskFinish = true
    var installLoop = setInterval(function(){
      if(installTaskFinish){
        var taskI= _this.installTaskObj[host].taskArr.shift()
        if(taskI){
          runTask(host, taskI)
        }else{
          _this.installTaskObj[host].taskRun = false
          clearInterval(installLoop)
        }
        
      }
    }, 1000)

    function runTask(host, taskInfo) {
      installTaskFinish = false      
      var adb = taskInfo.option.adb
      var pkg = taskInfo.option.pkg
      var serial = taskInfo.option.serial
      var apkPath = taskInfo.option.apkPath
      var log = taskInfo.option.log
      var rpldata = taskInfo.option.rpldata
      var cb = taskInfo.cb
      var error
  
      testutil.wakeUpPhone(serial, adb, log)
        .then(function () {
          log.debug('start install apk pkg:', pkg)
          adb.install(serial, apkPath)
            .timeout(60000 * 5)
            .catch(function (err) {
              log.debug('install apk failed err:', err)
              if(!err.code){
                rpldata.status = 'fail'
                rpldata.statusCode = 1
                rpldata.result = {errorType: 'install failed', reson: err.toString()}
                return error = err
              }
              err.code = err.code.split(':')[0]
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
                          log.debug('reInstall apk failed 11111. err:', err)
  
                          rpldata.status = 'fail'
                          rpldata.statusCode = 1
                          if (err.code) {
                            rpldata.result = {errorType: 'install failed', reson: err.code}
                          } else {
                            rpldata.result = {errorType: 'install failed', reson: err.toString()}
                          }
  
                          error = err
                        })
                    })
                  break
                case 'INSTALL_CANCELED_BY_USER':
                  return testutil.wakeUpPhone(serial, adb, log)
                    .then(function () {
                      return adb.install(serial, apkPath)
                        .timeout(60000 * 5)
                        .catch(function (err) {
                          log.debug('reInstall apk failed (canceled by user). err:', err)
  
                          rpldata.status = 'fail'
                          rpldata.statusCode = 1
                          if (err.code) {
                            rpldata.result = {errorType: 'install failed', reson: err.code}
                          } else {
                            rpldata.result = {errorType: 'install failed', reson: err.toString()}
                          }
  
                          error = err
                        })
                    })
                  break
                case 'INSTALL_FAILED_ABORTED':
                  return adb.shell(serial, 'pm list package')
                    .then(adbkit.util.readAll)
                    .then(function (output) {
                      var str = output.toString()
                      var pkgRegExp = RegExp(pkg)
                      if (!pkgRegExp.test(str)) {
                        rpldata.status = 'fail'
                        rpldata.statusCode = 1
                        if (err.code) {
                          rpldata.result = {errorType: 'install failed', reson: err.code}
                        } else {
                          rpldata.result = {errorType: 'install failed', reson: err.toString()}
                        }
                        error = err
                      }
                    })
                  break
                case 'INSTALL_FAILED_CONFLICTING_PROVIDER':
                  return adb.shell(serial, 'pm list package')
                    .then(adbkit.util.readAll)
                    .then(function (output) {
                      var platformNeedPkgs = ['com.boyaa.stf.pt', 'com.boyaa.checkjar', 'com.boyaa.checkjar.test', 'com.boyaa.application.testbundle', 'com.boyaa.stf.pmonitor']
                      var pkgList = output.toString().trim().split(/[\r\n]/)
                      var uninstallTaskList = []
                      for (var i = 0; i < pkgList.length; i++) {
                        if (/com.boyaa/i.test(pkgList[i]) && !(/stf/i.test(pkgList[i]))) {
                          log.debug('phone installed boyaa app :', pkgList[i], serial)
                          var pkgName = pkgList[i].split(':')[1]
                          if (platformNeedPkgs.indexOf(pkgName) == -1) {
                            log.debug('uninstall apk ', pkgName)
                            uninstallTaskList.push(uninstallApk(serial, pkgName))
                          }
                        }
                      }
  
                      if(uninstallTaskList.length > 0){
                        return Promise.all(uninstallTaskList)
                      }
  
                      function uninstallApk(s, p) {
                        return new Promise(function (resolve, reject) {
                          log.debug('start uninstall apk :', p)
                          adb.uninstall(s, p)
                            .then(function(output){
                              log.debug('uninstall apk fininsh ', p, output.toString())
                            })
                            .catch(function (err) {
                              log.debug('unninstall apk failed. error:', err, p)
                            })
                            .finally(function () {
                              resolve('')
                            })
                        })
  
                      }
                    })
                    .then(function () {
                      return testutil.wait(1000*10)
                    })
                    .then(function () {
                      return adb.install(serial, apkPath)
                        .timeout(60000 * 5)
                        .catch(function (err) {
                          log.debug('reInstall apk failed (conflicting provider). err:', err)
  
                          rpldata.status = 'fail'
                          rpldata.statusCode = 1
                          if (err.code) {
                            rpldata.result = {errorType: 'install failed', reson: err.code}
                          } else {
                            rpldata.result = {errorType: 'install failed', reson: err.toString()}
                          }
  
                          error = err
                        })
                    })
                  break
                default:
  
                  rpldata.status = 'fail'
                  rpldata.statusCode = 1
                  if (err.code) {
                    rpldata.result = {errorType: 'install failed', reson: err.code}
                  } else {
                    rpldata.result = {errorType: 'install failed', reson: err.toString()}
                  }
  
                  error = err
              }
            })
            .finally(function () {
              cb(error, rpldata)
              installTaskFinish = true 
            })
        })
  
    }
  }



}

module.exports = new installTask()
