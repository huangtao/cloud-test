'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _appiumSupport = require('appium-support');

var _teen_process = require('teen_process');

var _appiumIosDriver = require('appium-ios-driver');

var _logger = require('../logger');

var _logger2 = _interopRequireDefault(_logger);

var commands = _appiumIosDriver.iosCommands.file;

commands.getSimFileFullPath = function callee$0$0(remotePath) {
  var basePath, appName, appNameRegex, appNameMatches, findPath, _ref, stdout, appRoot, subPath, fullPath;

  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        basePath = this.opts.device.getDir();
        appName = null;

        if (this.opts.app) {
          appNameRegex = new RegExp('\\' + _path2['default'].sep + '([\\w-]+\\.app)');
          appNameMatches = appNameRegex.exec(this.opts.app);

          if (appNameMatches) {
            appName = appNameMatches[1];
          }
        }
        // de-absolutize the path
        if (_appiumSupport.system.isWindows()) {
          if (remotePath.indexof('://') === 1) {
            remotePath = remotePath.slice(4);
          }
        } else {
          if (remotePath.indexOf('/') === 0) {
            remotePath = remotePath.slice(1);
          }
        }

        if (!(remotePath.indexOf(appName) === 0)) {
          context$1$0.next = 19;
          break;
        }

        findPath = basePath;

        if (this.opts.platformVersion >= 8) {
          // the .app file appears in /Containers/Data and /Containers/Bundle both. We only want /Bundle
          findPath = _path2['default'].resolve(basePath, 'Containers', 'Bundle');
        }
        findPath = findPath.replace(/\s/g, '\\ ');

        context$1$0.next = 10;
        return _regeneratorRuntime.awrap((0, _teen_process.exec)('find', [findPath, '-name', appName]));

      case 10:
        _ref = context$1$0.sent;
        stdout = _ref.stdout;
        appRoot = stdout.replace(/\n$/, '');
        subPath = remotePath.substring(appName.length + 1);
        fullPath = _path2['default'].resolve(appRoot, subPath);

        _logger2['default'].debug('Finding app-relative file: \'' + fullPath + '\'');
        return context$1$0.abrupt('return', fullPath);

      case 19:
        fullPath = _path2['default'].resolve(basePath, remotePath);

        _logger2['default'].debug('Finding sim-relative file: ' + fullPath);
        return context$1$0.abrupt('return', fullPath);

      case 22:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

exports.commands = commands;
exports['default'] = commands;
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9jb21tYW5kcy9maWxlLW1vdmVtZW50LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7b0JBQWlCLE1BQU07Ozs7NkJBQ0EsZ0JBQWdCOzs0QkFDbEIsY0FBYzs7K0JBQ1AsbUJBQW1COztzQkFDL0IsV0FBVzs7OztBQUczQixJQUFJLFFBQVEsR0FBRyw2QkFBWSxJQUFJLENBQUM7O0FBRWhDLFFBQVEsQ0FBQyxrQkFBa0IsR0FBRyxvQkFBZ0IsVUFBVTtNQUNsRCxRQUFRLEVBQ1IsT0FBTyxFQUdMLFlBQVksRUFDWixjQUFjLEVBaUJkLFFBQVEsUUFPTixNQUFNLEVBQ1IsT0FBTyxFQUNQLE9BQU8sRUFLUCxRQUFROzs7OztBQXBDVixnQkFBUSxHQUFHLElBQUksQ0FBQyxJQUFJLENBQUMsTUFBTSxDQUFDLE1BQU0sRUFBRTtBQUNwQyxlQUFPLEdBQUcsSUFBSTs7QUFFbEIsWUFBSSxJQUFJLENBQUMsSUFBSSxDQUFDLEdBQUcsRUFBRTtBQUNiLHNCQUFZLEdBQUcsSUFBSSxNQUFNLFFBQU0sa0JBQUssR0FBRyxxQkFBa0I7QUFDekQsd0JBQWMsR0FBRyxZQUFZLENBQUMsSUFBSSxDQUFDLElBQUksQ0FBQyxJQUFJLENBQUMsR0FBRyxDQUFDOztBQUNyRCxjQUFJLGNBQWMsRUFBRTtBQUNsQixtQkFBTyxHQUFHLGNBQWMsQ0FBQyxDQUFDLENBQUMsQ0FBQztXQUM3QjtTQUNGOztBQUVELFlBQUksc0JBQU8sU0FBUyxFQUFFLEVBQUU7QUFDdEIsY0FBSSxVQUFVLENBQUMsT0FBTyxDQUFDLEtBQUssQ0FBQyxLQUFLLENBQUMsRUFBRTtBQUNuQyxzQkFBVSxHQUFHLFVBQVUsQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDLENBQUM7V0FDbEM7U0FDRixNQUFNO0FBQ0wsY0FBSSxVQUFVLENBQUMsT0FBTyxDQUFDLEdBQUcsQ0FBQyxLQUFLLENBQUMsRUFBRTtBQUNqQyxzQkFBVSxHQUFHLFVBQVUsQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDLENBQUM7V0FDbEM7U0FDRjs7Y0FFRyxVQUFVLENBQUMsT0FBTyxDQUFDLE9BQU8sQ0FBQyxLQUFLLENBQUMsQ0FBQTs7Ozs7QUFDL0IsZ0JBQVEsR0FBRyxRQUFROztBQUN2QixZQUFJLElBQUksQ0FBQyxJQUFJLENBQUMsZUFBZSxJQUFJLENBQUMsRUFBRTs7QUFFbEMsa0JBQVEsR0FBRyxrQkFBSyxPQUFPLENBQUMsUUFBUSxFQUFFLFlBQVksRUFBRSxRQUFRLENBQUMsQ0FBQztTQUMzRDtBQUNELGdCQUFRLEdBQUksUUFBUSxDQUFDLE9BQU8sQ0FBQyxLQUFLLEVBQUUsS0FBSyxDQUFDLENBQUM7Ozt5Q0FFcEIsd0JBQUssTUFBTSxFQUFFLENBQUMsUUFBUSxFQUFFLE9BQU8sRUFBRSxPQUFPLENBQUMsQ0FBQzs7OztBQUEzRCxjQUFNLFFBQU4sTUFBTTtBQUNSLGVBQU8sR0FBRyxNQUFNLENBQUMsT0FBTyxDQUFDLEtBQUssRUFBRSxFQUFFLENBQUM7QUFDbkMsZUFBTyxHQUFHLFVBQVUsQ0FBQyxTQUFTLENBQUMsT0FBTyxDQUFDLE1BQU0sR0FBRyxDQUFDLENBQUM7QUFDbEQsZ0JBQVEsR0FBRyxrQkFBSyxPQUFPLENBQUMsT0FBTyxFQUFFLE9BQU8sQ0FBQzs7QUFDN0MsNEJBQUksS0FBSyxtQ0FBZ0MsUUFBUSxRQUFJLENBQUM7NENBQy9DLFFBQVE7OztBQUVYLGdCQUFRLEdBQUcsa0JBQUssT0FBTyxDQUFDLFFBQVEsRUFBRSxVQUFVLENBQUM7O0FBQ2pELDRCQUFJLEtBQUssaUNBQStCLFFBQVEsQ0FBRyxDQUFDOzRDQUM3QyxRQUFROzs7Ozs7O0NBRWxCLENBQUM7O1FBR08sUUFBUSxHQUFSLFFBQVE7cUJBQ0YsUUFBUSIsImZpbGUiOiJsaWIvY29tbWFuZHMvZmlsZS1tb3ZlbWVudC5qcyIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCBwYXRoIGZyb20gJ3BhdGgnO1xuaW1wb3J0IHsgc3lzdGVtIH0gZnJvbSAnYXBwaXVtLXN1cHBvcnQnO1xuaW1wb3J0IHsgZXhlYyB9IGZyb20gJ3RlZW5fcHJvY2Vzcyc7XG5pbXBvcnQgeyBpb3NDb21tYW5kcyB9IGZyb20gJ2FwcGl1bS1pb3MtZHJpdmVyJztcbmltcG9ydCBsb2cgZnJvbSAnLi4vbG9nZ2VyJztcblxuXG5sZXQgY29tbWFuZHMgPSBpb3NDb21tYW5kcy5maWxlO1xuXG5jb21tYW5kcy5nZXRTaW1GaWxlRnVsbFBhdGggPSBhc3luYyBmdW5jdGlvbiAocmVtb3RlUGF0aCkge1xuICBsZXQgYmFzZVBhdGggPSB0aGlzLm9wdHMuZGV2aWNlLmdldERpcigpO1xuICBsZXQgYXBwTmFtZSA9IG51bGw7XG5cbiAgaWYgKHRoaXMub3B0cy5hcHApIHtcbiAgICBsZXQgYXBwTmFtZVJlZ2V4ID0gbmV3IFJlZ0V4cChgXFxcXCR7cGF0aC5zZXB9KFtcXFxcdy1dK1xcXFwuYXBwKWApO1xuICAgIGxldCBhcHBOYW1lTWF0Y2hlcyA9IGFwcE5hbWVSZWdleC5leGVjKHRoaXMub3B0cy5hcHApO1xuICAgIGlmIChhcHBOYW1lTWF0Y2hlcykge1xuICAgICAgYXBwTmFtZSA9IGFwcE5hbWVNYXRjaGVzWzFdO1xuICAgIH1cbiAgfVxuICAvLyBkZS1hYnNvbHV0aXplIHRoZSBwYXRoXG4gIGlmIChzeXN0ZW0uaXNXaW5kb3dzKCkpIHtcbiAgICBpZiAocmVtb3RlUGF0aC5pbmRleG9mKCc6Ly8nKSA9PT0gMSkge1xuICAgICAgcmVtb3RlUGF0aCA9IHJlbW90ZVBhdGguc2xpY2UoNCk7XG4gICAgfVxuICB9IGVsc2Uge1xuICAgIGlmIChyZW1vdGVQYXRoLmluZGV4T2YoJy8nKSA9PT0gMCkge1xuICAgICAgcmVtb3RlUGF0aCA9IHJlbW90ZVBhdGguc2xpY2UoMSk7XG4gICAgfVxuICB9XG5cbiAgaWYgKHJlbW90ZVBhdGguaW5kZXhPZihhcHBOYW1lKSA9PT0gMCkge1xuICAgIGxldCBmaW5kUGF0aCA9IGJhc2VQYXRoO1xuICAgIGlmICh0aGlzLm9wdHMucGxhdGZvcm1WZXJzaW9uID49IDgpIHtcbiAgICAgIC8vIHRoZSAuYXBwIGZpbGUgYXBwZWFycyBpbiAvQ29udGFpbmVycy9EYXRhIGFuZCAvQ29udGFpbmVycy9CdW5kbGUgYm90aC4gV2Ugb25seSB3YW50IC9CdW5kbGVcbiAgICAgIGZpbmRQYXRoID0gcGF0aC5yZXNvbHZlKGJhc2VQYXRoLCAnQ29udGFpbmVycycsICdCdW5kbGUnKTtcbiAgICB9XG4gICAgZmluZFBhdGggPSAgZmluZFBhdGgucmVwbGFjZSgvXFxzL2csICdcXFxcICcpO1xuXG4gICAgbGV0IHsgc3Rkb3V0IH0gPSBhd2FpdCBleGVjKCdmaW5kJywgW2ZpbmRQYXRoLCAnLW5hbWUnLCBhcHBOYW1lXSk7XG4gICAgbGV0IGFwcFJvb3QgPSBzdGRvdXQucmVwbGFjZSgvXFxuJC8sICcnKTtcbiAgICBsZXQgc3ViUGF0aCA9IHJlbW90ZVBhdGguc3Vic3RyaW5nKGFwcE5hbWUubGVuZ3RoICsgMSk7XG4gICAgbGV0IGZ1bGxQYXRoID0gcGF0aC5yZXNvbHZlKGFwcFJvb3QsIHN1YlBhdGgpO1xuICAgIGxvZy5kZWJ1ZyhgRmluZGluZyBhcHAtcmVsYXRpdmUgZmlsZTogJyR7ZnVsbFBhdGh9J2ApO1xuICAgIHJldHVybiBmdWxsUGF0aDtcbiAgfSBlbHNlIHtcbiAgICBsZXQgZnVsbFBhdGggPSBwYXRoLnJlc29sdmUoYmFzZVBhdGgsIHJlbW90ZVBhdGgpO1xuICAgIGxvZy5kZWJ1ZyhgRmluZGluZyBzaW0tcmVsYXRpdmUgZmlsZTogJHtmdWxsUGF0aH1gKTtcbiAgICByZXR1cm4gZnVsbFBhdGg7XG4gIH1cbn07XG5cblxuZXhwb3J0IHsgY29tbWFuZHMgfTtcbmV4cG9ydCBkZWZhdWx0IGNvbW1hbmRzO1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLi8uLiJ9
