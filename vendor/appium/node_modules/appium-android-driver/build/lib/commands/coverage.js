'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _Object$assign = require('babel-runtime/core-js/object/assign')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _temp = require('temp');

var _temp2 = _interopRequireDefault(_temp);

var _appiumSupport = require('appium-support');

var _logger = require('../logger');

var _logger2 = _interopRequireDefault(_logger);

var commands = {},
    helpers = {},
    extensions = {};

function unlinkFile(file) {
  return _regeneratorRuntime.async(function unlinkFile$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(_appiumSupport.fs.exists(file));

      case 2:
        if (!context$1$0.sent) {
          context$1$0.next = 5;
          break;
        }

        context$1$0.next = 5;
        return _regeneratorRuntime.awrap(_appiumSupport.fs.unlink(file));

      case 5:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}

commands.endCoverage = function callee$0$0(intentToBroadcast, ecOnDevicePath) {
  var localFile, b64data, data;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        localFile = _temp2['default'].path({ prefix: 'appium', suffix: '.ec' });
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap(unlinkFile(localFile));

      case 3:
        b64data = '';
        context$1$0.prev = 4;
        context$1$0.next = 7;
        return _regeneratorRuntime.awrap(this.adb.rimraf(ecOnDevicePath));

      case 7:
        context$1$0.next = 9;
        return _regeneratorRuntime.awrap(this.adb.broadcastProcessEnd(intentToBroadcast, this.appProcess));

      case 9:
        context$1$0.next = 11;
        return _regeneratorRuntime.awrap(this.adb.pull(ecOnDevicePath, localFile));

      case 11:
        context$1$0.next = 13;
        return _regeneratorRuntime.awrap(_appiumSupport.fs.readFile(localFile));

      case 13:
        data = context$1$0.sent;

        b64data = new Buffer(data).toString('base64');
        context$1$0.next = 17;
        return _regeneratorRuntime.awrap(unlinkFile(localFile));

      case 17:
        context$1$0.next = 22;
        break;

      case 19:
        context$1$0.prev = 19;
        context$1$0.t0 = context$1$0['catch'](4);

        _logger2['default'].debug('Error ending test coverage: ' + context$1$0.t0.message);

      case 22:
        return context$1$0.abrupt('return', b64data);

      case 23:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[4, 19]]);
};

_Object$assign(extensions, commands, helpers);
exports.commands = commands;
exports.helpers = helpers;
exports['default'] = extensions;

// ensure the ec we're pulling is newly created as a result of the intent.
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9jb21tYW5kcy9jb3ZlcmFnZS5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7b0JBQWlCLE1BQU07Ozs7NkJBQ0osZ0JBQWdCOztzQkFDbkIsV0FBVzs7OztBQUczQixJQUFJLFFBQVEsR0FBRyxFQUFFO0lBQUUsT0FBTyxHQUFHLEVBQUU7SUFBRSxVQUFVLEdBQUcsRUFBRSxDQUFDOztBQUVqRCxTQUFlLFVBQVUsQ0FBRSxJQUFJOzs7Ozt5Q0FDbkIsa0JBQUcsTUFBTSxDQUFDLElBQUksQ0FBQzs7Ozs7Ozs7O3lDQUNqQixrQkFBRyxNQUFNLENBQUMsSUFBSSxDQUFDOzs7Ozs7O0NBRXhCOztBQUVELFFBQVEsQ0FBQyxXQUFXLEdBQUcsb0JBQWdCLGlCQUFpQixFQUFFLGNBQWM7TUFDbEUsU0FBUyxFQUdULE9BQU8sRUFRTCxJQUFJOzs7O0FBWE4saUJBQVMsR0FBRyxrQkFBSyxJQUFJLENBQUMsRUFBQyxNQUFNLEVBQUUsUUFBUSxFQUFFLE1BQU0sRUFBRSxLQUFLLEVBQUMsQ0FBQzs7eUNBQ3RELFVBQVUsQ0FBQyxTQUFTLENBQUM7OztBQUV2QixlQUFPLEdBQUcsRUFBRTs7O3lDQUdSLElBQUksQ0FBQyxHQUFHLENBQUMsTUFBTSxDQUFDLGNBQWMsQ0FBQzs7Ozt5Q0FFL0IsSUFBSSxDQUFDLEdBQUcsQ0FBQyxtQkFBbUIsQ0FBQyxpQkFBaUIsRUFBRSxJQUFJLENBQUMsVUFBVSxDQUFDOzs7O3lDQUVoRSxJQUFJLENBQUMsR0FBRyxDQUFDLElBQUksQ0FBQyxjQUFjLEVBQUUsU0FBUyxDQUFDOzs7O3lDQUM3QixrQkFBRyxRQUFRLENBQUMsU0FBUyxDQUFDOzs7QUFBbkMsWUFBSTs7QUFDUixlQUFPLEdBQUcsSUFBSSxNQUFNLENBQUMsSUFBSSxDQUFDLENBQUMsUUFBUSxDQUFDLFFBQVEsQ0FBQyxDQUFDOzt5Q0FDeEMsVUFBVSxDQUFDLFNBQVMsQ0FBQzs7Ozs7Ozs7OztBQUUzQiw0QkFBSSxLQUFLLGtDQUFnQyxlQUFJLE9BQU8sQ0FBRyxDQUFDOzs7NENBRW5ELE9BQU87Ozs7Ozs7Q0FDZixDQUFDOztBQUdGLGVBQWMsVUFBVSxFQUFFLFFBQVEsRUFBRSxPQUFPLENBQUMsQ0FBQztRQUNwQyxRQUFRLEdBQVIsUUFBUTtRQUFFLE9BQU8sR0FBUCxPQUFPO3FCQUNYLFVBQVUiLCJmaWxlIjoibGliL2NvbW1hbmRzL2NvdmVyYWdlLmpzIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IHRlbXAgZnJvbSAndGVtcCc7XG5pbXBvcnQgeyBmcyB9IGZyb20gJ2FwcGl1bS1zdXBwb3J0JztcbmltcG9ydCBsb2cgZnJvbSAnLi4vbG9nZ2VyJztcblxuXG5sZXQgY29tbWFuZHMgPSB7fSwgaGVscGVycyA9IHt9LCBleHRlbnNpb25zID0ge307XG5cbmFzeW5jIGZ1bmN0aW9uIHVubGlua0ZpbGUgKGZpbGUpIHtcbiAgaWYgKGF3YWl0IGZzLmV4aXN0cyhmaWxlKSkge1xuICAgIGF3YWl0IGZzLnVubGluayhmaWxlKTtcbiAgfVxufVxuXG5jb21tYW5kcy5lbmRDb3ZlcmFnZSA9IGFzeW5jIGZ1bmN0aW9uIChpbnRlbnRUb0Jyb2FkY2FzdCwgZWNPbkRldmljZVBhdGgpIHtcbiAgbGV0IGxvY2FsRmlsZSA9IHRlbXAucGF0aCh7cHJlZml4OiAnYXBwaXVtJywgc3VmZml4OiAnLmVjJ30pO1xuICBhd2FpdCB1bmxpbmtGaWxlKGxvY2FsRmlsZSk7XG5cbiAgbGV0IGI2NGRhdGEgPSAnJztcbiAgdHJ5IHtcbiAgICAvLyBlbnN1cmUgdGhlIGVjIHdlJ3JlIHB1bGxpbmcgaXMgbmV3bHkgY3JlYXRlZCBhcyBhIHJlc3VsdCBvZiB0aGUgaW50ZW50LlxuICAgIGF3YWl0IHRoaXMuYWRiLnJpbXJhZihlY09uRGV2aWNlUGF0aCk7XG5cbiAgICBhd2FpdCB0aGlzLmFkYi5icm9hZGNhc3RQcm9jZXNzRW5kKGludGVudFRvQnJvYWRjYXN0LCB0aGlzLmFwcFByb2Nlc3MpO1xuXG4gICAgYXdhaXQgdGhpcy5hZGIucHVsbChlY09uRGV2aWNlUGF0aCwgbG9jYWxGaWxlKTtcbiAgICBsZXQgZGF0YSA9IGF3YWl0IGZzLnJlYWRGaWxlKGxvY2FsRmlsZSk7XG4gICAgYjY0ZGF0YSA9IG5ldyBCdWZmZXIoZGF0YSkudG9TdHJpbmcoJ2Jhc2U2NCcpO1xuICAgIGF3YWl0IHVubGlua0ZpbGUobG9jYWxGaWxlKTtcbiAgfSBjYXRjaCAoZXJyKSB7XG4gICAgbG9nLmRlYnVnKGBFcnJvciBlbmRpbmcgdGVzdCBjb3ZlcmFnZTogJHtlcnIubWVzc2FnZX1gKTtcbiAgfVxuICByZXR1cm4gYjY0ZGF0YTtcbn07XG5cblxuT2JqZWN0LmFzc2lnbihleHRlbnNpb25zLCBjb21tYW5kcywgaGVscGVycyk7XG5leHBvcnQgeyBjb21tYW5kcywgaGVscGVycyB9O1xuZXhwb3J0IGRlZmF1bHQgZXh0ZW5zaW9ucztcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4vLi4ifQ==
