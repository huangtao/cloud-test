/**
 * Created by GuixiangGui on 2016/10/11.
 */

/*
var Promise = require('bluebird')
var exec =  require('child_process').exec
var fs = require('fs')

var util = require('util')
var path = require('path')
var logger = require('../../../../../util/logger')

module.exports = function(file) {
  var log = logger.createLogger('storage:plugins:apk:aaptParseAPK')
  var resolver = Promise.defer()

  process.nextTick(function() {
    try {
      var filepath = file.path
      var apkinfo
      var command = 'aapt d badging ' + filepath

      fs.stat(filepath, function (err, stat) {
        if(stat && stat.isFile()){
          exec(command, function (err, stdout, stderr) {
            getApkInfo(err, stdout, stderr)
          })
        }
      })

      function getApkInfo (err, stdout, stderr) {

        if(err !== null){
          log.error('exec error: ' + err)
          return
        }

        var str = stdout.toString()
        var packageNameAnalysis1 = String(str.match(/name='.*'\s*versionCode/))
        var packageNameAnalysis2 = String(packageNameAnalysis1.match(/'.*'/))
        var packageName = packageNameAnalysis2.substring(1, packageNameAnalysis2.indexOf("'", 1))
        apkinfo.package = packageName
        var versionNameAnalysis1 = String(str.match(/versionName='.*'\s*platformBuildVersionName/))
        var versionNameAnalysis2 = String(versionNameAnalysis1.match(/'.*'/))
        var versionName = versionNameAnalysis2.substr(1, versionNameAnalysis2.indexOf("'", 1))
        apkinfo.versionName = versionName
        var applicationLabelAnalysis1 = String(str.match(/application-label:'.*'/))
        var applicationLabelAnalysis2 = String(applicationLabelAnalysis1.match(/'.*'/))
        var appName = applicationLabelAnalysis2.substring(1, applicationLabelAnalysis2.indexOf("'", 1))
        apkinfo.appName = appName
        var launchableActivityAnalysis1 = String(str.match(/launchable-activity: name='.*'\s*label/))
        var launchableActivityAnalysis2 = String(launchableActivityAnalysis1.match(/'.*'/))
        var launchActivity = launchableActivityAnalysis2.substring(1, launchableActivityAnalysis2.indexOf("'", 1))
        apkinfo.launchActivity = launchActivity
        dbapi.saveApkinfo(apkinfo)
        resolver.resolve(apkinfo)

      }

    }
    catch (err) {
      resolver.reject(err)
    }
  })

  return resolver.promise
}
*/


var exec =  require('child_process').exec
var execSync = require('child_process').execSync
var fs = require('fs')
var path = require('path')

var util = require('util')
var path = require('path')
var dbapi = require('../../../../../db/api')
// var manifest = require('./manifest')
var logger = require('../../../../../util/logger')
// var logger = require('../../../../../util/logger')

module.exports = function (file, fileInfo) {
  var log = logger.createLogger('storage:plugins:apk:aaptParseAPK')
  var filepath = file.path
  var apkinfo = fileInfo
  var command = 'aapt d --include-meta-data badging "' + filepath +'"'
  var appiconpath = file.path + '.png'
  var apkdir = '/var/stf/file/apk/'


  apkinfo.committime = new Date()


  fs.stat(filepath, function (err, stat) {
    if(stat && stat.isFile()){
      exec(command, function (err, stdout, stderr) {
        getApkInfo(err, stdout, stderr)
      })
    }
  })

  function getApkInfo (err, stdout, stderr) {

      if(err !== null){
        log.error('exec error: ' + err)
        return
      }

      var str = stdout.toString()
      var packageNameAnalysis1 = String(str.match(/name='.*'\s*versionCode/))
      var packageNameAnalysis2 = String(packageNameAnalysis1.match(/'.*'/))
      var packageName = packageNameAnalysis2.substring(1, packageNameAnalysis2.indexOf("'", 1))
      apkinfo.package = packageName
      var versionNameAnalysis1 = String(str.match(/versionName='.*'\s*platformBuildVersionName/))
      var versionNameAnalysis2 = String(versionNameAnalysis1.match(/'.*'/))
      var versionName = versionNameAnalysis2.substring(1, versionNameAnalysis2.indexOf("'", 1))
      apkinfo.versionName = versionName
      var versionCodeAnalysis1 = String(str.match(/versionCode='.*'\s*versionName/))
      var versionCodeAnalysis2 = String(versionCodeAnalysis1.match(/'.*'/))
      var versionCode = versionCodeAnalysis2.substring(1, versionCodeAnalysis2.indexOf("'", 1))
      apkinfo.versionCode = versionCode
      var applicationLabelAnalysis1 = String(str.match(/application-label:'.*'/))
      var applicationLabelAnalysis2 = String(applicationLabelAnalysis1.match(/'.*'/))
      var appName = applicationLabelAnalysis2.substring(1, applicationLabelAnalysis2.indexOf("'", 1))
      apkinfo.appName = appName
      var launchableActivityAnalysis1 = String(str.match(/launchable-activity: name='.*'\s*label/))
      var launchableActivityAnalysis2 = String(launchableActivityAnalysis1.match(/'.*'/))
      var launchActivity = launchableActivityAnalysis2.substring(1, launchableActivityAnalysis2.indexOf("'", 1))
      apkinfo.launchActivity = launchActivity
      var appidAnalysis1 = String(str.match(/meta-data: name='CHANNEL' value='appid.*'/))
      var appidAnalysis2 = String(appidAnalysis1.match(/appid=.*;/))
      var appid = String(appidAnalysis2.match(/\d+/))
      apkinfo.appid = appid
      var iconAnalysis1 = String(str.match(/application: label.*icon='.*'/))
      var iconAnalysis2 = String(iconAnalysis1.match(/icon='.*'/))
      // var iconAnalysis3 = String(iconAnalysis2.match(/'.*'/))
      var iconpath = iconAnalysis2.substring(6,iconAnalysis2.indexOf("'",6))
      log.debug('iconpath :', iconpath)
      if(iconpath.length>0){
        apkinfo.appiconpath = appiconpath
        var unzipcommand = 'unzip -j "'+ filepath+'" ' + iconpath + ' -d ' + apkdir
        log.debug('unzipcommand : ', unzipcommand)
        fs.stat(apkdir + path.basename(iconpath), function (err, stat) {
          if(stat){
            execSync('rm ' + apkdir + path.basename(iconpath))
          }
          exec(unzipcommand, function (err, stdout, stderr) {
            log.debug('unzipcommand finish ', stdout)
            var renameiconcommand = 'mv ' + apkdir + path.basename(iconpath) + ' ' +appiconpath
            log.debug('renameiconcommand:', renameiconcommand)
            exec(renameiconcommand)
          })
        })

      }


      dbapi.saveApkinfo(apkinfo)

  }
}
