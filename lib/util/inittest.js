/**
 * Created by GuixiangGui on 2016/12/13.
 */

var Promise = require('bluebird')
var adbkit = require('adbkit')
var exec = require('child_process').exec
var testutil = require('./testutil')
var logger = require('./logger')

var inittest = module.exports = Object.create(null)

inittest.init = function (taskid, serial, adb, options) {
  var log = logger.createLogger('%s:%s:testinit', taskid, serial)
  return new Promise(function (resolve, reject) {
    testutil.befortest(serial, adb, log)
      .then(function () {
        log.debug('kill monkey process')
        return testutil.killAndroidProceBypkg(adb, serial, 'com.android.commands.monkey', log)
      })
      .then(function () {
        log.debug('uninstall pkg: ', options.pkg)
        adb.uninstall(serial, options.pkg)
      })
      .then(function () {
        log.debug('rm monkeyLog')
        exec('rm ' + options.monkeyLog)
        log.debug('rm logcatLog')
        exec('rm ' + options.logcatLog)
        log.debug('rm anrLog')
        exec('rm ' + options.anrLog)
        log.debug('rm cptScreencap')
        exec('rm ' + options.cptScreencapPath + serial + '*')
      })
      .then(function () {
        return testutil.wait(1000*20)
      })
      .catch(function (err) {
        log.error(err, err.stack)
      })
      .finally(function () {
        resolve('')
      })

  })
}
