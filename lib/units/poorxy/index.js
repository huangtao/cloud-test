var http = require('http')

var express = require('express')
var httpProxy = require('http-proxy')

var logger = require('../../util/logger')

module.exports = function(options) {
  var log = logger.createLogger('poorxy')
  var app = express()
  var server = http.createServer(app)
  var proxy = httpProxy.createProxyServer()

  proxy.on('error', function(err) {
    log.error('Proxy had an error', err.stack)
  })

  app.set('strict routing', true)
  app.set('case sensitive routing', true)
  app.set('trust proxy', true)

  // app.all('*', function(req, res, next) {
  //   var data=['http://sso.oa.com/','http://cloud-test.oa.com']
  //   var origin = req.headers.origin;
  //   log.info('origin',origin)
  //   if(data.indexOf(origin) > -1){
  //      res.setHeader('Access-Control-Allow-Origin', origin);
  //   }

  //   // res.header('Access-Control-Allow-Origin:',)
  //   res.header('Access-Control-Allow-Headers', 'X-Requested-With,Content-Type')
  //   res.header('Access-Control-Allow-Credentials', true)
  //   res.header('Access-Control-Allow-Methods','PUT,POST,GET,DELETE,OPTIONS')
  //   res.header('X-Powered-By','3.2.1')
  //   //res.header("Content-Type", "text/plain;charset=utf-8")
  //   if(req.method=="OPTIONS") res.send(200);/*让options请求快速返回*/
  //   else  next();
  // })


  app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "http://cloud-test2.oa.com")
    res.header("Access-Control-Allow-Headers", "X-Requested-With,Content-Type")
    res.header("Access-Control-Allow-Credentials", true)
    res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS")
    res.header("X-Powered-By",'3.2.1')
    res.header("Content-Type", "text/plain;charset=utf-8")
    if(req.method=="OPTIONS") res.sendStatus(200);/*让options请求快速返回*/
    else  next();
  })



  ;['/static/auth/*', '/auth/*'].forEach(function(route) {
    log.debug('authUrl : ', options.authUrl)
    app.all(route, function(req, res) {
      proxy.web(req, res, {
        target: options.authUrl
      })
    })
  })

  ;['/s/image/*'].forEach(function(route) {
    app.all(route, function(req, res) {
      proxy.web(req, res, {
        target: options.storagePluginImageUrl
      })
    })
  })

  ;['/s/apk/*'].forEach(function(route) {
    app.all(route, function(req, res) {
      proxy.web(req, res, {
        target: options.storagePluginApkUrl
      })
    })
  })

  ;['/s/*'].forEach(function(route) {
    app.all(route, function(req, res) {
      proxy.web(req, res, {
        target: options.storageUrl
      })
    })
  })

  ;['/api/*'].forEach(function(route) {
    app.all(route, function(req, res) {
      proxy.web(req, res, {
        target: options.apiUrl
      })
    })
  })
  app.use(function(req, res) {
    proxy.web(req, res, {
      target: options.appUrl
    })
  })

  server.listen(options.port)
  log.info('Listening on port %d', options.port)
}
