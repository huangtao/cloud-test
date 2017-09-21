// jshint ignore: start
'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _getIterator = require('babel-runtime/core-js/get-iterator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _fs2 = require('fs');

var _fs3 = _interopRequireDefault(_fs2);

var _rimraf = require('rimraf');

var _rimraf2 = _interopRequireDefault(_rimraf);

var _md5File = require('md5-file');

var _md5File2 = _interopRequireDefault(_md5File);

var _ncp = require('ncp');

var _ncp2 = _interopRequireDefault(_ncp);

var _bluebird = require('bluebird');

var _bluebird2 = _interopRequireDefault(_bluebird);

var _mv = require('mv');

var _mv2 = _interopRequireDefault(_mv);

var _which = require('which');

var _which2 = _interopRequireDefault(_which);

var _glob = require('glob');

var _glob2 = _interopRequireDefault(_glob);

var _md5 = _bluebird2['default'].promisify(_md5File2['default']);

var fs = {
  hasAccess: function hasAccess(path) {
    return _regeneratorRuntime.async(function hasAccess$(context$1$0) {
      while (1) switch (context$1$0.prev = context$1$0.next) {
        case 0:
          context$1$0.prev = 0;
          context$1$0.next = 3;
          return _regeneratorRuntime.awrap(this.access(path, fs.F_OK | fs.R_OK));

        case 3:
          context$1$0.next = 8;
          break;

        case 5:
          context$1$0.prev = 5;
          context$1$0.t0 = context$1$0['catch'](0);
          return context$1$0.abrupt('return', false);

        case 8:
          return context$1$0.abrupt('return', true);

        case 9:
        case 'end':
          return context$1$0.stop();
      }
    }, null, this, [[0, 5]]);
  },
  exists: function exists(path) {
    return this.hasAccess(path);
  },
  rimraf: _bluebird2['default'].promisify(_rimraf2['default']),
  mkdir: function mkdir(dirName) {
    var _mkdir;

    return _regeneratorRuntime.async(function mkdir$(context$1$0) {
      while (1) switch (context$1$0.prev = context$1$0.next) {
        case 0:
          _mkdir = _bluebird2['default'].promisify(_fs3['default'].mkdir);
          context$1$0.prev = 1;
          context$1$0.next = 4;
          return _regeneratorRuntime.awrap(_mkdir(dirName));

        case 4:
          context$1$0.next = 10;
          break;

        case 6:
          context$1$0.prev = 6;
          context$1$0.t0 = context$1$0['catch'](1);

          if (!(context$1$0.t0 && context$1$0.t0.code !== "EEXIST")) {
            context$1$0.next = 10;
            break;
          }

          throw context$1$0.t0;

        case 10:
        case 'end':
          return context$1$0.stop();
      }
    }, null, this, [[1, 6]]);
  },
  copyFile: _bluebird2['default'].promisify(_ncp2['default']),
  md5: function md5(filePath) {
    return _regeneratorRuntime.async(function md5$(context$1$0) {
      while (1) switch (context$1$0.prev = context$1$0.next) {
        case 0:
          context$1$0.next = 2;
          return _regeneratorRuntime.awrap(_md5(filePath));

        case 2:
          return context$1$0.abrupt('return', context$1$0.sent);

        case 3:
        case 'end':
          return context$1$0.stop();
      }
    }, null, this);
  },
  mv: _bluebird2['default'].promisify(_mv2['default']),
  which: _bluebird2['default'].promisify(_which2['default']),
  glob: _bluebird2['default'].promisify(_glob2['default'])
};

var simples = ['open', 'close', 'access', 'readFile', 'writeFile', 'write', 'read', 'readlink', 'chmod', 'unlink', 'readdir', 'stat', 'rename', 'lstat'];

var _iteratorNormalCompletion = true;
var _didIteratorError = false;
var _iteratorError = undefined;

try {
  for (var _iterator = _getIterator(simples), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
    var s = _step.value;

    fs[s] = _bluebird2['default'].promisify(_fs3['default'][s]);
  }
} catch (err) {
  _didIteratorError = true;
  _iteratorError = err;
} finally {
  try {
    if (!_iteratorNormalCompletion && _iterator['return']) {
      _iterator['return']();
    }
  } finally {
    if (_didIteratorError) {
      throw _iteratorError;
    }
  }
}

exports['default'] = fs;
module.exports = exports['default'];
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9mcy5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7O21CQUNnQixJQUFJOzs7O3NCQUNELFFBQVE7Ozs7dUJBQ1AsVUFBVTs7OzttQkFDZCxLQUFLOzs7O3dCQUNQLFVBQVU7Ozs7a0JBQ1QsSUFBSTs7OztxQkFDRCxPQUFPOzs7O29CQUNSLE1BQU07Ozs7QUFHdkIsSUFBTSxJQUFHLEdBQUcsc0JBQUUsU0FBUyxzQkFBUyxDQUFDOztBQUVqQyxJQUFJLEVBQUUsR0FBRztBQUNQLEFBQU0sV0FBUyxFQUFDLG1CQUFDLElBQUk7Ozs7OzsyQ0FFWCxJQUFJLENBQUMsTUFBTSxDQUFDLElBQUksRUFBRSxFQUFFLENBQUMsSUFBSSxHQUFHLEVBQUUsQ0FBQyxJQUFJLENBQUM7Ozs7Ozs7Ozs4Q0FFbkMsS0FBSzs7OzhDQUVQLElBQUk7Ozs7Ozs7R0FDWjtBQUNELFFBQU0sRUFBQyxnQkFBQyxJQUFJLEVBQUU7QUFBRSxXQUFPLElBQUksQ0FBQyxTQUFTLENBQUMsSUFBSSxDQUFDLENBQUM7R0FBRTtBQUM5QyxRQUFNLEVBQUUsc0JBQUUsU0FBUyxxQkFBUTtBQUMzQixBQUFNLE9BQUssRUFBQyxlQUFDLE9BQU87UUFDZCxNQUFNOzs7OztBQUFOLGdCQUFNLEdBQUcsc0JBQUUsU0FBUyxDQUFDLGdCQUFJLEtBQUssQ0FBQzs7OzJDQUUzQixNQUFNLENBQUMsT0FBTyxDQUFDOzs7Ozs7Ozs7O2dCQUVqQixrQkFBTyxlQUFJLElBQUksS0FBSyxRQUFRLENBQUE7Ozs7Ozs7Ozs7OztHQUluQztBQUNELFVBQVEsRUFBRSxzQkFBRSxTQUFTLGtCQUFLO0FBQzFCLEFBQU0sS0FBRyxFQUFDLGFBQUMsUUFBUTs7Ozs7MkNBQ0osSUFBRyxDQUFDLFFBQVEsQ0FBQzs7Ozs7Ozs7OztHQUMzQjtBQUNELElBQUUsRUFBRSxzQkFBRSxTQUFTLGlCQUFJO0FBQ25CLE9BQUssRUFBRSxzQkFBRSxTQUFTLG9CQUFPO0FBQ3pCLE1BQUksRUFBRSxzQkFBRSxTQUFTLG1CQUFNO0NBQ3hCLENBQUM7O0FBRUYsSUFBTSxPQUFPLEdBQUcsQ0FBQyxNQUFNLEVBQUUsT0FBTyxFQUFFLFFBQVEsRUFBRSxVQUFVLEVBQUUsV0FBVyxFQUNsRCxPQUFPLEVBQUUsTUFBTSxFQUFFLFVBQVUsRUFBRSxPQUFPLEVBQUUsUUFBUSxFQUFFLFNBQVMsRUFDekQsTUFBTSxFQUFFLFFBQVEsRUFBRSxPQUFPLENBQUMsQ0FBQzs7Ozs7OztBQUU1QyxvQ0FBYyxPQUFPLDRHQUFFO1FBQWQsQ0FBQzs7QUFDUixNQUFFLENBQUMsQ0FBQyxDQUFDLEdBQUcsc0JBQUUsU0FBUyxDQUFDLGdCQUFJLENBQUMsQ0FBQyxDQUFDLENBQUM7R0FDN0I7Ozs7Ozs7Ozs7Ozs7Ozs7cUJBRWMsRUFBRSIsImZpbGUiOiJsaWIvZnMuanMiLCJzb3VyY2VzQ29udGVudCI6WyIvLyBqc2hpbnQgaWdub3JlOiBzdGFydFxuaW1wb3J0IF9mcyBmcm9tICdmcyc7XG5pbXBvcnQgcmltcmFmIGZyb20gJ3JpbXJhZic7XG5pbXBvcnQgbWQ1ZmlsZSBmcm9tICdtZDUtZmlsZSc7XG5pbXBvcnQgbmNwIGZyb20gJ25jcCc7XG5pbXBvcnQgQiBmcm9tICdibHVlYmlyZCc7XG5pbXBvcnQgbXYgZnJvbSAnbXYnO1xuaW1wb3J0IHdoaWNoIGZyb20gJ3doaWNoJztcbmltcG9ydCBnbG9iIGZyb20gJ2dsb2InO1xuXG5cbmNvbnN0IG1kNSA9IEIucHJvbWlzaWZ5KG1kNWZpbGUpO1xuXG5sZXQgZnMgPSB7XG4gIGFzeW5jIGhhc0FjY2VzcyAocGF0aCkge1xuICAgIHRyeSB7XG4gICAgICBhd2FpdCB0aGlzLmFjY2VzcyhwYXRoLCBmcy5GX09LIHwgZnMuUl9PSyk7XG4gICAgfSBjYXRjaCAoZXJyKSB7XG4gICAgICByZXR1cm4gZmFsc2U7XG4gICAgfVxuICAgIHJldHVybiB0cnVlO1xuICB9LFxuICBleGlzdHMgKHBhdGgpIHsgcmV0dXJuIHRoaXMuaGFzQWNjZXNzKHBhdGgpOyB9LFxuICByaW1yYWY6IEIucHJvbWlzaWZ5KHJpbXJhZiksXG4gIGFzeW5jIG1rZGlyIChkaXJOYW1lKSB7XG4gICAgbGV0IF9ta2RpciA9IEIucHJvbWlzaWZ5KF9mcy5ta2Rpcik7XG4gICAgdHJ5IHtcbiAgICAgIGF3YWl0IF9ta2RpcihkaXJOYW1lKTtcbiAgICB9IGNhdGNoIChlcnIpIHtcbiAgICAgIGlmIChlcnIgJiYgZXJyLmNvZGUgIT09IFwiRUVYSVNUXCIpIHtcbiAgICAgICAgdGhyb3cgZXJyO1xuICAgICAgfVxuICAgIH1cbiAgfSxcbiAgY29weUZpbGU6IEIucHJvbWlzaWZ5KG5jcCksXG4gIGFzeW5jIG1kNSAoZmlsZVBhdGgpIHtcbiAgICByZXR1cm4gYXdhaXQgbWQ1KGZpbGVQYXRoKTtcbiAgfSxcbiAgbXY6IEIucHJvbWlzaWZ5KG12KSxcbiAgd2hpY2g6IEIucHJvbWlzaWZ5KHdoaWNoKSxcbiAgZ2xvYjogQi5wcm9taXNpZnkoZ2xvYilcbn07XG5cbmNvbnN0IHNpbXBsZXMgPSBbJ29wZW4nLCAnY2xvc2UnLCAnYWNjZXNzJywgJ3JlYWRGaWxlJywgJ3dyaXRlRmlsZScsXG4gICAgICAgICAgICAgICAgICd3cml0ZScsICdyZWFkJywgJ3JlYWRsaW5rJywgJ2NobW9kJywgJ3VubGluaycsICdyZWFkZGlyJyxcbiAgICAgICAgICAgICAgICAgJ3N0YXQnLCAncmVuYW1lJywgJ2xzdGF0J107XG5cbmZvciAobGV0IHMgb2Ygc2ltcGxlcykge1xuICBmc1tzXSA9IEIucHJvbWlzaWZ5KF9mc1tzXSk7XG59XG5cbmV4cG9ydCBkZWZhdWx0IGZzO1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLiJ9
