var _ = require('lodash')
var oboe = require('oboe')

module.exports = function CptServiceFactory($http, socket) {
  var cptService = {}
  cptService.dpis = new Array()
  cptService.os_versions = new Array()
  cptService.manufacturers = new Array()

    oboe('/app/api/v1/phonedpis').node('dpis.*',function (dpi) {
     console.log(dpi)
     cptService.dpis.push(dpi)
    })

    oboe('/app/api/v1/phonemodels').node('manufacturers.*',function (manufacturer) {
     console.log(manufacturer)
     cptService.manufacturers.push(manufacturer)
    }).node('os_versions.*',function (os_version) {
     console.log(os_version)
     cptService.os_versions.push(os_version)
    })

  cptService.commitMonkeyTest = function (data) {
    $http({
      url:'/app/api/setprjectname/'+data.id+'/'+data.projectName
      ,method:'get'
    })

     return $http({
        url:'/app/api/v1/monkeytest'
      , method:'post'
      , data:data
    })
  }

  return cptService
}
