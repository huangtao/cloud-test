module.exports = angular.module('stf.cpt', [require('./fileupload/index').name])
  .config(['$routeProvider', function($routeProvider) {
    $routeProvider
      .when('/cpt', {
        template: require('./cpt.pug'),
        controller: 'CptCtrl'
      })
  }])
  .run(function(editableOptions) {
    // bootstrap3 theme for xeditables
    editableOptions.theme = 'bs3'
  })
  .controller('CptCtrl', require('./cpt-controller'))
