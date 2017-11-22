var http = require('http')
var util = require('util')
var path = require('path')
var fs = require('fs')

var express = require('express')
var validator = require('express-validator')
var bodyParser = require('body-parser')
var formidable = require('formidable')
var Promise = require('bluebird')

var logger = require('../../util/logger')
var Storage = require('../../util/storage')
var requtil = require('../../util/requtil')
var download = require('../../util/download')
var aaptParseAPK = require('./plugins/apk/task/aaptParseAPK')

module.exports = function(options) {
  var log = logger.createLogger('storage:temp')
  var app = express()
  var server = http.createServer(app)
  var storage = new Storage()

  app.set('strict routing', true)
  app.set('case sensitive routing', true)
  app.set('trust proxy', true)

  app.use(bodyParser.json())
  app.use(validator())

  storage.on('timeout', function(id) {
    log.info('Cleaning up inactive resource "%s"', id)
  })

  app.post('/s/download/:plugin', function(req, res) {
    requtil.validate(req, function() {
        req.checkBody('url').notEmpty()
      })
      .then(function() {
        return download(req.body.url, {
          dir: options.cacheDir
        })
      })
      .then(function(file) {
        return {
          id: storage.store(file)
        , name: file.name
        }
      })
      .then(function(file) {
        var plugin = req.params.plugin
        res.status(201)
          .json({
            success: true
          , resource: {
              date: new Date()
            , plugin: plugin
            , id: file.id
            , name: file.name
            , href: util.format(
                '/s/%s/%s%s'
              , plugin
              , file.id
              , file.name ? util.format('/%s', path.basename(file.name)) : ''
              )
            }
          })
      })
      .catch(requtil.ValidationError, function(err) {
        res.status(400)
          .json({
            success: false
          , error: 'ValidationError'
          , validationErrors: err.errors
          })
      })
      .catch(function(err) {
        log.error('Error storing resource', err.stack)
        res.status(500)
          .json({
            success: false
          , error: 'ServerError'
          })
      })
  })

  app.post('/s/upload/:plugin', function(req, res) {
    //log.info('reqbody.projectName',req.body.projectName)
    //log.info('reqbody.userName',req.body.userName)
    //log.info('reqbody.userEmail',req.body)
    var form = new formidable.IncomingForm()
    form.uploadDir = "/var/stf/file/apk"
    var plugin = req.params.plugin
    Promise.promisify(form.parse, form)(req)
      .spread(function(fields, files) {
        return Object.keys(files).map(function(field) {
          var file = files[field]
          var fileID = storage.store(file)
          var fileHref = util.format(
            '/s/%s/%s%s'
            , plugin
            , fileID
            , file.name ?
              util.format('/%s', path.basename(file.name)) :
              ''
          )
          log.info('fields.userName',fields.userName)
          log.info('Uploaded "%s" to "%s"', file.name, file.path)
          if(fields.userName == undefined){
            log.info('upload tmp apk')
          }
          else{
            if(req.params.plugin == 'apk'){
              var fileInfo = {
                id: fileID
                ,userName: fields.userName
                ,userEmail: 'UNKNOWN'
                ,projectName: 'UNKNOWN'
                ,fileName: file.name
                ,filePath: file.path
                ,href: fileHref
              }
              log.info('fileInfo',fileInfo)
              aaptParseAPK(file, fileInfo)
            }
          }

          return {
            field: field
            , id: fileID
            , name: file.name
            , href: fileHref
          }
        })
      })
      .then(function(storedFiles) {
        res.status(201)
          .json({
            success: true
          , resources: (function() {
              var mapped = Object.create(null)
              storedFiles.forEach(function(file) {

                mapped[file.field] = {
                  date: new Date()
                , plugin: plugin
                , id: file.id
                , name: file.name
                , href: file.href
                }
              })
              return mapped
            })()
          })
      })
      .catch(function(err) {
        log.error('Error storing resource', err.stack)
        res.status(500)
          .json({
            success: false
          , error: 'ServerError'
          })
      })
  })

  app.get('/s/blob/:id/:name', function(req, res) {
    var file = storage.retrieve(req.params.id)
    if (file) {
      if (typeof req.query.download !== 'undefined') {
        res.set('Content-Disposition',
          'attachment; filename="' + path.basename(file.name) + '"')
      }
      res.set('Content-Type', file.type)
      res.sendFile(file.path)
    }
    else {
      res.sendStatus(404)
    }
  })
  
  app.get('/s/blob/:id/:name', function(req, res) {
    var file = storage.retrieve(req.params.id)
    if (file) {
      if (typeof req.query.download !== 'undefined') {
        res.set('Content-Disposition',
          'attachment; filename="' + path.basename(file.name) + '"')
      }
      res.set('Content-Type', file.type)
      res.sendFile(file.path)
    }
    else {
      res.sendStatus(404)
    }
  })

  server.listen(options.port)
  log.info('Listening on port %d', options.port)
}
