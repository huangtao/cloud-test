require('source-map-support').install();

'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _yargs = require('yargs');

var _yargs2 = _interopRequireDefault(_yargs);

var _asyncbox = require('asyncbox');

var _libDriver = require('./lib/driver');

var _libServer = require('./lib/server');

var DEFAULT_HOST = 'localhost';
var DEFAULT_PORT = 4723;

function main() {
  var port, host;
  return _regeneratorRuntime.async(function main$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        port = _yargs2['default'].argv.port || DEFAULT_PORT;
        host = _yargs2['default'].argv.host || DEFAULT_HOST;
        return context$1$0.abrupt('return', (0, _libServer.startServer)(port, host));

      case 3:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}

if (require.main === module) {
  (0, _asyncbox.asyncify)(main);
}

exports.XCUITestDriver = _libDriver.XCUITestDriver;
exports.startServer = _libServer.startServer;
exports['default'] = _libDriver.XCUITestDriver;
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImluZGV4LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7OztxQkFFa0IsT0FBTzs7Ozt3QkFDQSxVQUFVOzt5QkFDSixjQUFjOzt5QkFDakIsY0FBYzs7QUFFMUMsSUFBTSxZQUFZLEdBQUcsV0FBVyxDQUFDO0FBQ2pDLElBQU0sWUFBWSxHQUFHLElBQUksQ0FBQzs7QUFFMUIsU0FBZSxJQUFJO01BQ2IsSUFBSSxFQUNKLElBQUk7Ozs7QUFESixZQUFJLEdBQUcsbUJBQU0sSUFBSSxDQUFDLElBQUksSUFBSSxZQUFZO0FBQ3RDLFlBQUksR0FBRyxtQkFBTSxJQUFJLENBQUMsSUFBSSxJQUFJLFlBQVk7NENBQ25DLDRCQUFZLElBQUksRUFBRSxJQUFJLENBQUM7Ozs7Ozs7Q0FDL0I7O0FBRUQsSUFBSSxPQUFPLENBQUMsSUFBSSxLQUFLLE1BQU0sRUFBRTtBQUMzQiwwQkFBUyxJQUFJLENBQUMsQ0FBQztDQUNoQjs7UUFFUSxjQUFjO1FBQUUsV0FBVyIsImZpbGUiOiJpbmRleC5qcyIsInNvdXJjZXNDb250ZW50IjpbIi8vIHRyYW5zcGlsZTptYWluXG5cbmltcG9ydCB5YXJncyBmcm9tICd5YXJncyc7XG5pbXBvcnQgeyBhc3luY2lmeSB9IGZyb20gJ2FzeW5jYm94JztcbmltcG9ydCB7IFhDVUlUZXN0RHJpdmVyIH0gZnJvbSAnLi9saWIvZHJpdmVyJztcbmltcG9ydCB7IHN0YXJ0U2VydmVyIH0gZnJvbSAnLi9saWIvc2VydmVyJztcblxuY29uc3QgREVGQVVMVF9IT1NUID0gJ2xvY2FsaG9zdCc7XG5jb25zdCBERUZBVUxUX1BPUlQgPSA0NzIzO1xuXG5hc3luYyBmdW5jdGlvbiBtYWluICgpIHtcbiAgbGV0IHBvcnQgPSB5YXJncy5hcmd2LnBvcnQgfHwgREVGQVVMVF9QT1JUO1xuICBsZXQgaG9zdCA9IHlhcmdzLmFyZ3YuaG9zdCB8fCBERUZBVUxUX0hPU1Q7XG4gIHJldHVybiBzdGFydFNlcnZlcihwb3J0LCBob3N0KTtcbn1cblxuaWYgKHJlcXVpcmUubWFpbiA9PT0gbW9kdWxlKSB7XG4gIGFzeW5jaWZ5KG1haW4pO1xufVxuXG5leHBvcnQgeyBYQ1VJVGVzdERyaXZlciwgc3RhcnRTZXJ2ZXIgfTtcbmV4cG9ydCBkZWZhdWx0IFhDVUlUZXN0RHJpdmVyO1xuIl0sInNvdXJjZVJvb3QiOiIuLiJ9
