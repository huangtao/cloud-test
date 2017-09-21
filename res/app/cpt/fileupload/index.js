require('./fileupload.css')

require('ng-file-upload')

module.exports = angular.module('stf.fileupload', [
  'angularFileUpload',
  require('stf/settings').name,
  require('stf/storage').name,
  require('stf/install').name,
  require('stf/upload').name
])
  .run(['$templateCache', function($templateCache) {
    $templateCache.put('cpt/fileupload/fileupload.pug',
      require('./fileupload.pug')
    )
  }])
  .controller('FileuploadCtrl', require('./fileupload-controller'))
