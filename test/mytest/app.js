var express = require('express');
var app = express();

var fileutil = require('../../lib/util/fileutil')
var dbapi = require('../../lib/db/apiv2')
var multiparty = require('multiparty');
var util = require('util');
var fs = require('fs');
var crypto = require('crypto');
var logger = require('../../lib/util/logger')
var uuid = require('node-uuid')
var log = logger.createLogger('fileutil')
var uitest = require('../../lib/units/autoui')

/* 上传页面 */
app.get('/', function(req, res, next) {
    res.sendFile( __dirname + "/" + "index.html" );
});

/* 上传*/
app.post('/file/uploading', function(req, res, next){

  var apkDir = '/var/stf/file/apk/'
  var projectName = '四川棋牌'

  //生成multiparty对象，并配置打包平台的上传目标路径
  var form = new multiparty.Form({ uploadDir: apkDir });

  new Promise(function (resolve, reject) {
    //上传完成后处理
    form.parse(req, function (err, fields, files) {
	  

	  log.info(fields)

	  projectName = 'projectName' in fields ? fields.projectName[0] : projectName

      var filesTmp = JSON.stringify(files, null, 2);
      if (err) {
        reject(err)
      } else {
        var inputFile = files.file[0]
        // 真实的文件名
        var fileName = inputFile.originalFilename
        // 临时文件全路径
        resolve({ temFilePath: inputFile.path, fileName: fileName })
      }
    })
  }).then(function (file) {
    // 做个md5
    return new Promise(function (resolve, reject) {
      var rs = fs.createReadStream(file.temFilePath)
      var hash = crypto.createHash('md5')
      rs.on('data', hash.update.bind(hash))
      rs.on('end', function () {
        file.md5 = hash.digest('hex')
        resolve(file)
      })
    })
  }).then(function (file) {
    // 看一下存放apk的目录下有没有同样的apk
    var targetApkPath = fileutil.join(apkDir, 'pack_' + file.md5)
    if (!fileutil.exists(targetApkPath)) {
      // 不存在，则把临时目录移动到apk目录
      fileutil.rename(file.temFilePath, targetApkPath)
    }

    // 把临时文件删除
    fs.unlinkSync(file.temFilePath)
    delete file.temFilePath

    file.filePath = targetApkPath
    return file
  }).then(function (file) {
    // 解析apk
    return fileutil.parseApk(file)

  }).then(function (file) {
    // 重打包
    //return fileutil.repack(file)
	return file

  }).then(function (file) {

    delete file.md5
    file.href = file.fileName

    // 存入数据库
	log.info(file)
    //return dbapi.insertApk(file)

  }).then(function(result) {
	log.info(projectName)
/*
    var fileID = result.generated_keys[0]
    var data = {
      body: {},
      user: {}
    }
    data.body.fileId = fileID
    data.user.email = 'pack_platform@boyaa.com'
    data.user.name = 'pack_platform'
    data.body.projectName = '四川棋牌'
    data.body.testEnv = 0
    data.body.version = '1500'
    data.body.memo = '【打包平台】'

    data.body.cases = ['015c7f22dd423738fa15cd9741fa24ed']
    data.body.serials = ['7N2SQL151D028589', 'YHZTGAZ5YLTKCM8L']
    data.body.account = ''

    var taskid = new Date().getTime() + '_' + 'pack_platform'
    uitest(data, taskid)*/

    res.json({
      result: true,
      message: 'success'
    })

  }).catch(function (err) {

    res.json({
      result: false,
      message: err
    })

  })


});

var server = app.listen(8081, function () {

    var host = server.address().address
    var port = server.address().port

    console.log("应用实例，访问地址为 http://%s:%s", host, port)

})
