'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _logger = require('./logger');

var _logger2 = _interopRequireDefault(_logger);

var _appiumBaseDriver = require('appium-base-driver');

var _driver = require('./driver');

function startServer(port, address) {
  var d, router, server;
  return _regeneratorRuntime.async(function startServer$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        d = new _driver.XCUITestDriver({ port: port, address: address });
        router = (0, _appiumBaseDriver.routeConfiguringFunction)(d);
        context$1$0.next = 4;
        return _regeneratorRuntime.awrap((0, _appiumBaseDriver.server)(router, port, address));

      case 4:
        server = context$1$0.sent;

        _logger2['default'].info('XCUITestDriver server listening on http://' + address + ':' + port);
        return context$1$0.abrupt('return', server);

      case 7:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}

exports.startServer = startServer;
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9zZXJ2ZXIuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7OztzQkFBZ0IsVUFBVTs7OztnQ0FDcUMsb0JBQW9COztzQkFDcEQsVUFBVTs7QUFFekMsU0FBZSxXQUFXLENBQUUsSUFBSSxFQUFFLE9BQU87TUFDbkMsQ0FBQyxFQUNELE1BQU0sRUFDTixNQUFNOzs7O0FBRk4sU0FBQyxHQUFHLDJCQUFtQixFQUFDLElBQUksRUFBSixJQUFJLEVBQUUsT0FBTyxFQUFQLE9BQU8sRUFBQyxDQUFDO0FBQ3ZDLGNBQU0sR0FBRyxnREFBeUIsQ0FBQyxDQUFDOzt5Q0FDckIsOEJBQVcsTUFBTSxFQUFFLElBQUksRUFBRSxPQUFPLENBQUM7OztBQUFoRCxjQUFNOztBQUNWLDRCQUFJLElBQUksZ0RBQThDLE9BQU8sU0FBSSxJQUFJLENBQUcsQ0FBQzs0Q0FDbEUsTUFBTTs7Ozs7OztDQUNkOztRQUVRLFdBQVcsR0FBWCxXQUFXIiwiZmlsZSI6ImxpYi9zZXJ2ZXIuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgbG9nIGZyb20gJy4vbG9nZ2VyJztcbmltcG9ydCB7IHNlcnZlciBhcyBiYXNlU2VydmVyLCByb3V0ZUNvbmZpZ3VyaW5nRnVuY3Rpb24gfSBmcm9tICdhcHBpdW0tYmFzZS1kcml2ZXInO1xuaW1wb3J0IHsgWENVSVRlc3REcml2ZXIgfSBmcm9tICcuL2RyaXZlcic7XG5cbmFzeW5jIGZ1bmN0aW9uIHN0YXJ0U2VydmVyIChwb3J0LCBhZGRyZXNzKSB7XG4gIGxldCBkID0gbmV3IFhDVUlUZXN0RHJpdmVyKHtwb3J0LCBhZGRyZXNzfSk7XG4gIGxldCByb3V0ZXIgPSByb3V0ZUNvbmZpZ3VyaW5nRnVuY3Rpb24oZCk7XG4gIGxldCBzZXJ2ZXIgPSBhd2FpdCBiYXNlU2VydmVyKHJvdXRlciwgcG9ydCwgYWRkcmVzcyk7XG4gIGxvZy5pbmZvKGBYQ1VJVGVzdERyaXZlciBzZXJ2ZXIgbGlzdGVuaW5nIG9uIGh0dHA6Ly8ke2FkZHJlc3N9OiR7cG9ydH1gKTtcbiAgcmV0dXJuIHNlcnZlcjtcbn1cblxuZXhwb3J0IHsgc3RhcnRTZXJ2ZXIgfTtcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4ifQ==
