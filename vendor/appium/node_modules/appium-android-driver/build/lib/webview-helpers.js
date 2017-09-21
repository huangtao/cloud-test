'use strict';

var _slicedToArray = require('babel-runtime/helpers/sliced-to-array')['default'];

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _getIterator = require('babel-runtime/core-js/get-iterator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

var _logger = require('./logger');

var _logger2 = _interopRequireDefault(_logger);

var _asyncbox = require('asyncbox');

var NATIVE_WIN = "NATIVE_APP";
var WEBVIEW_WIN = "WEBVIEW";
var WEBVIEW_BASE = WEBVIEW_WIN + '_';
var CHROMIUM_WIN = "CHROMIUM";

var helpers = {};

// This function gets a list of android system processes and returns ones
// that look like webviews, with the appropriate webview prefix and their PID.
// If we pass in a deviceSocket, we only attempt to find webviews which match
// that socket name (this is for apps which embed Chromium, which isn't the
// same as chrome-backed webviews)
// TODO: some of this function belongs in appium-adb
function webviewsFromProcs(adb, deviceSocket) {
  var webviews, out, _iteratorNormalCompletion, _didIteratorError, _iteratorError, _iterator, _step, line, webviewPid;

  return _regeneratorRuntime.async(function webviewsFromProcs$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        webviews = [];
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap(adb.shell(["cat", "/proc/net/unix"]));

      case 3:
        out = context$1$0.sent;
        _iteratorNormalCompletion = true;
        _didIteratorError = false;
        _iteratorError = undefined;
        context$1$0.prev = 7;

        for (_iterator = _getIterator(out.split("\n")); !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
          line = _step.value;

          line = line.trim();
          webviewPid = line.match(/@?webview_devtools_remote_(\d+)/);

          if (deviceSocket) {
            if (line.indexOf('@' + deviceSocket) === line.length - deviceSocket.length - 1) {
              if (webviewPid) {
                webviews.push(WEBVIEW_BASE + webviewPid[1]);
              } else {
                webviews.push(CHROMIUM_WIN);
              }
            }
          } else if (webviewPid) {
            // for multiple webviews a list of 'WEBVIEW_<index>' will be returned
            // where <index> is zero based (same is in selendroid)
            webviews.push(WEBVIEW_BASE + webviewPid[1]);
          }
        }
        context$1$0.next = 15;
        break;

      case 11:
        context$1$0.prev = 11;
        context$1$0.t0 = context$1$0['catch'](7);
        _didIteratorError = true;
        _iteratorError = context$1$0.t0;

      case 15:
        context$1$0.prev = 15;
        context$1$0.prev = 16;

        if (!_iteratorNormalCompletion && _iterator['return']) {
          _iterator['return']();
        }

      case 18:
        context$1$0.prev = 18;

        if (!_didIteratorError) {
          context$1$0.next = 21;
          break;
        }

        throw _iteratorError;

      case 21:
        return context$1$0.finish(18);

      case 22:
        return context$1$0.finish(15);

      case 23:
        return context$1$0.abrupt('return', _lodash2['default'].uniq(webviews));

      case 24:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[7, 11, 15, 23], [16,, 18, 22]]);
}

// Take a webview name like WEBVIEW_4296 and use 'adb shell ps' to figure out
// which app package is associated with that webview. One of the reasons we
// want to do this is to make sure we're listing webviews for the actual AUT,
// not some other running app
// TODO: this should be called procFromPid and exist in appium-adb
function procFromWebview(adb, webview) {
  var pid, out, pkg, lines, header, pidColumn, pkgColumn, _iteratorNormalCompletion2, _didIteratorError2, _iteratorError2, _iterator2, _step2, line;

  return _regeneratorRuntime.async(function procFromWebview$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        pid = webview.match(/\d+$/);

        if (pid) {
          context$1$0.next = 3;
          break;
        }

        throw new Error('Could not find PID for webview ' + webview);

      case 3:
        pid = pid[0];
        _logger2['default'].debug(webview + ' mapped to pid ' + pid);
        _logger2['default'].debug("Getting process name for webview");
        context$1$0.next = 8;
        return _regeneratorRuntime.awrap(adb.shell("ps"));

      case 8:
        out = context$1$0.sent;
        pkg = "unknown";
        lines = out.split(/\r?\n/);
        header = lines[0].trim().split(/\s+/);
        pidColumn = header.indexOf("PID");
        pkgColumn = header.indexOf("NAME") + 1;
        _iteratorNormalCompletion2 = true;
        _didIteratorError2 = false;
        _iteratorError2 = undefined;
        context$1$0.prev = 17;
        _iterator2 = _getIterator(lines);

      case 19:
        if (_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done) {
          context$1$0.next = 30;
          break;
        }

        line = _step2.value;

        line = line.trim().split(/\s+/);

        if (!(line[pidColumn].indexOf(pid) !== -1)) {
          context$1$0.next = 27;
          break;
        }

        // Android 6.0 support (occasionally returns undefined - Appium issue #5689)
        pkg = _lodash2['default'].isUndefined(line[pkgColumn]) ? line[pkgColumn - 1] : line[pkgColumn];
        _logger2['default'].debug('Parsed pid: ' + line[pidColumn] + ' pkg: ' + pkg + '!');
        _logger2['default'].debug('from: ' + line);
        return context$1$0.abrupt('break', 30);

      case 27:
        _iteratorNormalCompletion2 = true;
        context$1$0.next = 19;
        break;

      case 30:
        context$1$0.next = 36;
        break;

      case 32:
        context$1$0.prev = 32;
        context$1$0.t0 = context$1$0['catch'](17);
        _didIteratorError2 = true;
        _iteratorError2 = context$1$0.t0;

      case 36:
        context$1$0.prev = 36;
        context$1$0.prev = 37;

        if (!_iteratorNormalCompletion2 && _iterator2['return']) {
          _iterator2['return']();
        }

      case 39:
        context$1$0.prev = 39;

        if (!_didIteratorError2) {
          context$1$0.next = 42;
          break;
        }

        throw _iteratorError2;

      case 42:
        return context$1$0.finish(39);

      case 43:
        return context$1$0.finish(36);

      case 44:
        _logger2['default'].debug('returning process name: ' + pkg);
        return context$1$0.abrupt('return', pkg);

      case 46:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[17, 32, 36, 44], [37,, 39, 43]]);
}

// Get a list of available webviews by introspecting processes with adb, where
// webviews are listed. It's possible to pass in a 'deviceSocket' arg, which
// limits the webview possibilities to the one running on the Chromium devtools
// socket we're interested in (see note on webviewsFromProcs)
helpers.getWebviews = function callee$0$0(adb, deviceSocket) {
  var webviews;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    var _this = this;

    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        _logger2['default'].debug("Getting a list of available webviews");
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap(webviewsFromProcs(adb, deviceSocket));

      case 3:
        webviews = context$1$0.sent;

        if (!deviceSocket) {
          context$1$0.next = 6;
          break;
        }

        return context$1$0.abrupt('return', webviews);

      case 6:
        context$1$0.next = 8;
        return _regeneratorRuntime.awrap((0, _asyncbox.asyncmap)(webviews, function callee$1$0(webviewName) {
          var pkg;
          return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
            while (1) switch (context$2$0.prev = context$2$0.next) {
              case 0:
                context$2$0.next = 2;
                return _regeneratorRuntime.awrap(procFromWebview(adb, webviewName));

              case 2:
                pkg = context$2$0.sent;
                return context$2$0.abrupt('return', WEBVIEW_BASE + pkg);

              case 4:
              case 'end':
                return context$2$0.stop();
            }
          }, null, _this);
        }));

      case 8:
        webviews = context$1$0.sent;

        _logger2['default'].debug('Found webviews: ' + JSON.stringify(webviews));
        return context$1$0.abrupt('return', webviews);

      case 11:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

helpers.decorateChromeOptions = function (caps, opts, deviceId) {
  // add options from appium session caps
  if (opts.chromeOptions) {
    var _iteratorNormalCompletion3 = true;
    var _didIteratorError3 = false;
    var _iteratorError3 = undefined;

    try {
      for (var _iterator3 = _getIterator(_lodash2['default'].pairs(opts.chromeOptions)), _step3; !(_iteratorNormalCompletion3 = (_step3 = _iterator3.next()).done); _iteratorNormalCompletion3 = true) {
        var _step3$value = _slicedToArray(_step3.value, 2);

        var opt = _step3$value[0];
        var val = _step3$value[1];

        if (_lodash2['default'].isUndefined(caps.chromeOptions[opt])) {
          caps.chromeOptions[opt] = val;
        } else {
          _logger2['default'].warn('Cannot pass option ' + caps.chromeOptions[opt] + ' because ' + "Appium needs it to make chromeDriver work");
        }
      }
    } catch (err) {
      _didIteratorError3 = true;
      _iteratorError3 = err;
    } finally {
      try {
        if (!_iteratorNormalCompletion3 && _iterator3['return']) {
          _iterator3['return']();
        }
      } finally {
        if (_didIteratorError3) {
          throw _iteratorError3;
        }
      }
    }
  }

  // add device id from adb
  caps.chromeOptions.androidDeviceSerial = deviceId;
  return caps;
};

exports['default'] = helpers;
exports.helpers = helpers;
exports.NATIVE_WIN = NATIVE_WIN;
exports.WEBVIEW_WIN = WEBVIEW_WIN;
exports.WEBVIEW_BASE = WEBVIEW_BASE;
exports.CHROMIUM_WIN = CHROMIUM_WIN;

// webview_devtools_remote_4296 => 4296

/* Output of ps is like:
 USER     PID   PPID  VSIZE  RSS     WCHAN    PC         NAME
 u0_a136   6248  179   946000 48144 ffffffff 4005903e R com.example.test
*/

// the column order may not be identical on all androids
// dynamically locate the pid and name column.
//# sourceMappingURL=data:application/json;charset=utf8;base64,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RSxJQUFJLEVBQUUsUUFBUSxFQUFFOztBQUU5RCxNQUFJLElBQUksQ0FBQyxhQUFhLEVBQUU7Ozs7OztBQUN0Qix5Q0FBdUIsb0JBQUUsS0FBSyxDQUFDLElBQUksQ0FBQyxhQUFhLENBQUMsaUhBQUU7OztZQUExQyxHQUFHO1lBQUUsR0FBRzs7QUFDaEIsWUFBSSxvQkFBRSxXQUFXLENBQUMsSUFBSSxDQUFDLGFBQWEsQ0FBQyxHQUFHLENBQUMsQ0FBQyxFQUFFO0FBQzFDLGNBQUksQ0FBQyxhQUFhLENBQUMsR0FBRyxDQUFDLEdBQUcsR0FBRyxDQUFDO1NBQy9CLE1BQU07QUFDTCw4QkFBTyxJQUFJLENBQUMsd0JBQXNCLElBQUksQ0FBQyxhQUFhLENBQUMsR0FBRyxDQUFDLGlCQUM3QywyQ0FBMkMsQ0FBQyxDQUFDO1NBQzFEO09BQ0Y7Ozs7Ozs7Ozs7Ozs7OztHQUNGOzs7QUFHRCxNQUFJLENBQUMsYUFBYSxDQUFDLG1CQUFtQixHQUFHLFFBQVEsQ0FBQztBQUNsRCxTQUFPLElBQUksQ0FBQztDQUNiLENBQUM7O3FCQUVhLE9BQU87UUFDYixPQUFPLEdBQVAsT0FBTztRQUFFLFVBQVUsR0FBVixVQUFVO1FBQUUsV0FBVyxHQUFYLFdBQVc7UUFBRSxZQUFZLEdBQVosWUFBWTtRQUFFLFlBQVksR0FBWixZQUFZIiwiZmlsZSI6ImxpYi93ZWJ2aWV3LWhlbHBlcnMuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgXyBmcm9tICdsb2Rhc2gnO1xuaW1wb3J0IGxvZ2dlciBmcm9tICcuL2xvZ2dlcic7XG5pbXBvcnQgeyBhc3luY21hcCB9IGZyb20gJ2FzeW5jYm94JztcblxuY29uc3QgTkFUSVZFX1dJTiA9IFwiTkFUSVZFX0FQUFwiO1xuY29uc3QgV0VCVklFV19XSU4gPSBcIldFQlZJRVdcIjtcbmNvbnN0IFdFQlZJRVdfQkFTRSA9IGAke1dFQlZJRVdfV0lOfV9gO1xuY29uc3QgQ0hST01JVU1fV0lOID0gXCJDSFJPTUlVTVwiO1xuXG5sZXQgaGVscGVycyA9IHt9O1xuXG4vLyBUaGlzIGZ1bmN0aW9uIGdldHMgYSBsaXN0IG9mIGFuZHJvaWQgc3lzdGVtIHByb2Nlc3NlcyBhbmQgcmV0dXJucyBvbmVzXG4vLyB0aGF0IGxvb2sgbGlrZSB3ZWJ2aWV3cywgd2l0aCB0aGUgYXBwcm9wcmlhdGUgd2VidmlldyBwcmVmaXggYW5kIHRoZWlyIFBJRC5cbi8vIElmIHdlIHBhc3MgaW4gYSBkZXZpY2VTb2NrZXQsIHdlIG9ubHkgYXR0ZW1wdCB0byBmaW5kIHdlYnZpZXdzIHdoaWNoIG1hdGNoXG4vLyB0aGF0IHNvY2tldCBuYW1lICh0aGlzIGlzIGZvciBhcHBzIHdoaWNoIGVtYmVkIENocm9taXVtLCB3aGljaCBpc24ndCB0aGVcbi8vIHNhbWUgYXMgY2hyb21lLWJhY2tlZCB3ZWJ2aWV3cylcbi8vIFRPRE86IHNvbWUgb2YgdGhpcyBmdW5jdGlvbiBiZWxvbmdzIGluIGFwcGl1bS1hZGJcbmFzeW5jIGZ1bmN0aW9uIHdlYnZpZXdzRnJvbVByb2NzIChhZGIsIGRldmljZVNvY2tldCkge1xuICBsZXQgd2Vidmlld3MgPSBbXTtcbiAgbGV0IG91dCA9IGF3YWl0IGFkYi5zaGVsbChbXCJjYXRcIiwgXCIvcHJvYy9uZXQvdW5peFwiXSk7XG4gIGZvciAobGV0IGxpbmUgb2Ygb3V0LnNwbGl0KFwiXFxuXCIpKSB7XG4gICAgbGluZSA9IGxpbmUudHJpbSgpO1xuICAgIGxldCB3ZWJ2aWV3UGlkID0gbGluZS5tYXRjaCgvQD93ZWJ2aWV3X2RldnRvb2xzX3JlbW90ZV8oXFxkKykvKTtcbiAgICBpZiAoZGV2aWNlU29ja2V0KSB7XG4gICAgICBpZiAobGluZS5pbmRleE9mKGBAJHtkZXZpY2VTb2NrZXR9YCkgPT09IGxpbmUubGVuZ3RoIC0gZGV2aWNlU29ja2V0Lmxlbmd0aCAtIDEpIHtcbiAgICAgICAgaWYgKHdlYnZpZXdQaWQpIHtcbiAgICAgICAgICB3ZWJ2aWV3cy5wdXNoKFdFQlZJRVdfQkFTRSArIHdlYnZpZXdQaWRbMV0pO1xuICAgICAgICB9IGVsc2Uge1xuICAgICAgICAgIHdlYnZpZXdzLnB1c2goQ0hST01JVU1fV0lOKTtcbiAgICAgICAgfVxuICAgICAgfVxuICAgIH0gZWxzZSBpZiAod2Vidmlld1BpZCkge1xuICAgICAgLy8gZm9yIG11bHRpcGxlIHdlYnZpZXdzIGEgbGlzdCBvZiAnV0VCVklFV188aW5kZXg+JyB3aWxsIGJlIHJldHVybmVkXG4gICAgICAvLyB3aGVyZSA8aW5kZXg+IGlzIHplcm8gYmFzZWQgKHNhbWUgaXMgaW4gc2VsZW5kcm9pZClcbiAgICAgIHdlYnZpZXdzLnB1c2goV0VCVklFV19CQVNFICsgd2Vidmlld1BpZFsxXSk7XG4gICAgfVxuICB9XG4gIHJldHVybiBfLnVuaXEod2Vidmlld3MpO1xufVxuXG4vLyBUYWtlIGEgd2VidmlldyBuYW1lIGxpa2UgV0VCVklFV180Mjk2IGFuZCB1c2UgJ2FkYiBzaGVsbCBwcycgdG8gZmlndXJlIG91dFxuLy8gd2hpY2ggYXBwIHBhY2thZ2UgaXMgYXNzb2NpYXRlZCB3aXRoIHRoYXQgd2Vidmlldy4gT25lIG9mIHRoZSByZWFzb25zIHdlXG4vLyB3YW50IHRvIGRvIHRoaXMgaXMgdG8gbWFrZSBzdXJlIHdlJ3JlIGxpc3Rpbmcgd2Vidmlld3MgZm9yIHRoZSBhY3R1YWwgQVVULFxuLy8gbm90IHNvbWUgb3RoZXIgcnVubmluZyBhcHBcbi8vIFRPRE86IHRoaXMgc2hvdWxkIGJlIGNhbGxlZCBwcm9jRnJvbVBpZCBhbmQgZXhpc3QgaW4gYXBwaXVtLWFkYlxuYXN5bmMgZnVuY3Rpb24gcHJvY0Zyb21XZWJ2aWV3IChhZGIsIHdlYnZpZXcpIHtcbiAgLy8gd2Vidmlld19kZXZ0b29sc19yZW1vdGVfNDI5NiA9PiA0Mjk2XG4gIGxldCBwaWQgPSB3ZWJ2aWV3Lm1hdGNoKC9cXGQrJC8pO1xuICBpZiAoIXBpZCkge1xuICAgIHRocm93IG5ldyBFcnJvcihgQ291bGQgbm90IGZpbmQgUElEIGZvciB3ZWJ2aWV3ICR7d2Vidmlld31gKTtcbiAgfVxuICBwaWQgPSBwaWRbMF07XG4gIGxvZ2dlci5kZWJ1ZyhgJHt3ZWJ2aWV3fSBtYXBwZWQgdG8gcGlkICR7cGlkfWApO1xuICBsb2dnZXIuZGVidWcoXCJHZXR0aW5nIHByb2Nlc3MgbmFtZSBmb3Igd2Vidmlld1wiKTtcbiAgbGV0IG91dCA9IGF3YWl0IGFkYi5zaGVsbChcInBzXCIpO1xuICBsZXQgcGtnID0gXCJ1bmtub3duXCI7XG4gIGxldCBsaW5lcyA9IG91dC5zcGxpdCgvXFxyP1xcbi8pO1xuICAvKiBPdXRwdXQgb2YgcHMgaXMgbGlrZTpcbiAgIFVTRVIgICAgIFBJRCAgIFBQSUQgIFZTSVpFICBSU1MgICAgIFdDSEFOICAgIFBDICAgICAgICAgTkFNRVxuICAgdTBfYTEzNiAgIDYyNDggIDE3OSAgIDk0NjAwMCA0ODE0NCBmZmZmZmZmZiA0MDA1OTAzZSBSIGNvbS5leGFtcGxlLnRlc3RcbiAgKi9cbiAgbGV0IGhlYWRlciA9IGxpbmVzWzBdLnRyaW0oKS5zcGxpdCgvXFxzKy8pO1xuICAvLyB0aGUgY29sdW1uIG9yZGVyIG1heSBub3QgYmUgaWRlbnRpY2FsIG9uIGFsbCBhbmRyb2lkc1xuICAvLyBkeW5hbWljYWxseSBsb2NhdGUgdGhlIHBpZCBhbmQgbmFtZSBjb2x1bW4uXG4gIGxldCBwaWRDb2x1bW4gPSBoZWFkZXIuaW5kZXhPZihcIlBJRFwiKTtcbiAgbGV0IHBrZ0NvbHVtbiA9IGhlYWRlci5pbmRleE9mKFwiTkFNRVwiKSArIDE7XG5cbiAgZm9yIChsZXQgbGluZSBvZiBsaW5lcykge1xuICAgIGxpbmUgPSBsaW5lLnRyaW0oKS5zcGxpdCgvXFxzKy8pO1xuICAgIGlmIChsaW5lW3BpZENvbHVtbl0uaW5kZXhPZihwaWQpICE9PSAtMSkge1xuICAgICAgLy8gQW5kcm9pZCA2LjAgc3VwcG9ydCAob2NjYXNpb25hbGx5IHJldHVybnMgdW5kZWZpbmVkIC0gQXBwaXVtIGlzc3VlICM1Njg5KVxuICAgICAgcGtnID0gXy5pc1VuZGVmaW5lZChsaW5lW3BrZ0NvbHVtbl0pID8gbGluZVtwa2dDb2x1bW4tMV0gOiBsaW5lW3BrZ0NvbHVtbl07XG4gICAgICBsb2dnZXIuZGVidWcoYFBhcnNlZCBwaWQ6ICR7bGluZVtwaWRDb2x1bW5dfSBwa2c6ICR7cGtnfSFgKTtcbiAgICAgIGxvZ2dlci5kZWJ1ZyhgZnJvbTogJHtsaW5lfWApO1xuICAgICAgYnJlYWs7XG4gICAgfVxuICB9XG4gIGxvZ2dlci5kZWJ1ZyhgcmV0dXJuaW5nIHByb2Nlc3MgbmFtZTogJHtwa2d9YCk7XG4gIHJldHVybiBwa2c7XG59XG5cbi8vIEdldCBhIGxpc3Qgb2YgYXZhaWxhYmxlIHdlYnZpZXdzIGJ5IGludHJvc3BlY3RpbmcgcHJvY2Vzc2VzIHdpdGggYWRiLCB3aGVyZVxuLy8gd2Vidmlld3MgYXJlIGxpc3RlZC4gSXQncyBwb3NzaWJsZSB0byBwYXNzIGluIGEgJ2RldmljZVNvY2tldCcgYXJnLCB3aGljaFxuLy8gbGltaXRzIHRoZSB3ZWJ2aWV3IHBvc3NpYmlsaXRpZXMgdG8gdGhlIG9uZSBydW5uaW5nIG9uIHRoZSBDaHJvbWl1bSBkZXZ0b29sc1xuLy8gc29ja2V0IHdlJ3JlIGludGVyZXN0ZWQgaW4gKHNlZSBub3RlIG9uIHdlYnZpZXdzRnJvbVByb2NzKVxuaGVscGVycy5nZXRXZWJ2aWV3cyA9IGFzeW5jIGZ1bmN0aW9uIChhZGIsIGRldmljZVNvY2tldCkge1xuICBsb2dnZXIuZGVidWcoXCJHZXR0aW5nIGEgbGlzdCBvZiBhdmFpbGFibGUgd2Vidmlld3NcIik7XG4gIGxldCB3ZWJ2aWV3cyA9IGF3YWl0IHdlYnZpZXdzRnJvbVByb2NzKGFkYiwgZGV2aWNlU29ja2V0KTtcblxuICBpZiAoZGV2aWNlU29ja2V0KSB7XG4gICAgcmV0dXJuIHdlYnZpZXdzO1xuICB9XG5cbiAgd2Vidmlld3MgPSBhd2FpdCBhc3luY21hcCh3ZWJ2aWV3cywgYXN5bmMgKHdlYnZpZXdOYW1lKSA9PiB7XG4gICAgbGV0IHBrZyA9IGF3YWl0IHByb2NGcm9tV2VidmlldyhhZGIsIHdlYnZpZXdOYW1lKTtcbiAgICByZXR1cm4gV0VCVklFV19CQVNFICsgcGtnO1xuICB9KTtcbiAgbG9nZ2VyLmRlYnVnKGBGb3VuZCB3ZWJ2aWV3czogJHtKU09OLnN0cmluZ2lmeSh3ZWJ2aWV3cyl9YCk7XG4gIHJldHVybiB3ZWJ2aWV3cztcbn07XG5cbmhlbHBlcnMuZGVjb3JhdGVDaHJvbWVPcHRpb25zID0gZnVuY3Rpb24gKGNhcHMsIG9wdHMsIGRldmljZUlkKSB7XG4gIC8vIGFkZCBvcHRpb25zIGZyb20gYXBwaXVtIHNlc3Npb24gY2Fwc1xuICBpZiAob3B0cy5jaHJvbWVPcHRpb25zKSB7XG4gICAgZm9yIChsZXQgW29wdCwgdmFsXSBvZiBfLnBhaXJzKG9wdHMuY2hyb21lT3B0aW9ucykpIHtcbiAgICAgIGlmIChfLmlzVW5kZWZpbmVkKGNhcHMuY2hyb21lT3B0aW9uc1tvcHRdKSkge1xuICAgICAgICBjYXBzLmNocm9tZU9wdGlvbnNbb3B0XSA9IHZhbDtcbiAgICAgIH0gZWxzZSB7XG4gICAgICAgIGxvZ2dlci53YXJuKGBDYW5ub3QgcGFzcyBvcHRpb24gJHtjYXBzLmNocm9tZU9wdGlvbnNbb3B0XX0gYmVjYXVzZSBgICtcbiAgICAgICAgICAgICAgICAgICAgXCJBcHBpdW0gbmVlZHMgaXQgdG8gbWFrZSBjaHJvbWVEcml2ZXIgd29ya1wiKTtcbiAgICAgIH1cbiAgICB9XG4gIH1cblxuICAvLyBhZGQgZGV2aWNlIGlkIGZyb20gYWRiXG4gIGNhcHMuY2hyb21lT3B0aW9ucy5hbmRyb2lkRGV2aWNlU2VyaWFsID0gZGV2aWNlSWQ7XG4gIHJldHVybiBjYXBzO1xufTtcblxuZXhwb3J0IGRlZmF1bHQgaGVscGVycztcbmV4cG9ydCB7IGhlbHBlcnMsIE5BVElWRV9XSU4sIFdFQlZJRVdfV0lOLCBXRUJWSUVXX0JBU0UsIENIUk9NSVVNX1dJTiB9O1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLiJ9
