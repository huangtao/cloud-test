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
var dbapi = require('../../db/apiv2')
var datautil = require('../../util/datautil')
var activityCompatibility = require('../activity')
var fileutil = require('../../util/fileutil')
var deallog = require('../../util/deallog')
var updateApkUserInfo = require('../storage/plugins/apk/task/updateApkUserInfo')
//var auth = require('./middleware/auth')
var taskerrorlist = require('../report/taskErrorList')
var monkey = require('../monkey')
var uitest = require('../autoui')
var report = require('../report')
var async = require('async')
var httputil = require('../../util/httputil')
var _ = require('lodash')
var excel = require('excel-export')
var moment = require('moment')

var multiparty = require('multiparty');
var crypto = require('crypto');
var Archiver = require('archiver')
var performtest = require('../performance')
var traveltest = require('../travel')
var uuid = require('node-uuid')

var exec = require('child_process').exec
var markdownServe = require('markdown-serve')

var log = logger.createLogger('apiv2')
var app = express()
//app.use('/image', express.static('/var/stf/file/uilog'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

router.post('/selectTaskList', function (req, res) {
  var taskTypes = req.body.taskTypes  // [ ]
  var projectNames = req.body.projectNames  // [ ]
  var committer = req.body.committer
  var past = req.body.timePast
  var now = req.body.timeNow
  var page = req.body.page ? req.body.page : 1
  var pageSize = req.body.pageSize ? req.body.pageSize : 10

  dbapi.loadTaskList({
    'taskTypes': taskTypes,
    'projectNames': projectNames,
    'userName': committer,
    'timePast': past,
    'timeNow': now
    //'page': page,
    //'pageSize': pageSize
  }).then(function (cursor) {
	return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (tasks) {
var hitCount = tasks.length
    var target_tasks = tasks.slice((page - 1) * pageSize, page * pageSize)
    target_tasks.forEach(function (task) {
      if (task.taskType == 'uiTest' || task.taskType == 'performTest') {
        // 只对未完成的
        if (task.allstatus != 'finish') {
          var allcases = task.allcases * task.serials.length
          // 已经完成的用例数，这只是已经完成的手机，后面还要加上未完成的手机
          var completedCases = task.completedDevices.length * task.allcases

          var pendingSerials = _.difference(task.serials, task.completedDevices)

          pendingSerials.forEach(function (serial) {
            // 如果当前设备不是被当前任务占用，说明这台设备没有在运行，直接返回0
            var target_device = _.find(task.serialsOwner, function (o) {
              return o.serial == serial
            })
            if (target_device.owner && target_device.owner.taskid == task.taskid) {
              task.pycharmProject.forEach(function (pyproject) {
                var reportPath = fileutil.join('/var/stf/testproject2', task.projectKind, task.projectName, task.caseVersion, pyproject, 'src', serial, 'report')
                // 存在
                if (fileutil.exists(reportPath)) {
                  var cs = fileutil.list(reportPath)
                  _.remove(cs, function (n) {
                    return n.fileName == 'screenshot' || n.fileName == 'TestReport.xml' || n.fileName == 'TestReport.xsl' || n.fileName == 'TestResult.xsl'
                  })
                  completedCases += cs.length
                }
              })
            }
          })

          // 做个处理，如果是100%，但状态还没置成finish，就设置为95%
          if (completedCases == allcases) {
            task['process'] = '99%'
          }
          else {
            task['process'] = Math.round(completedCases / allcases * 100) + '%'
          }
          
        }

        else {
          task['process'] = '100%'
        }
      }
      delete task.allcases
      delete task.serials
	  delete task.pycharmProject
	  delete task.completedDevices
	  delete task.projectKind
    })
    res.json({
      success: true,
      count: hitCount,
      taskList: target_tasks
    })

  })
})

/*
 V2接口 by jc 2017/1/18
 */
router.post('/searchPhoneSerial', function (req, res) {
  var manufacturer = req.body.manufacturer ? req.body.manufacturer : []
  var version = req.body.version ? req.body.version : []
  var dpis = req.body.dpis ? req.body.dpis : []
  var status = req.body.status ? req.body.status : ''
  var recommend = req.body.recommend ? req.body.recommend : null

  var root = req.body.root ? req.body.root : []

  manufacturer = (manufacturer instanceof Array) ? manufacturer : [manufacturer]
  version = (version instanceof Array) ? version : [version]
  dpis = (dpis instanceof Array) ? dpis : [dpis]
  root = (root instanceof Array) ? root : [root]

  dbapi.loadPhone(manufacturer, version, dpis, status, recommend, root).then(function (data) {
      var result = []
      data.forEach(function (element) {
        var devices = []
        element.reduction.forEach(function (deviceInfo) {
		  if ('display' in deviceInfo && 'width' in deviceInfo.display) {
          devices.push({
            abi: deviceInfo.abi,
            width: deviceInfo.display.width,
            height: deviceInfo.display.height,
            manufacturer: deviceInfo.manufacturer,
            markName: deviceInfo.markName,
            model: deviceInfo.model,
            serial: deviceInfo.serial,
            osVersion: deviceInfo.version
          })
		}
        })
        result.push({
          'manufacturer': element.group,
          'selected': [],
          'devices': devices
        })
      })
      res.json({
        success: true,
        result: result
      })
    })
})


/*
 V2接口 by jc 2017/1/18
 */
router.get('/loadProjectInfo', function (req, res) {

  /*
  var options = {
    hostname: '192.168.204.70',
    port: 80,
    path: '/kkpromo_new/api.php?m=tool&p=showapi&_=1490326061395',
    method: 'GET'
  }*/
  var options = {
    hostname: 'reqm.oa.com',
    port: 80,
    path: '/index.php?r=interface%2Findex',
    method: 'GET'
  }
  httputil.get(options).then(function (data) {

    var json_data = {}
    try {
      json_data = JSON.parse(data)
    }
    catch (error) {
      log.info(error)
    }
    if (json_data.result && json_data.result.length != 0) {
      _.remove(json_data.result, function (n) {
        return n.projects == null
      })
      _.forEach(json_data.result, function (n) {
        _.forEach(n.projects, function(p) {
          if (p.projectName != '麻将类子游戏') {
            p.modules = []
          }
        })
      })
      res.json(json_data)
    }
    else {
       dbapi.loadProjectInfo().then(function (data) {
        var result = []
        data.forEach(function (element) {
          var projects = []
          element.reduction.forEach(function (project) {
            projects.push({
              projectName: project.projectName,
              projectId: project.id
            })
          })
          result.push({
              projectStudio: element.group,
              projects: projects
          })
       })
       res.json({
          success: true,
          result: result
        })
      })
    }
  })
})


/*
 V2接口,统一 app/api/v1/phonemodels
 app/api/v1/phonedpis
 by jc 2017/1/18
 */
router.get('/loadPhoneModels', function (req, res) {
  dbapi.loadPhoneModel().then(function (cursor) {
    var manufacturers = []
    var os_versions = []
    var dpis = []
    cursor.eachAsync(function (row) {
      if (row.brand) { 
        manufacturers.push(row.brand)  
      }
      if (row.version) { os_versions.push(row.version)  }
      if (row.display.width && row.display.height){ 
        dpis.push(row.display.width + 'x' + row.display.height) 
      }}).then(function () {
      manufacturers = datautil.unique(manufacturers).sort()
      os_versions = datautil.unique(os_versions).sort()
      dpis = datautil.unique(dpis).sort()
      res.json({
        success: true,
        manufacturers: manufacturers,
        os_versions: os_versions,
        dpis: dpis
      })
    })
  })
})


router.post('/monkeytest',function (req,res) {
  //log.info('monkeytest post body',req)
  if(!req.body.Project)
  {
    return res.json(540,{
        success:false
       , result:'请选择项目名'
      })
  }
  if(!req.body.id){
      return res.json(540,{
        success:false
       , result:'请上传APK文件'
      })
    }
    //log.info ('SSSSSSSSSSS',req.body.serials.length)
  if(req.body.serials.length == 0){
    return res.json(540,{
      success:false
      ,result:'请选择设备'
    })
  }
  var testversion = 'apiv2'
  var userEmail = req.user.email
  var taskid = new Date().getTime() + '_' + userEmail.split('@')[0]
  monkey(req,taskid,testversion)
  return res.json(200,{
      success: true
      ,taskid: taskid
    })
})

/*
 V2接口,增加分页功能 by jc 2017/1/22
 */
router.get('/apkinfo', function (req, res) {
  var page = req.query.page ? req.query.page : 1
  var pageSize = req.query.pageSize ? req.query.pageSize : 10
  dbapi.loadUserApkinfo(page,pageSize ).then(function (obj) {
    res.json({
      success: true,
      count: obj.count,
      apkinfos: obj.results
    })
  })
})


router.post('/filterTaskDevdetail', function (req, res){
  log.info('post filterTaskDevdetail',req.body)
  if(!req.body.taskid)
  {
    return res.json(540,{
        success:false
       , result:'请传任务ID'
      })
  }
  if(!req.body.data)
  {
    return res.json(540,{
        success:false
       , result:'请传过滤参数'
      })
  }

  dbapi.filterTaskDevdetail(req.body.taskid,req.body.data)
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

router.post('/filterTaskActivitydetail', function (req, res){
  log.info('post filterTaskActivitydetail',req.body)
  log.info('Detail Type',req.body.data.width[0],typeof(req.body.data.width[0]))
  if(!req.body.taskid)
  {
    return res.json(540,{
        success:false
       , result:'请传任务ID'
      })
  }
  if(!req.body.data)
  {
    return res.json(540,{
        success:false
       , result:'请传过滤参数'
      })
  }

  dbapi.filterTaskActivitydetail(req.body.taskid,req.body.data)
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

/*
 V2接口, UI活动兼容性测试提交 by jc 2017/2/5
 */
router.post('/activityCompatibility', function (req, res) {
  if (!req.body.testName) {
    res.json({
      success: false,
      result: '请输入测试名称'
    })
  }
  else if (!req.body.activityUrl) {
    res.json({
      success: false,
      result: '请输入测试URL'
    })
  }
  else if (!req.body.screenOrientation) {
    res.json({
      success: false,
      result: '请选择横竖屏'
    })
  }
  else if (!req.body.serials || req.body.serials.length == 0) {
    res.json({
      success: false,
      result: '请选择机型'
    })
  }
  else {
    var userEmail = req.user.email
    var taskid = new Date().getTime() + '_' + userEmail.split('@')[0]
    activityCompatibility(req, taskid)
    res.json({
      success: true,
      taskid: taskid
    })
  }
})


/*
  V2接口,获取所有项目名称,不考虑工作室 by jc 2017/2/5
 */
router.get('/loadProjectName', function (req, res) {
  var projectNames = []
  dbapi.loadProjectName().then(function (cursor) {
    cursor.eachAsync(function (row) {
      projectNames.push({
        label: row.projectName,
        value: row.id
      })
    }).then(function () {
      res.json({
        success: true,
        projectNames: projectNames
      })
    })
  })
})

/*
 V2接口,获取cptlog目录下的图片 by jc 2017/2/6
 */

router.get('/ScreenCap/:taskid/:serial/:num',function(req,res){
    dbapi.loadReportImg(req.params.taskid,req.params.serial)
      .then(function(cursor){
        if(cursor.length>0){
          var list=cursor[0]
          var num = req.params.num - 1
            if(num > list.length){
              res.json({
                statuscode:101
                ,result:'Image too long'
              })
            }
            else{
              var path= list[num]
              var pathExit=path.split('.')[1]
              }
              //log.info('00000000000',pathExit)
              if (pathExit =='jpg'|| pathExit =='png'){
                //log.info('11111111111111',pathExit)
                res.set('Content-Type','image/png')
                res.sendFile(path)
              }
              else{
                res.json({
                statuscode:101
                ,result:'No image have been obtain!'
                })
              }
          }
          else{
            res.json({
                statuscode:101
                ,result:'No image have been obtain!'
              })
          }
      })
})



router.get('/loadTaskDevOptions/:taskid',function (req,res){
  dbapi.loadTaskDevdetail(req.params.taskid)
    .then(function (cursor) {
      return Promise.promisify(cursor.toArray, cursor)()
        .then(function(list) {
          var version=[]
          var width=[]
          var height=[]
          var dpis=[]
          if(list.length>0){
          list.forEach(function(data){
            version.push(data.version)
            width.push(data.width)
            height.push(data.height)
            dpis.push(data.width+'x'+data.height)
          })          
          version=datautil.unique(version)
          width=datautil.unique(width)
          height=datautil.unique(height)
          dpis=datautil.unique(dpis)

          var Lversion=[]
          var Lwidth=[]
          var Lheight=[]
          var Ldpis=[]

          version.forEach(function(ver){
            Lversion.push({data:ver,value:true})
          })
          width.forEach(function(wid){
            Lwidth.push({data:wid,value:true})
          })
          height.forEach(function(hgt){
            Lheight.push({data:hgt,value:true})
          })
          dpis.forEach(function(dpi){
            Ldpis.push({data:dpi,value:true})
          })
          res.json({
            success: true
            ,version:Lversion
            ,width:Lwidth
            ,height:Lheight
            ,dpis:Ldpis
          })
          }
          else
            res.json({
              success:false,
              error: "There are table of detail"
            })
        })
    })
})

router.get('/loadTaskActivityOptions/:taskid',function (req,res){
  dbapi.loadActivityTaskDetail(req.params.taskid)
    .then(function (cursor) {
      return Promise.promisify(cursor.toArray, cursor)()
        .then(function(list) {
          var version=[]
          var width=[]
          var height=[]
          var dpis=[]
          if(list.length>0){
          list.forEach(function(data){
            version.push(data.version)
            width.push(data.width)
            height.push(data.height)
            dpis.push(data.width+'x'+data.height)
          })          
          version=datautil.unique(version)
          width=datautil.unique(width)
          height=datautil.unique(height)
          dpis=datautil.unique(dpis)

          var Lversion=[]
          var Lwidth=[]
          var Lheight=[]
          var Ldpis=[]

          version.forEach(function(ver){
            Lversion.push({data:ver,value:true})
          })
          width.forEach(function(wid){
            Lwidth.push({data:wid,value:true})
          })
          height.forEach(function(hgt){
            Lheight.push({data:hgt,value:true})
          })
          dpis.forEach(function(dpi){
            Ldpis.push({data:dpi,value:true})
          })
          res.json({
            success: true
            ,version:Lversion
            ,width:Lwidth
            ,height:Lheight
            ,dpis:Ldpis
          })
          }
          else
            res.json({
              success:false,
              error: "There are table of detail"
            })
        })
    })
})

router.post('/filterUI', function (req, res) {
  var taskId = req.body.taskId
  var os_version = req.body.os_version ? req.body.os_version : []
  var dpis = req.body.dpis ? req.body.dpis : []
  var manufacturer = req.body.manufacturer ? req.body.manufacturer : []

  os_version = (os_version instanceof Array) ? os_version : [os_version]
  dpis = (dpis instanceof Array) ? dpis : [dpis]
  manufacturer = (manufacturer instanceof Array) ? manufacturer : [manufacturer]

  var dpisStr = dpis.map(function (_dpis) {
    return _dpis[0] + 'x' + _dpis[1]
  })

  dbapi.filterUI(taskId).then(function (obj) {

    if (obj) {
      // 过滤手机版本
      if (os_version.length > 0) {
        _.remove(obj.devices, function (d) {
          return !_.includes(os_version, d.version)
        })
      }
      // 过虑分辨率
      if (dpis.length > 0) {
        _.remove(obj.devices, function (d) {
          return !_.includes(dpisStr, d.width + 'x' + d.height)
        })
      }
      // 过滤manufacturer
      if (manufacturer.length > 0) {
        _.remove(obj.devices, function (d) {
          return !_.includes(manufacturer, d.manufacturer)
        })
      }
      var order = 0
      obj.devices.forEach(function (device) {
        order = order + 1
        device.order = order

        var target_device = _.find(obj.completedDevices, function (o) {
          return o.serial == device.serial
        })

        // 如果已经完成的
        if (target_device) {
          _.assign(device, target_device)
          device.total = obj.casesCount
          device.waitCount = 0 //obj.casesCount - device.failCount - device.sucCount
          device.process = '100%'
          device.sucRate = Math.round(device.sucCount / obj.casesCount * 100) + '%'
        }
        // 未完成的去找文件数量
        else {
          // 看目录下生成的几份文件
          var completedCases = 0
          var sucCount = 0
          var failCount = 0
          var pendingCount = 0
		  
 		  if (device.owner && device.owner.taskid == taskId) {
          obj.pycharmProject.forEach(function (pyproject) {
            var reportPath = fileutil.join('/var/stf/testproject2', obj.projectKind, obj.projectName, obj.caseVersion, pyproject, 'src', device.serial, 'report')
            // 存在
            if (fileutil.exists(reportPath)) {
              var cs = fileutil.list(reportPath)
              _.forEach(cs, function (n) {
                if (n.fileName != 'screenshot' && n.fileName != 'TestReport.xml' && n.fileName != 'TestReport.xsl' && n.fileName != 'TestResult.xsl') {
                  completedCases++
                  var case_result = fileutil.parsexmlforresult(fileutil.join(reportPath, n.fileName))
                  if (case_result) {
                    case_result == 'True' ? ++sucCount : (case_result == 'pending' ? ++pendingCount : ++failCount)
                  }
                }
              })
            }
          })
		  }
          device.status = 'unfinish'
          device.total = obj.casesCount

          device.completedCount = completedCases
          device.waitCount = obj.casesCount - completedCases
          device.sucCount = sucCount
          device.failCount = failCount
          device.pendingCount = pendingCount
          // 这里也一样，如果是数量相等，但未写入数据库的，置成95%
          if (completedCases == obj.casesCount) {
            device.process = '99%'
          }
          else {
            device.process = Math.round(completedCases / obj.casesCount * 100) + '%'
          }
          device.sucRate = Math.round(sucCount / obj.casesCount * 100) + '%'
        }
      })

      delete obj.completedDevices
      delete obj.serials
      res.json({
        success: true,
        result: obj
      })
    }
    else {
      res.json({
        success: false,
        result: []
      })
    }
  })

})

router.post('/uiTest', function (req, res) {
  var projectName = req.body.projectName
  if (!projectName) {
    return res.json(200, {
      success: false,
      result: '请选择项目'
    })
  }
  var fileId = req.body.fileId
  if (!fileId) {
    return res.json(200, {
      success: false,
      result: '请上传APK文件'
    })
  }
  var cases = req.body.cases;
  if (!cases) {
    return res.json(200, {
      success: false,
      result: '请选择脚本'
    })
  }
  var serials = req.body.serials
  if (!serials) {
    return res.json(200, {
      success: false,
      result: '请选择机型'
    })
  }

  var account = req.body.account
  if (account) {
    try {
      req.body.account = {
        data: JSON.parse(account).map(function (user) {
          user['status'] = 'unuse'
          return user
        })
      }
    } catch (err) {
      return res.json(200, {
        success: false,
        result: '账号格式有误'
      })
    }
  }

  var userEmail = req.user.email
  var taskid = new Date().getTime() + '_' + userEmail.split('@')[0]
  uitest(req, taskid)
  res.json({
    success: true,
    taskid: taskid
  })
})

router.get('/loadSuiteCase', function (req, res) {
  var projectName = req.query.project
  var caseVersion = req.query.version
  var type = req.query.type
  if (type) {
    if (type == 'p') { type = '性能项目' }
    else if (type == 't') { type = '遍历测试' }
  }
  dbapi.getCaseByProject(projectName, caseVersion, type).then(function (cursor) {
    cursor.toArray(function (err, cases) {
      if (err) {
        res.json({success: false, result: null})
      }
      else {
        var module_key = {}
        var submodule_key = {}
        cases.forEach(function (element) {
          var module = element.module
          if(module) {
		 module_key.hasOwnProperty(module) ? module_key[module].push(element) : (module_key[module] = [], module_key[module].push(element))
          }
          else {
            var sub_module = element.sub_module
	    submodule_key.hasOwnProperty(sub_module) ? submodule_key[sub_module].push(element) : (submodule_key[sub_module] = [], submodule_key[sub_module].push(element))

          }
        })
        var result = []
        var module_sorted_key = Object.keys(module_key).sort()
        for (var i = 0; i < module_sorted_key.length; i++) {
          result.push({
            module: module_sorted_key[i],
            cases: module_key[module_sorted_key[i]]
          })
        }
        var submodule_sorted_key = Object.keys(submodule_key).sort()
        for (var i = 0; i < submodule_sorted_key.length; i++) {
          result.push({
            module: submodule_sorted_key[i],
            cases: submodule_key[submodule_sorted_key[i]]
          })
        }
        var k = []
        result.forEach(function (m) {
          k.push({
            cases: m.cases,
            suite_name: m.module,
	    suite_desc: m.cases.length > 0 ? m.cases[0].module_desc : '',
            selected: [],
            isOpened: true
          })
        })
        res.json({
          success: true,
          result: k
        })
      }
    })
  })
})

//router.get('/loadSuiteCase', function (req, res) {
//  /*dbapi.loadSuiteCaseByProjectId(req.params.projectId).then(function (cursor) {
//    cursor.toArray(function (err, result) {
//      if (err) {
//        res.json({success: false, result: null})
//      }
//      else {
//        log.info(result)
//        res.json({
//          success: true,
//          result: result.map(function(element) {
//	      return (element.selected = [], element.isOpened = true, element)
//          })
//        })
//      }
//    })
//  })*/
//  dbapi.getCaseByProject(req.query.project).then(function (cursor) {
//    cursor.toArray(function (err, cases) {
//      if (err) {
//        res.json({success: false, result: null})
//      }
//      else {
//        var module_map = {}
//        var key_map = {}
//        var result = []
//        cases.forEach(function (element) {
//	  element.name = element.class_name
//          var key = (element.modules.length > 0 ? element.modules[0] : '') + '_' + element.project_name
//          key_map[key] = [element.modules.length > 0 ? element.modules[0] : '', element.project_name]
//          if (!module_map.hasOwnProperty(key)) {
//            module_map[key] = []
//          }
//          module_map[key].push(element)
//
//        })
//        var sorted_key = Object.keys(module_map).sort()
//        for (var i = 0; i < sorted_key.length; i++) {
//          result.push({
//            module: key_map[sorted_key[i]][0],
//            cases: module_map[sorted_key[i]]
//          })
//        }
//        var k = []
//        result.forEach(function (m) {
//          k.push({
//            cases: m.cases,
//            suite_id: '',
//            suite_name: m.module,
//            selected: [],
//            isOpened: true
//          })
//        })
//
//        res.json({
//          success: true,
//          result: k
//        })
//      }
//    })
//  })
//
//})


router.get('/loadCaseVersion', function (req, res) {
  var projectName = req.query.project
  var type = req.query.type
  if (type) {
    if (type == 'p') { type = '性能项目' }
    else if (type == 't') { type = '遍历测试' }

  }
  dbapi.loadCaseVersion(projectName, type).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {

    list.sort(function(a, b) {
      return parseInt(b.case_version) - parseInt(a.case_version)
    })

    res.json({
      success: true,
      result: list
    })
  })
})

router.get('/loadTestSuite', function (req, res) {
  var project = req.query.project
  var module = req.query.suite
  var version = req.query.version
  var page = req.query.page ? req.query.page : 1
  var pageSize = req.query.pageSize ? req.query.pageSize : 10

  var type = req.query.type
  if (type) {
    if (type == 'p') { type = '性能项目' }
    else if (type == 't') { type = '遍历测试' }

  }

  exec('svn update', {cwd: '/var/stf/testproject2'}, function (err, stdout, stderr) {

    /*while (true) {
      log.info('asyning test case')
      if (!global.is_operating_db) {
        break
      }
    }*/
    dbapi.loadTestSuite(project, module, version, page, pageSize, type).then(function (cursor) {
	 cursor.toArray(function (err, cases) {
        if (err) {
          res.json({success: false, result: null})
        }
        else {
          var result = []
          var result_key = {}
          var module_key = {}, module_index = {}
          var submodule_key = {}, submodule_index = {}
          cases.forEach(function (element) {
            if (element.module) {
	      var key = element.project_name + '_' + element.case_version + '_' + element.module
              module_index[key] = [element.project_name, element.module, element.case_version]
              module_key.hasOwnProperty(key) ? module_key[key].push(element) : (module_key[key] = [], module_key[key].push(element))
            }
            else {
	      var key = element.project_name + '_' + element.case_version + '_' + element.sub_module
              submodule_index[key] = [element.project_name, element.sub_module, element.case_version]
              submodule_key.hasOwnProperty(key) ? submodule_key[key].push(element) : (submodule_key[key] = [], submodule_key[key].push(element))
            }
          })

          var module_sorted_key = Object.keys(module_key).sort()
          for (var i = 0; i < module_sorted_key.length; i++) {
            var projectname = module_index[module_sorted_key[i]][0]
            var modulename = module_index[module_sorted_key[i]][1]
	    var version = module_index[module_sorted_key[i]][2]

            if (!result_key.hasOwnProperty(projectname)) {
              result_key[projectname] = []
            }
            result_key[projectname].push({
              case_count: module_key[module_sorted_key[i]].length,
	      desc: module_key[module_sorted_key[i]] ? module_key[module_sorted_key[i]][0].module_desc : '',
              project_name: projectname,
              suite_name: modulename,
              module: modulename,
              sub_module: '',
	      version: version
            })

          }
          var submodule_sorted_key = Object.keys(submodule_key).sort()
          for (var i = 0; i < submodule_sorted_key.length; i++) {
            var projectname = submodule_index[submodule_sorted_key[i]][0]
            var submodulename = submodule_index[submodule_sorted_key[i]][1]
	    var version = submodule_index[submodule_sorted_key[i]][2]

            if (!result_key.hasOwnProperty(projectname)) {
              result_key[projectname] = []
            }
            result_key[projectname].push({
              case_count: submodule_key[submodule_sorted_key[i]].length,
	      desc: submodule_key[submodule_sorted_key[i]] ? submodule_key[submodule_sorted_key[i]][0].module_desc : '',
              project_name: projectname,
              suite_name: submodulename,
              module: '',
              sub_module: submodulename,
	      version: version
            })
          }
          var result_sorted_key = Object.keys(result_key).sort()
          for (var i = 0; i < result_sorted_key.length; i++) {
            var cs = result_key[result_sorted_key[i]]
            cs.forEach(function (c) {
              result.push({
                case_count: c.case_count,
                desc: c.desc,
                project_name: result_sorted_key[i],
                suite_name: c.suite_name,
                module: c.module,
                sub_module: c.sub_module,
		version: c.version
              })
            })
          }
          res.json({
            success: true,
            count: result.length,
            result: result
          })
        }
      })

    })
  })
})

//router.get('/loadTestSuite', function (req, res) {
//  var project = req.query.project
//  var suite = req.query.suite
//  var page = req.query.page ? req.query.page : 1
//  var pageSize = req.query.pageSize ? req.query.pageSize : 10
//  exec('svn update', {cwd: '/var/stf/testproject'}, function (err, stdout, stderr) {
//
//    while(true) {
//      if(!global.is_operating_db) {
//        break
//      }
//    }
//    dbapi.loadTestSuite(project, suite, page, pageSize).then(function (cursor) {
//      cursor.toArray(function (err, cases) {
//        if (err) {
//          res.json({success: false, result: null})
//        }
//        else {
//          var key_map = {}
//          var module_map = {}
//          cases.forEach(function (element) {
//
//            var key = (element.modules.length > 0 ? element.modules[0] : '*') + '_' + element.project_name
//            key_map[key] = [element.modules.length > 0 ? element.modules[0] : '*', element.project_name]
//            if (!module_map.hasOwnProperty(key)) {
//              module_map[key] = []
//            }
//            module_map[key].push(element)
//
//          })
//          var tem_result = []
//          var sorted_key = Object.keys(module_map).sort()
//          for (var i = 0; i < sorted_key.length; i++) {
//            tem_result.push({
//              module: key_map[sorted_key[i]][0],
//              project: key_map[sorted_key[i]][1],
//              cases: module_map[sorted_key[i]]
//            })
//          }
//
//          var result = []
//          tem_result.forEach(function (m) {
//            result.push({
//              case_count: m.cases.length,
//              desc: '',
//              project_name: m.project,
//              suite_id: '',
//              suite_name: m.module
//            })
//          })
//          res.json({
//            success: true,
//            count: result.length,
//            result: result
//          })
//        }
//      })
//    })
//  })
//
///*
//function exists(a, b) {
//    for(var i = 0; i < b.length; i++) {
//      if(a.local_path == b[i].local_path && a.class_name == b[i].class_name) {
//        return true
//      }
//    }
//    return false
//  }
//
//  var projectId = req.query.projectId
//  var suite = req.query.suite
//  var page = req.query.page ? req.query.page : 1
//  var pageSize = req.query.pageSize ? req.query.pageSize : 10
//  new Promise(function (resolve, reject) {
//    var path = 'python /var/stf/vendor/scancase/main.py'
//    exec(path, function (err, stdout, stderr) {
//      var data = JSON.parse(stdout)
//      log.info(data)
//      resolve(data)
//    })
//  }).then(function (data) {
//    return new Promise(function(resolve, reject) {
//      dbapi.filterCase(null, null).then(function(cursor){
//        cursor.toArray(function (err, cases) {
//          var _p = []
//          cases.forEach(function (c) {
//            //在本地目录不存在,则删除
//            if (!exists(c, data)) {
//              _p.push(dbapi.deleteCase({id: c.id}))
//            }
//          })
//          Promise.all(_p).then(function (results) {
//            resolve(data)
//          })
//        })
//      })
//    }).then(function (data) {
//        return dbapi.updateOrInsert(data)
//      }).then(function () {
//        dbapi.loadTestSuite(projectId, suite, page, pageSize).then(function (cursor) {
//          cursor.toArray(function (err, cases) {
//            if (err) {
//              res.json({success: false, result: null})
//            }
//            else {
//              var key_map = {}
//              var module_map = {}
//              cases.forEach(function (element) {
//                  var key = (element.modules.length > 0 ?  element.modules[0] : '') + '_' + element.project_name
//                  key_map[key] = [element.modules.length > 0 ?  element.modules[0] : '', element.project_name]
//                  if (!module_map.hasOwnProperty(key)) {
//                    module_map[key] = []
//                  }
//                  module_map[key].push(element)
//              })
//              var tem_result = []
//              var sorted_key = Object.keys(module_map).sort()
//              for (var i = 0; i < sorted_key.length; i++) {
//                tem_result.push({
//                  module: key_map[sorted_key[i]][0],
//                  project: key_map[sorted_key[i]][1],
//                  cases: module_map[sorted_key[i]]
//                })
//              }	              
//              var result = []
//              tem_result.forEach(function (m) {
//                result.push({
//                  case_count: m.cases.length,
//                  desc: '',
//                  project_name: m.project,
//                  suite_id: '',
//                  suite_name: m.module
//                })
//              })
//              res.json({
//                success: true,
//                count: result.length,
//                result: result
//              })
//            }
//          })
//        })
//      })
//    })
//*/
//
///*
//  var projectId = req.query.projectId
//  var suite = req.query.suite
//  var page = req.query.page ? req.query.page : 1
//  var pageSize = req.query.pageSize ? req.query.pageSize : 10
//  dbapi.loadTestSuite(projectId, suite, page, pageSize).then(function (cursor) {
//    cursor.toArray(function (err, cases) {
//      if (err) {
//        res.json({success: false, result: null})
//      }
//      else {
//        var key_map = {}
//        var module_map = {}
//        cases.forEach(function (element) {
//          if (element.modules.length > 0) {
//            var key = element.modules[0] + '_' + element.project_name
//            key_map[key] = [element.modules[0], element.project_name]
//            if (!module_map.hasOwnProperty(key)) {
//              module_map[key] = []
//            }
//            module_map[key].push(element)
//          }
//        })
//        var tem_result = []
//        for (var key in module_map) {
//          tem_result.push({
//            module: key_map[key][0],
//            project: key_map[key][1],
//            cases: module_map[key]
//          })
//        }
//        var result = []
//        tem_result.forEach(function (m) {
//          result.push({
//            case_count: m.cases.length,
//            desc: '',
//            project_name: m.project,
//            suite_id: '',
//            suite_name: m.module
//          })
//        })
//        res.json({
//          success: true,
//          count: result.length,
//          result: result
//        })
//      }
//    })
//  })
//*/
//})

router.post('/loadUIModule', function(req, res) {
  var taskId = req.body.taskId
  var serial = req.body.serial

  dbapi.loadUIModule(taskId, serial).then(function(list) {
    res.json({
      success: true,
      result: list
    })
  })
})

router.post('/loadUIDetail', function (req, res) {
  var taskId = req.body.taskId
  var serial = req.body.serial

  var modules = req.body.module ? req.body.module : []
  var status = req.body.status ? req.body.status : null

  dbapi.loadUITest(taskId, serial, modules, status).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    list.forEach(function (detail) {
      var t =detail.error.replace(/(<p class="error_content">)([\s\S]*?)(<\/p>)/g, function() {
	return arguments['1'] + arguments['2'].replace(/ /g, '&nbsp;').replace(/\n/g, '<br />') + arguments['3']
      })
      _.merge(detail, {error: t})
    })

    list.sort(function(a, b) {
      return moment(a.starttime).isBefore(b.starttime) ? -1 : 1
    })

    res.json({
      success: true,
      result: list
    })
  })
})

router.post('/ui/img/:taskid', function(req, res) {
  var taskId = req.params.taskid
  var img = req.body.img
  var imgPath = path.join('/var/stf/file/uilog', taskId, img)
  // 存在且是文件
  if (fs.existsSync(imgPath) && fs.lstatSync(imgPath).isFile()) {
    res.set('Content-Type','image/png')
    res.sendFile(imgPath)
  }
  else {
    res.status(404).end()
  }
})

router.post('/loadTestCase', function (req, res) {
  var project = req.body.project
  var module = req.body.module
  var sub_module = req.body.subModule
  var version = req.body.version

  var type = req.body.type
  if (type) {
    type = '性能项目'
  }

  dbapi.loadTestCase(project, version, module, sub_module, type).then(function (cursor) {
    cursor.toArray(function (err, data) {
      var cases = []
      data.forEach(function (c) {
        cases.push({
          logic_id: c.logic_id ? c.logic_id : '',
          name: c.class_name,
          desc: c.doc_string,
          owner: c.owner,
          priority: c.priority,
          status: c.status,
          mtime: c.mtime
        })
      })
      var result = {
        cases: cases,
        desc: data ? data[0].module_desc : '',
        package: data ? data[0].package : '',
        projectName: data ? data[0].project_name : '',
        suite_name: data ? (data[0].module ? data[0].module : data[0].sub_module) : '',
        selected: []
      }
      res.json({
        success: true,
        result: result
      })
    })
  })
/* 
  var project = req.query.project
  var suite = req.query.suite ? req.query.suite : ''
  dbapi.loadTestCase(project, suite).then(function (cursor) {
    cursor.toArray(function (err, data) {
      var cases = []
      data.forEach(function (c) {
        cases.push({
          desc: c.doc_string,
          id: c.id,
          logic_id: c.logic_id ? c.logic_id : '',
          method: '',
          name: c.class_name,
          parameter: '',
	  owner: c.owner,
	  priority: c.priority,
	  status: c.status
        })
      })
      var result = {
        cases: cases,
        class: '',
        desc: '',
        id: '',
        package: '',
        projectName: project,
        project_id: '',
        suite_id: '',
        suite_name: suite,
	selected: []
      }
      res.json({
        success: true,
        result: result
      })
    })
  })
*/
})

router.post('/rerun', function (req, res) {

  var taskId = req.body.taskId
  var serial = req.body.serial

  dbapi.loadFailTestCaseIds(taskId, serial).then(function (taskInfo) {
    var task = taskInfo ? taskInfo : {cases: []}
    // 去重
    var target_ids = _.compact(_.uniq(Array.prototype.concat.apply([], task.cases)))
	log.info(target_ids)
    if (target_ids.length) {
      _.assign(task, {cases: target_ids}, {serials: [serial]})
     
      _.assign(req.body, task)
      req.body.memo = '【用例重试】' + req.body.memo
      var userEmail = req.user.email
      var taskid = new Date().getTime() + '_' + userEmail.split('@')[0]
      uitest(req, taskid)

      var data = {
        taskid: taskid,
        sendusers: userEmail,
        fileID: req.body.fileId
      }
      dbapi.saveSendEmail(data)

      res.json({
        success: true,
        taskid: taskid
      })
    }
    else {
      res.json({
        success: false,
        result: '没用用例可选'
      })

    }
  })
})

router.get('/rerun/:taskid/:serial', function (req, res) {

  var taskId = req.params.taskid
  var serial = req.params.serial

  exec('svn update', {cwd: '/var/stf/testproject2'}, function (err, stdout, stderr) {

    if (err) {
      res.json({
        success: false,
        result: '更新用例失败'
      })
    }
    else {
      dbapi.loadFailTestCase(taskId, serial).then(function (cases) {
        var target_cases = cases ? cases : {cases: []}
 	target_cases.cases = _.compact(target_cases.cases)
        res.json({
          success: true,
          cases: Array.prototype.concat.apply([], target_cases.cases)
        })
      })
    }
  })

})

router.get('/release/:serial', function (req, res) {

  var serial = req.params.serial
  var condition = {serial: serial}
  var data = {owner: null}
  dbapi.setDevice(condition, data).then(function (result) {

    res.json({
      success: true,
      result: '释放成功'
    })

  })
})

router.get('/scanCase', function (req, res) {

  var project_name = req.params.projectName
  var moduel_name = req.params.moduleName
  log.info(project_name, moduel_name)
  new Promise(function (resolve, reject) {
    var path = 'python /var/stf/vendor/scancase/main.py'
    exec(path, function (err, stdout, stderr) {
      var data = JSON.parse(stdout)
      resolve(data)
    })
  }).then(function (data) {
    return dbapi.updateOrInsert(data)
  }).then(function () {
    return dbapi.filterCase(project_name, moduel_name)
  }).then(function (cursor) {
    cursor.toArray(function (err, result) {
      if (err) {
        res.json({success: false, result: null})
      }
      else {
        res.json({
          success: true,
          result: result
        })
      }
    })
  })
/*  // 获取参数：项目名称/模块名称
  var project_name = req.params.projectName
  var moduel_name = req.params.moduleName
  log.info(project_name, moduel_name)

  new Promise(function (resolve, reject) {
    //初次启动，需要重新扫描
    if (global.init_need_scan) {
      //先把数据库清空
      dbapi.clearCase().then(function () {
        // 调用python
        var path = 'python /var/stf/vendor/scancase/main.py'
        log.info('case cleared')
        exec(path, function (err, stdout, stderr) {
          var data = JSON.parse(stdout)
          dbapi.saveCase(data).then(function () {
            log.info('cases inserted')
	    resolve()
          })
        })
      })
      global.init_need_scan = false
    }
    else {
      resolve()
    }
  })./*then(function () {
    while (true) {
      if (!global.is_operating_db) {
        break
      }
    }
  }).then(function () {
    // 在数据库里filter
    return new Promise(function (resolve, reject) {
      dbapi.filterCase(project_name, moduel_name).then(function (cursor) {
        cursor.toArray(function (err, result) {
          if (err) {
            res.json({success: false, result: null})
          }
          else {
            res.json({
              success: true,
              result: result
            })
          }
          resolve()
        })
      })
    })
  }).then(function () {
    if (!global.is_listening_case) {
      // 开启listenging
      log.info('start to listing...')
      fileutil.watch(dbapi)
      global.is_listening_case = true
    }
  })*/
})


router.get('/imgs/:taskid/:serial', function(req, res) {
  var taskid = req.params.taskid
  var serial = req.params.serial

  dbapi.getSerialImgs(taskid, serial).then(function(cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function(imgs) {
    var imgPath =  _.compact(_.uniq(Array.prototype.concat.apply([], Array.prototype.concat.apply([], imgs))))
    res.json({
      success: true,
      imgs: imgPath.map(function(img) {
        return taskid + img.split(taskid).pop()
      })
    })
  })
})

// 修改手机
router.get('/asset/modify/:serial', function (req, res) {

  var serial = req.params.serial
  dbapi.getDeviceAndSelection({serial: serial}).then(function (result) {
    result.s.sort(function (a, b) {
      return a.value - b.value
    })
    result.b.sort(function (a, b) {
      return b.value - a.value
    })

    var dpis = []
    result.dpis.forEach(function(obj) {
      if (obj.width && obj.height) {
        dpis.push(obj.width + 'x' + obj.height)
      }
    })
    result.dpis = _.uniq(dpis)

    res.json({
      success: true,
      result: result
    })
  })
})


router.post('/asset/modify/:serial', function (req, res) {
  var condition = {
    serial: req.params.serial
  }
  var data = {
    // 资产编号 
    assertNum: req.body.assertNum ? req.body.assertNum : '',
    // 手机名称
    markName: req.body.markName ? req.body.markName : '',
    // 位置编号
    locateNum: req.body.locateNum ? req.body.locateNum : '',
    // 品牌
    brand: req.body.brand,
    // 型号
    model: req.body.model,
    // 系统
    platform: req.body.platform,
    // 版本
    version: req.body.version,
    // 分辨率
    display: {width: req.body.dpis.split('x')[0], height: req.body.dpis.split('x')[1]},
    // 状态
    status: req.body.status,
    // 支持测试项
    support: req.body.support,
    // 备注
    memo: req.body.memo,
    // 是否root 默认非root
    root: req.body.root ? req.body.root : "2"
  }
  dbapi.setDevice(condition, data).then(function() {
    res.json({
      success: true,
      result: '更新成功'
    })
  })
})

router.get('/asset/selection', function(req, res) {

  dbapi.getSelection().then(function (result) {
    result.s.sort(function (a, b) {
      return a.value - b.value
    })
    result.b.sort(function (a, b) {
      return b.value - a.value
    })

    var dpis = []
    var version = []
    result.dpis.forEach(function(obj) {
      version.push(obj.version)
      if (obj.width && obj.height) {
        dpis.push(obj.width + 'x' + obj.height)
      }
    })
    result.dpis = _.uniq(dpis)
    result.version = _.uniq(version)
    res.json({
      success: true,
      result: result
    })
  })

})


router.post('/assets', function(req, res) {
 
  var brand = req.body.brand ? req.body.brand : []
  var os = req.body.os ? req.body.os : []
  var version = req.body.version ? req.body.version : []
  var support = req.body.support ? req.body.support : null
  dbapi.getDeviceByMany(brand, os, version, support).then(function(cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function(devices) {
    res.json({
      success: true,
      result: devices
    })
  })

})

router.get('/asset/delete/:serial', function(req, res) {
  var serial = req.params.serial
  dbapi.deleteDevice({serial: serial}).then(function(result) {
    res.json({
      success: true
    })
  })
})

router.get('/asset/export', function(req, res) {

  dbapi.getDevice().then(function(cursor) {

    var excel_conf ={};
    excel_conf.cols = [
        {caption:'资产名称', type:'string'},
        {caption:'资产编号', type:'string'},
        {caption:'操作系统', type:'string'},
        {caption:'版本', type:'string'},
        {caption:'型号', type:'string'},    
        {caption:'位置编号', type:'string'},
        {caption:'支持测试项', type:'string'},
        {caption:'分辨率', type:'string'},
        {caption:'厂商', type:'string'},
        {caption:'状态', type:'string'},
        {caption:'备注', type:'string'}
    ];
    var rows = []
    cursor.eachAsync(function (device) {
        var data = [
          'markName' in device ? device.markName : '',
          'assertNum' in device ? device.assertNum : '',
          'platform' in device ? device.platform : '',
          'version' in device ? device.version : '',
          'model' in device ? device.model : '',
          'locateNum' in device ? device.locateNum : '',
          'support' in device ? device.support : '',
          'display' in device && 'width' in device.display && 'height' in device.display ? device.display.width + '*' + device.display.height : '',
          'brand' in device ? device.brand : '',
          'status' in device ? device.status : '',
          'momo' in device ? device.memo : ''
        ]
        rows.push(data)
    }).then(function() {
      excel_conf.rows = rows
      var result = excel.execute(excel_conf);
      res.setHeader('Content-Type', 'application/vnd.openxmlformats');
      res.setHeader("Content-Disposition", "attachment; filename=" + "Report.xlsx");
      res.end(result, 'binary');
    })
  })
})

router.post('/task/process', function(req, res) {
  var taskids = req.body.taskid ? req.body.taskid : []
  dbapi.getProcess(taskids).then(function(cases) {

    var result = {}
    cases.forEach(function(caseinfo) {
        var taskid = caseinfo.taskid
        var allCaseCount = caseinfo.allcases.length
        var completedCaseCount = Array.prototype.concat.apply([], caseinfo.cases).length
        var serialsCount = caseinfo.serials.length
       // Array.prototype.concat.apply([], caseinfo.cases)

        result[taskid] = (completedCaseCount / (serialsCount * allCaseCount)) + '%'
    })
    res.json({
      success: true,
      result: result
    })
  })
})

router.post('/task/caseprocess', function(req, res) {
  var taskid = req.body.taskid

  dbapi.getCaseProcess(taskid).then(function(obj) {

    var result = {}
    obj.serials.forEach(function(serial) {
      var path = fileutil.join('/var/stf/testproject2', obj.projectName, obj.caseVersion, 'DFQP/src', serial)
      // 存在
      if(fileutil.exists(path)) {
        var completedCase = fileutil.list(path)
        _.remove(completedCase, function(n) {
          return n != 'screenshot' && n != 'TestReport.xml' && n != 'TestReport.xsl' && n != 'TestResult.xsl'
        })  
        result[serial] = (completedCase.length / obj.cases.length * 100) + '%'
      }
      else {
        result[serial]  = '0%'
      }
    })
    res.json({
      succes: true,
      result: result
    })
  })
})

router.post('/pack/apk', function (req, res) {

  var apkDir = '/var/stf/file/apk/'
  var projectName = '四川棋牌'
  var caseSet = 'default'
  var deviceSet = 'default'
  var testEnv = 0
  var module = '' // 子模块
  var fileID = uuid.v4()

  log.info("here comes apk")

  //生成multiparty对象，并配置打包平台的上传目标路径
  var form = new multiparty.Form({ uploadDir: apkDir });
  form.encoding = 'utf-8'
  new Promise(function (resolve, reject) {
    //上传完成后处理
    form.parse(req, function (err, fields, files) {

      log.info("xxxxxxx")
      log.info(JSON.stringify(fields))

      projectName = 'projectName' in fields ? fields.projectName[0] : projectName
      caseSet = 'caseSet' in fields ? fields.caseSet[0] : caseSet
      deviceSet = 'deviceSet' in fields ? fields.deviceSet[0] : deviceSet
      testEnv = 'testEnv' in fields ? fields.testEnv[0] : testEnv
	  module = 'module' in fields ? fields.module[0] : module

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
	log.info("before md5:", file)

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
	log.info(file)
    // 看一下存放apk的目录下有没有同样的apk
    var targetApkPath = fileutil.join(apkDir, 'pack_' + file.md5)
    if (!fileutil.exists(targetApkPath)) {
      // 不存在，则把临时目录移动到apk目录
      fileutil.rename(file.temFilePath, targetApkPath)
    }

    file.filePath = targetApkPath
	log.info("move file:", file)
    return file
  }).then(function (file) {
    // 解析apk
    return fileutil.parseApk(file)

  }).then(function (file) {
	log.info("after parse:", file)
    // 重打包
    //return fileutil.repack(file)
    return file

  }).then(function (file) {
    delete file.md5
    file.href = file.fileName

    if (fileutil.exists(file.temFilePath)) {
      // 把临时文件删除
      fs.unlinkSync(file.temFilePath)
    }
    delete file.temFilePath
	file.id = fileID
    // 存入数据库
    return dbapi.insertApk(file)

  }).then(function() {
    return dbapi.getCaseSetAndDeviceSet(caseSet, deviceSet)
    
  }).then(function (result) {
    var data = {
      body: {},
      user: {}
    }
    data.body.fileId = fileID
    data.user.email = 'pack_platform@boyaa.com'
    data.user.name = 'tools.oa'
    data.body.projectName = projectName
    data.body.testEnv = testEnv
	data.body.module = module
    data.body.version =  _.compact(_.uniq(Array.prototype.concat.apply([], result.version)))[0]
    data.body.memo = '【来自打包平台】'

    data.body.cases = _.compact(_.uniq(Array.prototype.concat.apply([], result.cases)))
    data.body.serials = _.compact(_.uniq(Array.prototype.concat.apply([], result.serials)))

    data.body.account = ''

    var taskid = new Date().getTime() + '_' + 'pack_platform'
    uitest(data, taskid)

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

})

router.get('/:taskid/:serial/report', function (req, res) {

  var taskid = req.params.taskid
  var serial = req.params.serial

  dbapi.loadActivityDetail(taskid).then(function (task) {

    if (task) {
      // _.find只会找第一个匹配的
      var target = _.find(task.detail, function (detail) {
        return detail.serial == serial
      })
      var logPath = fileutil.dirname(target.logs.report)
      // 判断日志文件是否存在
      if (!fileutil.exists(logPath)) {
        return res.json({
          result: false,
          message: '日志目录不存在'
        })
      }
      var archive = Archiver('zip')
      archive.on('error', function (err) {
        res.status(500).send({ error: err.message })
      })
      archive.on('end', function () {
        log.info('Archive wrote %d bytes', archive.pointer())
      })
      res.attachment(target.markName + '.zip')
      archive.pipe(res)
      archive.directory(logPath + '/', target.markName)
      archive.finalize()
    }
    else {
      return res.json({
        result: false,
        message: '任务不存在'
      })
    }
  })
})

// 删除用例集
router.delete('/caseset/:id', function (req, res) {
  var id = req.params.id
  dbapi.deleteCaseSet({ id: id }).then(function (result) {
    res.json({
      success: true,
      result: '删除成功'
    })
  })
})

// 新建用例集选项
router.get('/caseset', function(req, res) {
  dbapi.groupTestCase().then(function(cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function(list) {
    var result = {}
    // 当前用户
    var user = req.user.name

    list.forEach(function(group) {
      var project = group.group[0]
      var version = group.group[1]
      project in result ? result[project][version]= group.reduction: (result[project] = {}, result[project][version] = group.reduction)
    })
    res.json({
      succes: true,
      result: result
    })
  })
})

// 新建用例集
router.post('/caseset', function(req, res) {
 var setName = req.body.name
  var project = req.body.project
  var version = req.body.version
  var cases = req.body.cases
  var type = req.body.type
  var creator = req.user.name

  dbapi.filterCaseSet({ name: setName }).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    if (list.length != 0) {
      res.json({
        succes: false,
        result: '已存在同名用例集'
      })
    }
    else {
      dbapi.insertCaseSet({
        name: setName,
        project: project,
        version: version,
        // 0: 公共；1: 私有
        type: type,
        creator: creator,
        cases: cases
      }).then(function (result) {
        res.json({
          succes: true,
          result: '新增成功'
        })
      })
    }
  })

})

// 选择/展示用例集
router.get('/loadcaseset', function(req, res) {
  var project = req.query.project
  var version = req.query.version
  var user = req.user.name
  var condition = {}
  if (project) {
    condition.project = project
  }
  if (version) {
    condition.version = version
  }

  dbapi.filterCaseSet(condition).then(function(cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function(list) {
    // 去除非当前用户的私有
    _.remove(list, function (n) {
      return n.creator != user && n.type != 0
    })
    res.json({
      success: true,
      result: list
    })
  })
})


router.get('/caseset/:id', function(req, res) {

  var id = req.params.id
  dbapi.filterCaseSet({id: id}).then(function(cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function(list) {
    res.json({
      success: true,
      result: list
    })
  })
  
})

router.post('/caseset/:id', function(req, res) {
  var id = req.params.id

  var setName = req.body.name
  var project = req.body.project
  var version = req.body.version
  var cases = req.body.cases
  var type = req.body.type
  dbapi.filterCaseSet({ name: setName }).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    _.remove(list, function(n) {
      return n.id == id
    })
    if (list.length != 0) {
      res.json({
        succes: false,
        result: '已存在同名用例集'
      })
    }
    else {
      dbapi.updateCaseSet({ id: id }, {
        name: setName,
        project: project,
        version: version,
        type: type,
        cases: cases
      }).then(function (result) {
        res.json({
          success: true,
          result: '更新成功'
        })
      })
    }
  })
})

router.post('/performTest', function (req, res) {
  var projectName = req.body.projectName
  if (!projectName) {
    return res.json(200, {
      success: false,
      result: '请选择项目'
    })
  }
  var fileId = req.body.fileId
  if (!fileId) {
    return res.json(200, {
      success: false,
      result: '请上传APK文件'
    })
  }
  var serials = req.body.serials
  if (!serials) {
    return res.json(200, {
      success: false,
      result: '请选择机型'
    })
  }
  var account = req.body.account
  if (account) {
    try {
      req.body.account = {
        data: JSON.parse(account).map(function (user) {
          user['status'] = 'unuse'
          return user
        })
      }
    } catch (err) {
      return res.json(200, {
        success: false,
        result: '账号格式有误'
      })
    }
  }
  var userEmail = req.user.email
  var taskid = new Date().getTime() + '_' + userEmail.split('@')[0]
  performtest(req, taskid)
  res.json({
    success: true,
    taskid: taskid
  })
})

// 新增测试机集
router.post('/deviceset', function (req, res) {
  var name = req.body.name
  var device = req.body.device
  var type = req.body.type
  var creator = req.user.name
  dbapi.filterDeviceSet({ name: name }).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    if (list.length != 0) {
      res.json({
        succes: false,
        result: '已存在同名设备集'
      })
    }
    else {
      dbapi.insertDeviceSet({
        name: name,
        // 0: 公共；1: 私有
        type: type,
        creator: creator,
        device: device
      }).then(function (result) {
        res.json({
          succes: true,
          result: '新增成功'
        })
      })
    }
  })
})

// 展示测试机集
router.get('/deviceset', function (req, res) {

  var user = req.user.name
  dbapi.getDeviceSet().then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    _.remove(list, function (n) {
      // 0: 公共；1: 私有
      return n.creator != user && n.type != 0
    })
    res.json({
      success: true,
      result: list
    })
  })
})

router.delete('/deviceset/:id', function(req, res) {
  var id = req.params.id
  dbapi.deleteDeviceSet({id: id}).then(function(result) {
    res.json({
      succes: true,
      result: '删除成功'
    })
  })
})

router.post('/deviceset/:id', function(req, res) {
var id = req.params.id
  var name = req.body.name
  var device = req.body.device
  var type = req.body.type
  var creator = req.user.name

  dbapi.filterDeviceSet({ name: name }).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    _.remove(list, function(n) {
      return n.id == id
    })
    if (list.length != 0) {
      res.json({
        succes: false,
        result: '已存在同名设备集'
      })
    }
    else {
      dbapi.updateDeviceSet({ id: id }, { name: name, device: device, type: type, creator: creator }).then(function (result) {
        res.json({
          succes: true,
          result: '更新成功'
        })
      })
    }
  })
})

router.post('/filterPerform', function (req, res) {
  var taskId = req.body.taskId
  var os_version = req.body.os_version ? req.body.os_version : []
  var dpis = req.body.dpis ? req.body.dpis : []
  var manufacturer = req.body.manufacturer ? req.body.manufacturer : []

  os_version = (os_version instanceof Array) ? os_version : [os_version]
  dpis = (dpis instanceof Array) ? dpis : [dpis]
  manufacturer = (manufacturer instanceof Array) ? manufacturer : [manufacturer]

  var dpisStr = dpis.map(function (_dpis) {
    return _dpis[0] + 'x' + _dpis[1]
  })
  dbapi.filterPerform(taskId).then(function (obj) {
    if (!obj) {
      return res.json({ success: false, result: '任务不存在' })
    }
    // 过滤手机版本
    if (os_version.length > 0) {
      _.remove(obj.devices, function (d) {
        return !_.includes(os_version, d.version)
      })
    }
    // 过虑分辨率
    if (dpis.length > 0) {
      _.remove(obj.devices, function (d) {
        return !_.includes(dpisStr, d.width + 'x' + d.height)
      })
    }
    // 过滤manufacturer
    if (manufacturer.length > 0) {
      _.remove(obj.devices, function (d) {
        return !_.includes(manufacturer, d.manufacturer)
      })
    }
    var order = 0
    obj.devices.forEach(function (device) {
      order = order + 1
      device.order = order

      device.error = ''
      device.status = 'unfinish'
	  device.performance = {}
      device.performance.cpu = 0
      device.performance.fps = 0
      device.performance.launchTime = 0
      device.performance.mem = 0
      device.performance.netIn = 0
      device.performance.netOut = 0
      device.performance.netTotal = 0

      obj.detail.forEach(function (detail) {
        if (device.serial == detail.serial) {
          _.assign(device, detail)
          if (detail.cases.length) {
            //device.error = detail.cases[0].error
            //device.status = detail.cases[0].result
            device.error = ''
            device.status = 'finish'
            _.forEach(detail.cases, function(o) {
              device.error = device.error + o.error + '<br /><br />'
            })
          }

          if (device.performance) {

            device.performance.cpu = (!device.performance.cpu || device.performance.cpu === 'NaN') ? 0 : device.performance.cpu
            device.performance.fps = (!device.performance.fps || device.performance.fps === 'NaN') ? 0 : device.performance.fps
            device.performance.launchTime = (!device.performance.launchTime || isNaN(parseInt(device.performance.launchTime))) ? 0 : (parseInt(device.performance.launchTime) / 1000).toFixed(2) + 's'
            device.performance.mem = (!device.performance.mem || device.performance.mem === 'NaN') ? 0 : (device.performance.mem / 1024).toFixed(2)
            device.performance.netIn = (!device.performance.netIn || device.performance.netIn === 'NaN') ? 0 : (device.performance.netIn > 1024 ? (device.performance.netIn / 1024).toFixed(2) + 'MB' : device.performance.netIn + 'KB')
            device.performance.netOut = (!device.performance.netOut || device.performance.netOut === 'NaN') ? 0 : (device.performance.netOut > 1024 ? (device.performance.netOut / 1024).toFixed(2) + 'MB' : device.performance.netOut + 'KB')
            device.performance.netTotal = (!device.performance.netTotal || device.performance.netTotal === 'NaN') ? 0 : (device.performance.netTotal > 1024 ? (device.performance.netTotal / 1024).toFixed(2) + 'MB' : device.performance.netTotal + 'KB')


          }

          delete device.cases
        }
      })
    })
	delete obj.detail
    res.json({ success: true, result: obj })
  })
})

router.post('/loadPerformDetail', function (req, res) {

  var taskid = req.body.taskid
  var serial = req.body.serial
  var scene = req.body.scene ? (req.body.scene instanceof Array ? req.body.scene : [req.body.scene]) : []

dbapi.loadPerformDetail(taskid, serial).then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    if (list.length == 0) {
      return res.json({ succes: false, result: [] })
    }
    var scene = []
    // 场景
    _.forEach(list[0].performanceScenes, function (o) {
      if (o.data) {
        o.data.cpu = o.data.cpu === 'NaN' ? 0 : o.data.cpu
        o.data.fps = o.data.fps === 'NaN' ? 0 : o.data.fps
        o.data.mem = o.data === 'NaN' ? 0 : (o.data.mem > 1024 ? (o.data.mem / 1024).toFixed(2) + 'MB' : o.data.mem + 'KB')
        o.data.netIn = o.data.netIn === 'NaN' ? 0 : (o.data.netIn > 1024 ? (o.data.netIn / 1024).toFixed(2) + 'MB' : o.data.netIn + 'KB')
        o.data.netOut = o.data.netOut === 'NaN' ? 0 : (o.data.netOut > 1024 ? (o.data.netOut / 1024).toFixed(2) + 'MB' : o.data.netOut + 'KB')
        o.data.netTotal = o.data.netTotal === 'NaN' ? 0 : (o.data.netTotal > 1024 ? (o.data.netTotal / 1024).toFixed(2) + 'MB' : o.data.netTotal + 'KB')
        _.find(list[0].cases, function(o) { 

        })
		o.status = 'finish'
        scene.push(o)
    }

    })
    // 求均值即可
    if (list[0].performanceDetail.screen) {
      list[0].performanceDetail.screen = list[0].performanceDetail.screen.map(function (n) {
        return n == '' ? n : n.split('/var/stf/file')[1]
      })
    }

    if (list[0].performance) {
      _.forEach(Object.keys(list[0].performance), function(key) {
        if (isNaN(parseFloat(list[0].performance[key]))) {
          list[0].performance[key] = 0
        }
        if (key == 'launchTime') {
          list[0].performance[key] = (parseInt(list[0].performance[key]) / 1000).toFixed(2) + 's'
        }
        else if (key == 'netIn' || key == 'netOut' || key == 'netTotal') {
           list[0].performance[key] = list[0].performance[key] == 0 ? 0 : (list[0].performance[key] > 1024 ? (list[0].performance[key] / 1024).toFixed(2) + 'MB' : list[0].performance[key] + 'KB')
        }
        else if (key == 'mem') {
          list[0].performance[key] = list[0].performance[key] > 1024 ? (list[0].performance[key] / 1024).toFixed(2) + 'MB' : list[0].performance[key] + 'KB'
        }
      })
    }

    res.json({
      success: true,
      // 手机性能数据
      performance: list[0].performance,
      //所有场景
      scene: scene,
      //详细数据
      sceneDetail: list[0].performanceDetail
    })

  })

})

// 开放给打包平台 获取用例集名称
router.get('/cs', function (req, res) {
  dbapi.filterCaseSet().then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    var result = []
    _.forEach(list, function (n) {
      result.push(n.name)
    })
    res.json({
      succes: true,
      result: result
    })
  })
})
// 开放给打包平台 获取设备集名称
router.get('/ds', function (req, res) {
  dbapi.filterDeviceSet().then(function (cursor) {
    return Promise.promisify(cursor.toArray, cursor)()
  }).then(function (list) {
    var result = []
    _.forEach(list, function (n) {
      result.push(n.name)
    })
    res.json({
      succes: true,
      result: result
    })
  })
})

router.post('/travelTest', function (req, res) {
  var projectName = req.body.projectName
  if (!projectName) {
    return res.json(200, {
      success: false,
      result: '请选择项目'
    })
  }
  var fileId = req.body.fileId
  if (!fileId) {
    return res.json(200, {
      success: false,
      result: '请上传APK文件'
    })
  }
  var serials = req.body.serials
  if (!serials) {
    return res.json(200, {
      success: false,
      result: '请选择机型'
    })
  }
  var account = req.body.account
  if (account) {
    try {
      req.body.account = {
        data: JSON.parse(account).map(function (user) {
          user['status'] = 'unuse'
          return user
        })
      }
    } catch (err) {
      return res.json(200, {
        success: false,
        result: '账号格式有误'
      })
    }
  }
  var userEmail = req.user.email
  var taskid = new Date().getTime() + '_' + userEmail.split('@')[0]
  traveltest(req, taskid)
  res.json({
    success: true,
    taskid: taskid
  })
})

router.post('/casestatus', function(req, res) {
  var taskid = req.body.taskid
  var serial = req.body.serial
  var caseName = req.body.case
  var moduleName = req.body.module
  var targetStatus = req.body.status
  
  dbapi.modifyCaseStatus(taskid, serial, 'cases.' + moduleName + '.' + caseName, targetStatus).then(function(result) {
    res.json({
      success: true,
      result: result
    })
  })

})

global.is_operating_db = false
global.is_listening_case = false



module.exports = router
