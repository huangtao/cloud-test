'use strict';

var _get = require('babel-runtime/helpers/get')['default'];

var _inherits = require('babel-runtime/helpers/inherits')['default'];

var _createClass = require('babel-runtime/helpers/create-class')['default'];

var _classCallCheck = require('babel-runtime/helpers/class-call-check')['default'];

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

var _config = require('./config');

var _appiumBaseDriver = require('appium-base-driver');

var _appiumFakeDriver = require('appium-fake-driver');

var _appiumAndroidDriver = require('appium-android-driver');

var _appiumIosDriver = require('appium-ios-driver');

var _appiumUiautomator2Driver = require('appium-uiautomator2-driver');

var _appiumSelendroidDriver = require('appium-selendroid-driver');

var _appiumXcuitestDriver = require('appium-xcuitest-driver');

var _appiumYouiengineDriver = require('appium-youiengine-driver');

var _appiumWindowsDriver = require('appium-windows-driver');

var _appiumMacDriver = require('appium-mac-driver');

var _bluebird = require('bluebird');

var _bluebird2 = _interopRequireDefault(_bluebird);

var _util = require('util');

var _util2 = _interopRequireDefault(_util);

var AppiumDriver = (function (_BaseDriver) {
  _inherits(AppiumDriver, _BaseDriver);

  function AppiumDriver(args) {
    _classCallCheck(this, AppiumDriver);

    _get(Object.getPrototypeOf(AppiumDriver.prototype), 'constructor', this).call(this);

    // the main Appium Driver has no new command timeout
    this.newCommandTimeoutMs = 0;

    this.args = args;

    this.sessions = {};
  }

  // help decide which commands should be proxied to sub-drivers and which
  // should be handled by this, our umbrella driver

  _createClass(AppiumDriver, [{
    key: 'sessionExists',
    value: function sessionExists(sessionId) {
      return _lodash2['default'].includes(_lodash2['default'].keys(this.sessions), sessionId) && this.sessions[sessionId].sessionId !== null;
    }
  }, {
    key: 'driverForSession',
    value: function driverForSession(sessionId) {
      return this.sessions[sessionId];
    }
  }, {
    key: 'getDriverForCaps',
    value: function getDriverForCaps(caps) {
      // TODO if this logic ever becomes complex, should probably factor out
      // into its own file
      if (!caps.platformName || !_lodash2['default'].isString(caps.platformName)) {
        throw new Error("You must include a platformName capability");
      }

      // we don't necessarily have an `automationName` capability,
      if (caps.automationName) {
        if (caps.automationName.toLowerCase() === 'selendroid') {
          // but if we do and it is 'Selendroid', act on it
          return _appiumSelendroidDriver.SelendroidDriver;
        } else if (caps.automationName.toLowerCase() === 'uiautomator2') {
          // but if we do and it is 'Uiautomator2', act on it
          return _appiumUiautomator2Driver.AndroidUiautomator2Driver;
        } else if (caps.automationName.toLowerCase() === 'xcuitest') {
          // but if we do and it is 'XCUITest', act on it
          return _appiumXcuitestDriver.XCUITestDriver;
        } else if (caps.automationName.toLowerCase() === 'youiengine') {
          // but if we do and it is 'YouiEngine', act on it
          return _appiumYouiengineDriver.YouiEngineDriver;
        }
      }

      if (caps.platformName.toLowerCase() === "fake") {
        return _appiumFakeDriver.FakeDriver;
      }

      if (caps.platformName.toLowerCase() === 'android') {
        return _appiumAndroidDriver.AndroidDriver;
      }

      if (caps.platformName.toLowerCase() === 'ios') {
        if (caps.platformVersion) {
          var majorVer = caps.platformVersion.toString().split(".")[0];
          if (parseInt(majorVer, 10) >= 10) {
            _logger2['default'].info("Requested iOS support with version >= 10, using XCUITest " + "driver instead of UIAutomation-based driver, since the " + "latter is unsupported on iOS 10 and up.");
            return _appiumXcuitestDriver.XCUITestDriver;
          }
        }

        return _appiumIosDriver.IosDriver;
      }

      if (caps.platformName.toLowerCase() === 'windows') {
        return _appiumWindowsDriver.WindowsDriver;
      }

      if (caps.platformName.toLowerCase() === 'mac') {
        return _appiumMacDriver.MacDriver;
      }

      var msg = undefined;
      if (caps.automationName) {
        msg = 'Could not find a driver for automationName \'' + caps.automationName + '\' and platformName ' + ('\'' + caps.platformName + '\'.');
      } else {
        msg = 'Could not find a driver for platformName \'' + caps.platformName + '\'.';
      }
      throw new Error(msg + ' Please check your desired capabilities.');
    }
  }, {
    key: 'getDriverVersion',
    value: function getDriverVersion(driver) {
      var NAME_DRIVER_MAP = {
        SelendroidDriver: 'appium-selendroid-driver',
        AndroidUiautomator2Driver: 'appium-uiautomator2-driver',
        XCUITestDriver: 'appium-xcuitest-driver',
        YouiEngineDriver: 'appium-youiengine-driver',
        FakeDriver: 'appium-fake-driver',
        AndroidDriver: 'appium-android-driver',
        IosDriver: 'appium-ios-driver',
        WindowsDriver: 'appium-windows-driver',
        MacDriver: 'appium-mac-driver'
      };
      if (!NAME_DRIVER_MAP[driver.name]) {
        _logger2['default'].warn('Unable to get version of driver \'' + driver.name + '\'');
        return;
      }

      var _require = require(NAME_DRIVER_MAP[driver.name] + '/package.json');

      var version = _require.version;

      return version;
    }
  }, {
    key: 'getStatus',
    value: function getStatus() {
      var config, gitSha, status;
      return _regeneratorRuntime.async(function getStatus$(context$2$0) {
        while (1) switch (context$2$0.prev = context$2$0.next) {
          case 0:
            context$2$0.next = 2;
            return _regeneratorRuntime.awrap((0, _config.getAppiumConfig)());

          case 2:
            config = context$2$0.sent;
            gitSha = config['git-sha'];
            status = { build: { version: config.version } };

            if (typeof gitSha !== "undefined") {
              status.build.revision = gitSha;
            }
            return context$2$0.abrupt('return', status);

          case 7:
          case 'end':
            return context$2$0.stop();
        }
      }, null, this);
    }
  }, {
    key: 'getSessions',
    value: function getSessions() {
      var sessions, _iteratorNormalCompletion, _didIteratorError, _iteratorError, _iterator, _step, _step$value, id, driver;

      return _regeneratorRuntime.async(function getSessions$(context$2$0) {
        while (1) switch (context$2$0.prev = context$2$0.next) {
          case 0:
            sessions = [];
            _iteratorNormalCompletion = true;
            _didIteratorError = false;
            _iteratorError = undefined;
            context$2$0.prev = 4;

            for (_iterator = _getIterator(_lodash2['default'].toPairs(this.sessions)); !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
              _step$value = _slicedToArray(_step.value, 2);
              id = _step$value[0];
              driver = _step$value[1];

              sessions.push({ id: id, capabilities: driver.caps });
            }
            context$2$0.next = 12;
            break;

          case 8:
            context$2$0.prev = 8;
            context$2$0.t0 = context$2$0['catch'](4);
            _didIteratorError = true;
            _iteratorError = context$2$0.t0;

          case 12:
            context$2$0.prev = 12;
            context$2$0.prev = 13;

            if (!_iteratorNormalCompletion && _iterator['return']) {
              _iterator['return']();
            }

          case 15:
            context$2$0.prev = 15;

            if (!_didIteratorError) {
              context$2$0.next = 18;
              break;
            }

            throw _iteratorError;

          case 18:
            return context$2$0.finish(15);

          case 19:
            return context$2$0.finish(12);

          case 20:
            return context$2$0.abrupt('return', sessions);

          case 21:
          case 'end':
            return context$2$0.stop();
        }
      }, null, this, [[4, 8, 12, 20], [13,, 15, 19]]);
    }
  }, {
    key: 'printNewSessionAnnouncement',
    value: function printNewSessionAnnouncement(driver, caps) {
      var driverVersion = this.getDriverVersion(driver);
      var introString = driverVersion ? 'Creating new ' + driver.name + ' (v' + driverVersion + ') session' : 'Creating new ' + driver.name + ' session';
      _logger2['default'].info(introString);
      _logger2['default'].info('Capabilities:');
      _util2['default'].inspect(caps);
      var _iteratorNormalCompletion2 = true;
      var _didIteratorError2 = false;
      var _iteratorError2 = undefined;

      try {
        for (var _iterator2 = _getIterator(_lodash2['default'].toPairs(caps)), _step2; !(_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done); _iteratorNormalCompletion2 = true) {
          var _step2$value = _slicedToArray(_step2.value, 2);

          var cap = _step2$value[0];
          var value = _step2$value[1];

          _logger2['default'].info('  ' + cap + ': ' + _util2['default'].inspect(value));
        }
      } catch (err) {
        _didIteratorError2 = true;
        _iteratorError2 = err;
      } finally {
        try {
          if (!_iteratorNormalCompletion2 && _iterator2['return']) {
            _iterator2['return']();
          }
        } finally {
          if (_didIteratorError2) {
            throw _iteratorError2;
          }
        }
      }
    }
  }, {
    key: 'createSession',
    value: function createSession(caps, reqCaps) {
      var InnerDriver, _iteratorNormalCompletion3, _didIteratorError3, _iteratorError3, _iterator3, _step3, id, curSessions, d, _ref, _ref2, innerSessionId, dCaps;

      return _regeneratorRuntime.async(function createSession$(context$2$0) {
        while (1) switch (context$2$0.prev = context$2$0.next) {
          case 0:
            caps = _lodash2['default'].defaults(_lodash2['default'].clone(caps), this.args.defaultCapabilities);
            InnerDriver = this.getDriverForCaps(caps);

            this.printNewSessionAnnouncement(InnerDriver, caps);

            // sessionOverride server flag check
            // this will need to be re-thought when we go to multiple session support

            if (!(this.args.sessionOverride && !!this.sessions && _lodash2['default'].keys(this.sessions).length > 0)) {
              context$2$0.next = 37;
              break;
            }

            _logger2['default'].info('Session override is on. Deleting other sessions.');
            _iteratorNormalCompletion3 = true;
            _didIteratorError3 = false;
            _iteratorError3 = undefined;
            context$2$0.prev = 8;
            _iterator3 = _getIterator(_lodash2['default'].keys(this.sessions));

          case 10:
            if (_iteratorNormalCompletion3 = (_step3 = _iterator3.next()).done) {
              context$2$0.next = 23;
              break;
            }

            id = _step3.value;

            _logger2['default'].info('    Deleting session \'' + id + '\'');
            context$2$0.prev = 13;
            context$2$0.next = 16;
            return _regeneratorRuntime.awrap(this.deleteSession(id));

          case 16:
            context$2$0.next = 20;
            break;

          case 18:
            context$2$0.prev = 18;
            context$2$0.t0 = context$2$0['catch'](13);

          case 20:
            _iteratorNormalCompletion3 = true;
            context$2$0.next = 10;
            break;

          case 23:
            context$2$0.next = 29;
            break;

          case 25:
            context$2$0.prev = 25;
            context$2$0.t1 = context$2$0['catch'](8);
            _didIteratorError3 = true;
            _iteratorError3 = context$2$0.t1;

          case 29:
            context$2$0.prev = 29;
            context$2$0.prev = 30;

            if (!_iteratorNormalCompletion3 && _iterator3['return']) {
              _iterator3['return']();
            }

          case 32:
            context$2$0.prev = 32;

            if (!_didIteratorError3) {
              context$2$0.next = 35;
              break;
            }

            throw _iteratorError3;

          case 35:
            return context$2$0.finish(32);

          case 36:
            return context$2$0.finish(29);

          case 37:
            curSessions = undefined;
            context$2$0.prev = 38;

            curSessions = this.curSessionDataForDriver(InnerDriver);
            context$2$0.next = 45;
            break;

          case 42:
            context$2$0.prev = 42;
            context$2$0.t2 = context$2$0['catch'](38);
            throw new _appiumBaseDriver.errors.SessionNotCreatedError(context$2$0.t2.message);

          case 45:
            d = new InnerDriver(this.args);
            context$2$0.next = 48;
            return _regeneratorRuntime.awrap(d.createSession(caps, reqCaps, curSessions));

          case 48:
            _ref = context$2$0.sent;
            _ref2 = _slicedToArray(_ref, 2);
            innerSessionId = _ref2[0];
            dCaps = _ref2[1];

            this.sessions[innerSessionId] = d;

            // this is an async function but we don't await it because it handles
            // an out-of-band promise which is fulfilled if the inner driver
            // unexpectedly shuts down
            this.attachUnexpectedShutdownHandler(d, innerSessionId);

            _logger2['default'].info('New ' + InnerDriver.name + ' session created successfully, session ' + (innerSessionId + ' added to master session list'));

            // set the New Command Timeout for the inner driver
            d.startNewCommandTimeout();

            return context$2$0.abrupt('return', [innerSessionId, dCaps]);

          case 57:
          case 'end':
            return context$2$0.stop();
        }
      }, null, this, [[8, 25, 29, 37], [13, 18], [30,, 32, 36], [38, 42]]);
    }
  }, {
    key: 'attachUnexpectedShutdownHandler',
    value: function attachUnexpectedShutdownHandler(driver, innerSessionId) {
      return _regeneratorRuntime.async(function attachUnexpectedShutdownHandler$(context$2$0) {
        while (1) switch (context$2$0.prev = context$2$0.next) {
          case 0:
            context$2$0.prev = 0;
            context$2$0.next = 3;
            return _regeneratorRuntime.awrap(driver.onUnexpectedShutdown);

          case 3:
            throw new Error('Unexpected shutdown');

          case 6:
            context$2$0.prev = 6;
            context$2$0.t0 = context$2$0['catch'](0);

            if (!(context$2$0.t0 instanceof _bluebird2['default'].CancellationError)) {
              context$2$0.next = 10;
              break;
            }

            return context$2$0.abrupt('return');

          case 10:
            _logger2['default'].warn('Closing session, cause was \'' + context$2$0.t0.message + '\'');
            _logger2['default'].info('Removing session ' + innerSessionId + ' from our master session list');
            delete this.sessions[innerSessionId];

          case 13:
          case 'end':
            return context$2$0.stop();
        }
      }, null, this, [[0, 6]]);
    }
  }, {
    key: 'curSessionDataForDriver',
    value: function curSessionDataForDriver(InnerDriver) {
      var data = _lodash2['default'].values(this.sessions).filter(function (s) {
        return s.constructor.name === InnerDriver.name;
      }).map(function (s) {
        return s.driverData;
      });
      var _iteratorNormalCompletion4 = true;
      var _didIteratorError4 = false;
      var _iteratorError4 = undefined;

      try {
        for (var _iterator4 = _getIterator(data), _step4; !(_iteratorNormalCompletion4 = (_step4 = _iterator4.next()).done); _iteratorNormalCompletion4 = true) {
          var datum = _step4.value;

          if (!datum) {
            throw new Error('Problem getting session data for driver type ' + (InnerDriver.name + '; does it implement \'get ') + 'driverData\'?');
          }
        }
      } catch (err) {
        _didIteratorError4 = true;
        _iteratorError4 = err;
      } finally {
        try {
          if (!_iteratorNormalCompletion4 && _iterator4['return']) {
            _iterator4['return']();
          }
        } finally {
          if (_didIteratorError4) {
            throw _iteratorError4;
          }
        }
      }

      return data;
    }
  }, {
    key: 'deleteSession',
    value: function deleteSession(sessionId) {
      return _regeneratorRuntime.async(function deleteSession$(context$2$0) {
        while (1) switch (context$2$0.prev = context$2$0.next) {
          case 0:
            context$2$0.prev = 0;

            if (!this.sessions[sessionId]) {
              context$2$0.next = 4;
              break;
            }

            context$2$0.next = 4;
            return _regeneratorRuntime.awrap(this.sessions[sessionId].deleteSession());

          case 4:
            context$2$0.next = 10;
            break;

          case 6:
            context$2$0.prev = 6;
            context$2$0.t0 = context$2$0['catch'](0);

            _logger2['default'].error('Had trouble ending session ' + sessionId + ': ' + context$2$0.t0.message);
            throw context$2$0.t0;

          case 10:
            context$2$0.prev = 10;

            // regardless of whether the deleteSession completes successfully or not
            // make the session unavailable, because who knows what state it might
            // be in otherwise
            _logger2['default'].info('Removing session ' + sessionId + ' from our master session list');
            delete this.sessions[sessionId];
            return context$2$0.finish(10);

          case 14:
          case 'end':
            return context$2$0.stop();
        }
      }, null, this, [[0, 6, 10, 14]]);
    }
  }, {
    key: 'executeCommand',
    value: function executeCommand(cmd) {
      var _sessions$sessionId;

      for (var _len = arguments.length, args = Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++) {
        args[_key - 1] = arguments[_key];
      }

      var _get2, sessionId;

      return _regeneratorRuntime.async(function executeCommand$(context$2$0) {
        while (1) switch (context$2$0.prev = context$2$0.next) {
          case 0:
            if (!isAppiumDriverCommand(cmd)) {
              context$2$0.next = 2;
              break;
            }

            return context$2$0.abrupt('return', (_get2 = _get(Object.getPrototypeOf(AppiumDriver.prototype), 'executeCommand', this)).call.apply(_get2, [this, cmd].concat(args)));

          case 2:
            sessionId = args[args.length - 1];
            return context$2$0.abrupt('return', (_sessions$sessionId = this.sessions[sessionId]).executeCommand.apply(_sessions$sessionId, [cmd].concat(args)));

          case 4:
          case 'end':
            return context$2$0.stop();
        }
      }, null, this);
    }
  }, {
    key: 'proxyActive',
    value: function proxyActive(sessionId) {
      return this.sessions[sessionId] && _lodash2['default'].isFunction(this.sessions[sessionId].proxyActive) && this.sessions[sessionId].proxyActive(sessionId);
    }
  }, {
    key: 'getProxyAvoidList',
    value: function getProxyAvoidList(sessionId) {
      if (!this.sessions[sessionId]) {
        return [];
      }
      return this.sessions[sessionId].getProxyAvoidList();
    }
  }, {
    key: 'canProxy',
    value: function canProxy(sessionId) {
      return this.sessions[sessionId] && this.sessions[sessionId].canProxy(sessionId);
    }
  }]);

  return AppiumDriver;
})(_appiumBaseDriver.BaseDriver);

function isAppiumDriverCommand(cmd) {
  return !(0, _appiumBaseDriver.isSessionCommand)(cmd) || cmd === "deleteSession";
}

function getAppiumRouter(args) {
  var appium = new AppiumDriver(args);
  return (0, _appiumBaseDriver.routeConfiguringFunction)(appium);
}

exports.AppiumDriver = AppiumDriver;
exports.getAppiumRouter = getAppiumRouter;
exports['default'] = getAppiumRouter;

// the error has already been logged in AppiumDriver.deleteSession
// continue

// Remove the session on unexpected shutdown, so that we are in a position
// to open another session later on.
// TODO: this should be removed and replaced by a onShutdown callback.
// this is a cancellable promise
// if we get here, we've had an unexpected shutdown, so error

// if we cancelled the unexpected shutdown promise, that means we
// no longer care about it, and can safely ignore it
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9hcHBpdW0uanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztzQkFBYyxRQUFROzs7O3NCQUNOLFVBQVU7Ozs7c0JBQ00sVUFBVTs7Z0NBRVQsb0JBQW9COztnQ0FDMUIsb0JBQW9COzttQ0FDakIsdUJBQXVCOzsrQkFDM0IsbUJBQW1COzt3Q0FDSCw0QkFBNEI7O3NDQUNyQywwQkFBMEI7O29DQUM1Qix3QkFBd0I7O3NDQUN0QiwwQkFBMEI7O21DQUM3Qix1QkFBdUI7OytCQUMzQixtQkFBbUI7O3dCQUMvQixVQUFVOzs7O29CQUNQLE1BQU07Ozs7SUFHakIsWUFBWTtZQUFaLFlBQVk7O0FBQ0osV0FEUixZQUFZLENBQ0gsSUFBSSxFQUFFOzBCQURmLFlBQVk7O0FBRWQsK0JBRkUsWUFBWSw2Q0FFTjs7O0FBR1IsUUFBSSxDQUFDLG1CQUFtQixHQUFHLENBQUMsQ0FBQzs7QUFFN0IsUUFBSSxDQUFDLElBQUksR0FBRyxJQUFJLENBQUM7O0FBRWpCLFFBQUksQ0FBQyxRQUFRLEdBQUcsRUFBRSxDQUFDO0dBQ3BCOzs7OztlQVZHLFlBQVk7O1dBWUYsdUJBQUMsU0FBUyxFQUFFO0FBQ3hCLGFBQU8sb0JBQUUsUUFBUSxDQUFDLG9CQUFFLElBQUksQ0FBQyxJQUFJLENBQUMsUUFBUSxDQUFDLEVBQUUsU0FBUyxDQUFDLElBQzVDLElBQUksQ0FBQyxRQUFRLENBQUMsU0FBUyxDQUFDLENBQUMsU0FBUyxLQUFLLElBQUksQ0FBQztLQUNwRDs7O1dBRWdCLDBCQUFDLFNBQVMsRUFBRTtBQUMzQixhQUFPLElBQUksQ0FBQyxRQUFRLENBQUMsU0FBUyxDQUFDLENBQUM7S0FDakM7OztXQUVnQiwwQkFBQyxJQUFJLEVBQUU7OztBQUd0QixVQUFJLENBQUMsSUFBSSxDQUFDLFlBQVksSUFBSSxDQUFDLG9CQUFFLFFBQVEsQ0FBQyxJQUFJLENBQUMsWUFBWSxDQUFDLEVBQUU7QUFDeEQsY0FBTSxJQUFJLEtBQUssQ0FBQyw0Q0FBNEMsQ0FBQyxDQUFDO09BQy9EOzs7QUFHRCxVQUFJLElBQUksQ0FBQyxjQUFjLEVBQUU7QUFDdkIsWUFBSSxJQUFJLENBQUMsY0FBYyxDQUFDLFdBQVcsRUFBRSxLQUFLLFlBQVksRUFBRTs7QUFFdEQsMERBQXdCO1NBQ3pCLE1BQU0sSUFBSSxJQUFJLENBQUMsY0FBYyxDQUFDLFdBQVcsRUFBRSxLQUFLLGNBQWMsRUFBRTs7QUFFL0QscUVBQWlDO1NBQ2xDLE1BQU0sSUFBSSxJQUFJLENBQUMsY0FBYyxDQUFDLFdBQVcsRUFBRSxLQUFLLFVBQVUsRUFBRTs7QUFFM0Qsc0RBQXNCO1NBQ3ZCLE1BQU0sSUFBSSxJQUFJLENBQUMsY0FBYyxDQUFDLFdBQVcsRUFBRSxLQUFLLFlBQVksRUFBRTs7QUFFN0QsMERBQXdCO1NBQ3pCO09BQ0Y7O0FBRUQsVUFBSSxJQUFJLENBQUMsWUFBWSxDQUFDLFdBQVcsRUFBRSxLQUFLLE1BQU0sRUFBRTtBQUM5Qyw0Q0FBa0I7T0FDbkI7O0FBRUQsVUFBSSxJQUFJLENBQUMsWUFBWSxDQUFDLFdBQVcsRUFBRSxLQUFLLFNBQVMsRUFBRTtBQUNqRCxrREFBcUI7T0FDdEI7O0FBRUQsVUFBSSxJQUFJLENBQUMsWUFBWSxDQUFDLFdBQVcsRUFBRSxLQUFLLEtBQUssRUFBRTtBQUM3QyxZQUFJLElBQUksQ0FBQyxlQUFlLEVBQUU7QUFDeEIsY0FBSSxRQUFRLEdBQUcsSUFBSSxDQUFDLGVBQWUsQ0FBQyxRQUFRLEVBQUUsQ0FBQyxLQUFLLENBQUMsR0FBRyxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUM7QUFDN0QsY0FBSSxRQUFRLENBQUMsUUFBUSxFQUFFLEVBQUUsQ0FBQyxJQUFJLEVBQUUsRUFBRTtBQUNoQyxnQ0FBSSxJQUFJLENBQUMsMkRBQTJELEdBQzNELHlEQUF5RCxHQUN6RCx5Q0FBeUMsQ0FBQyxDQUFDO0FBQ3BELHdEQUFzQjtXQUN2QjtTQUNGOztBQUVELDBDQUFpQjtPQUNsQjs7QUFFRCxVQUFJLElBQUksQ0FBQyxZQUFZLENBQUMsV0FBVyxFQUFFLEtBQUssU0FBUyxFQUFFO0FBQ2pELGtEQUFxQjtPQUN0Qjs7QUFFRCxVQUFJLElBQUksQ0FBQyxZQUFZLENBQUMsV0FBVyxFQUFFLEtBQUssS0FBSyxFQUFFO0FBQzdDLDBDQUFpQjtPQUNsQjs7QUFFRCxVQUFJLEdBQUcsWUFBQSxDQUFDO0FBQ1IsVUFBSSxJQUFJLENBQUMsY0FBYyxFQUFFO0FBQ3ZCLFdBQUcsR0FBRyxrREFBK0MsSUFBSSxDQUFDLGNBQWMsb0NBQzlELElBQUksQ0FBQyxZQUFZLFNBQUksQ0FBQztPQUNqQyxNQUFNO0FBQ0wsV0FBRyxtREFBZ0QsSUFBSSxDQUFDLFlBQVksUUFBSSxDQUFDO09BQzFFO0FBQ0QsWUFBTSxJQUFJLEtBQUssQ0FBSSxHQUFHLDhDQUEyQyxDQUFDO0tBQ25FOzs7V0FFZ0IsMEJBQUMsTUFBTSxFQUFFO0FBQ3hCLFVBQU0sZUFBZSxHQUFHO0FBQ3RCLHdCQUFnQixFQUFFLDBCQUEwQjtBQUM1QyxpQ0FBeUIsRUFBRSw0QkFBNEI7QUFDdkQsc0JBQWMsRUFBRSx3QkFBd0I7QUFDeEMsd0JBQWdCLEVBQUUsMEJBQTBCO0FBQzVDLGtCQUFVLEVBQUUsb0JBQW9CO0FBQ2hDLHFCQUFhLEVBQUUsdUJBQXVCO0FBQ3RDLGlCQUFTLEVBQUUsbUJBQW1CO0FBQzlCLHFCQUFhLEVBQUUsdUJBQXVCO0FBQ3RDLGlCQUFTLEVBQUUsbUJBQW1CO09BQy9CLENBQUM7QUFDRixVQUFJLENBQUMsZUFBZSxDQUFDLE1BQU0sQ0FBQyxJQUFJLENBQUMsRUFBRTtBQUNqQyw0QkFBSSxJQUFJLHdDQUFxQyxNQUFNLENBQUMsSUFBSSxRQUFJLENBQUM7QUFDN0QsZUFBTztPQUNSOztxQkFDZSxPQUFPLENBQUksZUFBZSxDQUFDLE1BQU0sQ0FBQyxJQUFJLENBQUMsbUJBQWdCOztVQUFsRSxPQUFPLFlBQVAsT0FBTzs7QUFDWixhQUFPLE9BQU8sQ0FBQztLQUNoQjs7O1dBRWU7VUFDVixNQUFNLEVBQ04sTUFBTSxFQUNOLE1BQU07Ozs7OzZDQUZTLDhCQUFpQjs7O0FBQWhDLGtCQUFNO0FBQ04sa0JBQU0sR0FBRyxNQUFNLENBQUMsU0FBUyxDQUFDO0FBQzFCLGtCQUFNLEdBQUcsRUFBQyxLQUFLLEVBQUUsRUFBQyxPQUFPLEVBQUUsTUFBTSxDQUFDLE9BQU8sRUFBQyxFQUFDOztBQUMvQyxnQkFBSSxPQUFPLE1BQU0sS0FBSyxXQUFXLEVBQUU7QUFDakMsb0JBQU0sQ0FBQyxLQUFLLENBQUMsUUFBUSxHQUFHLE1BQU0sQ0FBQzthQUNoQztnREFDTSxNQUFNOzs7Ozs7O0tBQ2Q7OztXQUVpQjtVQUNaLFFBQVEsK0ZBQ0YsRUFBRSxFQUFFLE1BQU07Ozs7O0FBRGhCLG9CQUFRLEdBQUcsRUFBRTs7Ozs7O0FBQ2pCLDBDQUF5QixvQkFBRSxPQUFPLENBQUMsSUFBSSxDQUFDLFFBQVEsQ0FBQyxxR0FBRTs7QUFBekMsZ0JBQUU7QUFBRSxvQkFBTTs7QUFDbEIsc0JBQVEsQ0FBQyxJQUFJLENBQUMsRUFBQyxFQUFFLEVBQUYsRUFBRSxFQUFFLFlBQVksRUFBRSxNQUFNLENBQUMsSUFBSSxFQUFDLENBQUMsQ0FBQzthQUNoRDs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Z0RBQ00sUUFBUTs7Ozs7OztLQUNoQjs7O1dBRTJCLHFDQUFDLE1BQU0sRUFBRSxJQUFJLEVBQUU7QUFDekMsVUFBSSxhQUFhLEdBQUcsSUFBSSxDQUFDLGdCQUFnQixDQUFDLE1BQU0sQ0FBQyxDQUFDO0FBQ2xELFVBQUksV0FBVyxHQUFHLGFBQWEscUJBQ2IsTUFBTSxDQUFDLElBQUksV0FBTSxhQUFhLG1DQUM5QixNQUFNLENBQUMsSUFBSSxhQUFVLENBQUM7QUFDeEMsMEJBQUksSUFBSSxDQUFDLFdBQVcsQ0FBQyxDQUFDO0FBQ3RCLDBCQUFJLElBQUksQ0FBQyxlQUFlLENBQUMsQ0FBQztBQUMxQix3QkFBSyxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUM7Ozs7OztBQUNuQiwyQ0FBeUIsb0JBQUUsT0FBTyxDQUFDLElBQUksQ0FBQyxpSEFBRTs7O2NBQWhDLEdBQUc7Y0FBRSxLQUFLOztBQUNsQiw4QkFBSSxJQUFJLFFBQU0sR0FBRyxVQUFLLGtCQUFLLE9BQU8sQ0FBQyxLQUFLLENBQUMsQ0FBRyxDQUFDO1NBQzlDOzs7Ozs7Ozs7Ozs7Ozs7S0FDRjs7O1dBRW1CLHVCQUFDLElBQUksRUFBRSxPQUFPO1VBRTVCLFdBQVcsdUZBT0osRUFBRSxFQVdULFdBQVcsRUFPWCxDQUFDLGVBQ0EsY0FBYyxFQUFFLEtBQUs7Ozs7O0FBM0IxQixnQkFBSSxHQUFHLG9CQUFFLFFBQVEsQ0FBQyxvQkFBRSxLQUFLLENBQUMsSUFBSSxDQUFDLEVBQUUsSUFBSSxDQUFDLElBQUksQ0FBQyxtQkFBbUIsQ0FBQyxDQUFDO0FBQzVELHVCQUFXLEdBQUcsSUFBSSxDQUFDLGdCQUFnQixDQUFDLElBQUksQ0FBQzs7QUFDN0MsZ0JBQUksQ0FBQywyQkFBMkIsQ0FBQyxXQUFXLEVBQUUsSUFBSSxDQUFDLENBQUM7Ozs7O2tCQUloRCxJQUFJLENBQUMsSUFBSSxDQUFDLGVBQWUsSUFBSSxDQUFDLENBQUMsSUFBSSxDQUFDLFFBQVEsSUFBSSxvQkFBRSxJQUFJLENBQUMsSUFBSSxDQUFDLFFBQVEsQ0FBQyxDQUFDLE1BQU0sR0FBRyxDQUFDLENBQUE7Ozs7O0FBQ2xGLGdDQUFJLElBQUksQ0FBQyxrREFBa0QsQ0FBQyxDQUFDOzs7OztzQ0FDOUMsb0JBQUUsSUFBSSxDQUFDLElBQUksQ0FBQyxRQUFRLENBQUM7Ozs7Ozs7O0FBQTNCLGNBQUU7O0FBQ1QsZ0NBQUksSUFBSSw2QkFBMEIsRUFBRSxRQUFJLENBQUM7Ozs2Q0FFakMsSUFBSSxDQUFDLGFBQWEsQ0FBQyxFQUFFLENBQUM7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0FBUTlCLHVCQUFXOzs7QUFFYix1QkFBVyxHQUFHLElBQUksQ0FBQyx1QkFBdUIsQ0FBQyxXQUFXLENBQUMsQ0FBQzs7Ozs7OztrQkFFbEQsSUFBSSx5QkFBTyxzQkFBc0IsQ0FBQyxlQUFFLE9BQU8sQ0FBQzs7O0FBR2hELGFBQUMsR0FBRyxJQUFJLFdBQVcsQ0FBQyxJQUFJLENBQUMsSUFBSSxDQUFDOzs2Q0FDRSxDQUFDLENBQUMsYUFBYSxDQUFDLElBQUksRUFBRSxPQUFPLEVBQUUsV0FBVyxDQUFDOzs7OztBQUExRSwwQkFBYztBQUFFLGlCQUFLOztBQUMxQixnQkFBSSxDQUFDLFFBQVEsQ0FBQyxjQUFjLENBQUMsR0FBRyxDQUFDLENBQUM7Ozs7O0FBS2xDLGdCQUFJLENBQUMsK0JBQStCLENBQUMsQ0FBQyxFQUFFLGNBQWMsQ0FBQyxDQUFDOztBQUd4RCxnQ0FBSSxJQUFJLENBQUMsU0FBTyxXQUFXLENBQUMsSUFBSSxnREFDcEIsY0FBYyxtQ0FBK0IsQ0FBQyxDQUFDOzs7QUFHM0QsYUFBQyxDQUFDLHNCQUFzQixFQUFFLENBQUM7O2dEQUVwQixDQUFDLGNBQWMsRUFBRSxLQUFLLENBQUM7Ozs7Ozs7S0FDL0I7OztXQUVxQyx5Q0FBQyxNQUFNLEVBQUUsY0FBYzs7Ozs7OzZDQUtuRCxNQUFNLENBQUMsb0JBQW9COzs7a0JBRTNCLElBQUksS0FBSyxDQUFDLHFCQUFxQixDQUFDOzs7Ozs7a0JBRWxDLDBCQUFhLHNCQUFFLGlCQUFpQixDQUFBOzs7Ozs7OztBQUtwQyxnQ0FBSSxJQUFJLG1DQUFnQyxlQUFFLE9BQU8sUUFBSSxDQUFDO0FBQ3RELGdDQUFJLElBQUksdUJBQXFCLGNBQWMsbUNBQWdDLENBQUM7QUFDNUUsbUJBQU8sSUFBSSxDQUFDLFFBQVEsQ0FBQyxjQUFjLENBQUMsQ0FBQzs7Ozs7OztLQUV4Qzs7O1dBRXVCLGlDQUFDLFdBQVcsRUFBRTtBQUNwQyxVQUFJLElBQUksR0FBRyxvQkFBRSxNQUFNLENBQUMsSUFBSSxDQUFDLFFBQVEsQ0FBQyxDQUNyQixNQUFNLENBQUMsVUFBQyxDQUFDO2VBQUssQ0FBQyxDQUFDLFdBQVcsQ0FBQyxJQUFJLEtBQUssV0FBVyxDQUFDLElBQUk7T0FBQSxDQUFDLENBQ3RELEdBQUcsQ0FBQyxVQUFDLENBQUM7ZUFBSyxDQUFDLENBQUMsVUFBVTtPQUFBLENBQUMsQ0FBQzs7Ozs7O0FBQ3RDLDJDQUFrQixJQUFJLGlIQUFFO2NBQWYsS0FBSzs7QUFDWixjQUFJLENBQUMsS0FBSyxFQUFFO0FBQ1Ysa0JBQU0sSUFBSSxLQUFLLENBQUMsbURBQ0csV0FBVyxDQUFDLElBQUksZ0NBQTJCLGtCQUNoQyxDQUFDLENBQUM7V0FDakM7U0FDRjs7Ozs7Ozs7Ozs7Ozs7OztBQUNELGFBQU8sSUFBSSxDQUFDO0tBQ2I7OztXQUVtQix1QkFBQyxTQUFTOzs7Ozs7aUJBRXRCLElBQUksQ0FBQyxRQUFRLENBQUMsU0FBUyxDQUFDOzs7Ozs7NkNBQ3BCLElBQUksQ0FBQyxRQUFRLENBQUMsU0FBUyxDQUFDLENBQUMsYUFBYSxFQUFFOzs7Ozs7Ozs7O0FBR2hELGdDQUFJLEtBQUssaUNBQStCLFNBQVMsVUFBSyxlQUFFLE9BQU8sQ0FBRyxDQUFDOzs7Ozs7Ozs7QUFNbkUsZ0NBQUksSUFBSSx1QkFBcUIsU0FBUyxtQ0FBZ0MsQ0FBQztBQUN2RSxtQkFBTyxJQUFJLENBQUMsUUFBUSxDQUFDLFNBQVMsQ0FBQyxDQUFDOzs7Ozs7OztLQUVuQzs7O1dBRW9CLHdCQUFDLEdBQUc7Ozt3Q0FBSyxJQUFJO0FBQUosWUFBSTs7O2lCQUs1QixTQUFTOzs7OztpQkFKVCxxQkFBcUIsQ0FBQyxHQUFHLENBQUM7Ozs7O29GQTFPNUIsWUFBWSwrREEyT2dCLEdBQUcsU0FBSyxJQUFJOzs7QUFHdEMscUJBQVMsR0FBRyxJQUFJLENBQUMsSUFBSSxDQUFDLE1BQU0sR0FBRyxDQUFDLENBQUM7Z0RBQzlCLHVCQUFBLElBQUksQ0FBQyxRQUFRLENBQUMsU0FBUyxDQUFDLEVBQUMsY0FBYyxNQUFBLHVCQUFDLEdBQUcsU0FBSyxJQUFJLEVBQUM7Ozs7Ozs7S0FDN0Q7OztXQUVXLHFCQUFDLFNBQVMsRUFBRTtBQUN0QixhQUFPLElBQUksQ0FBQyxRQUFRLENBQUMsU0FBUyxDQUFDLElBQ3hCLG9CQUFFLFVBQVUsQ0FBQyxJQUFJLENBQUMsUUFBUSxDQUFDLFNBQVMsQ0FBQyxDQUFDLFdBQVcsQ0FBQyxJQUNsRCxJQUFJLENBQUMsUUFBUSxDQUFDLFNBQVMsQ0FBQyxDQUFDLFdBQVcsQ0FBQyxTQUFTLENBQUMsQ0FBQztLQUN4RDs7O1dBRWlCLDJCQUFDLFNBQVMsRUFBRTtBQUM1QixVQUFJLENBQUMsSUFBSSxDQUFDLFFBQVEsQ0FBQyxTQUFTLENBQUMsRUFBRTtBQUM3QixlQUFPLEVBQUUsQ0FBQztPQUNYO0FBQ0QsYUFBTyxJQUFJLENBQUMsUUFBUSxDQUFDLFNBQVMsQ0FBQyxDQUFDLGlCQUFpQixFQUFFLENBQUM7S0FDckQ7OztXQUVRLGtCQUFDLFNBQVMsRUFBRTtBQUNuQixhQUFPLElBQUksQ0FBQyxRQUFRLENBQUMsU0FBUyxDQUFDLElBQUksSUFBSSxDQUFDLFFBQVEsQ0FBQyxTQUFTLENBQUMsQ0FBQyxRQUFRLENBQUMsU0FBUyxDQUFDLENBQUM7S0FDakY7OztTQWpRRyxZQUFZOzs7QUFzUWxCLFNBQVMscUJBQXFCLENBQUUsR0FBRyxFQUFFO0FBQ25DLFNBQU8sQ0FBQyx3Q0FBaUIsR0FBRyxDQUFDLElBQUksR0FBRyxLQUFLLGVBQWUsQ0FBQztDQUMxRDs7QUFFRCxTQUFTLGVBQWUsQ0FBRSxJQUFJLEVBQUU7QUFDOUIsTUFBSSxNQUFNLEdBQUcsSUFBSSxZQUFZLENBQUMsSUFBSSxDQUFDLENBQUM7QUFDcEMsU0FBTyxnREFBeUIsTUFBTSxDQUFDLENBQUM7Q0FDekM7O1FBRVEsWUFBWSxHQUFaLFlBQVk7UUFBRSxlQUFlLEdBQWYsZUFBZTtxQkFDdkIsZUFBZSIsImZpbGUiOiJsaWIvYXBwaXVtLmpzIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IF8gZnJvbSAnbG9kYXNoJztcbmltcG9ydCBsb2cgZnJvbSAnLi9sb2dnZXInO1xuaW1wb3J0IHsgZ2V0QXBwaXVtQ29uZmlnIH0gZnJvbSAnLi9jb25maWcnO1xuaW1wb3J0IHsgQmFzZURyaXZlciwgcm91dGVDb25maWd1cmluZ0Z1bmN0aW9uLCBlcnJvcnMsXG4gICAgICAgICBpc1Nlc3Npb25Db21tYW5kIH0gZnJvbSAnYXBwaXVtLWJhc2UtZHJpdmVyJztcbmltcG9ydCB7IEZha2VEcml2ZXIgfSBmcm9tICdhcHBpdW0tZmFrZS1kcml2ZXInO1xuaW1wb3J0IHsgQW5kcm9pZERyaXZlciB9IGZyb20gJ2FwcGl1bS1hbmRyb2lkLWRyaXZlcic7XG5pbXBvcnQgeyBJb3NEcml2ZXIgfSBmcm9tICdhcHBpdW0taW9zLWRyaXZlcic7XG5pbXBvcnQgeyBBbmRyb2lkVWlhdXRvbWF0b3IyRHJpdmVyIH0gZnJvbSAnYXBwaXVtLXVpYXV0b21hdG9yMi1kcml2ZXInO1xuaW1wb3J0IHsgU2VsZW5kcm9pZERyaXZlciB9IGZyb20gJ2FwcGl1bS1zZWxlbmRyb2lkLWRyaXZlcic7XG5pbXBvcnQgeyBYQ1VJVGVzdERyaXZlciB9IGZyb20gJ2FwcGl1bS14Y3VpdGVzdC1kcml2ZXInO1xuaW1wb3J0IHsgWW91aUVuZ2luZURyaXZlciB9IGZyb20gJ2FwcGl1bS15b3VpZW5naW5lLWRyaXZlcic7XG5pbXBvcnQgeyBXaW5kb3dzRHJpdmVyIH0gZnJvbSAnYXBwaXVtLXdpbmRvd3MtZHJpdmVyJztcbmltcG9ydCB7IE1hY0RyaXZlciB9IGZyb20gJ2FwcGl1bS1tYWMtZHJpdmVyJztcbmltcG9ydCBCIGZyb20gJ2JsdWViaXJkJztcbmltcG9ydCB1dGlsIGZyb20gJ3V0aWwnO1xuXG5cbmNsYXNzIEFwcGl1bURyaXZlciBleHRlbmRzIEJhc2VEcml2ZXIge1xuICBjb25zdHJ1Y3RvciAoYXJncykge1xuICAgIHN1cGVyKCk7XG5cbiAgICAvLyB0aGUgbWFpbiBBcHBpdW0gRHJpdmVyIGhhcyBubyBuZXcgY29tbWFuZCB0aW1lb3V0XG4gICAgdGhpcy5uZXdDb21tYW5kVGltZW91dE1zID0gMDtcblxuICAgIHRoaXMuYXJncyA9IGFyZ3M7XG5cbiAgICB0aGlzLnNlc3Npb25zID0ge307XG4gIH1cblxuICBzZXNzaW9uRXhpc3RzIChzZXNzaW9uSWQpIHtcbiAgICByZXR1cm4gXy5pbmNsdWRlcyhfLmtleXModGhpcy5zZXNzaW9ucyksIHNlc3Npb25JZCkgJiZcbiAgICAgICAgICAgdGhpcy5zZXNzaW9uc1tzZXNzaW9uSWRdLnNlc3Npb25JZCAhPT0gbnVsbDtcbiAgfVxuXG4gIGRyaXZlckZvclNlc3Npb24gKHNlc3Npb25JZCkge1xuICAgIHJldHVybiB0aGlzLnNlc3Npb25zW3Nlc3Npb25JZF07XG4gIH1cblxuICBnZXREcml2ZXJGb3JDYXBzIChjYXBzKSB7XG4gICAgLy8gVE9ETyBpZiB0aGlzIGxvZ2ljIGV2ZXIgYmVjb21lcyBjb21wbGV4LCBzaG91bGQgcHJvYmFibHkgZmFjdG9yIG91dFxuICAgIC8vIGludG8gaXRzIG93biBmaWxlXG4gICAgaWYgKCFjYXBzLnBsYXRmb3JtTmFtZSB8fCAhXy5pc1N0cmluZyhjYXBzLnBsYXRmb3JtTmFtZSkpIHtcbiAgICAgIHRocm93IG5ldyBFcnJvcihcIllvdSBtdXN0IGluY2x1ZGUgYSBwbGF0Zm9ybU5hbWUgY2FwYWJpbGl0eVwiKTtcbiAgICB9XG5cbiAgICAvLyB3ZSBkb24ndCBuZWNlc3NhcmlseSBoYXZlIGFuIGBhdXRvbWF0aW9uTmFtZWAgY2FwYWJpbGl0eSxcbiAgICBpZiAoY2Fwcy5hdXRvbWF0aW9uTmFtZSkge1xuICAgICAgaWYgKGNhcHMuYXV0b21hdGlvbk5hbWUudG9Mb3dlckNhc2UoKSA9PT0gJ3NlbGVuZHJvaWQnKSB7XG4gICAgICAgIC8vIGJ1dCBpZiB3ZSBkbyBhbmQgaXQgaXMgJ1NlbGVuZHJvaWQnLCBhY3Qgb24gaXRcbiAgICAgICAgcmV0dXJuIFNlbGVuZHJvaWREcml2ZXI7XG4gICAgICB9IGVsc2UgaWYgKGNhcHMuYXV0b21hdGlvbk5hbWUudG9Mb3dlckNhc2UoKSA9PT0gJ3VpYXV0b21hdG9yMicpIHtcbiAgICAgICAgLy8gYnV0IGlmIHdlIGRvIGFuZCBpdCBpcyAnVWlhdXRvbWF0b3IyJywgYWN0IG9uIGl0XG4gICAgICAgIHJldHVybiBBbmRyb2lkVWlhdXRvbWF0b3IyRHJpdmVyO1xuICAgICAgfSBlbHNlIGlmIChjYXBzLmF1dG9tYXRpb25OYW1lLnRvTG93ZXJDYXNlKCkgPT09ICd4Y3VpdGVzdCcpIHtcbiAgICAgICAgLy8gYnV0IGlmIHdlIGRvIGFuZCBpdCBpcyAnWENVSVRlc3QnLCBhY3Qgb24gaXRcbiAgICAgICAgcmV0dXJuIFhDVUlUZXN0RHJpdmVyO1xuICAgICAgfSBlbHNlIGlmIChjYXBzLmF1dG9tYXRpb25OYW1lLnRvTG93ZXJDYXNlKCkgPT09ICd5b3VpZW5naW5lJykge1xuICAgICAgICAvLyBidXQgaWYgd2UgZG8gYW5kIGl0IGlzICdZb3VpRW5naW5lJywgYWN0IG9uIGl0XG4gICAgICAgIHJldHVybiBZb3VpRW5naW5lRHJpdmVyO1xuICAgICAgfVxuICAgIH1cblxuICAgIGlmIChjYXBzLnBsYXRmb3JtTmFtZS50b0xvd2VyQ2FzZSgpID09PSBcImZha2VcIikge1xuICAgICAgcmV0dXJuIEZha2VEcml2ZXI7XG4gICAgfVxuXG4gICAgaWYgKGNhcHMucGxhdGZvcm1OYW1lLnRvTG93ZXJDYXNlKCkgPT09ICdhbmRyb2lkJykge1xuICAgICAgcmV0dXJuIEFuZHJvaWREcml2ZXI7XG4gICAgfVxuXG4gICAgaWYgKGNhcHMucGxhdGZvcm1OYW1lLnRvTG93ZXJDYXNlKCkgPT09ICdpb3MnKSB7XG4gICAgICBpZiAoY2Fwcy5wbGF0Zm9ybVZlcnNpb24pIHtcbiAgICAgICAgbGV0IG1ham9yVmVyID0gY2Fwcy5wbGF0Zm9ybVZlcnNpb24udG9TdHJpbmcoKS5zcGxpdChcIi5cIilbMF07XG4gICAgICAgIGlmIChwYXJzZUludChtYWpvclZlciwgMTApID49IDEwKSB7XG4gICAgICAgICAgbG9nLmluZm8oXCJSZXF1ZXN0ZWQgaU9TIHN1cHBvcnQgd2l0aCB2ZXJzaW9uID49IDEwLCB1c2luZyBYQ1VJVGVzdCBcIiArXG4gICAgICAgICAgICAgICAgICAgXCJkcml2ZXIgaW5zdGVhZCBvZiBVSUF1dG9tYXRpb24tYmFzZWQgZHJpdmVyLCBzaW5jZSB0aGUgXCIgK1xuICAgICAgICAgICAgICAgICAgIFwibGF0dGVyIGlzIHVuc3VwcG9ydGVkIG9uIGlPUyAxMCBhbmQgdXAuXCIpO1xuICAgICAgICAgIHJldHVybiBYQ1VJVGVzdERyaXZlcjtcbiAgICAgICAgfVxuICAgICAgfVxuXG4gICAgICByZXR1cm4gSW9zRHJpdmVyO1xuICAgIH1cblxuICAgIGlmIChjYXBzLnBsYXRmb3JtTmFtZS50b0xvd2VyQ2FzZSgpID09PSAnd2luZG93cycpIHtcbiAgICAgIHJldHVybiBXaW5kb3dzRHJpdmVyO1xuICAgIH1cblxuICAgIGlmIChjYXBzLnBsYXRmb3JtTmFtZS50b0xvd2VyQ2FzZSgpID09PSAnbWFjJykge1xuICAgICAgcmV0dXJuIE1hY0RyaXZlcjtcbiAgICB9XG5cbiAgICBsZXQgbXNnO1xuICAgIGlmIChjYXBzLmF1dG9tYXRpb25OYW1lKSB7XG4gICAgICBtc2cgPSBgQ291bGQgbm90IGZpbmQgYSBkcml2ZXIgZm9yIGF1dG9tYXRpb25OYW1lICcke2NhcHMuYXV0b21hdGlvbk5hbWV9JyBhbmQgcGxhdGZvcm1OYW1lIGAgK1xuICAgICAgICAgICAgYCcke2NhcHMucGxhdGZvcm1OYW1lfScuYDtcbiAgICB9IGVsc2Uge1xuICAgICAgbXNnID0gYENvdWxkIG5vdCBmaW5kIGEgZHJpdmVyIGZvciBwbGF0Zm9ybU5hbWUgJyR7Y2Fwcy5wbGF0Zm9ybU5hbWV9Jy5gO1xuICAgIH1cbiAgICB0aHJvdyBuZXcgRXJyb3IoYCR7bXNnfSBQbGVhc2UgY2hlY2sgeW91ciBkZXNpcmVkIGNhcGFiaWxpdGllcy5gKTtcbiAgfVxuXG4gIGdldERyaXZlclZlcnNpb24gKGRyaXZlcikge1xuICAgIGNvbnN0IE5BTUVfRFJJVkVSX01BUCA9IHtcbiAgICAgIFNlbGVuZHJvaWREcml2ZXI6ICdhcHBpdW0tc2VsZW5kcm9pZC1kcml2ZXInLFxuICAgICAgQW5kcm9pZFVpYXV0b21hdG9yMkRyaXZlcjogJ2FwcGl1bS11aWF1dG9tYXRvcjItZHJpdmVyJyxcbiAgICAgIFhDVUlUZXN0RHJpdmVyOiAnYXBwaXVtLXhjdWl0ZXN0LWRyaXZlcicsXG4gICAgICBZb3VpRW5naW5lRHJpdmVyOiAnYXBwaXVtLXlvdWllbmdpbmUtZHJpdmVyJyxcbiAgICAgIEZha2VEcml2ZXI6ICdhcHBpdW0tZmFrZS1kcml2ZXInLFxuICAgICAgQW5kcm9pZERyaXZlcjogJ2FwcGl1bS1hbmRyb2lkLWRyaXZlcicsXG4gICAgICBJb3NEcml2ZXI6ICdhcHBpdW0taW9zLWRyaXZlcicsXG4gICAgICBXaW5kb3dzRHJpdmVyOiAnYXBwaXVtLXdpbmRvd3MtZHJpdmVyJyxcbiAgICAgIE1hY0RyaXZlcjogJ2FwcGl1bS1tYWMtZHJpdmVyJyxcbiAgICB9O1xuICAgIGlmICghTkFNRV9EUklWRVJfTUFQW2RyaXZlci5uYW1lXSkge1xuICAgICAgbG9nLndhcm4oYFVuYWJsZSB0byBnZXQgdmVyc2lvbiBvZiBkcml2ZXIgJyR7ZHJpdmVyLm5hbWV9J2ApO1xuICAgICAgcmV0dXJuO1xuICAgIH1cbiAgICBsZXQge3ZlcnNpb259ID0gcmVxdWlyZShgJHtOQU1FX0RSSVZFUl9NQVBbZHJpdmVyLm5hbWVdfS9wYWNrYWdlLmpzb25gKTtcbiAgICByZXR1cm4gdmVyc2lvbjtcbiAgfVxuXG4gIGFzeW5jIGdldFN0YXR1cyAoKSB7XG4gICAgbGV0IGNvbmZpZyA9IGF3YWl0IGdldEFwcGl1bUNvbmZpZygpO1xuICAgIGxldCBnaXRTaGEgPSBjb25maWdbJ2dpdC1zaGEnXTtcbiAgICBsZXQgc3RhdHVzID0ge2J1aWxkOiB7dmVyc2lvbjogY29uZmlnLnZlcnNpb259fTtcbiAgICBpZiAodHlwZW9mIGdpdFNoYSAhPT0gXCJ1bmRlZmluZWRcIikge1xuICAgICAgc3RhdHVzLmJ1aWxkLnJldmlzaW9uID0gZ2l0U2hhO1xuICAgIH1cbiAgICByZXR1cm4gc3RhdHVzO1xuICB9XG5cbiAgYXN5bmMgZ2V0U2Vzc2lvbnMgKCkge1xuICAgIGxldCBzZXNzaW9ucyA9IFtdO1xuICAgIGZvciAobGV0IFtpZCwgZHJpdmVyXSBvZiBfLnRvUGFpcnModGhpcy5zZXNzaW9ucykpIHtcbiAgICAgIHNlc3Npb25zLnB1c2goe2lkLCBjYXBhYmlsaXRpZXM6IGRyaXZlci5jYXBzfSk7XG4gICAgfVxuICAgIHJldHVybiBzZXNzaW9ucztcbiAgfVxuXG4gIHByaW50TmV3U2Vzc2lvbkFubm91bmNlbWVudCAoZHJpdmVyLCBjYXBzKSB7XG4gICAgbGV0IGRyaXZlclZlcnNpb24gPSB0aGlzLmdldERyaXZlclZlcnNpb24oZHJpdmVyKTtcbiAgICBsZXQgaW50cm9TdHJpbmcgPSBkcml2ZXJWZXJzaW9uID9cbiAgICAgIGBDcmVhdGluZyBuZXcgJHtkcml2ZXIubmFtZX0gKHYke2RyaXZlclZlcnNpb259KSBzZXNzaW9uYCA6XG4gICAgICBgQ3JlYXRpbmcgbmV3ICR7ZHJpdmVyLm5hbWV9IHNlc3Npb25gO1xuICAgIGxvZy5pbmZvKGludHJvU3RyaW5nKTtcbiAgICBsb2cuaW5mbygnQ2FwYWJpbGl0aWVzOicpO1xuICAgIHV0aWwuaW5zcGVjdChjYXBzKTtcbiAgICBmb3IgKGxldCBbY2FwLCB2YWx1ZV0gb2YgXy50b1BhaXJzKGNhcHMpKSB7XG4gICAgICBsb2cuaW5mbyhgICAke2NhcH06ICR7dXRpbC5pbnNwZWN0KHZhbHVlKX1gKTtcbiAgICB9XG4gIH1cblxuICBhc3luYyBjcmVhdGVTZXNzaW9uIChjYXBzLCByZXFDYXBzKSB7XG4gICAgY2FwcyA9IF8uZGVmYXVsdHMoXy5jbG9uZShjYXBzKSwgdGhpcy5hcmdzLmRlZmF1bHRDYXBhYmlsaXRpZXMpO1xuICAgIGxldCBJbm5lckRyaXZlciA9IHRoaXMuZ2V0RHJpdmVyRm9yQ2FwcyhjYXBzKTtcbiAgICB0aGlzLnByaW50TmV3U2Vzc2lvbkFubm91bmNlbWVudChJbm5lckRyaXZlciwgY2Fwcyk7XG5cbiAgICAvLyBzZXNzaW9uT3ZlcnJpZGUgc2VydmVyIGZsYWcgY2hlY2tcbiAgICAvLyB0aGlzIHdpbGwgbmVlZCB0byBiZSByZS10aG91Z2h0IHdoZW4gd2UgZ28gdG8gbXVsdGlwbGUgc2Vzc2lvbiBzdXBwb3J0XG4gICAgaWYgKHRoaXMuYXJncy5zZXNzaW9uT3ZlcnJpZGUgJiYgISF0aGlzLnNlc3Npb25zICYmIF8ua2V5cyh0aGlzLnNlc3Npb25zKS5sZW5ndGggPiAwKSB7XG4gICAgICBsb2cuaW5mbygnU2Vzc2lvbiBvdmVycmlkZSBpcyBvbi4gRGVsZXRpbmcgb3RoZXIgc2Vzc2lvbnMuJyk7XG4gICAgICBmb3IgKGxldCBpZCBvZiBfLmtleXModGhpcy5zZXNzaW9ucykpIHtcbiAgICAgICAgbG9nLmluZm8oYCAgICBEZWxldGluZyBzZXNzaW9uICcke2lkfSdgKTtcbiAgICAgICAgdHJ5IHtcbiAgICAgICAgICBhd2FpdCB0aGlzLmRlbGV0ZVNlc3Npb24oaWQpO1xuICAgICAgICB9IGNhdGNoIChpZ24pIHtcbiAgICAgICAgICAvLyB0aGUgZXJyb3IgaGFzIGFscmVhZHkgYmVlbiBsb2dnZWQgaW4gQXBwaXVtRHJpdmVyLmRlbGV0ZVNlc3Npb25cbiAgICAgICAgICAvLyBjb250aW51ZVxuICAgICAgICB9XG4gICAgICB9XG4gICAgfVxuXG4gICAgbGV0IGN1clNlc3Npb25zO1xuICAgIHRyeSB7XG4gICAgICBjdXJTZXNzaW9ucyA9IHRoaXMuY3VyU2Vzc2lvbkRhdGFGb3JEcml2ZXIoSW5uZXJEcml2ZXIpO1xuICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgIHRocm93IG5ldyBlcnJvcnMuU2Vzc2lvbk5vdENyZWF0ZWRFcnJvcihlLm1lc3NhZ2UpO1xuICAgIH1cblxuICAgIGxldCBkID0gbmV3IElubmVyRHJpdmVyKHRoaXMuYXJncyk7XG4gICAgbGV0IFtpbm5lclNlc3Npb25JZCwgZENhcHNdID0gYXdhaXQgZC5jcmVhdGVTZXNzaW9uKGNhcHMsIHJlcUNhcHMsIGN1clNlc3Npb25zKTtcbiAgICB0aGlzLnNlc3Npb25zW2lubmVyU2Vzc2lvbklkXSA9IGQ7XG5cbiAgICAvLyB0aGlzIGlzIGFuIGFzeW5jIGZ1bmN0aW9uIGJ1dCB3ZSBkb24ndCBhd2FpdCBpdCBiZWNhdXNlIGl0IGhhbmRsZXNcbiAgICAvLyBhbiBvdXQtb2YtYmFuZCBwcm9taXNlIHdoaWNoIGlzIGZ1bGZpbGxlZCBpZiB0aGUgaW5uZXIgZHJpdmVyXG4gICAgLy8gdW5leHBlY3RlZGx5IHNodXRzIGRvd25cbiAgICB0aGlzLmF0dGFjaFVuZXhwZWN0ZWRTaHV0ZG93bkhhbmRsZXIoZCwgaW5uZXJTZXNzaW9uSWQpO1xuXG5cbiAgICBsb2cuaW5mbyhgTmV3ICR7SW5uZXJEcml2ZXIubmFtZX0gc2Vzc2lvbiBjcmVhdGVkIHN1Y2Nlc3NmdWxseSwgc2Vzc2lvbiBgICtcbiAgICAgICAgICAgICBgJHtpbm5lclNlc3Npb25JZH0gYWRkZWQgdG8gbWFzdGVyIHNlc3Npb24gbGlzdGApO1xuXG4gICAgLy8gc2V0IHRoZSBOZXcgQ29tbWFuZCBUaW1lb3V0IGZvciB0aGUgaW5uZXIgZHJpdmVyXG4gICAgZC5zdGFydE5ld0NvbW1hbmRUaW1lb3V0KCk7XG5cbiAgICByZXR1cm4gW2lubmVyU2Vzc2lvbklkLCBkQ2Fwc107XG4gIH1cblxuICBhc3luYyBhdHRhY2hVbmV4cGVjdGVkU2h1dGRvd25IYW5kbGVyIChkcml2ZXIsIGlubmVyU2Vzc2lvbklkKSB7XG4gICAgLy8gUmVtb3ZlIHRoZSBzZXNzaW9uIG9uIHVuZXhwZWN0ZWQgc2h1dGRvd24sIHNvIHRoYXQgd2UgYXJlIGluIGEgcG9zaXRpb25cbiAgICAvLyB0byBvcGVuIGFub3RoZXIgc2Vzc2lvbiBsYXRlciBvbi5cbiAgICAvLyBUT0RPOiB0aGlzIHNob3VsZCBiZSByZW1vdmVkIGFuZCByZXBsYWNlZCBieSBhIG9uU2h1dGRvd24gY2FsbGJhY2suXG4gICAgdHJ5IHtcbiAgICAgIGF3YWl0IGRyaXZlci5vblVuZXhwZWN0ZWRTaHV0ZG93bjsgLy8gdGhpcyBpcyBhIGNhbmNlbGxhYmxlIHByb21pc2VcbiAgICAgIC8vIGlmIHdlIGdldCBoZXJlLCB3ZSd2ZSBoYWQgYW4gdW5leHBlY3RlZCBzaHV0ZG93biwgc28gZXJyb3JcbiAgICAgIHRocm93IG5ldyBFcnJvcignVW5leHBlY3RlZCBzaHV0ZG93bicpO1xuICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgIGlmIChlIGluc3RhbmNlb2YgQi5DYW5jZWxsYXRpb25FcnJvcikge1xuICAgICAgICAvLyBpZiB3ZSBjYW5jZWxsZWQgdGhlIHVuZXhwZWN0ZWQgc2h1dGRvd24gcHJvbWlzZSwgdGhhdCBtZWFucyB3ZVxuICAgICAgICAvLyBubyBsb25nZXIgY2FyZSBhYm91dCBpdCwgYW5kIGNhbiBzYWZlbHkgaWdub3JlIGl0XG4gICAgICAgIHJldHVybjtcbiAgICAgIH1cbiAgICAgIGxvZy53YXJuKGBDbG9zaW5nIHNlc3Npb24sIGNhdXNlIHdhcyAnJHtlLm1lc3NhZ2V9J2ApO1xuICAgICAgbG9nLmluZm8oYFJlbW92aW5nIHNlc3Npb24gJHtpbm5lclNlc3Npb25JZH0gZnJvbSBvdXIgbWFzdGVyIHNlc3Npb24gbGlzdGApO1xuICAgICAgZGVsZXRlIHRoaXMuc2Vzc2lvbnNbaW5uZXJTZXNzaW9uSWRdO1xuICAgIH1cbiAgfVxuXG4gIGN1clNlc3Npb25EYXRhRm9yRHJpdmVyIChJbm5lckRyaXZlcikge1xuICAgIGxldCBkYXRhID0gXy52YWx1ZXModGhpcy5zZXNzaW9ucylcbiAgICAgICAgICAgICAgICAuZmlsdGVyKChzKSA9PiBzLmNvbnN0cnVjdG9yLm5hbWUgPT09IElubmVyRHJpdmVyLm5hbWUpXG4gICAgICAgICAgICAgICAgLm1hcCgocykgPT4gcy5kcml2ZXJEYXRhKTtcbiAgICBmb3IgKGxldCBkYXR1bSBvZiBkYXRhKSB7XG4gICAgICBpZiAoIWRhdHVtKSB7XG4gICAgICAgIHRocm93IG5ldyBFcnJvcihgUHJvYmxlbSBnZXR0aW5nIHNlc3Npb24gZGF0YSBmb3IgZHJpdmVyIHR5cGUgYCArXG4gICAgICAgICAgICAgICAgICAgICAgICBgJHtJbm5lckRyaXZlci5uYW1lfTsgZG9lcyBpdCBpbXBsZW1lbnQgJ2dldCBgICtcbiAgICAgICAgICAgICAgICAgICAgICAgIGBkcml2ZXJEYXRhJz9gKTtcbiAgICAgIH1cbiAgICB9XG4gICAgcmV0dXJuIGRhdGE7XG4gIH1cblxuICBhc3luYyBkZWxldGVTZXNzaW9uIChzZXNzaW9uSWQpIHtcbiAgICB0cnkge1xuICAgICAgaWYgKHRoaXMuc2Vzc2lvbnNbc2Vzc2lvbklkXSkge1xuICAgICAgICBhd2FpdCB0aGlzLnNlc3Npb25zW3Nlc3Npb25JZF0uZGVsZXRlU2Vzc2lvbigpO1xuICAgICAgfVxuICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgIGxvZy5lcnJvcihgSGFkIHRyb3VibGUgZW5kaW5nIHNlc3Npb24gJHtzZXNzaW9uSWR9OiAke2UubWVzc2FnZX1gKTtcbiAgICAgIHRocm93IGU7XG4gICAgfSBmaW5hbGx5IHtcbiAgICAgIC8vIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGUgZGVsZXRlU2Vzc2lvbiBjb21wbGV0ZXMgc3VjY2Vzc2Z1bGx5IG9yIG5vdFxuICAgICAgLy8gbWFrZSB0aGUgc2Vzc2lvbiB1bmF2YWlsYWJsZSwgYmVjYXVzZSB3aG8ga25vd3Mgd2hhdCBzdGF0ZSBpdCBtaWdodFxuICAgICAgLy8gYmUgaW4gb3RoZXJ3aXNlXG4gICAgICBsb2cuaW5mbyhgUmVtb3Zpbmcgc2Vzc2lvbiAke3Nlc3Npb25JZH0gZnJvbSBvdXIgbWFzdGVyIHNlc3Npb24gbGlzdGApO1xuICAgICAgZGVsZXRlIHRoaXMuc2Vzc2lvbnNbc2Vzc2lvbklkXTtcbiAgICB9XG4gIH1cblxuICBhc3luYyBleGVjdXRlQ29tbWFuZCAoY21kLCAuLi5hcmdzKSB7XG4gICAgaWYgKGlzQXBwaXVtRHJpdmVyQ29tbWFuZChjbWQpKSB7XG4gICAgICByZXR1cm4gc3VwZXIuZXhlY3V0ZUNvbW1hbmQoY21kLCAuLi5hcmdzKTtcbiAgICB9XG5cbiAgICBsZXQgc2Vzc2lvbklkID0gYXJnc1thcmdzLmxlbmd0aCAtIDFdO1xuICAgIHJldHVybiB0aGlzLnNlc3Npb25zW3Nlc3Npb25JZF0uZXhlY3V0ZUNvbW1hbmQoY21kLCAuLi5hcmdzKTtcbiAgfVxuXG4gIHByb3h5QWN0aXZlIChzZXNzaW9uSWQpIHtcbiAgICByZXR1cm4gdGhpcy5zZXNzaW9uc1tzZXNzaW9uSWRdICYmXG4gICAgICAgICAgIF8uaXNGdW5jdGlvbih0aGlzLnNlc3Npb25zW3Nlc3Npb25JZF0ucHJveHlBY3RpdmUpICYmXG4gICAgICAgICAgIHRoaXMuc2Vzc2lvbnNbc2Vzc2lvbklkXS5wcm94eUFjdGl2ZShzZXNzaW9uSWQpO1xuICB9XG5cbiAgZ2V0UHJveHlBdm9pZExpc3QgKHNlc3Npb25JZCkge1xuICAgIGlmICghdGhpcy5zZXNzaW9uc1tzZXNzaW9uSWRdKSB7XG4gICAgICByZXR1cm4gW107XG4gICAgfVxuICAgIHJldHVybiB0aGlzLnNlc3Npb25zW3Nlc3Npb25JZF0uZ2V0UHJveHlBdm9pZExpc3QoKTtcbiAgfVxuXG4gIGNhblByb3h5IChzZXNzaW9uSWQpIHtcbiAgICByZXR1cm4gdGhpcy5zZXNzaW9uc1tzZXNzaW9uSWRdICYmIHRoaXMuc2Vzc2lvbnNbc2Vzc2lvbklkXS5jYW5Qcm94eShzZXNzaW9uSWQpO1xuICB9XG59XG5cbi8vIGhlbHAgZGVjaWRlIHdoaWNoIGNvbW1hbmRzIHNob3VsZCBiZSBwcm94aWVkIHRvIHN1Yi1kcml2ZXJzIGFuZCB3aGljaFxuLy8gc2hvdWxkIGJlIGhhbmRsZWQgYnkgdGhpcywgb3VyIHVtYnJlbGxhIGRyaXZlclxuZnVuY3Rpb24gaXNBcHBpdW1Ecml2ZXJDb21tYW5kIChjbWQpIHtcbiAgcmV0dXJuICFpc1Nlc3Npb25Db21tYW5kKGNtZCkgfHwgY21kID09PSBcImRlbGV0ZVNlc3Npb25cIjtcbn1cblxuZnVuY3Rpb24gZ2V0QXBwaXVtUm91dGVyIChhcmdzKSB7XG4gIGxldCBhcHBpdW0gPSBuZXcgQXBwaXVtRHJpdmVyKGFyZ3MpO1xuICByZXR1cm4gcm91dGVDb25maWd1cmluZ0Z1bmN0aW9uKGFwcGl1bSk7XG59XG5cbmV4cG9ydCB7IEFwcGl1bURyaXZlciwgZ2V0QXBwaXVtUm91dGVyIH07XG5leHBvcnQgZGVmYXVsdCBnZXRBcHBpdW1Sb3V0ZXI7XG4iXSwic291cmNlUm9vdCI6Ii4uLy4uIn0=
