module.exports = function DeviceListMonkeyDirective() {
  return {
    restrict: 'E'
  , template: require('./device-list-monkey.pug')
  , scope: {
      tracker: '&tracker'
    }
  , link: function(scope) {
      var tracker = scope.tracker()

    }
  }
}
