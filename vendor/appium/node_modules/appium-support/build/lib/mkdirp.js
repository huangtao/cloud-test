'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _mkdirp2 = require('mkdirp');

var _mkdirp3 = _interopRequireDefault(_mkdirp2);

var _bluebird = require('bluebird');

var _bluebird2 = _interopRequireDefault(_bluebird);

function mkdirp(dir) {
  return _regeneratorRuntime.async(function mkdirp$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(new _bluebird2['default'](function (resolve, reject) {
          (0, _mkdirp3['default'])(dir, function (err) {
            if (err) {
              reject(err);
            } else {
              resolve();
            }
          });
        }));

      case 2:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 3:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}
exports.mkdirp = mkdirp;
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9ta2RpcnAuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozt1QkFBb0IsUUFBUTs7Ozt3QkFDZCxVQUFVOzs7O0FBRXhCLFNBQWUsTUFBTSxDQUFFLEdBQUc7Ozs7O3lDQUNYLDBCQUFNLFVBQUMsT0FBTyxFQUFFLE1BQU0sRUFBSztBQUN0QyxtQ0FBUSxHQUFHLEVBQUUsVUFBQyxHQUFHLEVBQUs7QUFDcEIsZ0JBQUksR0FBRyxFQUFFO0FBQ1Asb0JBQU0sQ0FBQyxHQUFHLENBQUMsQ0FBQzthQUNiLE1BQU07QUFDTCxxQkFBTyxFQUFFLENBQUM7YUFDWDtXQUNGLENBQUMsQ0FBQztTQUNKLENBQUM7Ozs7Ozs7Ozs7Q0FDSDtRQUNRLE1BQU0sR0FBTixNQUFNIiwiZmlsZSI6ImxpYi9ta2RpcnAuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgX21rZGlycCBmcm9tICdta2RpcnAnO1xuaW1wb3J0IEIgZnJvbSAnYmx1ZWJpcmQnO1xuXG5hc3luYyBmdW5jdGlvbiBta2RpcnAgKGRpcikge1xuICByZXR1cm4gYXdhaXQgbmV3IEIoKHJlc29sdmUsIHJlamVjdCkgPT4ge1xuICAgIF9ta2RpcnAoZGlyLCAoZXJyKSA9PiB7XG4gICAgICBpZiAoZXJyKSB7XG4gICAgICAgIHJlamVjdChlcnIpO1xuICAgICAgfSBlbHNlIHtcbiAgICAgICAgcmVzb2x2ZSgpO1xuICAgICAgfVxuICAgIH0pO1xuICB9KTtcbn1cbmV4cG9ydCB7IG1rZGlycCB9O1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLiJ9
