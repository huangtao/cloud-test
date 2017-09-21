var http = require('http')

var express = require('express')
var validator = require('express-validator')
var cookieSession = require('cookie-session')
var bodyParser = require('body-parser')
var cookieParser= require('cookie-parser')
var serveStatic = require('serve-static')
var csrf = require('csurf')
var Promise = require('bluebird')
var basicAuth = require('basic-auth')

var logger = require('../../util/logger')
var requtil = require('../../util/requtil')
var jwtutil = require('../../util/jwtutil')
var pathutil = require('../../util/pathutil')
var urlutil = require('../../util/urlutil')
var lifecycle = require('../../util/lifecycle')

module.exports = function(options) {
  var log = logger.createLogger('auth-mock')
  var app = express()
  var server = Promise.promisifyAll(http.createServer(app))

  lifecycle.observe(function() {
    log.info('Waiting for client connections to end')
    return server.closeAsync()
      .catch(function() {
        // Okay
      })
  })

  // BasicAuth Middleware
  // var basicAuthMiddleware = function(req, res, next) {
  //   function unauthorized(res) {
  //     res.set('WWW-Authenticate', 'Basic realm=Authorization Required')
  //     return res.send(401)
  //   }

  //   var user = basicAuth(req)

  //   if (!user || !user.name || !user.pass) {
  //     return unauthorized(res)
  //   }

  //   if (user.name === options.mock.basicAuth.username &&
  //       user.pass === options.mock.basicAuth.password) {
  //     return next()
  //   }
  //   else {
  //     return unauthorized(res)
  //   }
  // }

  // app.set('view engine', 'pug')
  // app.set('views', pathutil.resource('auth/mock/views'))
  // app.set('strict routing', true)
  // app.set('case sensitive routing', true)

  app.use(cookieSession({
    name: options.ssid
   , keys: [options.secret]
   , domain: ".oa.com"
  }))
  app.use(bodyParser.json())
  // app.use(csrf())
   app.use(validator())
   app.use('/static/bower_components',
   serveStatic(pathutil.resource('bower_components')))
   // app.use('/static/auth/mock', serveStatic(pathutil.resource('auth/mock')))

  /*app.use(function(req, res, next) {
    res.cookie('XSRF-TOKEN', req.csrfToken())
    next()
  })*/

  app.use(cookieParser())


  // if (options.mock.useBasicAuth) {
  //   app.use(basicAuthMiddleware)
  // }

  app.get('/', function(req, res) {
     res.redirect('/auth/mock/')
  })


  app.get('/auth/mock/',function(req,res){
  if(!req.cookies.admin_key){
   // log.info('11111111111111111',res)
  // res.redirect('http://sso.oa.com/Index/login/appid/1458/')
    res.status(200)
          .json({
            success: false
            , redirect: 'http://sso.oa.com/Index/login/appid/1458/'
          })
    }
  else{
  // log.info('22222222222222')
   var urlpath='/api?do=getInfo&appid='+1458+'&uid='
    +req.cookies.admin_uid+'&key='+encodeURIComponent(req.cookies.admin_key)
    log.info('urlpath:',urlpath)
    var opts = {
        host: 'sso.oa.com', 
        port: 8871,
        path: urlpath, 
        method: 'GET', 
        headers: { 
            'Content-Type': 'application/json'
        }
    }
    log.info('opts',opts)
  var req = http.request(opts,function(res){
    res.setEncoding('utf8')
    res.on('data',function(chunk){
      log.info('aaaa',chunk)
      ssoreturn(chunk)
    })
  })
  req.end()

  function ssoreturn(chunk){
    //log.info('chunk',chunk)
    var chunkjson=JSON.parse(chunk)
    var token = jwtutil.encode({
        payload: {
          email: chunkjson.email
        , name: chunkjson.username
        }
      , secret: options.secret
      // , header: {
      //           exp: Date.now() + 24 * 3600
      //   }
      })
    log.info('chunk',chunkjson)
    log.info('chunk ret',chunkjson.ret)
      if(chunkjson.ret == 1){
        log.info('333333333')
        //res.redirect(urlutil.addParams(options.appUrl, {jwt: token}))

        res.status(200)
          .json({
            success: true
            , user_name: chunkjson.username
            , redirect: urlutil.addParams(options.appUrl, {
                  jwt: token
                })
            })
      }
      else{
        log.info('redirect.......')
        //res.redirect() 
        res.status(200)
          .json({
            success: false
            , user_name: chunkjson.username
            , redirect: 'sso.oa.com'
          })  
        //res.redirect('http://sso.oa.com/Index/login/appid/1450/')             
      }  
    }
    }
  })
  server.listen(options.port)
  log.info('Listening on port %d', options.port)
}
