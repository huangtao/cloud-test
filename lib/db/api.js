var r = require('rethinkdb')
var util = require('util')

var db = require('./')
var wireutil = require('../wire/util')
var logger = require('../util/logger')

var dbapi = Object.create(null)

dbapi.DuplicateSecondaryIndexError = function DuplicateSecondaryIndexError() {
  Error.call(this)
  this.name = 'DuplicateSecondaryIndexError'
  Error.captureStackTrace(this, DuplicateSecondaryIndexError)
}

util.inherits(dbapi.DuplicateSecondaryIndexError, Error)
var log = logger.createLogger('db:api')

dbapi.close = function(options) {
  return db.close(options)
}

dbapi.saveUserAfterLogin = function(user) {
  return db.run(r.table('users').get(user.email).update({
      name: user.name
    , ip: user.ip
    , lastLoggedInAt: r.now().inTimezone('+08:00')
    }))
    .then(function(stats) {
      if (stats.skipped) {
        return db.run(r.table('users').insert({
          email: user.email
        , name: user.name
        , ip: user.ip
        , group: wireutil.makePrivateChannel()
        , lastLoggedInAt: r.now().inTimezone('+08:00')
        , createdAt: r.now().inTimezone('+08:00')
        , forwards: []
        , settings: {}
        }))
      }
      return stats
    })
}

dbapi.loadUser = function(email) {
  return db.run(r.table('users').get(email))
}

dbapi.loadTaskList = function(user){
  //return db.run(r.table('tasklist').filter(r.row('useremail').match(user)).orderBy("committime"))
  return db.run(r.table('tasklist').orderBy("committime"))
}


// dbapi.loadTaskDetail = function(taskid){
//   return db.run(r.table('tasklist').get(taskid).getField('detail'))
// }

dbapi.updateUserSettings = function(email, changes) {
  return db.run(r.table('users').get(email).update({
    settings: changes
  }))
}

dbapi.updateApkinfo= function(id,data){
  return db.run(r.table('apkinfo').get(id).update(data))
}


dbapi.resetUserSettings = function(email) {
  return db.run(r.table('users').get(email).update({
    settings: r.literal({})
  }))
}

dbapi.insertUserAdbKey = function(email, key) {
  return db.run(r.table('users').get(email).update({
    adbKeys: r.row('adbKeys').default([]).append({
      title: key.title
    , fingerprint: key.fingerprint
    })
  }))
}

dbapi.deleteUserAdbKey = function(email, fingerprint) {
  return db.run(r.table('users').get(email).update({
    adbKeys: r.row('adbKeys').default([]).filter(function(key) {
      return key('fingerprint').ne(fingerprint)
    })
  }))
}

dbapi.lookupUsersByAdbKey = function(fingerprint) {
  return db.run(r.table('users').getAll(fingerprint, {
    index: 'adbKeys'
  }))
}

dbapi.lookupUserByAdbFingerprint = function(fingerprint) {
  return db.run(r.table('users').getAll(fingerprint, {
      index: 'adbKeys'
    })
    .pluck('email', 'name', 'group'))
    .then(function(cursor) {
      return cursor.toArray()
    })
    .then(function(groups) {
      switch (groups.length) {
        case 1:
          return groups[0]
        case 0:
          return null
        default:
          throw new Error('Found multiple users for same ADB fingerprint')
      }
    })
}

dbapi.lookupUserByVncAuthResponse = function(response, serial) {
  return db.run(r.table('vncauth').getAll([response, serial], {
      index: 'responsePerDevice'
    })
    .eqJoin('userId', r.table('users'))('right')
    .pluck('email', 'name', 'group'))
    .then(function(cursor) {
      return cursor.toArray()
    })
    .then(function(groups) {
      switch (groups.length) {
        case 1:
          return groups[0]
        case 0:
          return null
        default:
          throw new Error('Found multiple users with the same VNC response')
      }
    })
}

dbapi.loadGroup = function(email) {
	log.info(email)
  return db.run(r.table('devices').getAll(email, {
    index: 'owner'
  }))
}

dbapi.loadUserDevices = function(email) {
  return db.run(r.table('devices').getAll(email, {
    index: 'owner'
  }))
}

dbapi.saveDeviceLog = function(serial, entry) {
  return db.run(r.table('logs').insert({
      serial: entry.serial
    , timestamp: r.epochTime(entry.timestamp)
    , priority: entry.priority
    , tag: entry.tag
    , pid: entry.pid
    , message: entry.message
    }
  , {
      durability: 'soft'
    }))
}

dbapi.saveDeviceInitialState = function(serial, device) {
  var data = {
    present: false
  , presenceChangedAt: r.now().inTimezone('+08:00')
  , provider: device.provider
  , owner: null
  , status: device.status
  , statusChangedAt: r.now().inTimezone('+08:00')
  , ready: false
  , reverseForwards: []
  , remoteConnect: false
  , remoteConnectUrl: null
  , usage: null
  }
  log.info(device)
  return db.run(r.table('devices').get(serial).update(data))
    .then(function(stats) {
      if (stats.skipped) {
        data.serial = serial
        data.createdAt = r.now().inTimezone('+08:00')
        return db.run(r.table('devices').insert(data))
      }
      return stats
    })
}

dbapi.setDeviceConnectUrl = function(serial, url) {
  return db.run(r.table('devices').get(serial).update({
    remoteConnectUrl: url
  , remoteConnect: true
  }))
}

dbapi.unsetDeviceConnectUrl = function(serial, url) {
  return db.run(r.table('devices').get(serial).update({
    remoteConnectUrl: null
  , remoteConnect: false
  }))
}

dbapi.saveDeviceStatus = function(serial, status) {
  return db.run(r.table('devices').get(serial).update({
    status: status
  , statusChangedAt: r.now().inTimezone('+08:00')
  }))
}

dbapi.setDeviceOwner = function(serial, owner) {
  //log.info(owner)
  /*if(owner.name=='YorickYe'){
   return
  }*/
  return db.run(r.table('devices').get(serial).update({
    owner: owner
  }))
}

dbapi.unsetDeviceOwner = function(serial) {
  return db.run(r.table('devices').get(serial).update({
    owner: null,
    remoteConnect: false,
    remoteConnectUrl: null
  }))
}

dbapi.setDevicePresent = function(serial) {
  return db.run(r.table('devices').get(serial).update({
    present: true
  , presenceChangedAt: r.now().inTimezone('+08:00')
  }))
}

dbapi.setDeviceAbsent = function(serial) {
  return db.run(r.table('devices').get(serial).update({
    present: false
  , presenceChangedAt: r.now().inTimezone('+08:00')
  }))
}

dbapi.setDeviceUsage = function(serial, usage) {
  return db.run(r.table('devices').get(serial).update({
    usage: usage
  , usageChangedAt: r.now().inTimezone('+08:00')
  }))
}

dbapi.unsetDeviceUsage = function(serial) {
  return db.run(r.table('devices').get(serial).update({
    usage: null
  , usageChangedAt: r.now().inTimezone('+08:00')
  }))
}

dbapi.setDeviceAirplaneMode = function(serial, enabled) {
  return db.run(r.table('devices').get(serial).update({
    airplaneMode: enabled
  }))
}

dbapi.setDeviceBattery = function(serial, battery) {
  return db.run(r.table('devices').get(serial).update({
      battery: {
        status: battery.status
      , health: battery.health
      , source: battery.source
      , level: battery.level
      , scale: battery.scale
      , temp: battery.temp
      , voltage: battery.voltage
      }
    }
  , {
      durability: 'soft'
    }))
}

dbapi.setDeviceBrowser = function(serial, browser) {
  return db.run(r.table('devices').get(serial).update({
    browser: {
      selected: browser.selected
    , apps: browser.apps
    }
  }))
}

dbapi.setDeviceConnectivity = function(serial, connectivity) {
  return db.run(r.table('devices').get(serial).update({
    network: {
      connected: connectivity.connected
    , type: connectivity.type
    , subtype: connectivity.subtype
    , failover: !!connectivity.failover
    , roaming: !!connectivity.roaming
    }
  }))
}

dbapi.setDevicePhoneState = function(serial, state) {
  return db.run(r.table('devices').get(serial).update({
    network: {
      state: state.state
    , manual: state.manual
    , operator: state.operator
    }
  }))
}

dbapi.setDeviceRotation = function(serial, rotation) {
  return db.run(r.table('devices').get(serial).update({
    display: {
      rotation: rotation
    }
  }))
}

dbapi.setDeviceNote = function(serial, note) {
  return db.run(r.table('devices').get(serial).update({
    notes: note
  }))
}

//add by SissiWu @2016.05.27 start
dbapi.setDeviceAssetNum = function(serial, assetNum) {
	  return db.run(r.table('devices').get(serial).update({
		  assetNum: assetNum
	  }))
	}
//add by SissiWu @2016.05.27 end

dbapi.setDeviceReverseForwards = function(serial, forwards) {
  return db.run(r.table('devices').get(serial).update({
    reverseForwards: forwards
  }))
}

dbapi.setDeviceReady = function(serial, channel) {
  return db.run(r.table('devices').get(serial).update({
    channel: channel
  , ready: true
  , owner: null
  , reverseForwards: []
  }))
}

dbapi.saveDeviceIdentity = function(serial, identity) {
  return db.run(r.table('devices').get(serial).update({
    platform: identity.platform
  , manufacturer: identity.manufacturer
  , operator: identity.operator
  , model: identity.model
  , version: identity.version
  , abi: identity.abi
  , sdk: identity.sdk
  , display: identity.display
  , phone: identity.phone
  , product: identity.product
  }))
}

dbapi.searchPhoneSerial = function(manufacturer,version,width,height){
  //log.info("0x88",manufacturer.length,version.length,width,height)
  var ret=0
  if(manufacturer.length>0){
    ret|=0x01
  }
  if(version.length>0){
    ret|=0x02
  }
  if(width.length>0){
    ret|=0x04
  }
  // 0x01=00000001
  // 0x02=00000010
  // 0x04=00000100
  //log.info("0x88",ret)
  switch (ret){
  case 0 :
    return db.run(r.table("devices").filter(r.row('present').eq(true)).getField('serial'))
  case 1 :
    return db.run(r.table("devices").filter(function (doc){
            return r.expr(manufacturer).contains(doc("manufacturer"))
           }).filter(r.row('present').eq(true)).getField('serial'))
  case 2 :
    return db.run(r.table("devices").filter(function (doc){
            return r.expr(version).contains(doc("version"))
           }).filter(r.row('present').eq(true)).getField('serial'))
  case 3 :
    return db.run(r.table("devices").filter(function (doc){
           return r.expr(manufacturer).contains(doc("manufacturer"))
            .and(r.expr(version).contains(doc("version")))
           }).filter(r.row('present').eq(true)).getField('serial'))
  case 4 :
    return db.run(r.table("devices").filter(function (doc){
           return r.expr(width).contains(doc("display")("width"))
            .and(r.expr(height).contains(doc("display")("height")))
           }).filter(r.row('present').eq(true)).getField('serial'))
  case 5 :
    return db.run(r.table("devices").filter(function (doc){
           return r.expr(manufacturer).contains(doc("manufacturer"))
            .and(r.expr(width).contains(doc("display")("width")))
            .and(r.expr(height).contains(doc("display")("height")))
           }).filter(r.row('present').eq(true)).getField('serial'))
  case 6 :
    return db.run(r.table("devices").filter(function (doc){
           return r.expr(version).contains(doc("version"))
            .and(r.expr(width).contains(doc("display")("width")))
            .and(r.expr(height).contains(doc("display")("height")))
           }).filter(r.row('present').eq(true)).getField('serial'))
  case 7 :
    return db.run(r.table("devices").filter(function (doc){
           return r.expr(manufacturer).contains(doc("manufacturer"))
           .and(r.expr(version).contains(doc("version")))
           .and(r.expr(width).contains(doc("display")("width")))
           .and(r.expr(height).contains(doc("display")("height")))
           }).filter(r.row('present').eq(true)).getField('serial'))
  default:
          throw new Error('input ret error')
  }
}
//add by YorickYe

dbapi.createTask = function(data){
  log.info('Create Task Data',data)
  if(data.tasktype =='monkey')
  return db.run(r.table('tasklist').insert({
          taskid: data.taskid,
          useremail:data.useremail,
          userName: data.userName,
          tasktype:data.tasktype,
          apkurl: data.apkurl,
          fileID: data.fileID,
          rpturl:null,
          projectName:data.projectName,
          allstatus:'unfinish',
          detail:data.detail,
          committime: r.now().inTimezone('+08:00'),

          appName: data.appName,
          appVersion: data.appVersion,
          appCode: data.appCode

         }))
  else if (data.tasktype == 'activityTest')
     return db.run(r.table('tasklist').insert({
              taskid: data.taskid,
              testName: data.testName,
              testDesc: data.testDesc,
              useremail: data.useremail,
              userName: data.userName,
              tasktype: data.tasktype,
              projectName:data.projectName,
              allstatus: data.allstatus,
              activityUrl: data.activityUrl,
              screenOrientation: data.screenOrientation,
              detail: data.detail,
              committime: r.now().inTimezone('+08:00')
         }))
  else if (data.tasktype == 'uiTest' || data.tasktype == 'performTest' || data.tasktype == 'travelTest') {
	data.committime = r.now().inTimezone('+08:00')
    return db.run(r.table('tasklist').insert(
		data
		/*{
      taskid: data.taskid,
      useremail: data.useremail,
      userName: data.userName,
      tasktype: data.tasktype,
      fileID: data.fileID,
      apkurl: data.apkurl,
      projectName: data.projectName,
      testEnv: data.testEnv,
      rpturl: data.rpturl,
      allstatus: data.allstatus,
      detail: data.detail,
      committime: r.now().inTimezone('+08:00'),
      caseVersion: data.caseVersion,
      memo: data.memo,
      cases: data.cases,
      serials: data.serials,

      appName: data.appName,
      appVersion: data.appVersion,
      appCode: data.appCode,

      account: data.account,
      accountPath: data.accountFilePath

    }*/
))
  }
   else
     return "Insert Data fail"
}

dbapi.createDevicetask=function(taskData){
    log.info("taskdata:", taskData)
    return db.run(r.table('devicetask').insert(taskData))
}

dbapi.saveTaskStatus = function(taskid, newdata){
  return db.run(r.table('tasklist').get(taskid).update({
    detail:r.row('detail').default([]).append(newdata)
  }))
}

dbapi.saveSendEmail = function(groupsdata){
  return db.run(r.table('sendemail').insert(groupsdata))
}

dbapi.loadSendEmail = function(taskid){
  return db.run(r.table('sendemail').get(taskid))
}

dbapi.updateTaskReport = function(taskid,newdata){
  //log.info("0x888",taskid,newdata)
  return db.run(r.table('tasklist').get(taskid).update(newdata))
}

dbapi.updatedevicetaskStatus = function(taskid,newdata){
  return db.run(r.table('devicetask').get(taskid).update(newdata))
}

dbapi.getTaskDeviceUrl = function(taskid){
  //return db.run(r.table('tasklist').get(taskid))

  var query = r.db('stf').table('tasklist').get(taskid).do(function (task) {

    return r.branch(
      task,
      {
        tasktype: task('tasktype'),
        apk: r.branch(
          task('fileID').default(null),
          r.db('stf').table('apkinfo').get(task('fileID')).pluck('appName', 'href', 'versionName', 'versionCode', 'package', 'launchActivity', 'appiconpath'),
          null
        ),
      
        starttime: task('detail').min('starttime')('starttime').default(''),
        endtime: task('detail').max('endtime')('endtime').default(''),

        detail: task('detail').eqJoin('serial', r.db('stf').table('devices')).map(function (obj) {
          return {
            logs: obj('left')('logs').default(null),
            manufacturer: obj('left')('manufacturer'),
            serial: obj('left')('serial'),
            screenCap: obj('left')('screenCap').default(null),
            starttime: obj('left')('starttime').default(''),
            endtime: obj('left')('endtime').default(''),
            version: obj('right')('version'),
            width: obj('right')('display')('width').default(''),
            height: obj('right')('display')('height').default(''),
            markName: obj('right')('markName').default(''),
            model: obj('left')('model'),
            cases: obj('left')('cases').default([]).map(function (c) {
              return c('result')
            })
          }
        })

      },
      null
    )
  })
  return db.run(query)
}

//add by yorickye

dbapi.loadDevices = function (brand, osVersion, width_height, free) {
  var brand = brand ? brand : []
  var osVersion = osVersion ? osVersion : []
  var width_height = width_height ? width_height : []
  var free = free ? free : []
  var query = r.table('devices').filter(function (device) {
      return r.branch(r.expr(brand).count().ne(0),
        r.expr(brand).contains(device('brand')),
        true
      )
    }
  ).filter(function (device) {
      return r.branch(r.expr(osVersion).count().ne(0),
        r.expr(osVersion).contains(device('version').default('4.4.4')),
        true
      )
    }
  ).filter(function (device) {
      return r.branch(r.expr(width_height).count().ne(0),
        r.expr(width_height).contains([device('display')('width'), device('display')('height')]),
        true
      )
    }
  )
  var freeCount = eval(free.join('+'));
  // 1,2,4
  switch (freeCount) {
    // 空闲
    case 1:
      query = query.filter({owner: null, present: true})
      break
    // 占用
    case 2:
      query = query.filter(r.row('owner').ne(null)).filter({present: true})
      break
    // 离线
    case 4:
      query = query.filter({present: false})
      break
    // 空闲 + 占用
    case 3:
      query = query.filter(function (obj) {
        return (obj('owner').eq(null).and(obj('present').eq(true))).or(obj('owner').ne(null).and(obj('present').eq(true)))
      })
      break
    // 空闲 + 离线
    case 5:
      query = query.filter(function (obj) {
        return (obj('owner').eq(null).and(obj('present').eq(true))).or(obj('present').eq(false))
      })
      break
    // 占用 + 离线
    case 6:
      query = query.filter(function (obj) {
        return (obj('owner').ne(null).and(obj('present').eq(true))).or(obj('present').eq(false))
      })
  }
  //log.info(query.toString())
  return db.run(query)
}

dbapi.loadFreeDevices = function() {
  return db.run(r.table("devices")
        .filter(r.row('owner').eq(null).and(r.row('present').eq(true))).getField('serial'))
}

dbapi.loaddevicetaskserial= function(taskid){
  return db.run(r.table("devicetask").get(taskid)("serials"))
}

dbapi.loaddevicetaskstatus= function(){
  return db.run(r.table("devicetask").orderBy('taskid'))
}


dbapi.loadApkinfo = function(id){
  return db.run(r.table('apkinfo').get(id))
}


dbapi.loadUserApkinfo = function(){
  return db.run(r.table('apkinfo').filter(r.row('projectName').ne('unknown')))
}

dbapi.loadPhonemode = function(){
  return db.run(r.table('devices').filter(r.row('present').eq(true))
    .withFields('serial','manufacturer','version','display'))
}

dbapi.loadPhonedpi =function(){
  return db.run(r.table('devices').filter(r.row('present').eq(true)).getField('display'))
}


dbapi.loadPresentDevices = function() {
  return db.run(r.table('devices').getAll(true, {
    index: 'present'
  }))
}

dbapi.connectedDevice = function(serial) {
  return db.run(r.table('devices').get(serial)('present'))
}

dbapi.loadDevice = function(serial) {
  return db.run(r.table('devices').get(serial))
}

dbapi.saveApkinfo= function(apkdata){
  return db.run(r.table('apkinfo').insert(apkdata))
}

dbapi.saveUserAccessToken = function(email, token) {
  return db.run(r.table('accessTokens').insert({
    email: email
  , id: token.id
  , title: token.title
  , jwt: token.jwt
  }))
}

dbapi.removeUserAccessToken = function(email, title) {
  return db.run(r.table('accessTokens').getAll(email, {
    index: 'email'
  }).filter({title: title}).delete())
}

dbapi.removedevicetask=function(taskid){
  return db.run(r.table('devicetask').get(taskid).delete())
}

dbapi.removeSendemail=function(taskid){
  return db.run(r.table('sendemail').get(taskid).delete())
}

dbapi.loadAccessTokens = function(email) {
  return db.run(r.table('accessTokens').getAll(email, {
    index: 'email'
  }))
}

dbapi.loadProject = function(){
  return db.run(r.table('ProjectInfo').getField('projectName'))
  //return db.run(r.table('ProjectInfo').pluck('label','value'))
}

dbapi.saveProjectName =function(projectName){
  return db.run(r.table('ProjectInfo').insert(projectName))
}

dbapi.loadAccessToken = function(id) {
  return db.run(r.table('accessTokens').get(id))
}

dbapi.loadTaskDetailwithAppName = function(taskid){
  return db.run(r.table('tasklist').filter(r.row('tasktype').eq('monkey'))
         .innerJoin(r.table('apkinfo'),function (tasklist, apkinfo) {
         return tasklist('fileID').eq(apkinfo('id'));
         })
        .map({
          id: r.row('right')('id'),
          detail:r.row('left')('detail'),
          taskid:r.row('left')('taskid'),
          appName: r.row('right')('appName'),
          versionName:r.row('right')('versionName'),
		  fileID: r.row('left')('fileID').default('')
        })
        .filter(r.row('taskid').eq(taskid)))
}

dbapi.loadTaskDevdetail = function (taskid) {
  return db.run(r.table('tasklist').get(taskid)('detail')
    .innerJoin(r.table('devices'),function(taskserial,devdetail){
      return taskserial('serial').eq(devdetail('serial'));
    })
    .map({
      serial:r.row('left')('serial'),
      //logs: r.row('left')('logs'),
      model:r.row('left')('model'),
      //performance:r.row('left')('performance'),
      result:r.row('left')('result'),
      //screenCap:r.row('left')('screenCap'),
      status:r.row('left')('status'),
      statusCode:r.row('left')('statusCode'),
      version:r.row('right')('version'),
      height:r.row('right')('display')('height'),
      width:r.row('right')('display')('width')
    }).distinct())
}

dbapi.loadtaskList=function(timepast,timenow){
  var past=parseInt(timepast)
  var now=parseInt(timenow)
  return db.run(r.table('tasklist').innerJoin(
  r.table('apkinfo'),
  function (tasklist, apkinfo) {
    return tasklist('fileID').eq(apkinfo('id'));
  })
  .map({
  id: r.row('right')('id'),
  taskid:r.row('left')('taskid'),
  appName: r.row('right')('appName'),
  projectName:r.row('right')('projectName'),
  committime:r.row('left')('committime').toEpochTime(),
  userName:r.row('left')('userName'),
  fileID:r.row('left')('fileID'),
  allstatus:r.row('left')('allstatus')
  })
  .filter(r.row('committime').gt(past)
  .and(r.row('committime').lt(now))))
}

dbapi.selecttasklist = function(projectName,timepast,timenow){
  var past=parseInt(timepast)
  var now=parseInt(timenow)
  return db.run(r.table('tasklist').innerJoin(
  r.table('apkinfo'),
  function (tasklist, apkinfo) {
    return tasklist('fileID').eq(apkinfo('id'));
  })
  .map({
  id: r.row('right')('id'),
  taskid:r.row('left')('taskid'),
  appName: r.row('right')('appName'),
  projectName:r.row('right')('projectName'),
  committime:r.row('left')('committime').toEpochTime(),
  userName:r.row('left')('userName'),
  fileID:r.row('left')('fileID'),
  allstatus:r.row('left')('allstatus')
  })
  .filter(r.row('projectName').eq(projectName)
  .and((r.row('committime').gt(past))
  .and(r.row('committime').lt(now)))))
}

dbapi.Loadtasklistdetail= function(taskid){
  return db.run(r.table('tasklist').get(taskid)('detail'))
}

dbapi.Loadlogcat = function(taskid,serial){
  return db.run(r.table('tasklist').get(taskid)('detail')
    .filter(r.row('serial').eq(serial))('logs')('logcatLog'))
}

dbapi.loadRecommendDevices=function(){
  return db.run(r.table('devices').filter(r.row('present').eq(true))
        .pluck('version','display','model','manufacturer','serial'))
}

dbapi.loadActivityTask = function (taskid) {
  return db.run(r.table('tasklist').get(taskid)
    .pluck('taskid','allstatus','committime','activityUrl','projectName','testName','userName','testDesc'))
}

dbapi.loadActivityTaskDetail=function(taskid){
  return db.run(r.table('tasklist').get(taskid)('detail')
    .innerJoin(r.table('devices'),function(taskserial,devdetail){
      return taskserial('serial').eq(devdetail('serial'));
    })
    .map({
      serial:r.row('left')('serial'),
      screenCap:r.row('left')('screenCap'),
      version:r.row('right')('version'),
      height:r.row('right')('display')('height'),
      width:r.row('right')('display')('width'),
      manufacturer:r.row('right')('manufacturer')
    }))
}

dbapi.loadtasktype= function(taskid){
  return db.run(r.table("tasklist").get(taskid)('tasktype'))
}

// dbapi.loadTaskListbyTime= function(timepast,timenow){
//     var past=parseInt(timepast)
//     var now=parseInt(timenow)
//   return db.run(r.table('tasklist').filter((r.row('committime').toEpochTime().gt(past)).and(r.row('committime').toEpochTime().lt(now))))
// }

dbapi.loadUITestDetail = function (taskid) {

var query = r.db('stf').table('tasklist').get(taskid).do(function (obj) {
    return r.branch(obj,
      {
        projectName: obj('projectName'),
        testEnv: obj('testEnv'),
        committer: obj('userName'),
        commitTime: obj('committime'),
        startTime: obj('detail').min('starttime')('starttime').default(null), //r.branch(obj.hasFields('starttime'), obj('starttime'), r.now()), //obj('starttime'),
        endTime: obj('detail').max('endtime')('endtime').default(null),
        status: obj('allstatus'),

        appName: obj('appName').default(''),
        appVersion: obj('appVersion').default(''),
        appCode: obj('appCode').default(''),
		caseVersion: obj('caseVersion').default(''),
        taskType: obj('tasktype'),
        memo: obj('memo').default(null),
        devices: obj('serials').map(function (s) {
          return {
            serial: s
          }
        }).eqJoin('serial', r.db('stf').table('devices')).map(function (device) {
          return {
            serial: device('left')('serial'),
            version: device('right')('version'),
            markName: device('right')('markName').default(''),
            height: device('right')('display')('height'),
            width: device('right')('display')('width'),
            manufacturer: device('right')('manufacturer')

          }
        })
      },
      {})
  })
  return db.run(query)
}

dbapi.getCaseByIds = function (ids) {
  var query = r.expr(ids).map(function (ss) {
    return {
      id: ss
    }
  }).innerJoin(r.db('stf').table('testCase'), function (a, b) {
    return a('id').eq(b('id'))
  }).map(function (data) {
    return {
      id: data('right')('id'),
      class_name: data('right')('class_name'),
      local_path: data('right')('local_path'),
      base_url: data('right')('base_url')
    }
  })
  return db.run(query)
}

dbapi.getadbhost = function (serial) {
 return db.run(r.table('devices').get(serial)('provider')('name'))
}

dbapi.updateApkInfo = function (condition, obj) {
  var query = r.table('apkinfo')
  if (condition) {
    query = query.filter(condition)
  }
  query = query.update(obj)
  return db.run(query)
}

dbapi.appendCompletedDevices = function(taskid, serial) {
  return db.run(r.table('tasklist').get(taskid).update({
    // 增加一个已经完成的字段，这样报告页面不用去查询detail字段，可以加快查询速度
    completedDevice: r.row('completedDevice').default([]).append(serial)
  }))
}

dbapi.getPycharmPro = function (cases) {
  var query = r.db('stf').table('testCase').innerJoin(cases, function (a, b) {
    return a('id').eq(b)
  }).map(function (c) {
    return c('left')('pycharm_project').default('')
  }).distinct()
  return db.run(query)
}

dbapi.loadPerform = function (taskid) {
  var query = r.db('stf').table('tasklist').get(taskid).do(function (obj) {
    return r.branch(obj,
      {
        projectName: obj('projectName'),
        testEnv: obj('testEnv'),
        committer: obj('userName'),
        commitTime: obj('committime'),
        startTime: obj('detail').min('starttime')('starttime').default(null), //r.branch(obj.hasFields('starttime'), obj('starttime'), r.now()), //obj('starttime'),
        endTime: obj('detail').max('endtime')('endtime').default(null),
        status: obj('allstatus'),
        appName: obj('appName').default(''),
        appVersion: obj('appVersion').default(''),
        appCode: obj('appCode').default(''),
        caseVersion: obj('caseVersion').default(''),
        taskType: obj('tasktype'),
        memo: obj('memo').default(null),
        devicePerformance: obj('detail').map(function(detail) {
          return {
            serial: detail('serial'),
            performance: detail('performance')
          }
        }),
        devices: obj('serials').map(function (s) {
          return {
            serial: s
          }
        }).eqJoin('serial', r.db('stf').table('devices')).map(function (device) {
          return {
            serial: device('left')('serial'),
            version: device('right')('version'),
            markName: device('right')('markName').default(''),
            height: device('right')('display')('height'),
            width: device('right')('display')('width'),
            manufacturer: device('right')('manufacturer')

          }
        })
      },
      {})
  })
  return db.run(query)
}
module.exports = dbapi
