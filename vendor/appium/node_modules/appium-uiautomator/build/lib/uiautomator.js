'use strict';

var _get = require('babel-runtime/helpers/get')['default'];

var _inherits = require('babel-runtime/helpers/inherits')['default'];

var _createClass = require('babel-runtime/helpers/create-class')['default'];

var _classCallCheck = require('babel-runtime/helpers/class-call-check')['default'];

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _events = require('events');

var _events2 = _interopRequireDefault(_events);

var _appiumSupport = require('appium-support');

var log = _appiumSupport.logger.getLogger('UiAutomator');

var UiAutomator = (function (_events$EventEmitter) {
  _inherits(UiAutomator, _events$EventEmitter);

  function UiAutomator(adb) {
    _classCallCheck(this, UiAutomator);

    if (!adb) {
      log.errorAndThrow("adb is required to instantiate UiAutomator");
    }
    _get(Object.getPrototypeOf(UiAutomator.prototype), 'constructor', this).call(this);
    this.adb = adb;
    this.tempPath = "/data/local/tmp/";
  }

  _createClass(UiAutomator, [{
    key: 'start',
    value: function start(uiAutomatorBinaryPath, className, startDetector) {
      var processIsAlive,
          jarName,
          _len,
          extraParams,
          _key,
          args,
          args$2$0 = arguments;

      return _regeneratorRuntime.async(function start$(context$2$0) {
        var _this = this;

        while (1) switch (context$2$0.prev = context$2$0.next) {
          case 0:
            processIsAlive = undefined;
            context$2$0.prev = 1;

            log.debug("Starting UiAutomator");
            this.changeState(UiAutomator.STATE_STARTING);

            log.debug("Parsing uiautomator jar");
            // expecting a path like /ads/ads/foo.jar or \asd\asd\foo.jar
            jarName = this.parseJarNameFromPath(uiAutomatorBinaryPath);
            context$2$0.next = 8;
            return _regeneratorRuntime.awrap(this.adb.push(uiAutomatorBinaryPath, this.tempPath));

          case 8:
            context$2$0.next = 10;
            return _regeneratorRuntime.awrap(this.killUiAutomatorOnDevice());

          case 10:

            log.debug('Starting UIAutomator');

            for (_len = args$2$0.length, extraParams = Array(_len > 3 ? _len - 3 : 0), _key = 3; _key < _len; _key++) {
              extraParams[_key - 3] = args$2$0[_key];
            }

            args = ["shell", "uiautomator", "runtest", jarName, "-c", className].concat(extraParams);

            this.proc = this.adb.createSubProcess(args);

            // handle out-of-bound exit by simply emitting a stopped state
            this.proc.on('exit', function (code, signal) {
              processIsAlive = false;
              // cleanup
              if (_this.state !== UiAutomator.STATE_STOPPED && _this.state !== UiAutomator.STATE_STOPPING) {
                var msg = 'UiAutomator exited unexpectedly with code ' + code + ', ' + ('signal ' + signal);
                log.error(msg);
              } else if (_this.state === UiAutomator.STATE_STOPPING) {
                log.debug("UiAutomator shut down normally");
              }
              _this.changeState(UiAutomator.STATE_STOPPED);
            });

            context$2$0.next = 17;
            return _regeneratorRuntime.awrap(this.proc.start(startDetector));

          case 17:
            processIsAlive = true;
            this.changeState(UiAutomator.STATE_ONLINE);
            return context$2$0.abrupt('return', this.proc);

          case 22:
            context$2$0.prev = 22;
            context$2$0.t0 = context$2$0['catch'](1);

            this.emit(UiAutomator.EVENT_ERROR, context$2$0.t0);

            if (!processIsAlive) {
              context$2$0.next = 30;
              break;
            }

            context$2$0.next = 28;
            return _regeneratorRuntime.awrap(this.killUiAutomatorOnDevice());

          case 28:
            context$2$0.next = 30;
            return _regeneratorRuntime.awrap(this.proc.stop());

          case 30:
            log.errorAndThrow(context$2$0.t0);

          case 31:
          case 'end':
            return context$2$0.stop();
        }
      }, null, this, [[1, 22]]);
    }
  }, {
    key: 'shutdown',
    value: function shutdown() {
      return _regeneratorRuntime.async(function shutdown$(context$2$0) {
        while (1) switch (context$2$0.prev = context$2$0.next) {
          case 0:
            log.debug('Shutting down UiAutomator');
            this.changeState(UiAutomator.STATE_STOPPING);
            context$2$0.next = 4;
            return _regeneratorRuntime.awrap(this.proc.stop());

          case 4:
            context$2$0.next = 6;
            return _regeneratorRuntime.awrap(this.killUiAutomatorOnDevice());

          case 6:
            this.changeState(UiAutomator.STATE_STOPPED);

          case 7:
          case 'end':
            return context$2$0.stop();
        }
      }, null, this);
    }
  }, {
    key: 'parseJarNameFromPath',
    value: function parseJarNameFromPath(binaryPath) {
      var reTest = /.*(\/|\\)(.*\.jar)/.exec(binaryPath);
      if (!reTest) {
        throw new Error('Unable to parse jar name from ' + binaryPath);
      }
      var jarName = reTest[2];
      log.debug('Found jar name: \'' + jarName + '\'');
      return jarName;
    }
  }, {
    key: 'changeState',
    value: function changeState(state) {
      log.debug('Moving to state \'' + state + '\'');
      this.state = state;
      this.emit(UiAutomator.EVENT_CHANGED, { state: state });
    }
  }, {
    key: 'killUiAutomatorOnDevice',
    value: function killUiAutomatorOnDevice() {
      return _regeneratorRuntime.async(function killUiAutomatorOnDevice$(context$2$0) {
        while (1) switch (context$2$0.prev = context$2$0.next) {
          case 0:
            context$2$0.prev = 0;
            context$2$0.next = 3;
            return _regeneratorRuntime.awrap(this.adb.killProcessesByName('uiautomator'));

          case 3:
            context$2$0.next = 8;
            break;

          case 5:
            context$2$0.prev = 5;
            context$2$0.t0 = context$2$0['catch'](0);

            log.warn('Error while killing uiAutomator: ' + context$2$0.t0);

          case 8:
          case 'end':
            return context$2$0.stop();
        }
      }, null, this, [[0, 5]]);
    }
  }]);

  return UiAutomator;
})(_events2['default'].EventEmitter);

UiAutomator.EVENT_ERROR = 'uiautomator_error';
UiAutomator.EVENT_CHANGED = 'stateChanged';
UiAutomator.STATE_STOPPED = 'stopped';
UiAutomator.STATE_STARTING = 'starting';
UiAutomator.STATE_ONLINE = 'online';
UiAutomator.STATE_STOPPING = 'stopping';

exports['default'] = UiAutomator;
module.exports = exports['default'];

// killing any uiautomator existing processes
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi91aWF1dG9tYXRvci5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7c0JBQW1CLFFBQVE7Ozs7NkJBQ0osZ0JBQWdCOztBQUd2QyxJQUFNLEdBQUcsR0FBRyxzQkFBTyxTQUFTLENBQUMsYUFBYSxDQUFDLENBQUM7O0lBRXRDLFdBQVc7WUFBWCxXQUFXOztBQUNILFdBRFIsV0FBVyxDQUNGLEdBQUcsRUFBRTswQkFEZCxXQUFXOztBQUViLFFBQUksQ0FBQyxHQUFHLEVBQUU7QUFDUixTQUFHLENBQUMsYUFBYSxDQUFDLDRDQUE0QyxDQUFDLENBQUM7S0FDakU7QUFDRCwrQkFMRSxXQUFXLDZDQUtMO0FBQ1IsUUFBSSxDQUFDLEdBQUcsR0FBRyxHQUFHLENBQUM7QUFDZixRQUFJLENBQUMsUUFBUSxHQUFHLGtCQUFrQixDQUFDO0dBQ3BDOztlQVJHLFdBQVc7O1dBVUgsZUFBQyxxQkFBcUIsRUFBRSxTQUFTLEVBQUUsYUFBYTtVQUN0RCxjQUFjO1VBT1osT0FBTzs7VUFSa0QsV0FBVzs7VUFlcEUsSUFBSTs7Ozs7Ozs7QUFkTiwwQkFBYzs7O0FBRWhCLGVBQUcsQ0FBQyxLQUFLLENBQUMsc0JBQXNCLENBQUMsQ0FBQztBQUNsQyxnQkFBSSxDQUFDLFdBQVcsQ0FBQyxXQUFXLENBQUMsY0FBYyxDQUFDLENBQUM7O0FBRTdDLGVBQUcsQ0FBQyxLQUFLLENBQUMseUJBQXlCLENBQUMsQ0FBQzs7QUFFakMsbUJBQU8sR0FBRyxJQUFJLENBQUMsb0JBQW9CLENBQUMscUJBQXFCLENBQUM7OzZDQUN4RCxJQUFJLENBQUMsR0FBRyxDQUFDLElBQUksQ0FBQyxxQkFBcUIsRUFBRSxJQUFJLENBQUMsUUFBUSxDQUFDOzs7OzZDQUduRCxJQUFJLENBQUMsdUJBQXVCLEVBQUU7Ozs7QUFFcEMsZUFBRyxDQUFDLEtBQUssQ0FBQyxzQkFBc0IsQ0FBQyxDQUFDOzt5Q0FkMkIsV0FBVztBQUFYLHlCQUFXOzs7QUFlcEUsZ0JBQUksSUFBSSxPQUFPLEVBQUUsYUFBYSxFQUFFLFNBQVMsRUFBRSxPQUFPLEVBQUUsSUFBSSxFQUFFLFNBQVMsU0FBSyxXQUFXOztBQUN2RixnQkFBSSxDQUFDLElBQUksR0FBRyxJQUFJLENBQUMsR0FBRyxDQUFDLGdCQUFnQixDQUFDLElBQUksQ0FBQyxDQUFDOzs7QUFHNUMsZ0JBQUksQ0FBQyxJQUFJLENBQUMsRUFBRSxDQUFDLE1BQU0sRUFBRSxVQUFDLElBQUksRUFBRSxNQUFNLEVBQUs7QUFDckMsNEJBQWMsR0FBRyxLQUFLLENBQUM7O0FBRXZCLGtCQUFJLE1BQUssS0FBSyxLQUFLLFdBQVcsQ0FBQyxhQUFhLElBQ3hDLE1BQUssS0FBSyxLQUFLLFdBQVcsQ0FBQyxjQUFjLEVBQUU7QUFDN0Msb0JBQUksR0FBRyxHQUFHLCtDQUE2QyxJQUFJLHVCQUN2QyxNQUFNLENBQUUsQ0FBQztBQUM3QixtQkFBRyxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsQ0FBQztlQUNoQixNQUFNLElBQUksTUFBSyxLQUFLLEtBQUssV0FBVyxDQUFDLGNBQWMsRUFBRTtBQUNwRCxtQkFBRyxDQUFDLEtBQUssQ0FBQyxnQ0FBZ0MsQ0FBQyxDQUFDO2VBQzdDO0FBQ0Qsb0JBQUssV0FBVyxDQUFDLFdBQVcsQ0FBQyxhQUFhLENBQUMsQ0FBQzthQUM3QyxDQUFDLENBQUM7Ozs2Q0FFRyxJQUFJLENBQUMsSUFBSSxDQUFDLEtBQUssQ0FBQyxhQUFhLENBQUM7OztBQUNwQywwQkFBYyxHQUFHLElBQUksQ0FBQztBQUN0QixnQkFBSSxDQUFDLFdBQVcsQ0FBQyxXQUFXLENBQUMsWUFBWSxDQUFDLENBQUM7Z0RBQ3BDLElBQUksQ0FBQyxJQUFJOzs7Ozs7QUFFaEIsZ0JBQUksQ0FBQyxJQUFJLENBQUMsV0FBVyxDQUFDLFdBQVcsaUJBQUksQ0FBQzs7aUJBQ2xDLGNBQWM7Ozs7Ozs2Q0FDVixJQUFJLENBQUMsdUJBQXVCLEVBQUU7Ozs7NkNBQzlCLElBQUksQ0FBQyxJQUFJLENBQUMsSUFBSSxFQUFFOzs7QUFFeEIsZUFBRyxDQUFDLGFBQWEsZ0JBQUcsQ0FBQzs7Ozs7OztLQUV4Qjs7O1dBRWM7Ozs7QUFDYixlQUFHLENBQUMsS0FBSyxDQUFDLDJCQUEyQixDQUFDLENBQUM7QUFDdkMsZ0JBQUksQ0FBQyxXQUFXLENBQUMsV0FBVyxDQUFDLGNBQWMsQ0FBQyxDQUFDOzs2Q0FDdkMsSUFBSSxDQUFDLElBQUksQ0FBQyxJQUFJLEVBQUU7Ozs7NkNBQ2hCLElBQUksQ0FBQyx1QkFBdUIsRUFBRTs7O0FBQ3BDLGdCQUFJLENBQUMsV0FBVyxDQUFDLFdBQVcsQ0FBQyxhQUFhLENBQUMsQ0FBQzs7Ozs7OztLQUM3Qzs7O1dBRW9CLDhCQUFDLFVBQVUsRUFBRTtBQUNoQyxVQUFJLE1BQU0sR0FBRyxvQkFBb0IsQ0FBQyxJQUFJLENBQUMsVUFBVSxDQUFDLENBQUM7QUFDbkQsVUFBSSxDQUFDLE1BQU0sRUFBRTtBQUNYLGNBQU0sSUFBSSxLQUFLLG9DQUFrQyxVQUFVLENBQUcsQ0FBQztPQUNoRTtBQUNELFVBQUksT0FBTyxHQUFHLE1BQU0sQ0FBQyxDQUFDLENBQUMsQ0FBQztBQUN4QixTQUFHLENBQUMsS0FBSyx3QkFBcUIsT0FBTyxRQUFJLENBQUM7QUFDMUMsYUFBTyxPQUFPLENBQUM7S0FDaEI7OztXQUVXLHFCQUFDLEtBQUssRUFBRTtBQUNsQixTQUFHLENBQUMsS0FBSyx3QkFBcUIsS0FBSyxRQUFJLENBQUM7QUFDeEMsVUFBSSxDQUFDLEtBQUssR0FBRyxLQUFLLENBQUM7QUFDbkIsVUFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsYUFBYSxFQUFFLEVBQUMsS0FBSyxFQUFMLEtBQUssRUFBQyxDQUFDLENBQUM7S0FDL0M7OztXQUU2Qjs7Ozs7OzZDQUVwQixJQUFJLENBQUMsR0FBRyxDQUFDLG1CQUFtQixDQUFDLGFBQWEsQ0FBQzs7Ozs7Ozs7OztBQUVqRCxlQUFHLENBQUMsSUFBSSxzREFBeUMsQ0FBQzs7Ozs7OztLQUVyRDs7O1NBdkZHLFdBQVc7R0FBUyxvQkFBTyxZQUFZOztBQTJGN0MsV0FBVyxDQUFDLFdBQVcsR0FBRyxtQkFBbUIsQ0FBQztBQUM5QyxXQUFXLENBQUMsYUFBYSxHQUFHLGNBQWMsQ0FBQztBQUMzQyxXQUFXLENBQUMsYUFBYSxHQUFHLFNBQVMsQ0FBQztBQUN0QyxXQUFXLENBQUMsY0FBYyxHQUFHLFVBQVUsQ0FBQztBQUN4QyxXQUFXLENBQUMsWUFBWSxHQUFHLFFBQVEsQ0FBQztBQUNwQyxXQUFXLENBQUMsY0FBYyxHQUFHLFVBQVUsQ0FBQzs7cUJBRXpCLFdBQVciLCJmaWxlIjoibGliL3VpYXV0b21hdG9yLmpzIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IGV2ZW50cyBmcm9tICdldmVudHMnO1xuaW1wb3J0IHsgbG9nZ2VyIH0gZnJvbSAnYXBwaXVtLXN1cHBvcnQnO1xuXG5cbmNvbnN0IGxvZyA9IGxvZ2dlci5nZXRMb2dnZXIoJ1VpQXV0b21hdG9yJyk7XG5cbmNsYXNzIFVpQXV0b21hdG9yIGV4dGVuZHMgZXZlbnRzLkV2ZW50RW1pdHRlciB7XG4gIGNvbnN0cnVjdG9yIChhZGIpIHtcbiAgICBpZiAoIWFkYikge1xuICAgICAgbG9nLmVycm9yQW5kVGhyb3coXCJhZGIgaXMgcmVxdWlyZWQgdG8gaW5zdGFudGlhdGUgVWlBdXRvbWF0b3JcIik7XG4gICAgfVxuICAgIHN1cGVyKCk7XG4gICAgdGhpcy5hZGIgPSBhZGI7XG4gICAgdGhpcy50ZW1wUGF0aCA9IFwiL2RhdGEvbG9jYWwvdG1wL1wiO1xuICB9XG5cbiAgYXN5bmMgc3RhcnQgKHVpQXV0b21hdG9yQmluYXJ5UGF0aCwgY2xhc3NOYW1lLCBzdGFydERldGVjdG9yLCAuLi5leHRyYVBhcmFtcykge1xuICAgIGxldCBwcm9jZXNzSXNBbGl2ZTtcbiAgICB0cnkge1xuICAgICAgbG9nLmRlYnVnKFwiU3RhcnRpbmcgVWlBdXRvbWF0b3JcIik7XG4gICAgICB0aGlzLmNoYW5nZVN0YXRlKFVpQXV0b21hdG9yLlNUQVRFX1NUQVJUSU5HKTtcblxuICAgICAgbG9nLmRlYnVnKFwiUGFyc2luZyB1aWF1dG9tYXRvciBqYXJcIik7XG4gICAgICAvLyBleHBlY3RpbmcgYSBwYXRoIGxpa2UgL2Fkcy9hZHMvZm9vLmphciBvciBcXGFzZFxcYXNkXFxmb28uamFyXG4gICAgICBsZXQgamFyTmFtZSA9IHRoaXMucGFyc2VKYXJOYW1lRnJvbVBhdGgodWlBdXRvbWF0b3JCaW5hcnlQYXRoKTtcbiAgICAgIGF3YWl0IHRoaXMuYWRiLnB1c2godWlBdXRvbWF0b3JCaW5hcnlQYXRoLCB0aGlzLnRlbXBQYXRoKTtcblxuICAgICAgLy8ga2lsbGluZyBhbnkgdWlhdXRvbWF0b3IgZXhpc3RpbmcgcHJvY2Vzc2VzXG4gICAgICBhd2FpdCB0aGlzLmtpbGxVaUF1dG9tYXRvck9uRGV2aWNlKCk7XG5cbiAgICAgIGxvZy5kZWJ1ZygnU3RhcnRpbmcgVUlBdXRvbWF0b3InKTtcbiAgICAgIGxldCBhcmdzID0gW1wic2hlbGxcIiwgXCJ1aWF1dG9tYXRvclwiLCBcInJ1bnRlc3RcIiwgamFyTmFtZSwgXCItY1wiLCBjbGFzc05hbWUsIC4uLmV4dHJhUGFyYW1zXTtcbiAgICAgIHRoaXMucHJvYyA9IHRoaXMuYWRiLmNyZWF0ZVN1YlByb2Nlc3MoYXJncyk7XG5cbiAgICAgIC8vIGhhbmRsZSBvdXQtb2YtYm91bmQgZXhpdCBieSBzaW1wbHkgZW1pdHRpbmcgYSBzdG9wcGVkIHN0YXRlXG4gICAgICB0aGlzLnByb2Mub24oJ2V4aXQnLCAoY29kZSwgc2lnbmFsKSA9PiB7XG4gICAgICAgIHByb2Nlc3NJc0FsaXZlID0gZmFsc2U7XG4gICAgICAgIC8vIGNsZWFudXBcbiAgICAgICAgaWYgKHRoaXMuc3RhdGUgIT09IFVpQXV0b21hdG9yLlNUQVRFX1NUT1BQRUQgJiZcbiAgICAgICAgICAgIHRoaXMuc3RhdGUgIT09IFVpQXV0b21hdG9yLlNUQVRFX1NUT1BQSU5HKSB7XG4gICAgICAgICAgbGV0IG1zZyA9IGBVaUF1dG9tYXRvciBleGl0ZWQgdW5leHBlY3RlZGx5IHdpdGggY29kZSAke2NvZGV9LCBgICtcbiAgICAgICAgICAgICAgICAgICAgYHNpZ25hbCAke3NpZ25hbH1gO1xuICAgICAgICAgIGxvZy5lcnJvcihtc2cpO1xuICAgICAgICB9IGVsc2UgaWYgKHRoaXMuc3RhdGUgPT09IFVpQXV0b21hdG9yLlNUQVRFX1NUT1BQSU5HKSB7XG4gICAgICAgICAgbG9nLmRlYnVnKFwiVWlBdXRvbWF0b3Igc2h1dCBkb3duIG5vcm1hbGx5XCIpO1xuICAgICAgICB9XG4gICAgICAgIHRoaXMuY2hhbmdlU3RhdGUoVWlBdXRvbWF0b3IuU1RBVEVfU1RPUFBFRCk7XG4gICAgICB9KTtcblxuICAgICAgYXdhaXQgdGhpcy5wcm9jLnN0YXJ0KHN0YXJ0RGV0ZWN0b3IpO1xuICAgICAgcHJvY2Vzc0lzQWxpdmUgPSB0cnVlO1xuICAgICAgdGhpcy5jaGFuZ2VTdGF0ZShVaUF1dG9tYXRvci5TVEFURV9PTkxJTkUpO1xuICAgICAgcmV0dXJuIHRoaXMucHJvYztcbiAgICB9IGNhdGNoIChlKSB7XG4gICAgICB0aGlzLmVtaXQoVWlBdXRvbWF0b3IuRVZFTlRfRVJST1IsIGUpO1xuICAgICAgaWYgKHByb2Nlc3NJc0FsaXZlKSB7XG4gICAgICAgIGF3YWl0IHRoaXMua2lsbFVpQXV0b21hdG9yT25EZXZpY2UoKTtcbiAgICAgICAgYXdhaXQgdGhpcy5wcm9jLnN0b3AoKTtcbiAgICAgIH1cbiAgICAgIGxvZy5lcnJvckFuZFRocm93KGUpO1xuICAgIH1cbiAgfVxuXG4gIGFzeW5jIHNodXRkb3duICgpIHtcbiAgICBsb2cuZGVidWcoJ1NodXR0aW5nIGRvd24gVWlBdXRvbWF0b3InKTtcbiAgICB0aGlzLmNoYW5nZVN0YXRlKFVpQXV0b21hdG9yLlNUQVRFX1NUT1BQSU5HKTtcbiAgICBhd2FpdCB0aGlzLnByb2Muc3RvcCgpO1xuICAgIGF3YWl0IHRoaXMua2lsbFVpQXV0b21hdG9yT25EZXZpY2UoKTtcbiAgICB0aGlzLmNoYW5nZVN0YXRlKFVpQXV0b21hdG9yLlNUQVRFX1NUT1BQRUQpO1xuICB9XG5cbiAgcGFyc2VKYXJOYW1lRnJvbVBhdGggKGJpbmFyeVBhdGgpIHtcbiAgICBsZXQgcmVUZXN0ID0gLy4qKFxcL3xcXFxcKSguKlxcLmphcikvLmV4ZWMoYmluYXJ5UGF0aCk7XG4gICAgaWYgKCFyZVRlc3QpIHtcbiAgICAgIHRocm93IG5ldyBFcnJvcihgVW5hYmxlIHRvIHBhcnNlIGphciBuYW1lIGZyb20gJHtiaW5hcnlQYXRofWApO1xuICAgIH1cbiAgICBsZXQgamFyTmFtZSA9IHJlVGVzdFsyXTtcbiAgICBsb2cuZGVidWcoYEZvdW5kIGphciBuYW1lOiAnJHtqYXJOYW1lfSdgKTtcbiAgICByZXR1cm4gamFyTmFtZTtcbiAgfVxuXG4gIGNoYW5nZVN0YXRlIChzdGF0ZSkge1xuICAgIGxvZy5kZWJ1ZyhgTW92aW5nIHRvIHN0YXRlICcke3N0YXRlfSdgKTtcbiAgICB0aGlzLnN0YXRlID0gc3RhdGU7XG4gICAgdGhpcy5lbWl0KFVpQXV0b21hdG9yLkVWRU5UX0NIQU5HRUQsIHtzdGF0ZX0pO1xuICB9XG5cbiAgYXN5bmMga2lsbFVpQXV0b21hdG9yT25EZXZpY2UgKCkge1xuICAgIHRyeSB7XG4gICAgICBhd2FpdCB0aGlzLmFkYi5raWxsUHJvY2Vzc2VzQnlOYW1lKCd1aWF1dG9tYXRvcicpO1xuICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgIGxvZy53YXJuKGBFcnJvciB3aGlsZSBraWxsaW5nIHVpQXV0b21hdG9yOiAke2V9YCk7XG4gICAgfVxuICB9XG5cbn1cblxuVWlBdXRvbWF0b3IuRVZFTlRfRVJST1IgPSAndWlhdXRvbWF0b3JfZXJyb3InO1xuVWlBdXRvbWF0b3IuRVZFTlRfQ0hBTkdFRCA9ICdzdGF0ZUNoYW5nZWQnO1xuVWlBdXRvbWF0b3IuU1RBVEVfU1RPUFBFRCA9ICdzdG9wcGVkJztcblVpQXV0b21hdG9yLlNUQVRFX1NUQVJUSU5HID0gJ3N0YXJ0aW5nJztcblVpQXV0b21hdG9yLlNUQVRFX09OTElORSA9ICdvbmxpbmUnO1xuVWlBdXRvbWF0b3IuU1RBVEVfU1RPUFBJTkcgPSAnc3RvcHBpbmcnO1xuXG5leHBvcnQgZGVmYXVsdCBVaUF1dG9tYXRvcjtcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4ifQ==
