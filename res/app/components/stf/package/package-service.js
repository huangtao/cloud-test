var oboe = require('oboe')
var _ = require('lodash')

module.exports = function PackageServiceFactory($http, socket) {
  var PackageService = {}
   PackageService.titles = ['应用名称','包名', 'version', '大小', '上传时间', '操作']
   PackageService.apkinfo = new Array()
  oboe('/app/api/v1/apkinfo').node('apkinfo.*',function(apkinfo){
    	PackageService.apkinfo.push(apkinfo)
    })
  return PackageService
}
