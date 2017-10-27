var fs = require('fs')
var path = require('path')
var exec = require('child_process').exec
var logger = require('./logger')
var log = logger.createLogger('fileutil')
var chokidar = require('chokidar')
var ejs = require('ejs')
var DOMParser = require('xmldom').DOMParser
var spawn = require('child_process').spawn

var watcher = null

/*
 返回dir目录下所有文件
 */
module.exports.list = function (directory) {
  var filePath = [];
  fs.readdirSync(directory).forEach(function (file) {
    filePath.push({fileName: file, mtime: fs.statSync(path.join(directory, file)).mtime});
  });
  return filePath;
}

module.exports.join = function () {
  var result = arguments[0]
  for (var i = 1; i < arguments.length; i++) {
    result = path.join(result, arguments[i])
  }
  return result
}

module.exports.exists = function (path) {
  return fs.existsSync(path)
}

module.exports.test = function() {
 return global.time
}

ready = false
module.exports.watch = function (dbapi) {

  // 文件新增时
  function addFileListener(path_) {
    if (ready) {
      if (path.extname(path_) == '.py') {
        log.info('File', path_, 'has been added')
        var command = 'python /var/stf/vendor/scancase/main.py ' + path_
        log.info('mmmmmmmmmmmmmmmmm', command)
        exec(command, function (err, stdout, stderr) {
          var data = JSON.parse(stdout)
          if (data.length) {
            global.is_operating_db = true
            dbapi.saveCase(data).then(function () {
              log.info('cases inserted')
              global.is_operating_db = false
            })
          }
        })
      }
    }
  }

  function addDirecotryListener(path_) {
    if (ready) {
      log.info('Directory', path_, 'has been added')
    }
  }

  function fileChangeListener(path_) {
    if (path.extname(path_) == '.py') { 
        log.info('File', path_, 'has been changed')
        var command = 'python /var/stf/vendor/scancase/main.py ' + path_
        log.info('mmmmmmmmmmmmmmmmm', command)
        exec(command, function (err, stdout, stderr) {
	    var data = JSON.parse(stdout)
	    if(data.length) {
          	global.is_operating_db = true
          	dbapi.deleteCase({local_path: path_}).then(function () {
            		dbapi.updateOrInsert(data).then(function (results) {
              			global.is_operating_db = false
              			log.info('update or insert success')
            		})
          	})
	     }
         })
    }
  }

// 删除文件时，需要把文件里所有的用例删掉
  // 删除文件时，需要把文件里所有的用例删掉
  function fileRemovedListener(path_) {
    if (path.extname(path_) == '.py') {
      log.info('File', path_, 'has been removed')
      global.is_operating_db = true
      dbapi.deleteCase({local_path: path_}).then(function () {
        global.is_operating_db = false
      })
    }
  }

  function directoryRemovedListener(path_) {
    var path_ = path_.replace(/\\/g, '/')
    log.info('Directory', path_, 'has been removed')
    global.is_operating_db = true
    dbapi.deleteCase(function (data) {
      return data('local_path').match('^' + path_)
    }).then(function () {
      global.is_operating_db = false
    })
  }

  if (!watcher) {
    watcher = chokidar.watch('/var/stf/testproject2')
  }
  watcher
    .on('add', addFileListener)
    .on('addDir', addDirecotryListener)
    .on('change', fileChangeListener)
    .on('unlink', fileRemovedListener)
    .on('unlinkDir', directoryRemovedListener)
    .on('error', function (error) {
      log.info('Error happened', error);
    })
    .on('ready', function () {
      log.info('Initial scan complete. Ready for changes.');
      ready = true
    })
}

module.exports.copy = function(src, dst) {

  function _copy(_src, _dst) {
    // 本身就是文件
	if (!fs.existsSync(_src)) {
		return 1
	}
    if (fs.statSync(_src).isFile()) {
      var srcContent = fs.readFileSync(_src, 'binary')
      if (fs.statSync(_dst).isDirectory()) {
        fs.writeFileSync(path.join(_dst, path.basename(_src)), srcContent, 'binary')
      }
      else {
        fs.writeFileSync(_dst, srcContent, 'binary')
      }
    }
    else {
      var srcfiles = fs.readdirSync(_src)
      for (var i = 0; i < srcfiles.length; i++) {
        // 是文件
        if (fs.statSync(_src + '/' + srcfiles[i]).isFile()) {
          // 用管道会有close事件回调
          // // 创建读取流
          // var readable = fs.createReadStream(_src + '/' + srcfiles[i]);
          // // 创建写入流
          // var writable = fs.createWriteStream(_dst + '/' + srcfiles[i]);
          // // 通过管道来传输流
          // readable.pipe(writable);
	  var srcContent = fs.readFileSync(_src + '/' + srcfiles[i], 'binary')
          fs.writeFileSync(_dst + '/' + srcfiles[i], srcContent, 'binary')
        }
        // 是目录
        else {
          // 在dst创建目录
          if (!fs.existsSync(_dst + '/' + srcfiles[i])) {
            fs.mkdirSync(_dst + '/' + srcfiles[i])
          }
          _copy(_src + '/' + srcfiles[i], _dst + '/' + srcfiles[i])
        }
      }
    }
  }
  _copy(src, dst)
}

module.exports.render = function(srcTemplate, dst, obj) {
  var sourceTemplate = fs.readFileSync(srcTemplate, 'utf8')
  var ret = ejs.render(sourceTemplate, obj)
  fs.writeFileSync(dst, ret, {encoding: 'utf8'})
}

module.exports.basename = function(src) {
  return path.basename(src)
}

module.exports.dirname = function(src) {
  return path.dirname(src)
}

module.exports.parsexmlforresult = function (xmlPath) {
  if (!fs.existsSync(xmlPath)) {
    return null
  }
  var reportdoc = new DOMParser().parseFromString(fs.readFileSync(xmlPath, { encoding: 'utf8' }))
  if (reportdoc) {
  var test = reportdoc.getElementsByTagName('TEST')
  if (test.length) {
    test = test[0]
  }
  if (test) {
    return test.getAttribute('result')
  }
}
return 'False'
}



module.exports.parseApk = function (file) {

  var apkPath = file.filePath
  var command = 'aapt d badging "' + apkPath + '"'

  return new Promise(function (resolve, reject) {
    fs.stat(apkPath, function (err, stat) {
      if (stat && stat.isFile()) {
        exec(command, function (err, stdout, stderr) {
          if (err) {
            reject('parse error')
          }
          file.committime = new Date()

          var str = stdout.toString()
          var packageNameAnalysis1 = String(str.match(/name='.*'\s*versionCode/))
          var packageNameAnalysis2 = String(packageNameAnalysis1.match(/'.*'/))
          var packageName = packageNameAnalysis2.substring(1, packageNameAnalysis2.indexOf("'", 1))
          file.package = packageName

          var versionNameAnalysis1 = String(str.match(/versionName='.*'\s*platformBuildVersionName/))
          var versionNameAnalysis2 = String(versionNameAnalysis1.match(/'.*'/))
          var versionName = versionNameAnalysis2.substring(1, versionNameAnalysis2.indexOf("'", 1))
          file.versionName = versionName

          var versionCodeAnalysis1 = String(str.match(/versionCode='.*'\s*versionName/))
          var versionCodeAnalysis2 = String(versionCodeAnalysis1.match(/'.*'/))
          var versionCode = versionCodeAnalysis2.substring(1, versionCodeAnalysis2.indexOf("'", 1))
          file.versionCode = versionCode


          var applicationLabelAnalysis1 = String(str.match(/application-label:'.*'/))
          var applicationLabelAnalysis2 = String(applicationLabelAnalysis1.match(/'.*'/))
          var appName = applicationLabelAnalysis2.substring(1, applicationLabelAnalysis2.indexOf("'", 1))
          file.appName = appName

          var launchableActivityAnalysis1 = String(str.match(/launchable-activity: name='.*'\s*label/))
          var launchableActivityAnalysis2 = String(launchableActivityAnalysis1.match(/'.*'/))
          var launchActivity = launchableActivityAnalysis2.substring(1, launchableActivityAnalysis2.indexOf("'", 1))
          file.launchActivity = launchActivity

          var iconAnalysis1 = String(str.match(/application: label.*icon='.*'/))
          var iconAnalysis2 = String(iconAnalysis1.match(/icon='.*'/))
          // var iconAnalysis3 = String(iconAnalysis2.match(/'.*'/))
          var iconpath = iconAnalysis2.substring(6, iconAnalysis2.indexOf("'", 6))


          log.debug('iconpath :', iconpath)
          if (iconpath.length > 0) {

            file.appiconpath = apkPath + '.png'

            var iconRandomName = new Date().getTime() + ''
            var iconPath = path.join(path.dirname(apkPath), iconRandomName)

            // 提取icon
            var unzipcommand = 'unzip -j "' + apkPath + '" ' + iconpath + ' -d ' + iconPath
            log.debug('unzipcommand : ', unzipcommand)

            fs.stat(iconPath, function (err, stat_) {
              if (stat_) {
                execSync('rm -rf' + iconPath)
              }
              exec(unzipcommand, function (err, stdout, stderr) {
                log.debug('unzipcommand finish ', stdout)
                fs.renameSync(path.join(iconPath, path.basename(iconpath)), file.appiconpath)

                resolve(file)
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

module.exports.rename = function (oldPath, newPath) {
  fs.renameSync(oldPath, newPath)
}


module.exports.repack = function (file) {

  var repack = '/var/stf/vendor/RainbowRepacker/src/entry.py'
  var apkPath = file.filePath
  var dir = path.join(path.dirname(apkPath), file.md5)
  log.info("apk path: ", apkPath)
  log.info("dir path: ", dir)
  return new Promise(function (resolve, reject) {
	log.info('python', ' ', repack, ' ', apkPath, ' ', dir)
    var p = spawn('python', [repack, apkPath, dir])
    p.stdout.on('data', function (data) {
      log.info(data.toString())
    })
    p.on('exit', function (code, signal) {
      log.info('repack ----------------------- finished' + code)
      if (code == 0) {
        var apkRepack = path.join(dir, 'autotest_' + path.basename(apkPath))
        var testbundlePath = path.join(dir, 'testbundle', 'testbundle.apk')
        file.apkDecompilePath = apkRepack
        file.testbundlePath = testbundlePath
        resolve(file)
      }
      else {
        resolve(null)
      }
    })
  })

}

module.exports.mkdirs = function(p) {

  if (fs.existsSync(p)) {
    return 1
  }
  _createUpperDirectory(path.dirname(p))
  fs.mkdirSync(p)
  function _createUpperDirectory(_p) {
    if (fs.existsSync(_p)) {
      return
    }
    _createUpperDirectory(path.dirname(_p))
    fs.mkdirSync(_p)
  }
}