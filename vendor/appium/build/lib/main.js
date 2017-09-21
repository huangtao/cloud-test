#!/usr/bin/env node

require('source-map-support').install();

'use strict';

var _slicedToArray = require('babel-runtime/helpers/sliced-to-array')['default'];

var _toConsumableArray = require('babel-runtime/helpers/to-consumable-array')['default'];

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _getIterator = require('babel-runtime/core-js/get-iterator')['default'];

var _Object$assign = require('babel-runtime/core-js/object/assign')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _logsink = require('./logsink');

var _logger = require('./logger');

var _logger2 = _interopRequireDefault(_logger);

// logger needs to remain first of imports

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

var _appiumBaseDriver = require('appium-base-driver');

var _asyncbox = require('asyncbox');

var _parser = require('./parser');

var _parser2 = _interopRequireDefault(_parser);

var _config = require('./config');

var _appium = require('./appium');

var _appium2 = _interopRequireDefault(_appium);

var _gridRegister = require('./grid-register');

var _gridRegister2 = _interopRequireDefault(_gridRegister);

var _util = require('util');

var _util2 = _interopRequireDefault(_util);

function preflightChecks(parser, args) {
  var throwInsteadOfExit = arguments.length <= 2 || arguments[2] === undefined ? false : arguments[2];
  return _regeneratorRuntime.async(function preflightChecks$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.prev = 0;

        (0, _config.checkNodeOk)();
        if (args.asyncTrace) {
          require('longjohn').async_trace_limit = -1;
        }

        if (!args.showConfig) {
          context$1$0.next = 7;
          break;
        }

        context$1$0.next = 6;
        return _regeneratorRuntime.awrap((0, _config.showConfig)());

      case 6:
        process.exit(0);

      case 7:
        (0, _config.warnNodeDeprecations)();
        (0, _config.validateServerArgs)(parser, args);

        if (!args.tmpDir) {
          context$1$0.next = 12;
          break;
        }

        context$1$0.next = 12;
        return _regeneratorRuntime.awrap((0, _config.validateTmpDir)(args.tmpDir));

      case 12:
        context$1$0.next = 20;
        break;

      case 14:
        context$1$0.prev = 14;
        context$1$0.t0 = context$1$0['catch'](0);

        _logger2['default'].error(context$1$0.t0.message.red);

        if (!throwInsteadOfExit) {
          context$1$0.next = 19;
          break;
        }

        throw context$1$0.t0;

      case 19:

        process.exit(1);

      case 20:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[0, 14]]);
}

function logDeprecationWarning(deprecatedArgs) {
  _logger2['default'].warn('Deprecated server args:');
  var _iteratorNormalCompletion = true;
  var _didIteratorError = false;
  var _iteratorError = undefined;

  try {
    for (var _iterator = _getIterator(_lodash2['default'].toPairs(deprecatedArgs)), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
      var _step$value = _slicedToArray(_step.value, 2);

      var arg = _step$value[0];
      var realArg = _step$value[1];

      _logger2['default'].warn('  ' + arg.red + ' => ' + realArg);
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
}

function logNonDefaultArgsWarning(args) {
  // cleanly print out the default arguments, allowing for prefix and timestamp
  function getValueArray(obj) {
    var indent = arguments.length <= 1 || arguments[1] === undefined ? '  ' : arguments[1];

    if (!_lodash2['default'].isObject(obj)) {
      return [obj];
    }

    var strArr = ['{'];
    var _iteratorNormalCompletion2 = true;
    var _didIteratorError2 = false;
    var _iteratorError2 = undefined;

    try {
      for (var _iterator2 = _getIterator(_lodash2['default'].toPairs(obj)), _step2; !(_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done); _iteratorNormalCompletion2 = true) {
        var _step2$value = _slicedToArray(_step2.value, 2);

        var arg = _step2$value[0];
        var value = _step2$value[1];

        if (!_lodash2['default'].isObject(value)) {
          strArr.push(indent + '  ' + arg + ': ' + value);
        } else {
          value = getValueArray(value, indent + '  ');
          strArr.push(indent + '  ' + arg + ': ' + value.shift());
          strArr.push.apply(strArr, _toConsumableArray(value));
        }
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

    strArr.push(indent + '}');
    return strArr;
  }
  _logger2['default'].info('Non-default server args:');
  var _iteratorNormalCompletion3 = true;
  var _didIteratorError3 = false;
  var _iteratorError3 = undefined;

  try {
    for (var _iterator3 = _getIterator(_lodash2['default'].toPairs(args)), _step3; !(_iteratorNormalCompletion3 = (_step3 = _iterator3.next()).done); _iteratorNormalCompletion3 = true) {
      var _step3$value = _slicedToArray(_step3.value, 2);

      var arg = _step3$value[0];
      var value = _step3$value[1];

      value = getValueArray(value);
      _logger2['default'].info('  ' + arg + ': ' + value.shift());
      var _iteratorNormalCompletion4 = true;
      var _didIteratorError4 = false;
      var _iteratorError4 = undefined;

      try {
        for (var _iterator4 = _getIterator(value), _step4; !(_iteratorNormalCompletion4 = (_step4 = _iterator4.next()).done); _iteratorNormalCompletion4 = true) {
          var val = _step4.value;

          _logger2['default'].info(val);
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

function logDefaultCapabilitiesWarning(caps) {
  _logger2['default'].info('Default capabilities, which will be added to each request ' + 'unless overridden by desired capabilities:');
  _util2['default'].inspect(caps);
  var _iteratorNormalCompletion5 = true;
  var _didIteratorError5 = false;
  var _iteratorError5 = undefined;

  try {
    for (var _iterator5 = _getIterator(_lodash2['default'].toPairs(caps)), _step5; !(_iteratorNormalCompletion5 = (_step5 = _iterator5.next()).done); _iteratorNormalCompletion5 = true) {
      var _step5$value = _slicedToArray(_step5.value, 2);

      var cap = _step5$value[0];
      var value = _step5$value[1];

      _logger2['default'].info('  ' + cap + ': ' + _util2['default'].inspect(value));
    }
  } catch (err) {
    _didIteratorError5 = true;
    _iteratorError5 = err;
  } finally {
    try {
      if (!_iteratorNormalCompletion5 && _iterator5['return']) {
        _iterator5['return']();
      }
    } finally {
      if (_didIteratorError5) {
        throw _iteratorError5;
      }
    }
  }
}

function logStartupInfo(parser, args) {
  var welcome, appiumRev, showArgs, deprecatedArgs;
  return _regeneratorRuntime.async(function logStartupInfo$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        welcome = 'Welcome to Appium v' + _config.APPIUM_VER;
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap((0, _config.getGitRev)());

      case 3:
        appiumRev = context$1$0.sent;

        if (appiumRev) {
          welcome += ' (REV ' + appiumRev + ')';
        }
        _logger2['default'].info(welcome);

        showArgs = (0, _config.getNonDefaultArgs)(parser, args);

        if (_lodash2['default'].size(showArgs)) {
          logNonDefaultArgsWarning(showArgs);
        }
        deprecatedArgs = (0, _config.getDeprecatedArgs)(parser, args);

        if (_lodash2['default'].size(deprecatedArgs)) {
          logDeprecationWarning(deprecatedArgs);
        }
        if (!_lodash2['default'].isEmpty(args.defaultCapabilities)) {
          logDefaultCapabilitiesWarning(args.defaultCapabilities);
        }
        // TODO: bring back loglevel reporting below once logger is flushed out
        //logger.info('Console LogLevel: ' + logger.transports.console.level);
        //if (logger.transports.file) {
        //logger.info('File LogLevel: ' + logger.transports.file.level);
        //}

      case 11:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}

function logServerPort(address, port) {
  var logMessage = 'Appium REST http interface listener started on ' + (address + ':' + port);
  _logger2['default'].info(logMessage);
}

function main() {
  var args = arguments.length <= 0 || arguments[0] === undefined ? null : arguments[0];
  var parser, throwInsteadOfExit, router, server;
  return _regeneratorRuntime.async(function main$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        parser = (0, _parser2['default'])();
        throwInsteadOfExit = false;

        if (args) {
          // a containing package passed in their own args, let's fill them out
          // with defaults
          args = _Object$assign({}, (0, _parser.getDefaultArgs)(), args);

          // if we have a containing package instead of running as a CLI process,
          // that package might not appreciate us calling 'process.exit' willy-
          // nilly, so give it the option to have us throw instead of exit
          if (args.throwInsteadOfExit) {
            throwInsteadOfExit = true;
            // but remove it since it's not a real server arg per se
            delete args.throwInsteadOfExit;
          }
        } else {
          // otherwise parse from CLI
          args = parser.parseArgs();
        }
        context$1$0.next = 5;
        return _regeneratorRuntime.awrap((0, _logsink.init)(args));

      case 5:
        context$1$0.next = 7;
        return _regeneratorRuntime.awrap(preflightChecks(parser, args, throwInsteadOfExit));

      case 7:
        context$1$0.next = 9;
        return _regeneratorRuntime.awrap(logStartupInfo(parser, args));

      case 9:
        router = (0, _appium2['default'])(args);
        context$1$0.next = 12;
        return _regeneratorRuntime.awrap((0, _appiumBaseDriver.server)(router, args.port, args.address));

      case 12:
        server = context$1$0.sent;
        context$1$0.prev = 13;

        if (!(args.nodeconfig !== null)) {
          context$1$0.next = 17;
          break;
        }

        context$1$0.next = 17;
        return _regeneratorRuntime.awrap((0, _gridRegister2['default'])(args.nodeconfig, args.address, args.port));

      case 17:
        context$1$0.next = 24;
        break;

      case 19:
        context$1$0.prev = 19;
        context$1$0.t0 = context$1$0['catch'](13);
        context$1$0.next = 23;
        return _regeneratorRuntime.awrap(server.close());

      case 23:
        throw context$1$0.t0;

      case 24:

        process.once('SIGINT', function callee$1$0() {
          return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
            while (1) switch (context$2$0.prev = context$2$0.next) {
              case 0:
                _logger2['default'].info('Received SIGINT - shutting down');
                context$2$0.next = 3;
                return _regeneratorRuntime.awrap(server.close());

              case 3:
              case 'end':
                return context$2$0.stop();
            }
          }, null, this);
        });

        process.once('SIGTERM', function callee$1$0() {
          return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
            while (1) switch (context$2$0.prev = context$2$0.next) {
              case 0:
                _logger2['default'].info('Received SIGTERM - shutting down');
                context$2$0.next = 3;
                return _regeneratorRuntime.awrap(server.close());

              case 3:
              case 'end':
                return context$2$0.stop();
            }
          }, null, this);
        });

        logServerPort(args.address, args.port);

        return context$1$0.abrupt('return', server);

      case 28:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[13, 19]]);
}

if (require.main === module) {
  (0, _asyncbox.asyncify)(main);
}

exports.main = main;

// TODO prelaunch if args.launch is set
// TODO: startAlertSocket(server, appiumServer);

// configure as node on grid, if necessary
//# sourceMappingURL=data:application/json;charset=utf8;base64,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TUosSUFBSSxDQUFDLFVBQVUsS0FBSyxJQUFJLENBQUE7Ozs7Ozt5Q0FDcEIsK0JBQWEsSUFBSSxDQUFDLFVBQVUsRUFBRSxJQUFJLENBQUMsT0FBTyxFQUFFLElBQUksQ0FBQyxJQUFJLENBQUM7Ozs7Ozs7Ozs7eUNBR3hELE1BQU0sQ0FBQyxLQUFLLEVBQUU7Ozs7Ozs7QUFJdEIsZUFBTyxDQUFDLElBQUksQ0FBQyxRQUFRLEVBQUU7Ozs7QUFDckIsb0NBQU8sSUFBSSxtQ0FBbUMsQ0FBQzs7aURBQ3pDLE1BQU0sQ0FBQyxLQUFLLEVBQUU7Ozs7Ozs7U0FDckIsQ0FBQyxDQUFDOztBQUVILGVBQU8sQ0FBQyxJQUFJLENBQUMsU0FBUyxFQUFFOzs7O0FBQ3RCLG9DQUFPLElBQUksb0NBQW9DLENBQUM7O2lEQUMxQyxNQUFNLENBQUMsS0FBSyxFQUFFOzs7Ozs7O1NBQ3JCLENBQUMsQ0FBQzs7QUFFSCxxQkFBYSxDQUFDLElBQUksQ0FBQyxPQUFPLEVBQUUsSUFBSSxDQUFDLElBQUksQ0FBQyxDQUFDOzs0Q0FFaEMsTUFBTTs7Ozs7OztDQUNkOztBQUVELElBQUksT0FBTyxDQUFDLElBQUksS0FBSyxNQUFNLEVBQUU7QUFDM0IsMEJBQVMsSUFBSSxDQUFDLENBQUM7Q0FDaEI7O1FBRVEsSUFBSSxHQUFKLElBQUkiLCJmaWxlIjoibGliL21haW4uanMiLCJzb3VyY2VzQ29udGVudCI6WyJcbi8vIHRyYW5zcGlsZTptYWluXG5cbmltcG9ydCB7IGluaXQgYXMgbG9nc2lua0luaXQgfSBmcm9tICcuL2xvZ3NpbmsnO1xuaW1wb3J0IGxvZ2dlciBmcm9tICcuL2xvZ2dlcic7IC8vIGxvZ2dlciBuZWVkcyB0byByZW1haW4gZmlyc3Qgb2YgaW1wb3J0c1xuaW1wb3J0IF8gZnJvbSAnbG9kYXNoJztcbmltcG9ydCB7IHNlcnZlciBhcyBiYXNlU2VydmVyIH0gZnJvbSAnYXBwaXVtLWJhc2UtZHJpdmVyJztcbmltcG9ydCB7IGFzeW5jaWZ5IH0gZnJvbSAnYXN5bmNib3gnO1xuaW1wb3J0IHsgZGVmYXVsdCBhcyBnZXRQYXJzZXIsIGdldERlZmF1bHRBcmdzIH0gZnJvbSAnLi9wYXJzZXInO1xuaW1wb3J0IHsgc2hvd0NvbmZpZywgY2hlY2tOb2RlT2ssIHZhbGlkYXRlU2VydmVyQXJncyxcbiAgICAgICAgIHdhcm5Ob2RlRGVwcmVjYXRpb25zLCB2YWxpZGF0ZVRtcERpciwgZ2V0Tm9uRGVmYXVsdEFyZ3MsXG4gICAgICAgICBnZXREZXByZWNhdGVkQXJncywgZ2V0R2l0UmV2LCBBUFBJVU1fVkVSIH0gZnJvbSAnLi9jb25maWcnO1xuaW1wb3J0IGdldEFwcGl1bVJvdXRlciBmcm9tICcuL2FwcGl1bSc7XG5pbXBvcnQgcmVnaXN0ZXJOb2RlIGZyb20gJy4vZ3JpZC1yZWdpc3Rlcic7XG5pbXBvcnQgdXRpbCBmcm9tICd1dGlsJztcblxuXG5hc3luYyBmdW5jdGlvbiBwcmVmbGlnaHRDaGVja3MgKHBhcnNlciwgYXJncywgdGhyb3dJbnN0ZWFkT2ZFeGl0ID0gZmFsc2UpIHtcbiAgdHJ5IHtcbiAgICBjaGVja05vZGVPaygpO1xuICAgIGlmIChhcmdzLmFzeW5jVHJhY2UpIHtcbiAgICAgIHJlcXVpcmUoJ2xvbmdqb2huJykuYXN5bmNfdHJhY2VfbGltaXQgPSAtMTtcbiAgICB9XG4gICAgaWYgKGFyZ3Muc2hvd0NvbmZpZykge1xuICAgICAgYXdhaXQgc2hvd0NvbmZpZygpO1xuICAgICAgcHJvY2Vzcy5leGl0KDApO1xuICAgIH1cbiAgICB3YXJuTm9kZURlcHJlY2F0aW9ucygpO1xuICAgIHZhbGlkYXRlU2VydmVyQXJncyhwYXJzZXIsIGFyZ3MpO1xuICAgIGlmIChhcmdzLnRtcERpcikge1xuICAgICAgYXdhaXQgdmFsaWRhdGVUbXBEaXIoYXJncy50bXBEaXIpO1xuICAgIH1cbiAgfSBjYXRjaCAoZXJyKSB7XG4gICAgbG9nZ2VyLmVycm9yKGVyci5tZXNzYWdlLnJlZCk7XG4gICAgaWYgKHRocm93SW5zdGVhZE9mRXhpdCkge1xuICAgICAgdGhyb3cgZXJyO1xuICAgIH1cblxuICAgIHByb2Nlc3MuZXhpdCgxKTtcbiAgfVxufVxuXG5mdW5jdGlvbiBsb2dEZXByZWNhdGlvbldhcm5pbmcgKGRlcHJlY2F0ZWRBcmdzKSB7XG4gIGxvZ2dlci53YXJuKCdEZXByZWNhdGVkIHNlcnZlciBhcmdzOicpO1xuICBmb3IgKGxldCBbYXJnLCByZWFsQXJnXSBvZiBfLnRvUGFpcnMoZGVwcmVjYXRlZEFyZ3MpKSB7XG4gICAgbG9nZ2VyLndhcm4oYCAgJHthcmcucmVkfSA9PiAke3JlYWxBcmd9YCk7XG4gIH1cbn1cblxuZnVuY3Rpb24gbG9nTm9uRGVmYXVsdEFyZ3NXYXJuaW5nIChhcmdzKSB7XG4gIC8vIGNsZWFubHkgcHJpbnQgb3V0IHRoZSBkZWZhdWx0IGFyZ3VtZW50cywgYWxsb3dpbmcgZm9yIHByZWZpeCBhbmQgdGltZXN0YW1wXG4gIGZ1bmN0aW9uIGdldFZhbHVlQXJyYXkgKG9iaiwgaW5kZW50ID0gJyAgJykge1xuICAgIGlmICghXy5pc09iamVjdChvYmopKSB7XG4gICAgICByZXR1cm4gW29ial07XG4gICAgfVxuXG4gICAgbGV0IHN0ckFyciA9IFsneyddO1xuICAgIGZvciAobGV0IFthcmcsIHZhbHVlXSBvZiBfLnRvUGFpcnMob2JqKSkge1xuICAgICAgaWYgKCFfLmlzT2JqZWN0KHZhbHVlKSkge1xuICAgICAgICBzdHJBcnIucHVzaChgJHtpbmRlbnR9ICAke2FyZ306ICR7dmFsdWV9YCk7XG4gICAgICB9IGVsc2Uge1xuICAgICAgICB2YWx1ZSA9IGdldFZhbHVlQXJyYXkodmFsdWUsIGAke2luZGVudH0gIGApO1xuICAgICAgICBzdHJBcnIucHVzaChgJHtpbmRlbnR9ICAke2FyZ306ICR7dmFsdWUuc2hpZnQoKX1gKTtcbiAgICAgICAgc3RyQXJyLnB1c2goLi4udmFsdWUpO1xuICAgICAgfVxuICAgIH1cbiAgICBzdHJBcnIucHVzaChgJHtpbmRlbnR9fWApO1xuICAgIHJldHVybiBzdHJBcnI7XG4gIH1cbiAgbG9nZ2VyLmluZm8oJ05vbi1kZWZhdWx0IHNlcnZlciBhcmdzOicpO1xuICBmb3IgKGxldCBbYXJnLCB2YWx1ZV0gb2YgXy50b1BhaXJzKGFyZ3MpKSB7XG4gICAgdmFsdWUgPSBnZXRWYWx1ZUFycmF5KHZhbHVlKTtcbiAgICBsb2dnZXIuaW5mbyhgICAke2FyZ306ICR7dmFsdWUuc2hpZnQoKX1gKTtcbiAgICBmb3IgKGxldCB2YWwgb2YgdmFsdWUpIHtcbiAgICAgIGxvZ2dlci5pbmZvKHZhbCk7XG4gICAgfVxuICB9XG59XG5cbmZ1bmN0aW9uIGxvZ0RlZmF1bHRDYXBhYmlsaXRpZXNXYXJuaW5nIChjYXBzKSB7XG4gIGxvZ2dlci5pbmZvKCdEZWZhdWx0IGNhcGFiaWxpdGllcywgd2hpY2ggd2lsbCBiZSBhZGRlZCB0byBlYWNoIHJlcXVlc3QgJyArXG4gICAgICAgICAgICAgICd1bmxlc3Mgb3ZlcnJpZGRlbiBieSBkZXNpcmVkIGNhcGFiaWxpdGllczonKTtcbiAgdXRpbC5pbnNwZWN0KGNhcHMpO1xuICBmb3IgKGxldCBbY2FwLCB2YWx1ZV0gb2YgXy50b1BhaXJzKGNhcHMpKSB7XG4gICAgbG9nZ2VyLmluZm8oYCAgJHtjYXB9OiAke3V0aWwuaW5zcGVjdCh2YWx1ZSl9YCk7XG4gIH1cbn1cblxuYXN5bmMgZnVuY3Rpb24gbG9nU3RhcnR1cEluZm8gKHBhcnNlciwgYXJncykge1xuICBsZXQgd2VsY29tZSA9IGBXZWxjb21lIHRvIEFwcGl1bSB2JHtBUFBJVU1fVkVSfWA7XG4gIGxldCBhcHBpdW1SZXYgPSBhd2FpdCBnZXRHaXRSZXYoKTtcbiAgaWYgKGFwcGl1bVJldikge1xuICAgIHdlbGNvbWUgKz0gYCAoUkVWICR7YXBwaXVtUmV2fSlgO1xuICB9XG4gIGxvZ2dlci5pbmZvKHdlbGNvbWUpO1xuXG4gIGxldCBzaG93QXJncyA9IGdldE5vbkRlZmF1bHRBcmdzKHBhcnNlciwgYXJncyk7XG4gIGlmIChfLnNpemUoc2hvd0FyZ3MpKSB7XG4gICAgbG9nTm9uRGVmYXVsdEFyZ3NXYXJuaW5nKHNob3dBcmdzKTtcbiAgfVxuICBsZXQgZGVwcmVjYXRlZEFyZ3MgPSBnZXREZXByZWNhdGVkQXJncyhwYXJzZXIsIGFyZ3MpO1xuICBpZiAoXy5zaXplKGRlcHJlY2F0ZWRBcmdzKSkge1xuICAgIGxvZ0RlcHJlY2F0aW9uV2FybmluZyhkZXByZWNhdGVkQXJncyk7XG4gIH1cbiAgaWYgKCFfLmlzRW1wdHkoYXJncy5kZWZhdWx0Q2FwYWJpbGl0aWVzKSkge1xuICAgIGxvZ0RlZmF1bHRDYXBhYmlsaXRpZXNXYXJuaW5nKGFyZ3MuZGVmYXVsdENhcGFiaWxpdGllcyk7XG4gIH1cbiAgLy8gVE9ETzogYnJpbmcgYmFjayBsb2dsZXZlbCByZXBvcnRpbmcgYmVsb3cgb25jZSBsb2dnZXIgaXMgZmx1c2hlZCBvdXRcbiAgLy9sb2dnZXIuaW5mbygnQ29uc29sZSBMb2dMZXZlbDogJyArIGxvZ2dlci50cmFuc3BvcnRzLmNvbnNvbGUubGV2ZWwpO1xuICAvL2lmIChsb2dnZXIudHJhbnNwb3J0cy5maWxlKSB7XG4gICAgLy9sb2dnZXIuaW5mbygnRmlsZSBMb2dMZXZlbDogJyArIGxvZ2dlci50cmFuc3BvcnRzLmZpbGUubGV2ZWwpO1xuICAvL31cbn1cblxuZnVuY3Rpb24gbG9nU2VydmVyUG9ydCAoYWRkcmVzcywgcG9ydCkge1xuICBsZXQgbG9nTWVzc2FnZSA9IGBBcHBpdW0gUkVTVCBodHRwIGludGVyZmFjZSBsaXN0ZW5lciBzdGFydGVkIG9uIGAgK1xuICAgICAgICAgICAgICAgICAgIGAke2FkZHJlc3N9OiR7cG9ydH1gO1xuICBsb2dnZXIuaW5mbyhsb2dNZXNzYWdlKTtcbn1cblxuYXN5bmMgZnVuY3Rpb24gbWFpbiAoYXJncyA9IG51bGwpIHtcbiAgbGV0IHBhcnNlciA9IGdldFBhcnNlcigpO1xuICBsZXQgdGhyb3dJbnN0ZWFkT2ZFeGl0ID0gZmFsc2U7XG4gIGlmIChhcmdzKSB7XG4gICAgLy8gYSBjb250YWluaW5nIHBhY2thZ2UgcGFzc2VkIGluIHRoZWlyIG93biBhcmdzLCBsZXQncyBmaWxsIHRoZW0gb3V0XG4gICAgLy8gd2l0aCBkZWZhdWx0c1xuICAgIGFyZ3MgPSBPYmplY3QuYXNzaWduKHt9LCBnZXREZWZhdWx0QXJncygpLCBhcmdzKTtcblxuICAgIC8vIGlmIHdlIGhhdmUgYSBjb250YWluaW5nIHBhY2thZ2UgaW5zdGVhZCBvZiBydW5uaW5nIGFzIGEgQ0xJIHByb2Nlc3MsXG4gICAgLy8gdGhhdCBwYWNrYWdlIG1pZ2h0IG5vdCBhcHByZWNpYXRlIHVzIGNhbGxpbmcgJ3Byb2Nlc3MuZXhpdCcgd2lsbHktXG4gICAgLy8gbmlsbHksIHNvIGdpdmUgaXQgdGhlIG9wdGlvbiB0byBoYXZlIHVzIHRocm93IGluc3RlYWQgb2YgZXhpdFxuICAgIGlmIChhcmdzLnRocm93SW5zdGVhZE9mRXhpdCkge1xuICAgICAgdGhyb3dJbnN0ZWFkT2ZFeGl0ID0gdHJ1ZTtcbiAgICAgIC8vIGJ1dCByZW1vdmUgaXQgc2luY2UgaXQncyBub3QgYSByZWFsIHNlcnZlciBhcmcgcGVyIHNlXG4gICAgICBkZWxldGUgYXJncy50aHJvd0luc3RlYWRPZkV4aXQ7XG4gICAgfVxuICB9IGVsc2Uge1xuICAgIC8vIG90aGVyd2lzZSBwYXJzZSBmcm9tIENMSVxuICAgIGFyZ3MgPSBwYXJzZXIucGFyc2VBcmdzKCk7XG4gIH1cbiAgYXdhaXQgbG9nc2lua0luaXQoYXJncyk7XG4gIGF3YWl0IHByZWZsaWdodENoZWNrcyhwYXJzZXIsIGFyZ3MsIHRocm93SW5zdGVhZE9mRXhpdCk7XG4gIGF3YWl0IGxvZ1N0YXJ0dXBJbmZvKHBhcnNlciwgYXJncyk7XG4gIGxldCByb3V0ZXIgPSBnZXRBcHBpdW1Sb3V0ZXIoYXJncyk7XG4gIGxldCBzZXJ2ZXIgPSBhd2FpdCBiYXNlU2VydmVyKHJvdXRlciwgYXJncy5wb3J0LCBhcmdzLmFkZHJlc3MpO1xuICB0cnkge1xuICAgIC8vIFRPRE8gcHJlbGF1bmNoIGlmIGFyZ3MubGF1bmNoIGlzIHNldFxuICAgIC8vIFRPRE86IHN0YXJ0QWxlcnRTb2NrZXQoc2VydmVyLCBhcHBpdW1TZXJ2ZXIpO1xuXG4gICAgLy8gY29uZmlndXJlIGFzIG5vZGUgb24gZ3JpZCwgaWYgbmVjZXNzYXJ5XG4gICAgaWYgKGFyZ3Mubm9kZWNvbmZpZyAhPT0gbnVsbCkge1xuICAgICAgYXdhaXQgcmVnaXN0ZXJOb2RlKGFyZ3Mubm9kZWNvbmZpZywgYXJncy5hZGRyZXNzLCBhcmdzLnBvcnQpO1xuICAgIH1cbiAgfSBjYXRjaCAoZXJyKSB7XG4gICAgYXdhaXQgc2VydmVyLmNsb3NlKCk7XG4gICAgdGhyb3cgZXJyO1xuICB9XG5cbiAgcHJvY2Vzcy5vbmNlKCdTSUdJTlQnLCBhc3luYyBmdW5jdGlvbiAoKSB7XG4gICAgbG9nZ2VyLmluZm8oYFJlY2VpdmVkIFNJR0lOVCAtIHNodXR0aW5nIGRvd25gKTtcbiAgICBhd2FpdCBzZXJ2ZXIuY2xvc2UoKTtcbiAgfSk7XG5cbiAgcHJvY2Vzcy5vbmNlKCdTSUdURVJNJywgYXN5bmMgZnVuY3Rpb24gKCkge1xuICAgIGxvZ2dlci5pbmZvKGBSZWNlaXZlZCBTSUdURVJNIC0gc2h1dHRpbmcgZG93bmApO1xuICAgIGF3YWl0IHNlcnZlci5jbG9zZSgpO1xuICB9KTtcblxuICBsb2dTZXJ2ZXJQb3J0KGFyZ3MuYWRkcmVzcywgYXJncy5wb3J0KTtcblxuICByZXR1cm4gc2VydmVyO1xufVxuXG5pZiAocmVxdWlyZS5tYWluID09PSBtb2R1bGUpIHtcbiAgYXN5bmNpZnkobWFpbik7XG59XG5cbmV4cG9ydCB7IG1haW4gfTtcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4ifQ==
