/**
 * Created by GuixiangGui on 2016/10/14.
 */

var dbapi = require('../../../../../db/api')
// var logger = require('../../../../../util/logger')

module.exports = function (req) {
  var id = req.params.id
  var apkupdate = {
    userName: req.user.name
    ,userEmail: req.user.email
    ,projectName: req.params.projectName
  }

  //dbapi.updateApkinfo(id, apkupdate)
}
