'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _Object$assign = require('babel-runtime/core-js/object/assign')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _logger = require('../logger');

var _logger2 = _interopRequireDefault(_logger);

var _appiumBaseDriver = require('appium-base-driver');

var commands = {},
    helpers = {},
    extensions = {};

commands.isIMEActivated = function callee$0$0() {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        return context$1$0.abrupt('return', true);

      case 1:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

commands.availableIMEEngines = function callee$0$0() {
  var engines;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        _logger2['default'].debug("Retrieving available IMEs");
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap(this.adb.availableIMEs());

      case 3:
        engines = context$1$0.sent;

        _logger2['default'].debug('Engines: ' + JSON.stringify(engines));
        return context$1$0.abrupt('return', engines);

      case 6:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

commands.getActiveIMEEngine = function callee$0$0() {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        _logger2['default'].debug("Retrieving current default IME");
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap(this.adb.defaultIME());

      case 3:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 4:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

commands.activateIMEEngine = function callee$0$0(imeId) {
  var availableEngines;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        _logger2['default'].debug('Attempting to activate IME ' + imeId);
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap(this.adb.availableIMEs());

      case 3:
        availableEngines = context$1$0.sent;

        if (!(availableEngines.indexOf(imeId) === -1)) {
          context$1$0.next = 7;
          break;
        }

        _logger2['default'].debug("IME not found, failing");
        throw new _appiumBaseDriver.errors.IMENotAvailableError();

      case 7:
        _logger2['default'].debug("Found installed IME, attempting to activate");
        context$1$0.next = 10;
        return _regeneratorRuntime.awrap(this.adb.enableIME(imeId));

      case 10:
        context$1$0.next = 12;
        return _regeneratorRuntime.awrap(this.adb.setIME(imeId));

      case 12:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

commands.deactivateIMEEngine = function callee$0$0() {
  var currentEngine;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.getActiveIMEEngine());

      case 2:
        currentEngine = context$1$0.sent;

        _logger2['default'].debug('Attempting to deactivate ' + currentEngine);
        context$1$0.next = 6;
        return _regeneratorRuntime.awrap(this.adb.disableIME(currentEngine));

      case 6:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

_Object$assign(extensions, commands, helpers);
exports.commands = commands;
exports.helpers = helpers;
exports['default'] = extensions;

// IME is always activated on Android devices
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9jb21tYW5kcy9pbWUuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7O3NCQUFnQixXQUFXOzs7O2dDQUNKLG9CQUFvQjs7QUFFM0MsSUFBSSxRQUFRLEdBQUcsRUFBRTtJQUFFLE9BQU8sR0FBRyxFQUFFO0lBQUUsVUFBVSxHQUFHLEVBQUUsQ0FBQzs7QUFFakQsUUFBUSxDQUFDLGNBQWMsR0FBRzs7Ozs0Q0FFakIsSUFBSTs7Ozs7OztDQUNaLENBQUM7O0FBRUYsUUFBUSxDQUFDLG1CQUFtQixHQUFHO01BRXpCLE9BQU87Ozs7QUFEWCw0QkFBSSxLQUFLLENBQUMsMkJBQTJCLENBQUMsQ0FBQzs7eUNBQ25CLElBQUksQ0FBQyxHQUFHLENBQUMsYUFBYSxFQUFFOzs7QUFBeEMsZUFBTzs7QUFDWCw0QkFBSSxLQUFLLGVBQWEsSUFBSSxDQUFDLFNBQVMsQ0FBQyxPQUFPLENBQUMsQ0FBRyxDQUFDOzRDQUMxQyxPQUFPOzs7Ozs7O0NBQ2YsQ0FBQzs7QUFFRixRQUFRLENBQUMsa0JBQWtCLEdBQUc7Ozs7QUFDNUIsNEJBQUksS0FBSyxDQUFDLGdDQUFnQyxDQUFDLENBQUM7O3lDQUMvQixJQUFJLENBQUMsR0FBRyxDQUFDLFVBQVUsRUFBRTs7Ozs7Ozs7OztDQUNuQyxDQUFDOztBQUVGLFFBQVEsQ0FBQyxpQkFBaUIsR0FBRyxvQkFBZ0IsS0FBSztNQUU1QyxnQkFBZ0I7Ozs7QUFEcEIsNEJBQUksS0FBSyxpQ0FBK0IsS0FBSyxDQUFHLENBQUM7O3lDQUNwQixJQUFJLENBQUMsR0FBRyxDQUFDLGFBQWEsRUFBRTs7O0FBQWpELHdCQUFnQjs7Y0FDaEIsZ0JBQWdCLENBQUMsT0FBTyxDQUFDLEtBQUssQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFBOzs7OztBQUN4Qyw0QkFBSSxLQUFLLENBQUMsd0JBQXdCLENBQUMsQ0FBQztjQUM5QixJQUFJLHlCQUFPLG9CQUFvQixFQUFFOzs7QUFFekMsNEJBQUksS0FBSyxDQUFDLDZDQUE2QyxDQUFDLENBQUM7O3lDQUNuRCxJQUFJLENBQUMsR0FBRyxDQUFDLFNBQVMsQ0FBQyxLQUFLLENBQUM7Ozs7eUNBQ3pCLElBQUksQ0FBQyxHQUFHLENBQUMsTUFBTSxDQUFDLEtBQUssQ0FBQzs7Ozs7OztDQUM3QixDQUFDOztBQUVGLFFBQVEsQ0FBQyxtQkFBbUIsR0FBRztNQUN6QixhQUFhOzs7Ozt5Q0FBUyxJQUFJLENBQUMsa0JBQWtCLEVBQUU7OztBQUEvQyxxQkFBYTs7QUFDakIsNEJBQUksS0FBSywrQkFBNkIsYUFBYSxDQUFHLENBQUM7O3lDQUNqRCxJQUFJLENBQUMsR0FBRyxDQUFDLFVBQVUsQ0FBQyxhQUFhLENBQUM7Ozs7Ozs7Q0FDekMsQ0FBQzs7QUFFRixlQUFjLFVBQVUsRUFBRSxRQUFRLEVBQUUsT0FBTyxDQUFDLENBQUM7UUFDcEMsUUFBUSxHQUFSLFFBQVE7UUFBRSxPQUFPLEdBQVAsT0FBTztxQkFDWCxVQUFVIiwiZmlsZSI6ImxpYi9jb21tYW5kcy9pbWUuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgbG9nIGZyb20gJy4uL2xvZ2dlcic7XG5pbXBvcnQgeyBlcnJvcnMgfSBmcm9tICdhcHBpdW0tYmFzZS1kcml2ZXInO1xuXG5sZXQgY29tbWFuZHMgPSB7fSwgaGVscGVycyA9IHt9LCBleHRlbnNpb25zID0ge307XG5cbmNvbW1hbmRzLmlzSU1FQWN0aXZhdGVkID0gYXN5bmMgZnVuY3Rpb24gKCkge1xuICAvLyBJTUUgaXMgYWx3YXlzIGFjdGl2YXRlZCBvbiBBbmRyb2lkIGRldmljZXNcbiAgcmV0dXJuIHRydWU7XG59O1xuXG5jb21tYW5kcy5hdmFpbGFibGVJTUVFbmdpbmVzID0gYXN5bmMgZnVuY3Rpb24gKCkge1xuICBsb2cuZGVidWcoXCJSZXRyaWV2aW5nIGF2YWlsYWJsZSBJTUVzXCIpO1xuICBsZXQgZW5naW5lcyA9IGF3YWl0IHRoaXMuYWRiLmF2YWlsYWJsZUlNRXMoKTtcbiAgbG9nLmRlYnVnKGBFbmdpbmVzOiAke0pTT04uc3RyaW5naWZ5KGVuZ2luZXMpfWApO1xuICByZXR1cm4gZW5naW5lcztcbn07XG5cbmNvbW1hbmRzLmdldEFjdGl2ZUlNRUVuZ2luZSA9IGFzeW5jIGZ1bmN0aW9uICgpIHtcbiAgbG9nLmRlYnVnKFwiUmV0cmlldmluZyBjdXJyZW50IGRlZmF1bHQgSU1FXCIpO1xuICByZXR1cm4gYXdhaXQgdGhpcy5hZGIuZGVmYXVsdElNRSgpO1xufTtcblxuY29tbWFuZHMuYWN0aXZhdGVJTUVFbmdpbmUgPSBhc3luYyBmdW5jdGlvbiAoaW1lSWQpIHtcbiAgbG9nLmRlYnVnKGBBdHRlbXB0aW5nIHRvIGFjdGl2YXRlIElNRSAke2ltZUlkfWApO1xuICBsZXQgYXZhaWxhYmxlRW5naW5lcyA9IGF3YWl0IHRoaXMuYWRiLmF2YWlsYWJsZUlNRXMoKTtcbiAgaWYgKGF2YWlsYWJsZUVuZ2luZXMuaW5kZXhPZihpbWVJZCkgPT09IC0xKSB7XG4gICAgbG9nLmRlYnVnKFwiSU1FIG5vdCBmb3VuZCwgZmFpbGluZ1wiKTtcbiAgICB0aHJvdyBuZXcgZXJyb3JzLklNRU5vdEF2YWlsYWJsZUVycm9yKCk7XG4gIH1cbiAgbG9nLmRlYnVnKFwiRm91bmQgaW5zdGFsbGVkIElNRSwgYXR0ZW1wdGluZyB0byBhY3RpdmF0ZVwiKTtcbiAgYXdhaXQgdGhpcy5hZGIuZW5hYmxlSU1FKGltZUlkKTtcbiAgYXdhaXQgdGhpcy5hZGIuc2V0SU1FKGltZUlkKTtcbn07XG5cbmNvbW1hbmRzLmRlYWN0aXZhdGVJTUVFbmdpbmUgPSBhc3luYyBmdW5jdGlvbiAoKSB7XG4gIGxldCBjdXJyZW50RW5naW5lID0gYXdhaXQgdGhpcy5nZXRBY3RpdmVJTUVFbmdpbmUoKTtcbiAgbG9nLmRlYnVnKGBBdHRlbXB0aW5nIHRvIGRlYWN0aXZhdGUgJHtjdXJyZW50RW5naW5lfWApO1xuICBhd2FpdCB0aGlzLmFkYi5kaXNhYmxlSU1FKGN1cnJlbnRFbmdpbmUpO1xufTtcblxuT2JqZWN0LmFzc2lnbihleHRlbnNpb25zLCBjb21tYW5kcywgaGVscGVycyk7XG5leHBvcnQgeyBjb21tYW5kcywgaGVscGVycyB9O1xuZXhwb3J0IGRlZmF1bHQgZXh0ZW5zaW9ucztcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4vLi4ifQ==
