'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _logger = require('../logger');

var _logger2 = _interopRequireDefault(_logger);

var commands = {};

commands.updateSettings = function callee$0$0(newSettings) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        if (!this.settings) {
          _logger2['default'].errorAndThrow('Cannot update settings; settings object not found');
        }
        return context$1$0.abrupt('return', this.settings.update(newSettings));

      case 2:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

commands.getSettings = function callee$0$0() {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        if (!this.settings) {
          _logger2['default'].errorAndThrow('Cannot get settings; settings object not found');
        }
        return context$1$0.abrupt('return', this.settings.getSettings());

      case 2:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

exports['default'] = commands;
module.exports = exports['default'];
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9iYXNlZHJpdmVyL2NvbW1hbmRzL3NldHRpbmdzLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7c0JBQWdCLFdBQVc7Ozs7QUFFM0IsSUFBSSxRQUFRLEdBQUcsRUFBRSxDQUFDOztBQUVsQixRQUFRLENBQUMsY0FBYyxHQUFHLG9CQUFnQixXQUFXOzs7O0FBQ25ELFlBQUksQ0FBQyxJQUFJLENBQUMsUUFBUSxFQUFFO0FBQ2xCLDhCQUFJLGFBQWEsQ0FBQyxtREFBbUQsQ0FBQyxDQUFDO1NBQ3hFOzRDQUNNLElBQUksQ0FBQyxRQUFRLENBQUMsTUFBTSxDQUFDLFdBQVcsQ0FBQzs7Ozs7OztDQUN6QyxDQUFDOztBQUVGLFFBQVEsQ0FBQyxXQUFXLEdBQUc7Ozs7QUFDckIsWUFBSSxDQUFDLElBQUksQ0FBQyxRQUFRLEVBQUU7QUFDbEIsOEJBQUksYUFBYSxDQUFDLGdEQUFnRCxDQUFDLENBQUM7U0FDckU7NENBQ00sSUFBSSxDQUFDLFFBQVEsQ0FBQyxXQUFXLEVBQUU7Ozs7Ozs7Q0FDbkMsQ0FBQzs7cUJBRWEsUUFBUSIsImZpbGUiOiJsaWIvYmFzZWRyaXZlci9jb21tYW5kcy9zZXR0aW5ncy5qcyIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCBsb2cgZnJvbSAnLi4vbG9nZ2VyJztcblxubGV0IGNvbW1hbmRzID0ge307XG5cbmNvbW1hbmRzLnVwZGF0ZVNldHRpbmdzID0gYXN5bmMgZnVuY3Rpb24gKG5ld1NldHRpbmdzKSB7XG4gIGlmICghdGhpcy5zZXR0aW5ncykge1xuICAgIGxvZy5lcnJvckFuZFRocm93KCdDYW5ub3QgdXBkYXRlIHNldHRpbmdzOyBzZXR0aW5ncyBvYmplY3Qgbm90IGZvdW5kJyk7XG4gIH1cbiAgcmV0dXJuIHRoaXMuc2V0dGluZ3MudXBkYXRlKG5ld1NldHRpbmdzKTtcbn07XG5cbmNvbW1hbmRzLmdldFNldHRpbmdzID0gYXN5bmMgZnVuY3Rpb24gKCkge1xuICBpZiAoIXRoaXMuc2V0dGluZ3MpIHtcbiAgICBsb2cuZXJyb3JBbmRUaHJvdygnQ2Fubm90IGdldCBzZXR0aW5nczsgc2V0dGluZ3Mgb2JqZWN0IG5vdCBmb3VuZCcpO1xuICB9XG4gIHJldHVybiB0aGlzLnNldHRpbmdzLmdldFNldHRpbmdzKCk7XG59O1xuXG5leHBvcnQgZGVmYXVsdCBjb21tYW5kcztcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4vLi4vLi4ifQ==
