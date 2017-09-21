'use strict';

var _Object$keys = require('babel-runtime/core-js/object/keys')['default'];

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _getIterator = require('babel-runtime/core-js/get-iterator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _npmlog = require('npmlog');

var _npmlog2 = _interopRequireDefault(_npmlog);

var _winston = require('winston');

var _winston2 = _interopRequireDefault(_winston);

var _appiumSupport = require('appium-support');

require('date-utils');

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

// set up distributed logging before everything else
_appiumSupport.logger.patchLogger(_npmlog2['default']);
global._global_npmlog = _npmlog2['default'];

// npmlog is used only for emitting, we use winston for output
_npmlog2['default'].level = "silent";
var levels = {
  debug: 4,
  info: 3,
  warn: 2,
  error: 1
};

var colors = {
  info: 'cyan',
  debug: 'grey',
  warn: 'yellow',
  error: 'red'
};

var npmToWinstonLevels = {
  silly: 'debug',
  verbose: 'debug',
  debug: 'debug',
  info: 'info',
  http: 'info',
  warn: 'warn',
  error: 'error'
};

var log = null;
var timeZone = null;

function timestamp() {
  var date = new Date();
  if (!timeZone) {
    date = new Date(date.valueOf() + date.getTimezoneOffset() * 60000);
  }
  return date.toFormat("YYYY-MM-DD HH24:MI:SS:LL");
}

// Strip the color marking within messages.
// We need to patch the transports, because the stripColor functionality in
// Winston is wrongly implemented at the logger level, and we want to avoid
// having to create 2 loggers.
function applyStripColorPatch(transport) {
  var _log = transport.log.bind(transport);
  transport.log = function (level, msg, meta, callback) {
    // eslint-disable-line promise/prefer-await-to-callbacks
    var code = /\u001b\[(\d+(;\d+)*)?m/g;
    msg = ('' + msg).replace(code, '');
    _log(level, msg, meta, callback);
  };
}

function _createConsoleTransport(args, logLvl) {
  var transport = new _winston2['default'].transports.Console({
    name: "console",
    timestamp: args.logTimestamp ? timestamp : undefined,
    colorize: !args.logNoColors,
    handleExceptions: true,
    exitOnError: false,
    json: false,
    level: logLvl,
    formatter: function formatter(options) {
      var meta = options.meta && _Object$keys(options.meta).length ? '\n\t' + JSON.stringify(options.meta) : '';
      var timestampPrefix = '';
      if (options.timestamp) {
        timestampPrefix = options.timestamp() + ' - ';
      }
      return '' + timestampPrefix + (options.message || '') + meta;
    }
  });
  if (args.logNoColors) {
    applyStripColorPatch(transport);
  }

  return transport;
}

function _createFileTransport(args, logLvl) {
  var transport = new _winston2['default'].transports.File({
    name: "file",
    timestamp: timestamp,
    filename: args.log,
    maxFiles: 1,
    handleExceptions: true,
    exitOnError: false,
    json: false,
    level: logLvl
  });
  applyStripColorPatch(transport);
  return transport;
}

function _createHttpTransport(args, logLvl) {
  var host = null,
      port = null;

  if (args.webhook.match(':')) {
    var hostAndPort = args.webhook.split(':');
    host = hostAndPort[0];
    port = parseInt(hostAndPort[1], 10);
  }

  var transport = new _winston2['default'].transports.Http({
    name: "http",
    host: host || '127.0.0.1',
    port: port || 9003,
    path: '/',
    handleExceptions: true,
    exitOnError: false,
    json: false,
    level: logLvl
  });
  applyStripColorPatch(transport);
  return transport;
}

function _createTransports(args) {
  var transports, consoleLogLevel, fileLogLevel, lvlPair;
  return _regeneratorRuntime.async(function _createTransports$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        transports = [];
        consoleLogLevel = null;
        fileLogLevel = null;

        if (args.loglevel && args.loglevel.match(":")) {
          lvlPair = args.loglevel.split(':');

          consoleLogLevel = lvlPair[0] || consoleLogLevel;
          fileLogLevel = lvlPair[1] || fileLogLevel;
        } else {
          consoleLogLevel = fileLogLevel = args.loglevel;
        }

        transports.push(_createConsoleTransport(args, consoleLogLevel));

        if (!args.log) {
          context$1$0.next = 18;
          break;
        }

        context$1$0.prev = 6;
        context$1$0.next = 9;
        return _regeneratorRuntime.awrap(_appiumSupport.fs.exists(args.log));

      case 9:
        if (!context$1$0.sent) {
          context$1$0.next = 12;
          break;
        }

        context$1$0.next = 12;
        return _regeneratorRuntime.awrap(_appiumSupport.fs.unlink(args.log));

      case 12:

        transports.push(_createFileTransport(args, fileLogLevel));
        context$1$0.next = 18;
        break;

      case 15:
        context$1$0.prev = 15;
        context$1$0.t0 = context$1$0['catch'](6);

        // eslint-disable-next-line no-console
        console.log('Tried to attach logging to file ' + args.log + ' but an error ' + ('occurred: ' + context$1$0.t0.message));

      case 18:

        if (args.webhook) {
          try {
            transports.push(_createHttpTransport(args, fileLogLevel));
          } catch (e) {
            // eslint-disable-next-line no-console
            console.log('Tried to attach logging to Http at ' + args.webhook + ' but ' + ('an error occurred: ' + e.message));
          }
        }

        return context$1$0.abrupt('return', transports);

      case 20:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[6, 15]]);
}

function init(args) {
  return _regeneratorRuntime.async(function init$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        // set de facto param passed to timestamp function
        timeZone = args.localTimezone;

        // by not adding colors here and not setting 'colorize' in transports
        // when logNoColors === true, console output is fully stripped of color.
        if (!args.logNoColors) {
          _winston2['default'].addColors(colors);
        }

        // clean up in case we have initted before since npmlog is a global
        // object
        clear();

        context$1$0.t0 = _winston2['default'].Logger;
        context$1$0.next = 6;
        return _regeneratorRuntime.awrap(_createTransports(args));

      case 6:
        context$1$0.t1 = context$1$0.sent;
        context$1$0.t2 = {
          transports: context$1$0.t1
        };
        log = new context$1$0.t0(context$1$0.t2);

        // Capture logs emitted via npmlog and pass them through winston
        _npmlog2['default'].on('log', function (logObj) {
          var winstonLevel = npmToWinstonLevels[logObj.level] || 'info';
          var msg = logObj.message;
          if (logObj.prefix) {
            var prefix = '[' + logObj.prefix + ']';
            msg = prefix.magenta + ' ' + msg;
          }
          log[winstonLevel](msg);
          if (args.logHandler && typeof args.logHandler === "function") {
            args.logHandler(logObj.level, msg);
          }
        });

        log.setLevels(levels);

        // 8/19/14 this is a hack to force Winston to print debug messages to stdout rather than stderr.
        // TODO: remove this if winston provides an API for directing streams.
        if (levels[log.transports.console.level] === levels.debug) {
          log.debug = function (msg) {
            log.info('[debug] ' + msg);
          };
        }

      case 12:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}

function clear() {
  if (log) {
    var _iteratorNormalCompletion = true;
    var _didIteratorError = false;
    var _iteratorError = undefined;

    try {
      for (var _iterator = _getIterator(_lodash2['default'].keys(log.transports)), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
        var transport = _step.value;

        log.remove(transport);
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
  _npmlog2['default'].removeAllListeners('log');
}

exports.init = init;
exports.clear = clear;
exports['default'] = init;

// --log-level arg can optionally provide diff logging levels for console and file, separated by a colon

// if we don't delete the log file, winston will always append and it will grow infinitely large;
// winston allows for limiting log file size, but as of 9.2.14 there's a serious bug when using
// maxFiles and maxSize together. https://github.com/flatiron/winston/issues/397
//# sourceMappingURL=data:application/json;charset=utf8;base64,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aW1wb3J0IG5wbWxvZyBmcm9tICducG1sb2cnO1xuaW1wb3J0IHdpbnN0b24gIGZyb20gJ3dpbnN0b24nO1xuaW1wb3J0IHsgZnMsIGxvZ2dlciB9IGZyb20gJ2FwcGl1bS1zdXBwb3J0JztcbmltcG9ydCAnZGF0ZS11dGlscyc7XG5pbXBvcnQgXyBmcm9tICdsb2Rhc2gnO1xuXG5cbi8vIHNldCB1cCBkaXN0cmlidXRlZCBsb2dnaW5nIGJlZm9yZSBldmVyeXRoaW5nIGVsc2VcbmxvZ2dlci5wYXRjaExvZ2dlcihucG1sb2cpO1xuZ2xvYmFsLl9nbG9iYWxfbnBtbG9nID0gbnBtbG9nO1xuXG4vLyBucG1sb2cgaXMgdXNlZCBvbmx5IGZvciBlbWl0dGluZywgd2UgdXNlIHdpbnN0b24gZm9yIG91dHB1dFxubnBtbG9nLmxldmVsID0gXCJzaWxlbnRcIjtcbmNvbnN0IGxldmVscyA9IHtcbiAgZGVidWc6IDQsXG4gIGluZm86IDMsXG4gIHdhcm46IDIsXG4gIGVycm9yOiAxLFxufTtcblxuY29uc3QgY29sb3JzID0ge1xuICBpbmZvOiAnY3lhbicsXG4gIGRlYnVnOiAnZ3JleScsXG4gIHdhcm46ICd5ZWxsb3cnLFxuICBlcnJvcjogJ3JlZCcsXG59O1xuXG5jb25zdCBucG1Ub1dpbnN0b25MZXZlbHMgPSB7XG4gIHNpbGx5OiAnZGVidWcnLFxuICB2ZXJib3NlOiAnZGVidWcnLFxuICBkZWJ1ZzogJ2RlYnVnJyxcbiAgaW5mbzogJ2luZm8nLFxuICBodHRwOiAnaW5mbycsXG4gIHdhcm46ICd3YXJuJyxcbiAgZXJyb3I6ICdlcnJvcicsXG59O1xuXG5sZXQgbG9nID0gbnVsbDtcbmxldCB0aW1lWm9uZSA9IG51bGw7XG5cbmZ1bmN0aW9uIHRpbWVzdGFtcCAoKSB7XG4gIGxldCBkYXRlID0gbmV3IERhdGUoKTtcbiAgaWYgKCF0aW1lWm9uZSkge1xuICAgIGRhdGUgPSBuZXcgRGF0ZShkYXRlLnZhbHVlT2YoKSArIGRhdGUuZ2V0VGltZXpvbmVPZmZzZXQoKSAqIDYwMDAwKTtcbiAgfVxuICByZXR1cm4gZGF0ZS50b0Zvcm1hdChcIllZWVktTU0tREQgSEgyNDpNSTpTUzpMTFwiKTtcbn1cblxuLy8gU3RyaXAgdGhlIGNvbG9yIG1hcmtpbmcgd2l0aGluIG1lc3NhZ2VzLlxuLy8gV2UgbmVlZCB0byBwYXRjaCB0aGUgdHJhbnNwb3J0cywgYmVjYXVzZSB0aGUgc3RyaXBDb2xvciBmdW5jdGlvbmFsaXR5IGluXG4vLyBXaW5zdG9uIGlzIHdyb25nbHkgaW1wbGVtZW50ZWQgYXQgdGhlIGxvZ2dlciBsZXZlbCwgYW5kIHdlIHdhbnQgdG8gYXZvaWRcbi8vIGhhdmluZyB0byBjcmVhdGUgMiBsb2dnZXJzLlxuZnVuY3Rpb24gYXBwbHlTdHJpcENvbG9yUGF0Y2ggKHRyYW5zcG9ydCkge1xuICBsZXQgX2xvZyA9IHRyYW5zcG9ydC5sb2cuYmluZCh0cmFuc3BvcnQpO1xuICB0cmFuc3BvcnQubG9nID0gZnVuY3Rpb24gKGxldmVsLCBtc2csIG1ldGEsIGNhbGxiYWNrKSB7IC8vIGVzbGludC1kaXNhYmxlLWxpbmUgcHJvbWlzZS9wcmVmZXItYXdhaXQtdG8tY2FsbGJhY2tzXG4gICAgbGV0IGNvZGUgPSAvXFx1MDAxYlxcWyhcXGQrKDtcXGQrKSopP20vZztcbiAgICBtc2cgPSAoJycgKyBtc2cpLnJlcGxhY2UoY29kZSwgJycpO1xuICAgIF9sb2cobGV2ZWwsIG1zZywgbWV0YSwgY2FsbGJhY2spO1xuICB9O1xufVxuXG5mdW5jdGlvbiBfY3JlYXRlQ29uc29sZVRyYW5zcG9ydCAoYXJncywgbG9nTHZsKSB7XG4gIGxldCB0cmFuc3BvcnQgPSBuZXcgKHdpbnN0b24udHJhbnNwb3J0cy5Db25zb2xlKSh7XG4gICAgbmFtZTogXCJjb25zb2xlXCIsXG4gICAgdGltZXN0YW1wOiBhcmdzLmxvZ1RpbWVzdGFtcCA/IHRpbWVzdGFtcCA6IHVuZGVmaW5lZCxcbiAgICBjb2xvcml6ZTogIWFyZ3MubG9nTm9Db2xvcnMsXG4gICAgaGFuZGxlRXhjZXB0aW9uczogdHJ1ZSxcbiAgICBleGl0T25FcnJvcjogZmFsc2UsXG4gICAganNvbjogZmFsc2UsXG4gICAgbGV2ZWw6IGxvZ0x2bCxcbiAgICBmb3JtYXR0ZXIgKG9wdGlvbnMpIHtcbiAgICAgIGxldCBtZXRhID0gb3B0aW9ucy5tZXRhICYmIE9iamVjdC5rZXlzKG9wdGlvbnMubWV0YSkubGVuZ3RoID8gYFxcblxcdCR7SlNPTi5zdHJpbmdpZnkob3B0aW9ucy5tZXRhKX1gIDogJyc7XG4gICAgICBsZXQgdGltZXN0YW1wUHJlZml4ID0gJyc7XG4gICAgICBpZiAob3B0aW9ucy50aW1lc3RhbXApIHtcbiAgICAgICAgdGltZXN0YW1wUHJlZml4ID0gYCR7b3B0aW9ucy50aW1lc3RhbXAoKX0gLSBgO1xuICAgICAgfVxuICAgICAgcmV0dXJuIGAke3RpbWVzdGFtcFByZWZpeH0ke29wdGlvbnMubWVzc2FnZSB8fCAnJ30ke21ldGF9YDtcbiAgICB9XG4gIH0pO1xuICBpZiAoYXJncy5sb2dOb0NvbG9ycykge1xuICAgIGFwcGx5U3RyaXBDb2xvclBhdGNoKHRyYW5zcG9ydCk7XG4gIH1cblxuICByZXR1cm4gdHJhbnNwb3J0O1xufVxuXG5mdW5jdGlvbiBfY3JlYXRlRmlsZVRyYW5zcG9ydCAoYXJncywgbG9nTHZsKSB7XG4gIGxldCB0cmFuc3BvcnQgPSBuZXcgKHdpbnN0b24udHJhbnNwb3J0cy5GaWxlKSh7XG4gICAgbmFtZTogXCJmaWxlXCIsXG4gICAgdGltZXN0YW1wLFxuICAgIGZpbGVuYW1lOiBhcmdzLmxvZyxcbiAgICBtYXhGaWxlczogMSxcbiAgICBoYW5kbGVFeGNlcHRpb25zOiB0cnVlLFxuICAgIGV4aXRPbkVycm9yOiBmYWxzZSxcbiAgICBqc29uOiBmYWxzZSxcbiAgICBsZXZlbDogbG9nTHZsLFxuICB9KTtcbiAgYXBwbHlTdHJpcENvbG9yUGF0Y2godHJhbnNwb3J0KTtcbiAgcmV0dXJuIHRyYW5zcG9ydDtcbn1cblxuZnVuY3Rpb24gX2NyZWF0ZUh0dHBUcmFuc3BvcnQgKGFyZ3MsIGxvZ0x2bCkge1xuICBsZXQgaG9zdCA9IG51bGwsXG4gICAgICBwb3J0ID0gbnVsbDtcblxuICBpZiAoYXJncy53ZWJob29rLm1hdGNoKCc6JykpIHtcbiAgICBsZXQgaG9zdEFuZFBvcnQgPSBhcmdzLndlYmhvb2suc3BsaXQoJzonKTtcbiAgICBob3N0ID0gaG9zdEFuZFBvcnRbMF07XG4gICAgcG9ydCA9IHBhcnNlSW50KGhvc3RBbmRQb3J0WzFdLCAxMCk7XG4gIH1cblxuICBsZXQgdHJhbnNwb3J0ID0gbmV3ICh3aW5zdG9uLnRyYW5zcG9ydHMuSHR0cCkoe1xuICAgIG5hbWU6IFwiaHR0cFwiLFxuICAgIGhvc3Q6IGhvc3QgfHwgJzEyNy4wLjAuMScsXG4gICAgcG9ydDogcG9ydCB8fCA5MDAzLFxuICAgIHBhdGg6ICcvJyxcbiAgICBoYW5kbGVFeGNlcHRpb25zOiB0cnVlLFxuICAgIGV4aXRPbkVycm9yOiBmYWxzZSxcbiAgICBqc29uOiBmYWxzZSxcbiAgICBsZXZlbDogbG9nTHZsLFxuICB9KTtcbiAgYXBwbHlTdHJpcENvbG9yUGF0Y2godHJhbnNwb3J0KTtcbiAgcmV0dXJuIHRyYW5zcG9ydDtcbn1cblxuYXN5bmMgZnVuY3Rpb24gX2NyZWF0ZVRyYW5zcG9ydHMgKGFyZ3MpIHtcbiAgbGV0IHRyYW5zcG9ydHMgPSBbXTtcbiAgbGV0IGNvbnNvbGVMb2dMZXZlbCA9IG51bGw7XG4gIGxldCBmaWxlTG9nTGV2ZWwgPSBudWxsO1xuXG4gIGlmIChhcmdzLmxvZ2xldmVsICYmIGFyZ3MubG9nbGV2ZWwubWF0Y2goXCI6XCIpKSB7XG4gICAgLy8gLS1sb2ctbGV2ZWwgYXJnIGNhbiBvcHRpb25hbGx5IHByb3ZpZGUgZGlmZiBsb2dnaW5nIGxldmVscyBmb3IgY29uc29sZSBhbmQgZmlsZSwgc2VwYXJhdGVkIGJ5IGEgY29sb25cbiAgICBsZXQgbHZsUGFpciA9IGFyZ3MubG9nbGV2ZWwuc3BsaXQoJzonKTtcbiAgICBjb25zb2xlTG9nTGV2ZWwgPSAgbHZsUGFpclswXSB8fCBjb25zb2xlTG9nTGV2ZWw7XG4gICAgZmlsZUxvZ0xldmVsID0gbHZsUGFpclsxXSB8fCBmaWxlTG9nTGV2ZWw7XG4gIH0gZWxzZSB7XG4gICAgY29uc29sZUxvZ0xldmVsID0gZmlsZUxvZ0xldmVsID0gYXJncy5sb2dsZXZlbDtcbiAgfVxuXG4gIHRyYW5zcG9ydHMucHVzaChfY3JlYXRlQ29uc29sZVRyYW5zcG9ydChhcmdzLCBjb25zb2xlTG9nTGV2ZWwpKTtcblxuICBpZiAoYXJncy5sb2cpIHtcbiAgICB0cnkge1xuICAgICAgLy8gaWYgd2UgZG9uJ3QgZGVsZXRlIHRoZSBsb2cgZmlsZSwgd2luc3RvbiB3aWxsIGFsd2F5cyBhcHBlbmQgYW5kIGl0IHdpbGwgZ3JvdyBpbmZpbml0ZWx5IGxhcmdlO1xuICAgICAgLy8gd2luc3RvbiBhbGxvd3MgZm9yIGxpbWl0aW5nIGxvZyBmaWxlIHNpemUsIGJ1dCBhcyBvZiA5LjIuMTQgdGhlcmUncyBhIHNlcmlvdXMgYnVnIHdoZW4gdXNpbmdcbiAgICAgIC8vIG1heEZpbGVzIGFuZCBtYXhTaXplIHRvZ2V0aGVyLiBodHRwczovL2dpdGh1Yi5jb20vZmxhdGlyb24vd2luc3Rvbi9pc3N1ZXMvMzk3XG4gICAgICBpZiAoYXdhaXQgZnMuZXhpc3RzKGFyZ3MubG9nKSkge1xuICAgICAgICBhd2FpdCBmcy51bmxpbmsoYXJncy5sb2cpO1xuICAgICAgfVxuXG4gICAgICB0cmFuc3BvcnRzLnB1c2goX2NyZWF0ZUZpbGVUcmFuc3BvcnQoYXJncywgZmlsZUxvZ0xldmVsKSk7XG4gICAgfSBjYXRjaCAoZSkge1xuICAgICAgLy8gZXNsaW50LWRpc2FibGUtbmV4dC1saW5lIG5vLWNvbnNvbGVcbiAgICAgIGNvbnNvbGUubG9nKGBUcmllZCB0byBhdHRhY2ggbG9nZ2luZyB0byBmaWxlICR7YXJncy5sb2d9IGJ1dCBhbiBlcnJvciBgICtcbiAgICAgICAgICAgICAgICAgIGBvY2N1cnJlZDogJHtlLm1lc3NhZ2V9YCk7XG4gICAgfVxuICB9XG5cbiAgaWYgKGFyZ3Mud2ViaG9vaykge1xuICAgIHRyeSB7XG4gICAgICB0cmFuc3BvcnRzLnB1c2goX2NyZWF0ZUh0dHBUcmFuc3BvcnQoYXJncywgZmlsZUxvZ0xldmVsKSk7XG4gICAgfSBjYXRjaCAoZSkge1xuICAgICAgLy8gZXNsaW50LWRpc2FibGUtbmV4dC1saW5lIG5vLWNvbnNvbGVcbiAgICAgIGNvbnNvbGUubG9nKGBUcmllZCB0byBhdHRhY2ggbG9nZ2luZyB0byBIdHRwIGF0ICR7YXJncy53ZWJob29rfSBidXQgYCArXG4gICAgICAgICAgICAgICAgICBgYW4gZXJyb3Igb2NjdXJyZWQ6ICR7ZS5tZXNzYWdlfWApO1xuICAgIH1cbiAgfVxuXG4gIHJldHVybiB0cmFuc3BvcnRzO1xufVxuXG5hc3luYyBmdW5jdGlvbiBpbml0IChhcmdzKSB7XG4gIC8vIHNldCBkZSBmYWN0byBwYXJhbSBwYXNzZWQgdG8gdGltZXN0YW1wIGZ1bmN0aW9uXG4gIHRpbWVab25lID0gYXJncy5sb2NhbFRpbWV6b25lO1xuXG4gIC8vIGJ5IG5vdCBhZGRpbmcgY29sb3JzIGhlcmUgYW5kIG5vdCBzZXR0aW5nICdjb2xvcml6ZScgaW4gdHJhbnNwb3J0c1xuICAvLyB3aGVuIGxvZ05vQ29sb3JzID09PSB0cnVlLCBjb25zb2xlIG91dHB1dCBpcyBmdWxseSBzdHJpcHBlZCBvZiBjb2xvci5cbiAgaWYgKCFhcmdzLmxvZ05vQ29sb3JzKSB7XG4gICAgd2luc3Rvbi5hZGRDb2xvcnMoY29sb3JzKTtcbiAgfVxuXG4gIC8vIGNsZWFuIHVwIGluIGNhc2Ugd2UgaGF2ZSBpbml0dGVkIGJlZm9yZSBzaW5jZSBucG1sb2cgaXMgYSBnbG9iYWxcbiAgLy8gb2JqZWN0XG4gIGNsZWFyKCk7XG5cbiAgbG9nID0gbmV3ICh3aW5zdG9uLkxvZ2dlcikoe1xuICAgIHRyYW5zcG9ydHM6IGF3YWl0IF9jcmVhdGVUcmFuc3BvcnRzKGFyZ3MpXG4gIH0pO1xuXG4gIC8vIENhcHR1cmUgbG9ncyBlbWl0dGVkIHZpYSBucG1sb2cgYW5kIHBhc3MgdGhlbSB0aHJvdWdoIHdpbnN0b25cbiAgbnBtbG9nLm9uKCdsb2cnLCAobG9nT2JqKSA9PiB7XG4gICAgbGV0IHdpbnN0b25MZXZlbCA9IG5wbVRvV2luc3RvbkxldmVsc1tsb2dPYmoubGV2ZWxdIHx8ICdpbmZvJztcbiAgICBsZXQgbXNnID0gbG9nT2JqLm1lc3NhZ2U7XG4gICAgaWYgKGxvZ09iai5wcmVmaXgpIHtcbiAgICAgIGxldCBwcmVmaXggPSBgWyR7bG9nT2JqLnByZWZpeH1dYDtcbiAgICAgIG1zZyA9IGAke3ByZWZpeC5tYWdlbnRhfSAke21zZ31gO1xuICAgIH1cbiAgICBsb2dbd2luc3RvbkxldmVsXShtc2cpO1xuICAgIGlmIChhcmdzLmxvZ0hhbmRsZXIgJiYgdHlwZW9mIGFyZ3MubG9nSGFuZGxlciA9PT0gXCJmdW5jdGlvblwiKSB7XG4gICAgICBhcmdzLmxvZ0hhbmRsZXIobG9nT2JqLmxldmVsLCBtc2cpO1xuICAgIH1cblxuICB9KTtcblxuXG4gIGxvZy5zZXRMZXZlbHMobGV2ZWxzKTtcblxuICAvLyA4LzE5LzE0IHRoaXMgaXMgYSBoYWNrIHRvIGZvcmNlIFdpbnN0b24gdG8gcHJpbnQgZGVidWcgbWVzc2FnZXMgdG8gc3Rkb3V0IHJhdGhlciB0aGFuIHN0ZGVyci5cbiAgLy8gVE9ETzogcmVtb3ZlIHRoaXMgaWYgd2luc3RvbiBwcm92aWRlcyBhbiBBUEkgZm9yIGRpcmVjdGluZyBzdHJlYW1zLlxuICBpZiAobGV2ZWxzW2xvZy50cmFuc3BvcnRzLmNvbnNvbGUubGV2ZWxdID09PSBsZXZlbHMuZGVidWcpIHtcbiAgICBsb2cuZGVidWcgPSBmdW5jdGlvbiAobXNnKSB7XG4gICAgICBsb2cuaW5mbygnW2RlYnVnXSAnICsgbXNnKTtcbiAgICB9O1xuICB9XG59XG5cbmZ1bmN0aW9uIGNsZWFyICgpIHtcbiAgaWYgKGxvZykge1xuICAgIGZvciAobGV0IHRyYW5zcG9ydCBvZiBfLmtleXMobG9nLnRyYW5zcG9ydHMpKSB7XG4gICAgICBsb2cucmVtb3ZlKHRyYW5zcG9ydCk7XG4gICAgfVxuICB9XG4gIG5wbWxvZy5yZW1vdmVBbGxMaXN0ZW5lcnMoJ2xvZycpO1xufVxuXG5cbmV4cG9ydCB7IGluaXQsIGNsZWFyIH07XG5leHBvcnQgZGVmYXVsdCBpbml0O1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLiJ9
