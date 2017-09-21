var Promise = require('bluebird')
var fs = require('fs')
var path = require('path')

var exec = require('child_process').exec

var logger = require('../../lib/util/logger')
var uuid = require('node-uuid')
var log = logger.createLogger('fileutil')


function parseApk(apkPath) {

var command = 'aapt d badging "' + apkPath + '"'

  return new Promise(function (resolve, reject) {
    fs.stat(apkPath, function (err, stat) {
      if (stat && stat.isFile()) {
        exec(command, function (err, stdout, stderr) {
          if (err) {
            reject('parse error')
          }
          var apkinfo = {}
		          apkinfo.id = uuid.v4()
          apkinfo.committime = new Date()

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

          var iconAnalysis1 = String(str.match(/application: label.*icon='.*'/))
          var iconAnalysis2 = String(iconAnalysis1.match(/icon='.*'/))
          // var iconAnalysis3 = String(iconAnalysis2.match(/'.*'/))
          var iconpath = iconAnalysis2.substring(6, iconAnalysis2.indexOf("'", 6))

var apkdir = path.join(path.dirname(apkPath), apkinfo.id)

          if (!fs.existsSync(apkdir)) {
            fs.mkdirSync(apkdir)
          }

          log.debug('iconpath :', iconpath)
          if (iconpath.length > 0) {

            apkinfo.appiconpath = apkdir + path.basename(iconpath)

            // 提取icon
            var unzipcommand = 'unzip -j "' + apkPath + '" ' + iconpath + ' -d ' + 'test.png'//apkdir
            log.debug('unzipcommand : ', unzipcommand)
			log.debug(apkdir + path.basename(iconpath))	
            fs.stat(apkdir + path.basename(iconpath), function (err, stat_) {

              exec(unzipcommand, function (err, stdout, stderr) {
                log.debug('unzipcommand finish ', stdout)
                resolve(apkinfo)
              })
            })

          }
        })
      }
      else {
        reject(apkPath + ' is not a file')
      }
    })

  })

}

parseApk('/var/stf/test/mytest/test.apk').then(function(apkinfo) {
 log.info(apkinfo)

}).catch(function(err) {

	log.inf('hhhhhhhhhhh')
})
