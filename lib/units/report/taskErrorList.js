/**
 * Created by GuixiangGui on 2016/11/11.
 */

var dbapi = require('../../db/api')

module.exports = function (taskid) {
  return dbapi.Loadtasklistdetail(taskid)
    .then(function (detail) {
      var detailResult = new Array()
      if(detail && detail.length > 0){
        var deviceError
        detail.forEach(function (deviceResult) {
          if(deviceResult.result && deviceResult.result.errorType){
            deviceError = {serial : deviceResult.serial
            , model : deviceResult.model
            , errorType : deviceResult.result.errorType
            , reson : deviceResult.result.reson
            , mobilecount : 1}
            detailResult.push(deviceError)
          }
          if(deviceResult.result && deviceResult.result.luacrash){
            deviceError = {serial : deviceResult.serial
              , model : deviceResult.model
              , errorType : 'luacrash'
              , reson : deviceResult.result.luacrash
              , mobilecount : 1}
            detailResult.push(deviceError)
          }
        })
      }
      return detailResult
    })
}
