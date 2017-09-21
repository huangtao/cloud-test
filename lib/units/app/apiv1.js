var http = require('http')
var url = require('url')
var fs = require('fs')
var path = require('path')
var express = require('express')
var router= express.Router()
//var validator = require('express-validator')
//var cookieSession = require('cookie-session')
//var cookieParser= require('cookie-parser')
var bodyParser = require('body-parser')
var Promise = require('bluebird')
var logger = require('../../util/logger')
var pathutil = require('../../util/pathutil')
var dbapi = require('../../db/api')
var datautil = require('../../util/datautil')
var deallog = require('../../util/deallog')
var updateApkUserInfo = require('../storage/plugins/apk/task/updateApkUserInfo')
//var auth = require('./middleware/auth')
var taskerrorlist = require('../report/taskErrorList')
var monkey = require('../monkey')
var report = require('../report')
var _ = require('lodash')

var markdownServe = require('markdown-serve')

var log = logger.createLogger('apiv1')
var app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

app.use(function (req, res, next) {
 log.info('rquest:%s',req.url)
  next()
})

router.get('/user', function(req, res) {
    //log.info(req.url)
    res.json({
      success: true
    , user: req.user
    })
 })

router.get('/group', function(req, res) {
    log.info(req.url)
    dbapi.loadGroup(req.user.email)
      .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function(list) {
            list.forEach(function(device) {
              datautil.normalize(device, req.user)
            })
            res.json({
              success: true
            , devices: list
            })
          })
      })
      .catch(function(err) {
        log.error('Failed to load group: ', err.stack)
        res.json(500, {
          success: false
        })
      })
  })

router.get('/devices', function(req, res) {
    dbapi.loadDevices()
      .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function(list) {
	  var brand = []
          var os_version = []
          var dpis = []
            list.forEach(function(device) {
            datautil.normalize(device, req.user)

            if (device.brand) {
              brand.push(device.brand)
            }

            if (device.version) {
              os_version.push(device.version)
            }
	    if ('display' in device && 'width' in device.display && 'height' in device.display) {
              dpis.push(device.display.width + 'x' + device.display.height)
	    }
            /*if (device.display.hasOwnProperty(width) && device.display.hasOwnProperty(height)) {
              dpis.push(device.display.width + 'x' + device.display.height)
            }*/

            })

	  brand = datautil.unique(brand).sort()
          os_version = datautil.unique(os_version).sort()
          dpis = datautil.unique(dpis).sort()
            res.json({
              success: true,

	      manufacturer: brand.map(function (m) {
              return {
                label: m,
                value: false
              }
            }),
            os_version: os_version.map(function (o) {
              return {
                label: o,
                value: false
              }
            }),
            width_height: dpis.map(function (d) {
              return {
                label: d,
                value: false
              }
            }),

	      devices: list
            })
          })
      })
      .catch(function(err) {
        log.error('Failed to load device list: ', err.stack)
        res.json(500, {
          success: false
        })
      })
 })

router.post('/devices', function (req, res) {
  var brand = req.body.brand
  var os_version = req.body.osVersion
  var dpis = req.body.dpis
  var free = req.body.free

  dbapi.loadDevices(brand, os_version, dpis, free).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)().then(function (list) {
      list.forEach(function (device) {
        datautil.normalize(device, req.user)
      })
      res.json({
        success: true,
        devices: list
      })
    })
  }).catch(function (err) {
    log.error('Failed to load device list: ', err.stack)
    res.json(500, {
      success: false
    })
  })
})


router.get('/phonemodels',function (req,res) {
    log.info(req.url)
    dbapi.loadPhonemode()
    .then(function(cursor) {
      return Promise.promisify(cursor.toArray, cursor)()
        .then(function(list) {
          var os_versions = []
          var manufacturers = []
          var serials=[]
          list.forEach(function(datas) {
          os_versions.push(datas.version)
          manufacturers.push(datas.manufacturer)
          serials.push(datas.serial)
        })

          var ver = datautil.unique(os_versions)
          var manufa= datautil.unique(manufacturers)

        res.json({
          success: true
          ,os_versions: ver
          ,manufacturers: manufa
        })
      })
    })
    .catch(function(err) {
      log.error('Failed to load phonemodels: ', err.stack)
      res.json(500, {
        success: false
      })
    })
})

router.get('/phonedpis',function (req,res) {
    dbapi.loadPhonedpi()
    .then(function(cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
      .then(function(list) {
        var dpis = []
        list.forEach(function(display) {
              dpis.push(display.width+'*'+display.height)
        })
       // log.info('0x88 %s',datautil.unique(dpis))
        var wandh=datautil.unique(dpis)
        //must be do like this var xx = datautil.unique(xxx)
        res.json({
          success: true
          ,dpis: wandh
        })
      })
    })
    .catch(function(err) {
      log.error('Failed to load device width and height:', err.stack)
      res.json(500, {
        success: false
      })
    })
  })

router.get('/apkinfo',function (req,res) {
    dbapi.loadUserApkinfo()
      .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function(list) {
            var apkinfos = []
            list.forEach(function(info) {
              apkinfos.push(info)
            })
            res.json({
              success: true
            , apkinfo: apkinfos
            })
          })
      })
})

router.post('/updateApkinfo',function(req,res)
  {
    log.info("id is null?",req.body.id)
     if(req.body.id){
      data={
        userName: req.body.userName,
        userEmail: req.body.userEmail,
        projectName: req.body.projectName
      }
      log.info('apkdata',data)
      dbapi.updateApkinfo(req.body.id,data)
      res.status(200)
      .json({success:true})
    }else{
      res.status(200)
      .json({success: false})
    }
})

router.get('/devices/:serial', function(req, res) {
	  log.info(req.url)
    dbapi.loadDevice(req.params.serial)
      .then(function(device) {
        if (device) {
          datautil.normalize(device, req.user)
          res.json({
            success: true
          , device: device
          })
        }
        else {
          res.json(404, {
            success: false
          })
        }
      })
      .catch(function(err) {
        log.error('Failed to load device "%s": ', req.params.serial, err.stack)
        res.json(500, {
          success: false
        })
      })
})

router.get('/accessTokens', function(req, res) {
    log.info(req.url)
    dbapi.loadAccessTokens(req.user.email)
      .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function(list) {
            var titles = []
            list.forEach(function(token) {
              titles.push(token.title)
            })
            res.json({
              success: true
            , titles: titles
            })
          })
      })
      .catch(function(err) {
        log.error('Failed to load tokens: ', err.stack)
        res.json(500, {
          success: false
        })
      })
})

router.post('/notifiedusers', function (req, res) {
    var sendusers
    if(req.body.sendusers){
      sendusers = req.body.sendusers + ',' + req.user.email
    }else{
      sendusers = req.user.email
    }
    var data = {
      taskid: req.body.taskid
      ,sendusers: sendusers
      ,fileID: req.body.fileID
    }
    dbapi.saveSendEmail(data)
    res.status(200)
      .json({success: true})
})

router.post('/monkeytest',function (req,res) {
    log.info('monkeytest-id',req.body.id)
    if(!req.body.id){
      return res.json(400,{
        success:false
       , result:'请上传APK文件'
      })
    }
    log.debug('href not null')
    log.debug(req.body.dpis,req.body.os_versions,req.body.manufacturers)
    log.debug(req.body.dpis.length==0)

    if((req.body.dpis.length==0)&&(req.body.os_versions.length==0)&&(req.body.manufacturers.length==0)){
      return res.json(400,{
        success:false
        , result:'请选择设备'
      })
    }
    var userEmail = req.user.email
    var taskid = new Date().getTime() + '_' + userEmail.split('@')[0]
    monkey(req, taskid)

    return res.json(200, {
      success: true
      ,taskid: taskid
    })
})

router.get('/download/:taskid',function (req,res) {
    var serial=null
    report(req.params.taskid,serial,dbapi, function (reportZip) {
      log.debug('start download ',reportZip)
      res.download(reportZip)
    })
})

router.get('/download/:taskid/:serial',function (req,res) {
    report(req.params.taskid, req.params.serial, dbapi,function (reportZip) {
      log.debug('start download ',reportZip)
      res.download(reportZip)
    })
})

router.get('/loadProject',function(req,res){
    dbapi.loadProject()
      .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function(list) {
            var projectName = []
            list.forEach(function(pn) {
              projectName.push(pn)
            })
            res.json({
              success: true
            , projectName: projectName
            })
        })
    })
})

router.post('/addProject',function(req,res){
    if(req.body.projectName){
      data={
        projectName : req.body.projectName
      }
      dbapi.saveProjectName(data)
      res.status(200)
      .json({success:true})
    }else{
      res.status(200)
      .json({success: false})
    }
})


router.get('/loadTaskdetail/:taskid/:type',function(req,res){
  var type= req.params.type
  if(type == 'monkey'){
     dbapi.loadTaskDetailwithAppName(req.params.taskid)
      .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function(list) {
            var detail = []
            var appLaunchTime = []
            var cpu = []
            var dataflow = []
            var memory = []
            var appName = null
            var versionName= null
            list.forEach(function(dt) {
              detail=dt.detail
              appName = dt.appName
              versionName= dt.versionName
              detail.forEach(function(table){
                appLaunchTime.push(parseInt(table.appLaunchTime))
                cpu.push(parseInt(table.cpu))
                dataflow.push(parseInt(table.dataflow))
                memory.push(parseInt(table.memory))
              })
            })
            res.json({
              success: true
            , avgappLaunchTime: datautil.AvgData(appLaunchTime)
            , cpu : datautil.AvgData(cpu)
            , dataflow: datautil.AvgData(dataflow)
            , memory : datautil.AvgData(memory)
            , appName : appName
            , versionName: versionName
            , detail: detail
            })
          })
      })
  }
  else if(type == 'activityTest'){
    dbapi.loadActivityTask(req.params.taskid)
      .then(function(list) {
          res.json({
            success:true
            ,list: list
          })
      })
  }
else if (type == 'uiTest' || type =='travelTest') {
    dbapi.loadUITestDetail(req.params.taskid).then(function (obj) {
      var os_version = []
      var width_height = []
      var manufacturer = []
      obj.devices.forEach(function (device) {
        os_version.push(device.version)
        width_height.push(device.width + 'x' + device.height)
        manufacturer.push(device.manufacturer)
      })
      res.json({
        success: true,
        os_version: datautil.unique(os_version).map(function (element) {
          return {label: element, value: false}
        }),
        width_height: datautil.unique(width_height).map(function (element) {
          return {label: element, value: false}
        }),
        manufacturer: datautil.unique(manufacturer).map(function (element) {
          return {label: element, value: false}
        }),
        result: obj
      })
    })
  }
  else if (type == 'performTest') {


    dbapi.loadPerform(req.params.taskid).then(function (obj) {
      var os_version = []
      var width_height = []
      var manufacturer = []
      obj.devices.forEach(function (device) {
        os_version.push(device.version)
        width_height.push(device.width + 'x' + device.height)
        manufacturer.push(device.manufacturer)
      })
      var launchTime = 0
      var cpu = 0
      var mem = 0
      var netTotal = 0
      var fps = 0
      var bestLaunchSerial, worstLaunchSerial, worstLaunch = 0, bestLaunch = 0
      var bestCpuSerial, worstCpuSerial, worstCpu = 0, bestCpu = 0
      var bestMemSerial, worstMemSerial, worstMem = 0, bestMem = 0
      var bestNetTotalSerial, worstNetTotalSerial, worstNetTotal = 0, bestNetTotal = 0
      var bestFpsSerail, worstFpsSerial, worstFps = 0, bestFps = 0

      var notNaNLaunch = notNaNCpu = notNaNMem = notNaNNetTotal = notNaNFps = 0

 var isLaunchFirst = isCpuFirst = isMemFirst = isNetTotalFirst = isFpsFirst = true

      obj.devicePerformance.forEach(function (perform) {


        launchTime = isNaN(parseInt(perform.performance.launchTime)) ? launchTime : (notNaNLaunch = notNaNLaunch + 1, launchTime + parseInt(perform.performance.launchTime))
        cpu = (!perform.performance.cpu || perform.performance.cpu === 'NaN' || parseInt(perform.performance.cpu) == 0) ? cpu : (notNaNCpu = notNaNCpu + 1, cpu + perform.performance.cpu)
        mem = (!perform.performance.mem || perform.performance.mem === 'NaN' || parseInt(perform.performance.mem) == 0) ? mem : (notNaNMem = notNaNMem + 1, mem + perform.performance.mem)
        netTotal = (!perform.performance.netTotal || perform.performance.netTotal === 'NaN' || parseInt(perform.performance.netTotal) == 0) ? netTotal : (notNaNNetTotal = notNaNNetTotal + 1, netTotal + perform.performance.netTotal)
        fps = (!perform.performance.fps || perform.performance.fps === 'NaN' || parseInt(perform.performance.fps) == 0) ? fps : (notNaNFps = notNaNFps + 1, fps + perform.performance.fps)

        // launchtime非0
        if (perform.performance.launchTime != 'NaN' && !isNaN(parseInt(perform.performance.launchTime)) && parseInt(perform.performance.launchTime) != 0) {
          if (isLaunchFirst) {
            bestLaunch = parseInt(perform.performance.launchTime)
            worstLaunch = parseInt(perform.performance.launchTime)
			bestLaunchSerial = worstLaunchSerial = perform.serial
            isLaunchFirst = false
          }
          else {
            if (parseInt(perform.performance.launchTime) < bestLaunch) {
              bestLaunchSerial = perform.serial
              bestLaunch = parseInt(perform.performance.launchTime)
            }
            if (parseInt(perform.performance.launchTime) > worstLaunch) {
              worstLaunchSerial = perform.serial
              worstLaunch = parseInt(perform.performance.launchTime)
            }
          }
        }

        // cpu
        if (perform.performance.cpu && perform.performance.cpu != 'NaN' && parseInt(perform.performance.cpu) != 0) {
          if (isCpuFirst) {
            bestCpu = perform.performance.cpu
            worstCpu = perform.performance.cpu
			bestCpuSerial = worstCpuSerial = perform.serial
            isCpuFirst = false
          }
          else {
            if (perform.performance.cpu < bestCpu) {
              bestCpuSerial = perform.serial
              bestCpu = perform.performance.cpu
            }
            if (perform.performance.cpu > worstCpu) {
              worstCpuSerial = perform.serial
              worstCpu = perform.performance.cpu
            }
          }
        }

        // mem
        if (perform.performance.mem && perform.performance.mem != 'NaN' && parseInt(perform.performance.mem) != 0) {
          if (isMemFirst) {
            bestMem = perform.performance.mem
            worstMem = perform.performance.mem
			bestMemSerial = worstMemSerial = perform.serial
            isMemFirst = false
          }
          else {
            if (perform.performance.mem < bestMem) {
              bestMemSerial = perform.serial
              bestMem = perform.performance.mem
            }
            if (perform.performance.mem > worstMem) {
              worstMemSerial = perform.serial
              worstMem = perform.performance.mem
            }
          }
        }

        // 总流量
        if (perform.performance.netTotal && perform.performance.netTotal != 'NaN' && parseInt(perform.performance.netTotal) != 0) {
          if (isNetTotalFirst) {
            bestNetTotal = perform.performance.netTotal
            worstNetTotal = perform.performance.netTotal
			bestNetTotalSerial = worstNetTotalSerial = perform.serial
            isNetTotalFirst = false
          }
          else {
            if (perform.performance.netTotal < bestNetTotal) {
              bestNetTotalSerial = perform.serial
              bestNetTotal = perform.performance.netTotal
            }
            if (perform.performance.netTotal > worstNetTotal) {
              worstNetTotalSerial = perform.serial
              worstNetTotal = perform.performance.netTotal
            }
          }
        }

        // fps
        if (perform.performance.fps && perform.performance.fps != 'NaN' && parseInt(perform.performance.fps) != 0) {
          if (isFpsFirst) {
            bestFps = perform.performance.fps
            worstFps = perform.performance.fps
			bestFpsSerail = worstFpsSerial = perform.serial
            isFpsFirst = false
          }
          else {
            if (perform.performance.fps > bestFps) {
              bestFpsSerail = perform.serial
              bestFps = perform.performance.fps
            }
            if (perform.performance.fps < worstFps) {
              worstFpsSerial = perform.serial
              worstFps = perform.performance.fps
            }
          }
        }

      })

      obj.best = {
        cpu: {
          device: {},
          value: bestCpu == 0 ? 0 : bestCpu + '%'
        },
        mem: {
          device: {},
          value: bestMem == 0 ? 0 : (bestMem > 1024 ? (bestMem / 1024).toFixed(2) + 'MB' : bestMem + 'KB')
        },
        netTotal: {
          device: {},
          value: bestNetTotal == 0 ? 0 : (bestNetTotal > 1024 ? (bestNetTotal/1024).toFixed(2) + 'MB' :  bestNetTotal + 'KB')
        },
        fps: {
          device: {},
          value: bestFps
        },
        launch: {
          device: {},
          value: bestLaunch == 0 || isNaN(bestLaunch) ? 0 : (bestLaunch / 1000).toFixed(2) + 's'
        }
      }

      obj.worst = {
        cpu: {
          device: {},
          value: worstCpu == 0 ? 0 : worstCpu + '%'
        },
        mem: {
          device: {},
          value: worstMem == 0 ? 0 : (worstMem > 1024 ? (worstMem / 1024).toFixed(2) + 'MB' : worstMem  + 'KB')
        },
        netTotal: {
          device: {},
          value: worstNetTotal == 0 ? 0 : (worstNetTotal > 1024 ? (worstNetTotal/1024).toFixed(2) + 'MB' :  worstNetTotal + 'KB')
        },
        fps: {
          device: {},
          value: worstFps
        },
        launch: {
          device: {},
          value: worstLaunch == 0 || isNaN(worstLaunch) ? 0 : (worstLaunch / 1000).toFixed(2) + 's'
        }
      }
      
      obj.devices.forEach(function (device) {
        if (device.serial == bestCpuSerial) {
          _.assign(obj.best.cpu.device, device)
        }
        if (device.serial == worstCpuSerial) {
          _.assign(obj.worst.cpu.device, device)
        }

        if (device.serial == bestMemSerial) {
          _.assign(obj.best.mem.device, device)
        }
        if (device.serial == worstMemSerial) {
          _.assign(obj.worst.mem.device, device)
        }

        if (device.serial == bestNetTotalSerial) {
          _.assign(obj.best.netTotal.device, device)
        }
        if (device.serial == worstNetTotalSerial) {
          _.assign(obj.worst.netTotal.device, device)
        }

        if (device.serial == bestFpsSerail) {
          _.assign(obj.best.fps.device, device)
        }
        if (device.serial == worstFpsSerial) {
          _.assign(obj.worst.fps.device, device)
        }

        if (device.serial == bestLaunchSerial) {
          _.assign(obj.best.launch.device, device)
        }
        if (device.serial == worstLaunchSerial) {
          _.assign(obj.worst.launch.device, device)
        }
      })

      if (obj.devicePerformance.length) {
        launchTime = notNaNLaunch == 0 ? 0 : (launchTime / notNaNLaunch / 1000).toFixed(2) + 's'
        cpu = notNaNCpu == 0 ? 0 : (cpu / notNaNCpu).toFixed(2) + '%'
        mem = notNaNMem == 0 ? 0 : ((mem / notNaNMem) > 1024 ? (mem / obj.devicePerformance.length / 1024).toFixed(2) + 'MB' : (mem / obj.devicePerformance.length).toFixed(2) + 'KB')
        netTotal = notNaNNetTotal == 0 ? 0 : (netTotal > 1024 ? (netTotal / notNaNNetTotal / 1024).toFixed(2) + 'MB' : (netTotal / notNaNNetTotal).toFixed(2) + 'KB')
        fps = notNaNFps == 0 ? 0 : (fps / notNaNFps).toFixed(2)

      }
      obj.performanceTotal = {
        cpu: cpu,
        mem: mem,
        netTotal: netTotal,
		fps: fps == 'NaN' ? 0 : fps,
        launch: launchTime
      }
      delete obj.devicePerformance
      res.json({
        success: true,
        os_version: datautil.unique(os_version).map(function (element) {
          return { label: element, value: false }
        }),
        width_height: datautil.unique(width_height).map(function (element) {
          return { label: element, value: false }
        }),
        manufacturer: datautil.unique(manufacturer).map(function (element) {
          return { label: element, value: false }
        }),
        result: obj
      })
    })

  }
  else
  {
    res.json({
            success:false
            ,result:'No type'
          })
  }
})

//活动自动化任务详细+测试设备的信息
router.get('/loadActivityTaskDetail/:taskid',function (req,res){
    dbapi.loadActivityTaskDetail(req.params.taskid)
    .then(function(list) {
          res.json({
            success:true
            ,list: list
          })
      })  
})


router.get('/loadTaskDevdetail/:taskid',function (req,res){
  dbapi.loadTaskDevdetail(req.params.taskid)
    .then(function (cursor) {
      return Promise.promisify(cursor.toArray, cursor)()
        .then(function(list) {
          res.json({
            success:true
            ,detail:list
          })
        })
    })
})

router.get('/loadtaskerrorinfo/:taskid', function (req,res) {
     log.debug('loadtaskerrorinfo')
     taskerrorlist(req.params.taskid)
        .then(function (errorlist) {
          res.json(200, {
            success: true
            ,errorlist: errorlist
          })
        })
})

router.get('/loadDeviceLog/:taskid/:serial/:loglevel/:firstnum/:lastnum',function(req,res){
  var linelong = req.params.lastnum - req.params.firstnum
  var a = parseInt(linelong)
  //log.info('aaaaaaaaaaaaaaaaa',a,typeof(a))
  if (linelong > 5000 )
    {
      res.json(501,{
        success: 'failed'
      , reason: 'reqest lines is too many'
      })
    }
  else{
    deallog.getLogdata(req.params.taskid,req.params.serial,req.params.loglevel,req.params.firstnum,req.params.lastnum)
    .then(function(All){
     // log.info('log',All)
      res.json({
      success: true
    , AllLines: All
      // , logcat: logcat
    })
    })
  }
})

router.get('/downloadappicon/:fileID',function(req,res){
    log.debug('get appicon')
    dbapi.loadApkinfo(req.params.fileID)
      .then(function (apkinfo) {
        var appiconpath = apkinfo.appiconpath
        log.debug('appiconpath is :',appiconpath)
        fs.stat(appiconpath, function (err, stat) {
          if(stat && stat.isFile()){
            fs.readFile(appiconpath, 'binary', function (err, data) {
              if(err){
                res.writeHead(500,{'Content-Type':'text/plain'})
                res.write(err + '\n')
                res.end()
              }else{
                res.writeHead(200, {'Content-Type':'image/png'})
                res.write(data, 'binary')
                res.end()
              }
            })
          }else {
            res.sendStatus(404)
          }
        })
      })
})

router.get('/selecttasklist/:projectName/:timepast/:timenow',function(req,res){
  //log.info(req.params.projectName)
    if(req.params.projectName == "All"){
    dbapi.loadtaskList(req.params.timepast,req.params.timenow)
      .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function(list) {
            var table = []
            list.forEach(function(data) {
              table.push(data)
            })
            res.json({
              success: true
            , tasklist: table
            })
          })
      })
    }
    else{
    dbapi.selecttasklist(req.params.projectName,req.params.timepast,req.params.timenow)
      .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
          .then(function(list) {
            var table = []
            list.forEach(function(data) {
              table.push(data)
            })
            res.json({
              success: true
            , tasklist: table
            })
          })
      })
    }
})

router.get('/loadRecommendDevices', function (req,res) {
  dbapi.loadRecommendDevices()
    .then(function(cursor) {
      return Promise.promisify(cursor.toArray, cursor)()
        .then(function(list) {
          res.json({
            success:true
            ,list: list
          })
        })
    })
})
//add by SissiWu @2016.06.01 start
router.get('/checkUsedDevice', function(req, res) {
	log.info('/app/api/v1/checkUsedDevice start')
	var list=new Array()
	list[0]="Saab"
	list[1]="Volvo"
	list[2]="BMW"
	log.info(list)
	res.json({
	    success: true
	    , devices: list
	})
	log.info('/app/api/v1/checkUsedDevice end')
})
    //add by SissiWu @2016.06.01 end

// add by jc for test
router.post('/selectTaskList', function(req, res) {
  //console.log(req.body)
  var taskTypes = req.body.taskTypes  // [ ]
  var projectNames = req.body.projectNames  // [ ]
  var past = req.body.timePast
  var now = req.body.timeNow
  var page = req.body.page
  var pageSize = req.body.pageSize

  dbapi.loadTaskList({
    'taskTypes': taskTypes,
    'projectNames': projectNames,
    'timePast': past,
    'timeNow': now,
    'page': page,
    'pageSize': pageSize
  }).then(function (obj) {
    res.json({
      success: true,
      count: obj.count,
      taskList: obj.results
    })
  })

})

module.exports = router
