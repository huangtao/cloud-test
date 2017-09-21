require('./task.css')
module.exports = angular.module('stf.task', [])
  .config(['$routeProvider', function($routeProvider) {
    $routeProvider
      .when('/task', {
        template: require('./task.pug'),
        controller: 'TaskCtrl'
      })
  }])
  .run(function(editableOptions) {
    // bootstrap3 theme for xeditables
    editableOptions.theme = 'bs3'
  })
  .controller('TaskCtrl', require('./task-controller'))