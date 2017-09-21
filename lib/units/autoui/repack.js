/*
var path = require('path')
var spawn = require('child_process').spawn
var logger = require('../../util/logger')
var log = logger.createLogger('storage:plugins:apk:repack')
var Promise = require('bluebird')
var repack = '/var/stf/vendor/RainbowRepacker/src/entry.py'

module.exports = function (apkPath, dbapi) {
  log.info("apkPath:", apkPath)

  return new Promise(function (resolve, reject) {
    var p = spawn('python', [repack, apkPath])
    p.stdout.on('data', function (data) {
      log.info(data.toString())
    })
    p.on('exit', function (code, signal) {
      log.info('repack ----------------------- finished' + code)
      if (code == 0) {
        // update
        var apkRepack = path.join(path.dirname(apkPath), 'autotest_' + path.basename(apkPath))
        dbapi.updateApkInfo({filePath: apkPath}, {apkDecompilePath: apkRepack}).then(function (result) {
          resolve(apkRepack)
        })
      }
      else{
        resolve(null)
      }
    })
  })

}

*/

var path = require('path')
var spawn = require('child_process').spawn
var logger = require('../../util/logger')
var log = logger.createLogger('storage:plugins:apk:repack')
var Promise = require('bluebird')
var repack = '/var/stf/vendor/RainbowRepacker/src/entry.py'

module.exports = function (apkPath, dir, dbapi) {
  log.info("apkPath:", apkPath)
  log.info("dir:", dir)
  return new Promise(function (resolve, reject) {
    var p = spawn('python', [repack, apkPath, dir])
    p.stdout.on('data', function (data) {
      log.info(data.toString())
    })
    p.on('exit', function (code, signal) {
      log.info('repack ----------------------- finished' + code)
      if (code == 0) {
        // update
        var apkRepack = path.join(dir, 'autotest_' + path.basename(apkPath))
        var testbundlePath = path.join(dir, 'testbundle', 'testbundle.apk')
        dbapi.updateApkInfo({filePath: apkPath}, {apkDecompilePath: apkRepack, testbundlePath: testbundlePath}).then(function (result) {
          resolve({
            apkDecompilePath: apkRepack,
            testbundlePath: testbundlePath
          })
        })
      }
      else {
        resolve(null)
      }
    })
  })


}


