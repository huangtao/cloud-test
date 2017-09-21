var http = require('http')
var url = require('url')
var fs = require('fs')
var path = require('path')
var apiv1= require('./apiv1')
var apiv2 = require('./apiv2')
var express = require('express')
var validator = require('express-validator')
var cookieSession = require('cookie-session')
var cookieParser= require('cookie-parser')
var bodyParser = require('body-parser')
var serveFavicon = require('serve-favicon')
var serveStatic = require('serve-static')
var csrf = require('csurf')
var Promise = require('bluebird')
var compression = require('compression')

var logger = require('../../util/logger')
var pathutil = require('../../util/pathutil')
var dbapi = require('../../db/api')
var dbapiv2 = require('../../db/apiv2')
var fileutil = require('../../util/fileutil')
var exec = require('child_process').exec
var spawn = require('child_process').spawn
var datautil = require('../../util/datautil')
var deallog = require('../../util/deallog')
var updateApkUserInfo = require('../storage/plugins/apk/task/updateApkUserInfo')

var auth = require('./middleware/auth')
var deviceIconMiddleware = require('./middleware/device-icons')
var browserIconMiddleware = require('./middleware/browser-icons')
var appstoreIconMiddleware = require('./middleware/appstore-icons')
var taskerrorlist = require('../report/taskErrorList')
var monkey = require('../monkey')
var report = require('../report')

var memwatch = require('memwatch-next')
var heapdump = require('heapdump')
//var leakutil = require('../../util/leakutil')

var markdownServe = require('markdown-serve')

module.exports = function(options) {
  var log = logger.createLogger('app')
  var app = express()
  var server = http.createServer(app)

  app.use('/static/wiki', markdownServe.middleware({
    rootDirectory: pathutil.root('node_modules/stf-wiki')
  , view: 'docs'
  }))

  app.set('view engine', 'pug')
  app.set('views', pathutil.resource('app/views'))
  app.set('strict routing', true)
  app.set('case sensitive routing', true)
  app.set('trust proxy', true)

  if (fs.existsSync(pathutil.resource('build'))) {
    log.info('Using pre-built resources')
    app.use(compression())
    app.use('/static/app/build/entry',
      serveStatic(pathutil.resource('build/entry')))
    app.use('/static/app/build', serveStatic(pathutil.resource('build'), {
      maxAge: '10d'
    }))
  }
  else {
    log.info('Using webpack')
    // Keep webpack-related requires here, as our prebuilt package won't
    // have them at all.
    var webpackServerConfig = require('./../../../webpack.config').webpackServer
    app.use('/static/app/build',
      require('./middleware/webpack')(webpackServerConfig))
  }

  //app.use('/image', express.static('/var/stf/file/uilog'))

  app.use('/image', express.static('/var/stf/file'))

  app.use('/static/bower_components',
    serveStatic(pathutil.resource('bower_components')))
  app.use('/static/app/data', serveStatic(pathutil.resource('data')))
  app.use('/static/app/status', serveStatic(pathutil.resource('common/status')))
  app.use('/static/app/browsers', browserIconMiddleware())
  app.use('/static/app/appstores', appstoreIconMiddleware())
  app.use('/static/app/devices', deviceIconMiddleware())
  app.use('/static/app', serveStatic(pathutil.resource('app')))

  app.use('/static/logo',
    serveStatic(pathutil.resource('common/logo')))
  app.use(serveFavicon(pathutil.resource(
    'common/logo/exports/STF-128.png')))

   app.use(cookieSession({
    name: options.ssid
   , keys: [options.secret]
   , domain: ".oa.com"
   //, maxAge: 24 * 60 * 60 * 1000
   }))


  log.info("app secret:", options.secret)
  log.info("app authUrl:", options.authUrl)
  app.use(auth({
    secret: options.secret
  , authUrl: options.authUrl
  }))


  // This needs to be before the csrf() middleware or we'll get nasty
  // errors in the logs. The dummy endpoint is a hack used to enable
  // autocomplete on some text fields.
  app.all('/app/api/v1/dummy', function(req, res) {
    res.send('OK')
  })

  app.use(bodyParser.json())
  app.use(bodyParser.urlencoded({ extended: true }))
  //app.use(bodyParser.urlencoded({ "limit":"10000kb"}))
  // app.use(csrf())
  app.use(validator())
  
 /* app.use(function(req, res, next) {
    res.('XSRF-TOKEN', req.csrfToken())
    next()
  })*/
  app.use('/app/api/v1',apiv1)
  app.use('/app/api/v2',apiv2)
  app.get('/', function(req, res) {
    res.render('index')
  })

  app.get('/app/api/stf/state.js', function(req, res) {
    var state = {
      config: {
        websocketUrl: (function() {
          var wsUrl = url.parse(options.websocketUrl, true)
          wsUrl.query.uip = req.ip
          return url.format(wsUrl)
        })()
      }
    , user: req.user
    }

    if (options.userProfileUrl) {
      state.config.userProfileUrl = (function() {
        return options.userProfileUrl
      })()
    }

    res.type('application/javascript')
    res.send('var GLOBAL_APPSTATE = ' + JSON.stringify(state))
  })
  
  //add by SissiWu @2016.07.01 start
  app.get('/monkey/demo', function(req, res) {
//    var monkey_map = {tips:"this is demo"}
//    res.send(monkey_map)
	log.info(req.url)
    dbapi.loadDevices()
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
        log.error('Failed to load device list: ', err.stack)
        res.json(500, {
          success: false
        })
      })
  });

  server.listen(options.port)
  log.info('App server Listening on port %d', options.port)

 global.init_need_scan = true
if (global.init_need_scan) {
  log.info('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii')
  function exists(a, b) {
    for (var i = 0; i < b.length; i++) {
      if (a.local_path == b[i].local_path && a.class_name == b[i].class_name) {
        return true
      }
    }
    return false
  }
  new Promise(function (resolve, reject) {
      var chunk = ''
      var scan = spawn('python', ['/var/stf/vendor/scancase/main.py'])
      scan.stdout.on('data', function(data) {
        chunk = chunk + data
      })
      scan.stdout.on('end', function (data) {
	try {
		data = JSON.parse(chunk)
		resolve(data)
	}
	catch(err) {
		log.info(err)
		resolve([])
	}
      })
  }).then(function (data) {
      if(data.length) {
        return new Promise(function (resolve, reject) {
          dbapiv2.filterCase(null, null).then(function (cursor) {
            cursor.toArray(function (err, cases) {
              var _p = []
              cases.forEach(function (c) {
                //在本地目录不存在,则删除
                if (!exists(c, data)) {
                  _p.push(dbapiv2.deleteCase({id: c.id}))
                }
              })
              Promise.all(_p).then(function (results) {
                resolve(data)
              })
            })
          })
        })
      }
      else {
        return data
      }

  }).then(function(data){
      return dbapiv2.updateOrInsert(data)
  }).then(function () {
    // 开启文件监听
    log.info('start to listing...')
    fileutil.watch(dbapiv2)
    global.init_need_scan = false
    global.is_operating_db = false
 

    log.info('checking memory...')
    memwatch.on('leak', function (info) {
	log.info('memeory leak', info)	
  	var file = '/tmp/stf-' + process.pid + '-' + Date.now() + '.heapsnapshot'
  	heapdump.writeSnapshot(file, function (err) {
    		if (err) log.info(err)
    		else log.info('Wrote snapshot: ' + file)
  	})
    })

  })
}

}
