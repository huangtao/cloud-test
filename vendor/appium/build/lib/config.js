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

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _appiumSupport = require('appium-support');

var _teen_process = require('teen_process');

var _logger = require('./logger');

var _logger2 = _interopRequireDefault(_logger);

var _packageJson = require('../../package.json');

var _packageJson2 = _interopRequireDefault(_packageJson);

// eslint-disable-line import/no-unresolved

var APPIUM_VER = _packageJson2['default'].version;

function getNodeVersion() {
  // expect v<major>.<minor>.<patch>
  // we will pull out `major` and `minor`
  var version = process.version.match(/^v(\d+)\.(\d+)/);
  return [Number(version[1]), Number(version[2])];
}

function getGitRev() {
  var cwd, rev, _ref, stdout;

  return _regeneratorRuntime.async(function getGitRev$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        cwd = _path2['default'].resolve(__dirname, "..", "..");
        rev = null;
        context$1$0.prev = 2;
        context$1$0.next = 5;
        return _regeneratorRuntime.awrap((0, _teen_process.exec)("git", ["rev-parse", "HEAD"], { cwd: cwd }));

      case 5:
        _ref = context$1$0.sent;
        stdout = _ref.stdout;

        rev = stdout.trim();
        context$1$0.next = 12;
        break;

      case 10:
        context$1$0.prev = 10;
        context$1$0.t0 = context$1$0['catch'](2);

      case 12:
        return context$1$0.abrupt('return', rev);

      case 13:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[2, 10]]);
}

function getAppiumConfig() {
  var stat, built, config;
  return _regeneratorRuntime.async(function getAppiumConfig$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(_appiumSupport.fs.stat(_path2['default'].resolve(__dirname, '..')));

      case 2:
        stat = context$1$0.sent;
        built = stat.mtime.getTime();
        context$1$0.next = 6;
        return _regeneratorRuntime.awrap(getGitRev());

      case 6:
        context$1$0.t0 = context$1$0.sent;
        context$1$0.t1 = built;
        context$1$0.t2 = APPIUM_VER;
        config = {
          'git-sha': context$1$0.t0,
          built: context$1$0.t1,
          version: context$1$0.t2
        };
        return context$1$0.abrupt('return', config);

      case 11:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}

function checkNodeOk() {
  var _getNodeVersion = getNodeVersion();

  var _getNodeVersion2 = _slicedToArray(_getNodeVersion, 2);

  var major = _getNodeVersion2[0];
  var minor = _getNodeVersion2[1];

  if (major < 4) {
    var msg = 'Node version must be >= 4. Currently ' + major + '.' + minor;
    _logger2['default'].errorAndThrow(msg);
  }
}

function warnNodeDeprecations() {
  var _getNodeVersion3 = getNodeVersion();

  var _getNodeVersion32 = _slicedToArray(_getNodeVersion3, 1);

  var major = _getNodeVersion32[0];

  if (major < 4) {
    _logger2['default'].warn("Appium support for versions of node < 4 has been " + "deprecated and will be removed in a future version. Please " + "upgrade!");
  }
}

function showConfig() {
  var config;
  return _regeneratorRuntime.async(function showConfig$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(getAppiumConfig());

      case 2:
        config = context$1$0.sent;

        console.log(JSON.stringify(config)); // eslint-disable-line no-console

      case 4:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}

function getNonDefaultArgs(parser, args) {
  var nonDefaults = {};
  var _iteratorNormalCompletion = true;
  var _didIteratorError = false;
  var _iteratorError = undefined;

  try {
    for (var _iterator = _getIterator(parser.rawArgs), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
      var rawArg = _step.value;

      var arg = rawArg[1].dest;
      if (args[arg] && args[arg] !== rawArg[1].defaultValue) {
        nonDefaults[arg] = args[arg];
      }
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

  return nonDefaults;
}

function getDeprecatedArgs(parser, args) {
  // go through the server command line arguments and figure
  // out which of the ones used are deprecated
  var deprecated = {};
  var _iteratorNormalCompletion2 = true;
  var _didIteratorError2 = false;
  var _iteratorError2 = undefined;

  try {
    for (var _iterator2 = _getIterator(parser.rawArgs), _step2; !(_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done); _iteratorNormalCompletion2 = true) {
      var rawArg = _step2.value;

      var arg = rawArg[1].dest;
      var defaultValue = rawArg[1].defaultValue;
      var isDeprecated = !!rawArg[1].deprecatedFor;
      if (args[arg] && args[arg] !== defaultValue && isDeprecated) {
        deprecated[rawArg[0]] = rawArg[1].deprecatedFor;
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

  return deprecated;
}

function checkValidPort(port, portName) {
  if (port > 0 && port < 65536) return true;
  _logger2['default'].error('Port \'' + portName + '\' must be greater than 0 and less than 65536. Currently ' + port);
  return false;
}

function validateServerArgs(parser, args) {
  // arguments that cannot both be set
  var exclusives = [['noReset', 'fullReset'], ['ipa', 'safari'], ['app', 'safari'], ['forceIphone', 'forceIpad'], ['deviceName', 'defaultDevice']];

  var _iteratorNormalCompletion3 = true;
  var _didIteratorError3 = false;
  var _iteratorError3 = undefined;

  try {
    for (var _iterator3 = _getIterator(exclusives), _step3; !(_iteratorNormalCompletion3 = (_step3 = _iterator3.next()).done); _iteratorNormalCompletion3 = true) {
      var exSet = _step3.value;

      var numFoundInArgs = 0;
      var _iteratorNormalCompletion5 = true;
      var _didIteratorError5 = false;
      var _iteratorError5 = undefined;

      try {
        for (var _iterator5 = _getIterator(exSet), _step5; !(_iteratorNormalCompletion5 = (_step5 = _iterator5.next()).done); _iteratorNormalCompletion5 = true) {
          var opt = _step5.value;

          if (_lodash2['default'].has(args, opt) && args[opt]) {
            numFoundInArgs++;
          }
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

      if (numFoundInArgs > 1) {
        throw new Error('You can\'t pass in more than one argument from the ' + ('set ' + JSON.stringify(exSet) + ', since they are ') + 'mutually exclusive');
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

  var validations = {
    port: checkValidPort,
    callbackPort: checkValidPort,
    bootstrapPort: checkValidPort,
    selendroidPort: checkValidPort,
    chromedriverPort: checkValidPort,
    robotPort: checkValidPort,
    backendRetries: function backendRetries(r) {
      return r >= 0;
    }
  };

  var nonDefaultArgs = getNonDefaultArgs(parser, args);

  var _iteratorNormalCompletion4 = true;
  var _didIteratorError4 = false;
  var _iteratorError4 = undefined;

  try {
    for (var _iterator4 = _getIterator(_lodash2['default'].toPairs(validations)), _step4; !(_iteratorNormalCompletion4 = (_step4 = _iterator4.next()).done); _iteratorNormalCompletion4 = true) {
      var _step4$value = _slicedToArray(_step4.value, 2);

      var arg = _step4$value[0];
      var validator = _step4$value[1];

      if (_lodash2['default'].has(nonDefaultArgs, arg)) {
        if (!validator(args[arg], arg)) {
          throw new Error('Invalid argument for param ' + arg + ': ' + args[arg]);
        }
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
}

function validateTmpDir(tmpDir) {
  return _regeneratorRuntime.async(function validateTmpDir$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.prev = 0;
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap((0, _appiumSupport.mkdirp)(tmpDir));

      case 3:
        context$1$0.next = 8;
        break;

      case 5:
        context$1$0.prev = 5;
        context$1$0.t0 = context$1$0['catch'](0);
        throw new Error('We could not ensure that the temp dir you specified ' + ('(' + tmpDir + ') exists. Please make sure it\'s writeable.'));

      case 8:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[0, 5]]);
}

exports.getAppiumConfig = getAppiumConfig;
exports.validateServerArgs = validateServerArgs;
exports.checkNodeOk = checkNodeOk;
exports.showConfig = showConfig;
exports.warnNodeDeprecations = warnNodeDeprecations;
exports.validateTmpDir = validateTmpDir;
exports.getNonDefaultArgs = getNonDefaultArgs;
exports.getDeprecatedArgs = getDeprecatedArgs;
exports.getGitRev = getGitRev;
exports.checkValidPort = checkValidPort;
exports.APPIUM_VER = APPIUM_VER;
//# sourceMappingURL=data:application/json;charset=utf8;base64,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QUMsU0FBUyxDQUFDLElBQUksQ0FBQyxHQUFHLENBQUMsRUFBRSxHQUFHLENBQUMsRUFBRTtBQUM5QixnQkFBTSxJQUFJLEtBQUssaUNBQStCLEdBQUcsVUFBSyxJQUFJLENBQUMsR0FBRyxDQUFDLENBQUcsQ0FBQztTQUNwRTtPQUNGO0tBQ0Y7Ozs7Ozs7Ozs7Ozs7OztDQUNGOztBQUVELFNBQWUsY0FBYyxDQUFFLE1BQU07Ozs7Ozt5Q0FFM0IsMkJBQU8sTUFBTSxDQUFDOzs7Ozs7Ozs7Y0FFZCxJQUFJLEtBQUssQ0FBQyxnRUFDSSxNQUFNLGlEQUE0QyxDQUFDOzs7Ozs7O0NBRTFFOztRQUVRLGVBQWUsR0FBZixlQUFlO1FBQUUsa0JBQWtCLEdBQWxCLGtCQUFrQjtRQUFFLFdBQVcsR0FBWCxXQUFXO1FBQUUsVUFBVSxHQUFWLFVBQVU7UUFDNUQsb0JBQW9CLEdBQXBCLG9CQUFvQjtRQUFFLGNBQWMsR0FBZCxjQUFjO1FBQUUsaUJBQWlCLEdBQWpCLGlCQUFpQjtRQUN2RCxpQkFBaUIsR0FBakIsaUJBQWlCO1FBQUUsU0FBUyxHQUFULFNBQVM7UUFBRSxjQUFjLEdBQWQsY0FBYztRQUFFLFVBQVUsR0FBVixVQUFVIiwiZmlsZSI6ImxpYi9jb25maWcuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgXyBmcm9tICdsb2Rhc2gnO1xuaW1wb3J0IHBhdGggZnJvbSAncGF0aCc7XG5pbXBvcnQgeyBta2RpcnAsIGZzIH0gZnJvbSAnYXBwaXVtLXN1cHBvcnQnO1xuaW1wb3J0IHsgZXhlYyB9IGZyb20gJ3RlZW5fcHJvY2Vzcyc7XG5pbXBvcnQgbG9nZ2VyIGZyb20gJy4vbG9nZ2VyJztcbmltcG9ydCBwa2dPYmogZnJvbSAnLi4vLi4vcGFja2FnZS5qc29uJzsgLy8gZXNsaW50LWRpc2FibGUtbGluZSBpbXBvcnQvbm8tdW5yZXNvbHZlZFxuXG5cbmNvbnN0IEFQUElVTV9WRVIgPSBwa2dPYmoudmVyc2lvbjtcblxuZnVuY3Rpb24gZ2V0Tm9kZVZlcnNpb24gKCkge1xuICAvLyBleHBlY3QgdjxtYWpvcj4uPG1pbm9yPi48cGF0Y2g+XG4gIC8vIHdlIHdpbGwgcHVsbCBvdXQgYG1ham9yYCBhbmQgYG1pbm9yYFxuICBsZXQgdmVyc2lvbiA9IHByb2Nlc3MudmVyc2lvbi5tYXRjaCgvXnYoXFxkKylcXC4oXFxkKykvKTtcbiAgcmV0dXJuIFtOdW1iZXIodmVyc2lvblsxXSksIE51bWJlcih2ZXJzaW9uWzJdKV07XG59XG5cbmFzeW5jIGZ1bmN0aW9uIGdldEdpdFJldiAoKSB7XG4gIGxldCBjd2QgPSBwYXRoLnJlc29sdmUoX19kaXJuYW1lLCBcIi4uXCIsIFwiLi5cIik7XG4gIGxldCByZXYgPSBudWxsO1xuICB0cnkge1xuICAgIGxldCB7c3Rkb3V0fSA9IGF3YWl0IGV4ZWMoXCJnaXRcIiwgW1wicmV2LXBhcnNlXCIsIFwiSEVBRFwiXSwge2N3ZH0pO1xuICAgIHJldiA9IHN0ZG91dC50cmltKCk7XG4gIH0gY2F0Y2ggKGlnbikge31cbiAgcmV0dXJuIHJldjtcbn1cblxuYXN5bmMgZnVuY3Rpb24gZ2V0QXBwaXVtQ29uZmlnICgpIHtcbiAgbGV0IHN0YXQgPSBhd2FpdCBmcy5zdGF0KHBhdGgucmVzb2x2ZShfX2Rpcm5hbWUsICcuLicpKTtcbiAgbGV0IGJ1aWx0ID0gc3RhdC5tdGltZS5nZXRUaW1lKCk7XG4gIGxldCBjb25maWcgPSB7XG4gICAgJ2dpdC1zaGEnOiBhd2FpdCBnZXRHaXRSZXYoKSxcbiAgICBidWlsdCxcbiAgICB2ZXJzaW9uOiBBUFBJVU1fVkVSLFxuICB9O1xuICByZXR1cm4gY29uZmlnO1xufVxuXG5mdW5jdGlvbiBjaGVja05vZGVPayAoKSB7XG4gIGxldCBbbWFqb3IsIG1pbm9yXSA9IGdldE5vZGVWZXJzaW9uKCk7XG4gIGlmIChtYWpvciA8IDQpIHtcbiAgICBsZXQgbXNnID0gYE5vZGUgdmVyc2lvbiBtdXN0IGJlID49IDQuIEN1cnJlbnRseSAke21ham9yfS4ke21pbm9yfWA7XG4gICAgbG9nZ2VyLmVycm9yQW5kVGhyb3cobXNnKTtcbiAgfVxufVxuXG5mdW5jdGlvbiB3YXJuTm9kZURlcHJlY2F0aW9ucyAoKSB7XG4gIGxldCBbbWFqb3JdID0gZ2V0Tm9kZVZlcnNpb24oKTtcbiAgaWYgKG1ham9yIDwgNCkge1xuICAgIGxvZ2dlci53YXJuKFwiQXBwaXVtIHN1cHBvcnQgZm9yIHZlcnNpb25zIG9mIG5vZGUgPCA0IGhhcyBiZWVuIFwiICtcbiAgICAgICAgICAgICAgICBcImRlcHJlY2F0ZWQgYW5kIHdpbGwgYmUgcmVtb3ZlZCBpbiBhIGZ1dHVyZSB2ZXJzaW9uLiBQbGVhc2UgXCIgK1xuICAgICAgICAgICAgICAgIFwidXBncmFkZSFcIik7XG4gIH1cbn1cblxuYXN5bmMgZnVuY3Rpb24gc2hvd0NvbmZpZyAoKSB7XG4gIGxldCBjb25maWcgPSBhd2FpdCBnZXRBcHBpdW1Db25maWcoKTtcbiAgY29uc29sZS5sb2coSlNPTi5zdHJpbmdpZnkoY29uZmlnKSk7IC8vIGVzbGludC1kaXNhYmxlLWxpbmUgbm8tY29uc29sZVxufVxuXG5mdW5jdGlvbiBnZXROb25EZWZhdWx0QXJncyAocGFyc2VyLCBhcmdzKSB7XG4gIGxldCBub25EZWZhdWx0cyA9IHt9O1xuICBmb3IgKGxldCByYXdBcmcgb2YgcGFyc2VyLnJhd0FyZ3MpIHtcbiAgICBsZXQgYXJnID0gcmF3QXJnWzFdLmRlc3Q7XG4gICAgaWYgKGFyZ3NbYXJnXSAmJiBhcmdzW2FyZ10gIT09IHJhd0FyZ1sxXS5kZWZhdWx0VmFsdWUpIHtcbiAgICAgIG5vbkRlZmF1bHRzW2FyZ10gPSBhcmdzW2FyZ107XG4gICAgfVxuICB9XG4gIHJldHVybiBub25EZWZhdWx0cztcbn1cblxuZnVuY3Rpb24gZ2V0RGVwcmVjYXRlZEFyZ3MgKHBhcnNlciwgYXJncykge1xuICAvLyBnbyB0aHJvdWdoIHRoZSBzZXJ2ZXIgY29tbWFuZCBsaW5lIGFyZ3VtZW50cyBhbmQgZmlndXJlXG4gIC8vIG91dCB3aGljaCBvZiB0aGUgb25lcyB1c2VkIGFyZSBkZXByZWNhdGVkXG4gIGxldCBkZXByZWNhdGVkID0ge307XG4gIGZvciAobGV0IHJhd0FyZyBvZiBwYXJzZXIucmF3QXJncykge1xuICAgIGxldCBhcmcgPSByYXdBcmdbMV0uZGVzdDtcbiAgICBsZXQgZGVmYXVsdFZhbHVlID0gcmF3QXJnWzFdLmRlZmF1bHRWYWx1ZTtcbiAgICBsZXQgaXNEZXByZWNhdGVkID0gISFyYXdBcmdbMV0uZGVwcmVjYXRlZEZvcjtcbiAgICBpZiAoYXJnc1thcmddICYmIGFyZ3NbYXJnXSAhPT0gZGVmYXVsdFZhbHVlICYmIGlzRGVwcmVjYXRlZCkge1xuICAgICAgZGVwcmVjYXRlZFtyYXdBcmdbMF1dID0gcmF3QXJnWzFdLmRlcHJlY2F0ZWRGb3I7XG4gICAgfVxuICB9XG4gIHJldHVybiBkZXByZWNhdGVkO1xufVxuXG5mdW5jdGlvbiBjaGVja1ZhbGlkUG9ydCAocG9ydCwgcG9ydE5hbWUpIHtcbiAgaWYgKHBvcnQgPiAwICYmIHBvcnQgPCA2NTUzNikgcmV0dXJuIHRydWU7XG4gIGxvZ2dlci5lcnJvcihgUG9ydCAnJHtwb3J0TmFtZX0nIG11c3QgYmUgZ3JlYXRlciB0aGFuIDAgYW5kIGxlc3MgdGhhbiA2NTUzNi4gQ3VycmVudGx5ICR7cG9ydH1gKTtcbiAgcmV0dXJuIGZhbHNlO1xufVxuXG5mdW5jdGlvbiB2YWxpZGF0ZVNlcnZlckFyZ3MgKHBhcnNlciwgYXJncykge1xuICAvLyBhcmd1bWVudHMgdGhhdCBjYW5ub3QgYm90aCBiZSBzZXRcbiAgbGV0IGV4Y2x1c2l2ZXMgPSBbXG4gICAgWydub1Jlc2V0JywgJ2Z1bGxSZXNldCddLFxuICAgIFsnaXBhJywgJ3NhZmFyaSddLFxuICAgIFsnYXBwJywgJ3NhZmFyaSddLFxuICAgIFsnZm9yY2VJcGhvbmUnLCAnZm9yY2VJcGFkJ10sXG4gICAgWydkZXZpY2VOYW1lJywgJ2RlZmF1bHREZXZpY2UnXVxuICBdO1xuXG4gIGZvciAobGV0IGV4U2V0IG9mIGV4Y2x1c2l2ZXMpIHtcbiAgICBsZXQgbnVtRm91bmRJbkFyZ3MgPSAwO1xuICAgIGZvciAobGV0IG9wdCBvZiBleFNldCkge1xuICAgICAgaWYgKF8uaGFzKGFyZ3MsIG9wdCkgJiYgYXJnc1tvcHRdKSB7XG4gICAgICAgIG51bUZvdW5kSW5BcmdzKys7XG4gICAgICB9XG4gICAgfVxuICAgIGlmIChudW1Gb3VuZEluQXJncyA+IDEpIHtcbiAgICAgIHRocm93IG5ldyBFcnJvcihgWW91IGNhbid0IHBhc3MgaW4gbW9yZSB0aGFuIG9uZSBhcmd1bWVudCBmcm9tIHRoZSBgICtcbiAgICAgICAgICAgICAgICAgICAgICBgc2V0ICR7SlNPTi5zdHJpbmdpZnkoZXhTZXQpfSwgc2luY2UgdGhleSBhcmUgYCArXG4gICAgICAgICAgICAgICAgICAgICAgYG11dHVhbGx5IGV4Y2x1c2l2ZWApO1xuICAgIH1cbiAgfVxuXG4gIGNvbnN0IHZhbGlkYXRpb25zID0ge1xuICAgIHBvcnQ6IGNoZWNrVmFsaWRQb3J0LFxuICAgIGNhbGxiYWNrUG9ydDogY2hlY2tWYWxpZFBvcnQsXG4gICAgYm9vdHN0cmFwUG9ydDogY2hlY2tWYWxpZFBvcnQsXG4gICAgc2VsZW5kcm9pZFBvcnQ6IGNoZWNrVmFsaWRQb3J0LFxuICAgIGNocm9tZWRyaXZlclBvcnQ6IGNoZWNrVmFsaWRQb3J0LFxuICAgIHJvYm90UG9ydDogY2hlY2tWYWxpZFBvcnQsXG4gICAgYmFja2VuZFJldHJpZXM6IChyKSA9PiB7IHJldHVybiByID49IDA7IH1cbiAgfTtcblxuICBjb25zdCBub25EZWZhdWx0QXJncyA9IGdldE5vbkRlZmF1bHRBcmdzKHBhcnNlciwgYXJncyk7XG5cbiAgZm9yIChsZXQgW2FyZywgdmFsaWRhdG9yXSBvZiBfLnRvUGFpcnModmFsaWRhdGlvbnMpKSB7XG4gICAgaWYgKF8uaGFzKG5vbkRlZmF1bHRBcmdzLCBhcmcpKSB7XG4gICAgICBpZiAoIXZhbGlkYXRvcihhcmdzW2FyZ10sIGFyZykpIHtcbiAgICAgICAgdGhyb3cgbmV3IEVycm9yKGBJbnZhbGlkIGFyZ3VtZW50IGZvciBwYXJhbSAke2FyZ306ICR7YXJnc1thcmddfWApO1xuICAgICAgfVxuICAgIH1cbiAgfVxufVxuXG5hc3luYyBmdW5jdGlvbiB2YWxpZGF0ZVRtcERpciAodG1wRGlyKSB7XG4gIHRyeSB7XG4gICAgYXdhaXQgbWtkaXJwKHRtcERpcik7XG4gIH0gY2F0Y2ggKGUpIHtcbiAgICB0aHJvdyBuZXcgRXJyb3IoYFdlIGNvdWxkIG5vdCBlbnN1cmUgdGhhdCB0aGUgdGVtcCBkaXIgeW91IHNwZWNpZmllZCBgICtcbiAgICAgICAgICAgICAgICAgICAgYCgke3RtcERpcn0pIGV4aXN0cy4gUGxlYXNlIG1ha2Ugc3VyZSBpdCdzIHdyaXRlYWJsZS5gKTtcbiAgfVxufVxuXG5leHBvcnQgeyBnZXRBcHBpdW1Db25maWcsIHZhbGlkYXRlU2VydmVyQXJncywgY2hlY2tOb2RlT2ssIHNob3dDb25maWcsXG4gICAgICAgICB3YXJuTm9kZURlcHJlY2F0aW9ucywgdmFsaWRhdGVUbXBEaXIsIGdldE5vbkRlZmF1bHRBcmdzLFxuICAgICAgICAgZ2V0RGVwcmVjYXRlZEFyZ3MsIGdldEdpdFJldiwgY2hlY2tWYWxpZFBvcnQsIEFQUElVTV9WRVIgfTtcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4ifQ==
