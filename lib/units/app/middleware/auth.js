var jwtutil = require('../../../util/jwtutil')
var urlutil = require('../../../util/urlutil')
var dbapi = require('../../../db/api')
var logger = require('../../../util/logger')

var log = logger.createLogger('middle-auth')

module.exports = function(options) {
  return function(req, res, next) {
	log.info(req.path)
    var path = req.path
    // 放过推送的接口
    if (path == '/app/api/v2/pack/apk' || path == '/app/api/v2/cs' || path == '/app/api/v2/ds') {
      next()
    }
	else {
    if (req.query.jwt) {
      // Coming from auth client
      var data = jwtutil.decode(req.query.jwt, options.secret)
      var redir = urlutil.removeParam(req.url, 'jwt')
      if (data) {
        // Redirect once to get rid of the token
        dbapi.saveUserAfterLogin({
            name: data.name
          , email: data.email
          , ip: req.ip
          })
          .then(function() {
            req.session.jwt = data
            res.redirect(redir)
          })
          .catch(next)
      }
      else {
        // Invalid token, forward to auth client
        res.redirect(options.authUrl)
      }
    }
    else if (req.session && req.session.jwt) {
      dbapi.loadUser(req.session.jwt.email)
        .then(function(user) {
          if (user) {
            // Continue existing session
            req.user = user
            next()
          }
          else {
            // We no longer have the user in the database
            res.redirect(options.authUrl)
          }
        })
        .catch(next)
    }
    else {
      // No session, forward to auth client
      res.redirect(options.authUrl)
    }
	}
  }
}
