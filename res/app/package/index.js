module.exports = angular.module('stf.package', [])
  .config(['$routeProvider', function($routeProvider) {
    $routeProvider
      .when('/package', {
        template: require('./package.pug'),
        controller: 'PackageCtrl'
      })
  }])
   //.run(['$templateCache',function(editableOptions,$templateCache) {
  .run(['$templateCache',function($templateCache) {
    $templateCache.put('package/package.pug',
      require('./package.pug')
    )
  }])
  .controller('PackageCtrl', require('./package-controller'))
