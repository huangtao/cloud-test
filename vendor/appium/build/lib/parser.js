'use strict';

var _defineProperty = require('babel-runtime/helpers/define-property')['default'];

var _slicedToArray = require('babel-runtime/helpers/sliced-to-array')['default'];

var _getIterator = require('babel-runtime/core-js/get-iterator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _fs = require('fs');

var _fs2 = _interopRequireDefault(_fs);

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

var _argparse = require('argparse');

var _packageJson = require('../../package.json');

var _packageJson2 = _interopRequireDefault(_packageJson);

// eslint-disable-line import/no-unresolved

var args = [[['--shell'], {
  required: false,
  defaultValue: null,
  help: 'Enter REPL mode',
  nargs: 0,
  dest: 'shell'
}], [['--reboot'], {
  defaultValue: false,
  dest: 'reboot',
  action: 'storeTrue',
  required: false,
  help: '(Android-only) reboot emulator after each session and kill it at the end',
  nargs: 0
}], [['--ipa'], {
  required: false,
  defaultValue: null,
  help: '(IOS-only) abs path to compiled .ipa file',
  example: '/abs/path/to/my.ipa',
  dest: 'ipa'
}], [['-a', '--address'], {
  defaultValue: '0.0.0.0',
  required: false,
  example: '0.0.0.0',
  help: 'IP Address to listen on',
  dest: 'address'
}], [['-p', '--port'], {
  defaultValue: 4723,
  required: false,
  type: 'int',
  example: '4723',
  help: 'port to listen on',
  dest: 'port'
}], [['-ca', '--callback-address'], {
  required: false,
  dest: 'callbackAddress',
  defaultValue: null,
  example: '127.0.0.1',
  help: 'callback IP Address (default: same as --address)'
}], [['-cp', '--callback-port'], {
  required: false,
  dest: 'callbackPort',
  defaultValue: null,
  type: 'int',
  example: '4723',
  help: 'callback port (default: same as port)'
}], [['-bp', '--bootstrap-port'], {
  defaultValue: 4725,
  dest: 'bootstrapPort',
  required: false,
  type: 'int',
  example: '4725',
  help: '(Android-only) port to use on device to talk to Appium'
}], [['-tp', '--testbundle-port'], {
  defaultValue: 4724,
  dest: 'testbundlePort',
  required: false,
  type: 'int',
  example: '4724',
  help: 'Port to use on PC to foward to testbundle on device'
}], [['-r', '--backend-retries'], {
  defaultValue: 3,
  dest: 'backendRetries',
  required: false,
  type: 'int',
  example: '3',
  help: '(iOS-only) How many times to retry launching Instruments ' + 'before saying it crashed or timed out'
}], [['--session-override'], {
  defaultValue: false,
  dest: 'sessionOverride',
  action: 'storeTrue',
  required: false,
  help: 'Enables session override (clobbering)',
  nargs: 0
}], [['-l', '--pre-launch'], {
  defaultValue: false,
  dest: 'launch',
  action: 'storeTrue',
  required: false,
  help: 'Pre-launch the application before allowing the first session ' + '(Requires --app and, for Android, --app-pkg and --app-activity)',
  nargs: 0
}], [['-g', '--log'], {
  defaultValue: null,
  dest: 'log',
  required: false,
  example: '/path/to/appium.log',
  help: 'Also send log output to this file'
}], [['--log-level'], {
  choices: ['info', 'info:debug', 'info:info', 'info:warn', 'info:error', 'warn', 'warn:debug', 'warn:info', 'warn:warn', 'warn:error', 'error', 'error:debug', 'error:info', 'error:warn', 'error:error', 'debug', 'debug:debug', 'debug:info', 'debug:warn', 'debug:error'],
  defaultValue: 'debug',
  dest: 'loglevel',
  required: false,
  example: 'debug',
  help: 'log level; default (console[:file]): debug[:debug]'
}], [['--log-timestamp'], {
  defaultValue: true,
  required: false,
  help: 'Show timestamps in console output',
  nargs: 0,
  action: 'storeTrue',
  dest: 'logTimestamp'
}], [['--local-timezone'], {
  defaultValue: true,
  required: false,
  help: 'Use local timezone for timestamps',
  nargs: 0,
  action: 'storeTrue',
  dest: 'localTimezone'
}], [['--log-no-colors'], {
  defaultValue: false,
  required: false,
  help: 'Do not use colors in console output',
  nargs: 0,
  action: 'storeTrue',
  dest: 'logNoColors'
}], [['-G', '--webhook'], {
  defaultValue: null,
  required: false,
  example: 'localhost:9876',
  dest: 'webhook',
  help: 'Also send log output to this HTTP listener'
}], [['--safari'], {
  defaultValue: false,
  action: 'storeTrue',
  dest: 'safari',
  required: false,
  help: '(IOS-Only) Use the safari app',
  nargs: 0
}], [['--default-device', '-dd'], {
  dest: 'defaultDevice',
  defaultValue: false,
  action: 'storeTrue',
  required: false,
  help: '(IOS-Simulator-only) use the default simulator that instruments ' + 'launches on its own'
}], [['--force-iphone'], {
  defaultValue: false,
  dest: 'forceIphone',
  action: 'storeTrue',
  required: false,
  help: '(IOS-only) Use the iPhone Simulator no matter what the app wants',
  nargs: 0
}], [['--force-ipad'], {
  defaultValue: false,
  dest: 'forceIpad',
  action: 'storeTrue',
  required: false,
  help: '(IOS-only) Use the iPad Simulator no matter what the app wants',
  nargs: 0
}], [['--tracetemplate'], {
  defaultValue: null,
  dest: 'automationTraceTemplatePath',
  required: false,
  example: '/Users/me/Automation.tracetemplate',
  help: '(IOS-only) .tracetemplate file to use with Instruments'
}], [['--instruments'], {
  defaultValue: null,
  dest: 'instrumentsPath',
  require: false,
  example: '/path/to/instruments',
  help: '(IOS-only) path to instruments binary'
}], [['--nodeconfig'], {
  required: false,
  defaultValue: null,
  dest: 'nodeconfig',
  help: 'Configuration JSON file to register appium with selenium grid',
  example: '/abs/path/to/nodeconfig.json'
}], [['-ra', '--robot-address'], {
  defaultValue: '0.0.0.0',
  dest: 'robotAddress',
  required: false,
  example: '0.0.0.0',
  help: 'IP Address of robot'
}], [['-rp', '--robot-port'], {
  defaultValue: -1,
  dest: 'robotPort',
  required: false,
  type: 'int',
  example: '4242',
  help: 'port for robot'
}], [['--selendroid-port'], {
  defaultValue: 8080,
  dest: 'selendroidPort',
  required: false,
  type: 'int',
  example: '8080',
  help: 'Local port used for communication with Selendroid'
}], [['--chromedriver-port'], {
  defaultValue: null,
  dest: 'chromeDriverPort',
  required: false,
  type: 'int',
  example: '9515',
  help: 'Port upon which ChromeDriver will run. If not given, Android driver will pick a random available port.'
}], [['--chromedriver-executable'], {
  defaultValue: null,
  dest: 'chromedriverExecutable',
  required: false,
  help: 'ChromeDriver executable full path'
}], [['--show-config'], {
  defaultValue: false,
  dest: 'showConfig',
  action: 'storeTrue',
  required: false,
  help: 'Show info about the appium server configuration and exit'
}], [['--no-perms-check'], {
  defaultValue: false,
  dest: 'noPermsCheck',
  action: 'storeTrue',
  required: false,
  help: 'Bypass Appium\'s checks to ensure we can read/write necessary files'
}], [['--strict-caps'], {
  defaultValue: false,
  dest: 'enforceStrictCaps',
  action: 'storeTrue',
  required: false,
  help: 'Cause sessions to fail if desired caps are sent in that Appium ' + 'does not recognize as valid for the selected device',
  nargs: 0
}], [['--isolate-sim-device'], {
  defaultValue: false,
  dest: 'isolateSimDevice',
  action: 'storeTrue',
  required: false,
  help: 'Xcode 6 has a bug on some platforms where a certain simulator ' + 'can only be launched without error if all other simulator devices ' + 'are first deleted. This option causes Appium to delete all ' + 'devices other than the one being used by Appium. Note that this ' + 'is a permanent deletion, and you are responsible for using simctl ' + 'or xcode to manage the categories of devices used with Appium.',
  nargs: 0
}], [['--tmp'], {
  defaultValue: null,
  dest: 'tmpDir',
  required: false,
  help: 'Absolute path to directory Appium can use to manage temporary ' + 'files, like built-in iOS apps it needs to move around. On *nix/Mac ' + 'defaults to /tmp, on Windows defaults to C:\\Windows\\Temp'
}], [['--trace-dir'], {
  defaultValue: null,
  dest: 'traceDir',
  required: false,
  help: 'Absolute path to directory Appium use to save ios instruments ' + 'traces, defaults to <tmp dir>/appium-instruments'
}], [['--debug-log-spacing'], {
  dest: 'debugLogSpacing',
  defaultValue: false,
  action: 'storeTrue',
  required: false,
  help: 'Add exaggerated spacing in logs to help with visual inspection'
}], [['--suppress-adb-kill-server'], {
  dest: 'suppressKillServer',
  defaultValue: false,
  action: 'storeTrue',
  required: false,
  help: '(Android-only) If set, prevents Appium from killing the adb server instance',
  nargs: 0
}], [['--async-trace'], {
  dest: 'asyncTrace',
  defaultValue: false,
  required: false,
  action: 'storeTrue',
  help: 'Add long stack traces to log entries. Recommended for debugging only.'
}], [['--webkit-debug-proxy-port'], {
  defaultValue: 27753,
  dest: 'webkitDebugProxyPort',
  required: false,
  type: 'int',
  example: "27753",
  help: '(IOS-only) Local port used for communication with ios-webkit-debug-proxy'
}], [['--webdriveragent-port'], {
  defaultValue: 8100,
  dest: 'wdaLocalPort',
  required: false,
  type: 'int',
  example: "8100",
  help: '(IOS-only, XCUITest-only) Local port used for communication with WebDriverAgent'
}], [['-dc', '--default-capabilities'], {
  dest: 'defaultCapabilities',
  defaultValue: {},
  type: parseDefaultCaps,
  required: false,
  example: '[ \'{"app": "myapp.app", "deviceName": "iPhone Simulator"}\' ' + '| /path/to/caps.json ]',
  help: 'Set the default desired capabilities, which will be set on each ' + 'session unless overridden by received capabilities.'
}]];

var deprecatedArgs = [[['--command-timeout'], {
  defaultValue: 60,
  dest: 'defaultCommandTimeout',
  type: 'int',
  required: false,
  help: '[DEPRECATED] No effect. This used to be the default command ' + 'timeout for the server to use for all sessions (in seconds and ' + 'should be less than 2147483). Use newCommandTimeout cap instead'
}], [['-k', '--keep-artifacts'], {
  defaultValue: false,
  dest: 'keepArtifacts',
  action: 'storeTrue',
  required: false,
  help: '[DEPRECATED] - no effect, trace is now in tmp dir by default and is ' + 'cleared before each run. Please also refer to the --trace-dir flag.',
  nargs: 0
}], [['--platform-name'], {
  dest: 'platformName',
  defaultValue: null,
  required: false,
  deprecatedFor: '--default-capabilities',
  example: 'iOS',
  help: '[DEPRECATED] - Name of the mobile platform: iOS, Android, or FirefoxOS'
}], [['--platform-version'], {
  dest: 'platformVersion',
  defaultValue: null,
  required: false,
  deprecatedFor: '--default-capabilities',
  example: '7.1',
  help: '[DEPRECATED] - Version of the mobile platform'
}], [['--automation-name'], {
  dest: 'automationName',
  defaultValue: null,
  required: false,
  deprecatedFor: '--default-capabilities',
  example: 'Appium',
  help: '[DEPRECATED] - Name of the automation tool: Appium or Selendroid'
}], [['--device-name'], {
  dest: 'deviceName',
  defaultValue: null,
  required: false,
  deprecatedFor: '--default-capabilities',
  example: 'iPhone Retina (4-inch), Android Emulator',
  help: '[DEPRECATED] - Name of the mobile device to use'
}], [['--browser-name'], {
  dest: 'browserName',
  defaultValue: null,
  required: false,
  deprecatedFor: '--default-capabilities',
  example: 'Safari',
  help: '[DEPRECATED] - Name of the mobile browser: Safari or Chrome'
}], [['--app'], {
  dest: 'app',
  required: false,
  defaultValue: null,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - IOS: abs path to simulator-compiled .app file or the bundle_id of the desired target on device; Android: abs path to .apk file',
  example: '/abs/path/to/my.app'
}], [['-lt', '--launch-timeout'], {
  defaultValue: 90000,
  dest: 'launchTimeout',
  type: 'int',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (iOS-only) how long in ms to wait for Instruments to launch'
}], [['--language'], {
  defaultValue: null,
  dest: 'language',
  required: false,
  example: 'en',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - Language for the iOS simulator / Android Emulator'
}], [['--locale'], {
  defaultValue: null,
  dest: 'locale',
  required: false,
  example: 'en_US',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - Locale for the iOS simulator / Android Emulator'
}], [['-U', '--udid'], {
  dest: 'udid',
  required: false,
  defaultValue: null,
  example: '1adsf-sdfas-asdf-123sdf',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - Unique device identifier of the connected physical device'
}], [['--orientation'], {
  dest: 'orientation',
  defaultValue: null,
  required: false,
  example: 'LANDSCAPE',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (IOS-only) use LANDSCAPE or PORTRAIT to initialize all requests ' + 'to this orientation'
}], [['--no-reset'], {
  defaultValue: false,
  dest: 'noReset',
  action: 'storeTrue',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - Do not reset app state between sessions (IOS: do not delete app ' + 'plist files; Android: do not uninstall app before new session)',
  nargs: 0
}], [['--full-reset'], {
  defaultValue: false,
  dest: 'fullReset',
  action: 'storeTrue',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (iOS) Delete the entire simulator folder. (Android) Reset app ' + 'state by uninstalling app instead of clearing app data. On ' + 'Android, this will also remove the app after the session is complete.',
  nargs: 0
}], [['--app-pkg'], {
  dest: 'appPackage',
  defaultValue: null,
  required: false,
  deprecatedFor: '--default-capabilities',
  example: 'com.example.android.myApp',
  help: '[DEPRECATED] - (Android-only) Java package of the Android app you want to run ' + '(e.g., com.example.android.myApp)'
}], [['--app-activity'], {
  dest: 'appActivity',
  defaultValue: null,
  required: false,
  example: 'MainActivity',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Activity name for the Android activity you want ' + 'to launch from your package (e.g., MainActivity)'
}], [['--app-wait-package'], {
  dest: 'appWaitPackage',
  defaultValue: false,
  required: false,
  example: 'com.example.android.myApp',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Package name for the Android activity you want ' + 'to wait for (e.g., com.example.android.myApp)'
}], [['--app-wait-activity'], {
  dest: 'appWaitActivity',
  defaultValue: false,
  required: false,
  example: 'SplashActivity',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Activity name for the Android activity you want ' + 'to wait for (e.g., SplashActivity)'
}], [['--device-ready-timeout'], {
  dest: 'deviceReadyTimeout',
  defaultValue: 5,
  required: false,
  type: 'int',
  example: '5',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Timeout in seconds while waiting for device to become ready'
}], [['--android-coverage'], {
  dest: 'androidCoverage',
  defaultValue: false,
  required: false,
  example: 'com.my.Pkg/com.my.Pkg.instrumentation.MyInstrumentation',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Fully qualified instrumentation class. Passed to -w in ' + 'adb shell am instrument -e coverage true -w '
}], [['--avd'], {
  dest: 'avd',
  defaultValue: null,
  required: false,
  example: '@default',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Name of the avd to launch'
}], [['--avd-args'], {
  dest: 'avdArgs',
  defaultValue: null,
  required: false,
  example: '-no-snapshot-load',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Additional emulator arguments to launch the avd'
}], [['--use-keystore'], {
  defaultValue: false,
  dest: 'useKeystore',
  action: 'storeTrue',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) When set the keystore will be used to sign apks.'
}], [['--keystore-path'], {
  defaultValue: _path2['default'].resolve(process.env.HOME || process.env.USERPROFILE || '', '.android', 'debug.keystore'),
  dest: 'keystorePath',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Path to keystore'
}], [['--keystore-password'], {
  defaultValue: 'android',
  dest: 'keystorePassword',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Password to keystore'
}], [['--key-alias'], {
  defaultValue: 'androiddebugkey',
  dest: 'keyAlias',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Key alias'
}], [['--key-password'], {
  defaultValue: 'android',
  dest: 'keyPassword',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Key password'
}], [['--intent-action'], {
  dest: 'intentAction',
  defaultValue: 'android.intent.action.MAIN',
  required: false,
  example: 'android.intent.action.MAIN',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Intent action which will be used to start activity'
}], [['--intent-category'], {
  dest: 'intentCategory',
  defaultValue: 'android.intent.category.LAUNCHER',
  required: false,
  example: 'android.intent.category.APP_CONTACTS',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Intent category which will be used to start activity'
}], [['--intent-flags'], {
  dest: 'intentFlags',
  defaultValue: '0x10200000',
  required: false,
  example: '0x10200000',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Flags that will be used to start activity'
}], [['--intent-args'], {
  dest: 'optionalIntentArguments',
  defaultValue: null,
  required: false,
  example: '0x10200000',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) Additional intent arguments that will be used to ' + 'start activity'
}], [['--dont-stop-app-on-reset'], {
  dest: 'dontStopAppOnReset',
  defaultValue: false,
  action: 'storeTrue',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (Android-only) When included, refrains from stopping the app before restart'
}], [['--calendar-format'], {
  defaultValue: null,
  dest: 'calendarFormat',
  required: false,
  example: 'gregorian',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (IOS-only) calendar format for the iOS simulator'
}], [['--native-instruments-lib'], {
  defaultValue: false,
  dest: 'nativeInstrumentsLib',
  action: 'storeTrue',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (IOS-only) IOS has a weird built-in unavoidable ' + 'delay. We patch this in appium. If you do not want it patched, ' + 'pass in this flag.',
  nargs: 0
}], [['--keep-keychains'], {
  defaultValue: false,
  dest: 'keepKeyChains',
  action: 'storeTrue',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (iOS-only) Whether to keep keychains (Library/Keychains) when reset app between sessions',
  nargs: 0
}], [['--localizable-strings-dir'], {
  required: false,
  dest: 'localizableStringsDir',
  defaultValue: 'en.lproj',
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (IOS-only) the relative path of the dir where Localizable.strings file resides ',
  example: 'en.lproj'
}], [['--show-ios-log'], {
  defaultValue: false,
  dest: 'showIOSLog',
  action: 'storeTrue',
  required: false,
  deprecatedFor: '--default-capabilities',
  help: '[DEPRECATED] - (IOS-only) if set, the iOS system log will be written to the console',
  nargs: 0
}]];

function updateParseArgsForDefaultCapabilities(parser) {
  // here we want to update the parser.parseArgs() function
  // in order to bring together all the args that are actually
  // default caps.
  // once those deprecated args are actually removed, this
  // can also be removed
  parser._parseArgs = parser.parseArgs;
  parser.parseArgs = function (args) {
    var parsedArgs = parser._parseArgs(args);
    parsedArgs.defaultCapabilities = parsedArgs.defaultCapabilities || {};
    var _iteratorNormalCompletion = true;
    var _didIteratorError = false;
    var _iteratorError = undefined;

    try {
      for (var _iterator = _getIterator(deprecatedArgs), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
        var argEntry = _step.value;

        var arg = argEntry[1].dest;
        if (argEntry[1].deprecatedFor === '--default-capabilities') {
          if (arg in parsedArgs && parsedArgs[arg] !== argEntry[1].defaultValue) {
            parsedArgs.defaultCapabilities[arg] = parsedArgs[arg];
            // j s h i n t can't handle complex interpolated strings
            var capDict = _defineProperty({}, arg, parsedArgs[arg]);
            argEntry[1].deprecatedFor = '--default-capabilities ' + ('\'' + JSON.stringify(capDict) + '\'');
          }
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

    return parsedArgs;
  };
}

function parseDefaultCaps(caps) {
  try {
    // use synchronous file access, as `argparse` provides no way of either
    // awaiting or using callbacks. This step happens in startup, in what is
    // effectively command-line code, so nothing is blocked in terms of
    // sessions, so holding up the event loop does not incur the usual
    // drawbacks.
    if (_fs2['default'].statSync(caps).isFile()) {
      caps = _fs2['default'].readFileSync(caps, 'utf8');
    }
  } catch (err) {
    // not a file, or not readable
  }
  caps = JSON.parse(caps);
  if (!_lodash2['default'].isPlainObject(caps)) {
    throw 'Invalid format for default capabilities';
  }
  return caps;
}

function getParser() {
  var parser = new _argparse.ArgumentParser({
    version: _packageJson2['default'].version,
    addHelp: true,
    description: 'A webdriver-compatible server for use with native and hybrid iOS and Android applications.',
    prog: process.argv[1] || 'Appium'
  });
  var allArgs = _lodash2['default'].union(args, deprecatedArgs);
  parser.rawArgs = allArgs;
  var _iteratorNormalCompletion2 = true;
  var _didIteratorError2 = false;
  var _iteratorError2 = undefined;

  try {
    for (var _iterator2 = _getIterator(allArgs), _step2; !(_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done); _iteratorNormalCompletion2 = true) {
      var arg = _step2.value;

      parser.addArgument(arg[0], arg[1]);
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

  updateParseArgsForDefaultCapabilities(parser);

  return parser;
}

function getDefaultArgs() {
  var defaults = {};
  var _iteratorNormalCompletion3 = true;
  var _didIteratorError3 = false;
  var _iteratorError3 = undefined;

  try {
    for (var _iterator3 = _getIterator(args), _step3; !(_iteratorNormalCompletion3 = (_step3 = _iterator3.next()).done); _iteratorNormalCompletion3 = true) {
      var _step3$value = _slicedToArray(_step3.value, 2);

      var arg = _step3$value[1];

      defaults[arg.dest] = arg.defaultValue;
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

  return defaults;
}

exports['default'] = getParser;
exports.getDefaultArgs = getDefaultArgs;
exports.getParser = getParser;
//# sourceMappingURL=data:application/json;charset=utf8;base64,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dCBmcyBmcm9tICdmcyc7XG5pbXBvcnQgcGF0aCBmcm9tICdwYXRoJztcbmltcG9ydCBfIGZyb20gJ2xvZGFzaCc7XG5pbXBvcnQgeyBBcmd1bWVudFBhcnNlciB9IGZyb20gJ2FyZ3BhcnNlJztcbmltcG9ydCBwa2dPYmogZnJvbSAnLi4vLi4vcGFja2FnZS5qc29uJzsgIC8vIGVzbGludC1kaXNhYmxlLWxpbmUgaW1wb3J0L25vLXVucmVzb2x2ZWRcblxuXG5jb25zdCBhcmdzID0gW1xuICBbWyctLXNoZWxsJ10sIHtcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIGhlbHA6ICdFbnRlciBSRVBMIG1vZGUnLFxuICAgIG5hcmdzOiAwLFxuICAgIGRlc3Q6ICdzaGVsbCcsXG4gIH1dLFxuXG4gIFtbJy0tcmVib290J10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGRlc3Q6ICdyZWJvb3QnLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGhlbHA6ICcoQW5kcm9pZC1vbmx5KSByZWJvb3QgZW11bGF0b3IgYWZ0ZXIgZWFjaCBzZXNzaW9uIGFuZCBraWxsIGl0IGF0IHRoZSBlbmQnLFxuICAgIG5hcmdzOiAwLFxuICB9XSxcbiAgIFxuICBbWyctLWlwYSddLCB7XG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGRlZmF1bHRWYWx1ZTogbnVsbCxcbiAgICBoZWxwOiAnKElPUy1vbmx5KSBhYnMgcGF0aCB0byBjb21waWxlZCAuaXBhIGZpbGUnLFxuICAgIGV4YW1wbGU6ICcvYWJzL3BhdGgvdG8vbXkuaXBhJyxcbiAgICBkZXN0OiAnaXBhJyxcbiAgfV0sXG5cbiAgW1snLWEnLCAnLS1hZGRyZXNzJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6ICcwLjAuMC4wJyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZXhhbXBsZTogJzAuMC4wLjAnLFxuICAgIGhlbHA6ICdJUCBBZGRyZXNzIHRvIGxpc3RlbiBvbicsXG4gICAgZGVzdDogJ2FkZHJlc3MnLFxuICB9XSxcblxuICBbWyctcCcsICctLXBvcnQnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogNDcyMyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgdHlwZTogJ2ludCcsXG4gICAgZXhhbXBsZTogJzQ3MjMnLFxuICAgIGhlbHA6ICdwb3J0IHRvIGxpc3RlbiBvbicsXG4gICAgZGVzdDogJ3BvcnQnLFxuICB9XSxcblxuICBbWyctY2EnLCAnLS1jYWxsYmFjay1hZGRyZXNzJ10sIHtcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVzdDogJ2NhbGxiYWNrQWRkcmVzcycsXG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIGV4YW1wbGU6ICcxMjcuMC4wLjEnLFxuICAgIGhlbHA6ICdjYWxsYmFjayBJUCBBZGRyZXNzIChkZWZhdWx0OiBzYW1lIGFzIC0tYWRkcmVzcyknLFxuICB9XSxcblxuICBbWyctY3AnLCAnLS1jYWxsYmFjay1wb3J0J10sIHtcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVzdDogJ2NhbGxiYWNrUG9ydCcsXG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIHR5cGU6ICdpbnQnLFxuICAgIGV4YW1wbGU6ICc0NzIzJyxcbiAgICBoZWxwOiAnY2FsbGJhY2sgcG9ydCAoZGVmYXVsdDogc2FtZSBhcyBwb3J0KScsXG4gIH1dLFxuXG4gIFtbJy1icCcsICctLWJvb3RzdHJhcC1wb3J0J10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IDQ3MjUsXG4gICAgZGVzdDogJ2Jvb3RzdHJhcFBvcnQnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICB0eXBlOiAnaW50JyxcbiAgICBleGFtcGxlOiAnNDcyNScsXG4gICAgaGVscDogJyhBbmRyb2lkLW9ubHkpIHBvcnQgdG8gdXNlIG9uIGRldmljZSB0byB0YWxrIHRvIEFwcGl1bScsXG4gIH1dLFxuXG4gIFtbJy10cCcsICctLXRlc3RidW5kbGUtcG9ydCddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiA0NzI0LFxuICAgIGRlc3Q6ICd0ZXN0YnVuZGxlUG9ydCcsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIHR5cGU6ICdpbnQnLFxuICAgIGV4YW1wbGU6ICc0NzI0JyxcbiAgICBoZWxwOiAnUG9ydCB0byB1c2Ugb24gUEMgdG8gZm93YXJkIHRvIHRlc3RidW5kbGUgb24gZGV2aWNlJyxcbiAgfV0sXG5cbiAgW1snLXInLCAnLS1iYWNrZW5kLXJldHJpZXMnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogMyxcbiAgICBkZXN0OiAnYmFja2VuZFJldHJpZXMnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICB0eXBlOiAnaW50JyxcbiAgICBleGFtcGxlOiAnMycsXG4gICAgaGVscDogJyhpT1Mtb25seSkgSG93IG1hbnkgdGltZXMgdG8gcmV0cnkgbGF1bmNoaW5nIEluc3RydW1lbnRzICcgK1xuICAgICAgICAgICdiZWZvcmUgc2F5aW5nIGl0IGNyYXNoZWQgb3IgdGltZWQgb3V0JyxcbiAgfV0sXG5cbiAgW1snLS1zZXNzaW9uLW92ZXJyaWRlJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGRlc3Q6ICdzZXNzaW9uT3ZlcnJpZGUnLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGhlbHA6ICdFbmFibGVzIHNlc3Npb24gb3ZlcnJpZGUgKGNsb2JiZXJpbmcpJyxcbiAgICBuYXJnczogMCxcbiAgfV0sXG5cbiAgW1snLWwnLCAnLS1wcmUtbGF1bmNoJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGRlc3Q6ICdsYXVuY2gnLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGhlbHA6ICdQcmUtbGF1bmNoIHRoZSBhcHBsaWNhdGlvbiBiZWZvcmUgYWxsb3dpbmcgdGhlIGZpcnN0IHNlc3Npb24gJyArXG4gICAgICAgICAgJyhSZXF1aXJlcyAtLWFwcCBhbmQsIGZvciBBbmRyb2lkLCAtLWFwcC1wa2cgYW5kIC0tYXBwLWFjdGl2aXR5KScsXG4gICAgbmFyZ3M6IDAsXG4gIH1dLFxuXG4gIFtbJy1nJywgJy0tbG9nJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IG51bGwsXG4gICAgZGVzdDogJ2xvZycsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICcvcGF0aC90by9hcHBpdW0ubG9nJyxcbiAgICBoZWxwOiAnQWxzbyBzZW5kIGxvZyBvdXRwdXQgdG8gdGhpcyBmaWxlJyxcbiAgfV0sXG5cbiAgW1snLS1sb2ctbGV2ZWwnXSwge1xuICAgIGNob2ljZXM6IFsnaW5mbycsICdpbmZvOmRlYnVnJywgJ2luZm86aW5mbycsICdpbmZvOndhcm4nLCAnaW5mbzplcnJvcicsXG4gICAgICAgICAgICAgICd3YXJuJywgJ3dhcm46ZGVidWcnLCAnd2FybjppbmZvJywgJ3dhcm46d2FybicsICd3YXJuOmVycm9yJyxcbiAgICAgICAgICAgICAgJ2Vycm9yJywgJ2Vycm9yOmRlYnVnJywgJ2Vycm9yOmluZm8nLCAnZXJyb3I6d2FybicsICdlcnJvcjplcnJvcicsXG4gICAgICAgICAgICAgICdkZWJ1ZycsICdkZWJ1ZzpkZWJ1ZycsICdkZWJ1ZzppbmZvJywgJ2RlYnVnOndhcm4nLCAnZGVidWc6ZXJyb3InXSxcbiAgICBkZWZhdWx0VmFsdWU6ICdkZWJ1ZycsXG4gICAgZGVzdDogJ2xvZ2xldmVsJyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZXhhbXBsZTogJ2RlYnVnJyxcbiAgICBoZWxwOiAnbG9nIGxldmVsOyBkZWZhdWx0IChjb25zb2xlWzpmaWxlXSk6IGRlYnVnWzpkZWJ1Z10nLFxuICB9XSxcblxuICBbWyctLWxvZy10aW1lc3RhbXAnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogdHJ1ZSxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgaGVscDogJ1Nob3cgdGltZXN0YW1wcyBpbiBjb25zb2xlIG91dHB1dCcsXG4gICAgbmFyZ3M6IDAsXG4gICAgYWN0aW9uOiAnc3RvcmVUcnVlJyxcbiAgICBkZXN0OiAnbG9nVGltZXN0YW1wJyxcbiAgfV0sXG5cbiAgW1snLS1sb2NhbC10aW1lem9uZSddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiB0cnVlLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBoZWxwOiAnVXNlIGxvY2FsIHRpbWV6b25lIGZvciB0aW1lc3RhbXBzJyxcbiAgICBuYXJnczogMCxcbiAgICBhY3Rpb246ICdzdG9yZVRydWUnLFxuICAgIGRlc3Q6ICdsb2NhbFRpbWV6b25lJyxcbiAgfV0sXG5cbiAgW1snLS1sb2ctbm8tY29sb3JzJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBoZWxwOiAnRG8gbm90IHVzZSBjb2xvcnMgaW4gY29uc29sZSBvdXRwdXQnLFxuICAgIG5hcmdzOiAwLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgZGVzdDogJ2xvZ05vQ29sb3JzJyxcbiAgfV0sXG5cbiAgW1snLUcnLCAnLS13ZWJob29rJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IG51bGwsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICdsb2NhbGhvc3Q6OTg3NicsXG4gICAgZGVzdDogJ3dlYmhvb2snLFxuICAgIGhlbHA6ICdBbHNvIHNlbmQgbG9nIG91dHB1dCB0byB0aGlzIEhUVFAgbGlzdGVuZXInLFxuICB9XSxcblxuICBbWyctLXNhZmFyaSddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiBmYWxzZSxcbiAgICBhY3Rpb246ICdzdG9yZVRydWUnLFxuICAgIGRlc3Q6ICdzYWZhcmknLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBoZWxwOiAnKElPUy1Pbmx5KSBVc2UgdGhlIHNhZmFyaSBhcHAnLFxuICAgIG5hcmdzOiAwLFxuICB9XSxcblxuICBbWyctLWRlZmF1bHQtZGV2aWNlJywgJy1kZCddLCB7XG4gICAgZGVzdDogJ2RlZmF1bHREZXZpY2UnLFxuICAgIGRlZmF1bHRWYWx1ZTogZmFsc2UsXG4gICAgYWN0aW9uOiAnc3RvcmVUcnVlJyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgaGVscDogJyhJT1MtU2ltdWxhdG9yLW9ubHkpIHVzZSB0aGUgZGVmYXVsdCBzaW11bGF0b3IgdGhhdCBpbnN0cnVtZW50cyAnICtcbiAgICAgICAgICAnbGF1bmNoZXMgb24gaXRzIG93bicsXG4gIH1dLFxuXG4gIFtbJy0tZm9yY2UtaXBob25lJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGRlc3Q6ICdmb3JjZUlwaG9uZScsXG4gICAgYWN0aW9uOiAnc3RvcmVUcnVlJyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgaGVscDogJyhJT1Mtb25seSkgVXNlIHRoZSBpUGhvbmUgU2ltdWxhdG9yIG5vIG1hdHRlciB3aGF0IHRoZSBhcHAgd2FudHMnLFxuICAgIG5hcmdzOiAwLFxuICB9XSxcblxuICBbWyctLWZvcmNlLWlwYWQnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogZmFsc2UsXG4gICAgZGVzdDogJ2ZvcmNlSXBhZCcsXG4gICAgYWN0aW9uOiAnc3RvcmVUcnVlJyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgaGVscDogJyhJT1Mtb25seSkgVXNlIHRoZSBpUGFkIFNpbXVsYXRvciBubyBtYXR0ZXIgd2hhdCB0aGUgYXBwIHdhbnRzJyxcbiAgICBuYXJnczogMCxcbiAgfV0sXG5cbiAgW1snLS10cmFjZXRlbXBsYXRlJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IG51bGwsXG4gICAgZGVzdDogJ2F1dG9tYXRpb25UcmFjZVRlbXBsYXRlUGF0aCcsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICcvVXNlcnMvbWUvQXV0b21hdGlvbi50cmFjZXRlbXBsYXRlJyxcbiAgICBoZWxwOiAnKElPUy1vbmx5KSAudHJhY2V0ZW1wbGF0ZSBmaWxlIHRvIHVzZSB3aXRoIEluc3RydW1lbnRzJyxcbiAgfV0sXG5cbiAgW1snLS1pbnN0cnVtZW50cyddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIGRlc3Q6ICdpbnN0cnVtZW50c1BhdGgnLFxuICAgIHJlcXVpcmU6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICcvcGF0aC90by9pbnN0cnVtZW50cycsXG4gICAgaGVscDogJyhJT1Mtb25seSkgcGF0aCB0byBpbnN0cnVtZW50cyBiaW5hcnknLFxuICB9XSxcblxuICBbWyctLW5vZGVjb25maWcnXSwge1xuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBkZWZhdWx0VmFsdWU6IG51bGwsXG4gICAgZGVzdDogJ25vZGVjb25maWcnLFxuICAgIGhlbHA6ICdDb25maWd1cmF0aW9uIEpTT04gZmlsZSB0byByZWdpc3RlciBhcHBpdW0gd2l0aCBzZWxlbml1bSBncmlkJyxcbiAgICBleGFtcGxlOiAnL2Ficy9wYXRoL3RvL25vZGVjb25maWcuanNvbicsXG4gIH1dLFxuXG4gIFtbJy1yYScsICctLXJvYm90LWFkZHJlc3MnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogJzAuMC4wLjAnLFxuICAgIGRlc3Q6ICdyb2JvdEFkZHJlc3MnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBleGFtcGxlOiAnMC4wLjAuMCcsXG4gICAgaGVscDogJ0lQIEFkZHJlc3Mgb2Ygcm9ib3QnLFxuICB9XSxcblxuICBbWyctcnAnLCAnLS1yb2JvdC1wb3J0J10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IC0xLFxuICAgIGRlc3Q6ICdyb2JvdFBvcnQnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICB0eXBlOiAnaW50JyxcbiAgICBleGFtcGxlOiAnNDI0MicsXG4gICAgaGVscDogJ3BvcnQgZm9yIHJvYm90JyxcbiAgfV0sXG5cbiAgW1snLS1zZWxlbmRyb2lkLXBvcnQnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogODA4MCxcbiAgICBkZXN0OiAnc2VsZW5kcm9pZFBvcnQnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICB0eXBlOiAnaW50JyxcbiAgICBleGFtcGxlOiAnODA4MCcsXG4gICAgaGVscDogJ0xvY2FsIHBvcnQgdXNlZCBmb3IgY29tbXVuaWNhdGlvbiB3aXRoIFNlbGVuZHJvaWQnLFxuICB9XSxcblxuICBbWyctLWNocm9tZWRyaXZlci1wb3J0J10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IG51bGwsXG4gICAgZGVzdDogJ2Nocm9tZURyaXZlclBvcnQnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICB0eXBlOiAnaW50JyxcbiAgICBleGFtcGxlOiAnOTUxNScsXG4gICAgaGVscDogJ1BvcnQgdXBvbiB3aGljaCBDaHJvbWVEcml2ZXIgd2lsbCBydW4uIElmIG5vdCBnaXZlbiwgQW5kcm9pZCBkcml2ZXIgd2lsbCBwaWNrIGEgcmFuZG9tIGF2YWlsYWJsZSBwb3J0LicsXG4gIH1dLFxuXG4gIFtbJy0tY2hyb21lZHJpdmVyLWV4ZWN1dGFibGUnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogbnVsbCxcbiAgICBkZXN0OiAnY2hyb21lZHJpdmVyRXhlY3V0YWJsZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGhlbHA6ICdDaHJvbWVEcml2ZXIgZXhlY3V0YWJsZSBmdWxsIHBhdGgnLFxuICB9XSxcblxuICBbWyctLXNob3ctY29uZmlnJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGRlc3Q6ICdzaG93Q29uZmlnJyxcbiAgICBhY3Rpb246ICdzdG9yZVRydWUnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBoZWxwOiAnU2hvdyBpbmZvIGFib3V0IHRoZSBhcHBpdW0gc2VydmVyIGNvbmZpZ3VyYXRpb24gYW5kIGV4aXQnLFxuICB9XSxcblxuICBbWyctLW5vLXBlcm1zLWNoZWNrJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGRlc3Q6ICdub1Blcm1zQ2hlY2snLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGhlbHA6ICdCeXBhc3MgQXBwaXVtXFwncyBjaGVja3MgdG8gZW5zdXJlIHdlIGNhbiByZWFkL3dyaXRlIG5lY2Vzc2FyeSBmaWxlcycsXG4gIH1dLFxuXG4gIFtbJy0tc3RyaWN0LWNhcHMnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogZmFsc2UsXG4gICAgZGVzdDogJ2VuZm9yY2VTdHJpY3RDYXBzJyxcbiAgICBhY3Rpb246ICdzdG9yZVRydWUnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBoZWxwOiAnQ2F1c2Ugc2Vzc2lvbnMgdG8gZmFpbCBpZiBkZXNpcmVkIGNhcHMgYXJlIHNlbnQgaW4gdGhhdCBBcHBpdW0gJyArXG4gICAgICAgICAgJ2RvZXMgbm90IHJlY29nbml6ZSBhcyB2YWxpZCBmb3IgdGhlIHNlbGVjdGVkIGRldmljZScsXG4gICAgbmFyZ3M6IDAsXG4gIH1dLFxuXG4gIFtbJy0taXNvbGF0ZS1zaW0tZGV2aWNlJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGRlc3Q6ICdpc29sYXRlU2ltRGV2aWNlJyxcbiAgICBhY3Rpb246ICdzdG9yZVRydWUnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBoZWxwOiAnWGNvZGUgNiBoYXMgYSBidWcgb24gc29tZSBwbGF0Zm9ybXMgd2hlcmUgYSBjZXJ0YWluIHNpbXVsYXRvciAnICtcbiAgICAgICAgICAnY2FuIG9ubHkgYmUgbGF1bmNoZWQgd2l0aG91dCBlcnJvciBpZiBhbGwgb3RoZXIgc2ltdWxhdG9yIGRldmljZXMgJyArXG4gICAgICAgICAgJ2FyZSBmaXJzdCBkZWxldGVkLiBUaGlzIG9wdGlvbiBjYXVzZXMgQXBwaXVtIHRvIGRlbGV0ZSBhbGwgJyArXG4gICAgICAgICAgJ2RldmljZXMgb3RoZXIgdGhhbiB0aGUgb25lIGJlaW5nIHVzZWQgYnkgQXBwaXVtLiBOb3RlIHRoYXQgdGhpcyAnICtcbiAgICAgICAgICAnaXMgYSBwZXJtYW5lbnQgZGVsZXRpb24sIGFuZCB5b3UgYXJlIHJlc3BvbnNpYmxlIGZvciB1c2luZyBzaW1jdGwgJyArXG4gICAgICAgICAgJ29yIHhjb2RlIHRvIG1hbmFnZSB0aGUgY2F0ZWdvcmllcyBvZiBkZXZpY2VzIHVzZWQgd2l0aCBBcHBpdW0uJyxcbiAgICBuYXJnczogMCxcbiAgfV0sXG5cbiAgW1snLS10bXAnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogbnVsbCxcbiAgICBkZXN0OiAndG1wRGlyJyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgaGVscDogJ0Fic29sdXRlIHBhdGggdG8gZGlyZWN0b3J5IEFwcGl1bSBjYW4gdXNlIHRvIG1hbmFnZSB0ZW1wb3JhcnkgJyArXG4gICAgICAgICAgJ2ZpbGVzLCBsaWtlIGJ1aWx0LWluIGlPUyBhcHBzIGl0IG5lZWRzIHRvIG1vdmUgYXJvdW5kLiBPbiAqbml4L01hYyAnICtcbiAgICAgICAgICAnZGVmYXVsdHMgdG8gL3RtcCwgb24gV2luZG93cyBkZWZhdWx0cyB0byBDOlxcXFxXaW5kb3dzXFxcXFRlbXAnLFxuICB9XSxcblxuICBbWyctLXRyYWNlLWRpciddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIGRlc3Q6ICd0cmFjZURpcicsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGhlbHA6ICdBYnNvbHV0ZSBwYXRoIHRvIGRpcmVjdG9yeSBBcHBpdW0gdXNlIHRvIHNhdmUgaW9zIGluc3RydW1lbnRzICcgK1xuICAgICAgICAgICd0cmFjZXMsIGRlZmF1bHRzIHRvIDx0bXAgZGlyPi9hcHBpdW0taW5zdHJ1bWVudHMnLFxuICB9XSxcblxuICBbWyctLWRlYnVnLWxvZy1zcGFjaW5nJ10sIHtcbiAgICBkZXN0OiAnZGVidWdMb2dTcGFjaW5nJyxcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGhlbHA6ICdBZGQgZXhhZ2dlcmF0ZWQgc3BhY2luZyBpbiBsb2dzIHRvIGhlbHAgd2l0aCB2aXN1YWwgaW5zcGVjdGlvbicsXG4gIH1dLFxuXG4gIFtbJy0tc3VwcHJlc3MtYWRiLWtpbGwtc2VydmVyJ10sIHtcbiAgICBkZXN0OiAnc3VwcHJlc3NLaWxsU2VydmVyJyxcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGhlbHA6ICcoQW5kcm9pZC1vbmx5KSBJZiBzZXQsIHByZXZlbnRzIEFwcGl1bSBmcm9tIGtpbGxpbmcgdGhlIGFkYiBzZXJ2ZXIgaW5zdGFuY2UnLFxuICAgIG5hcmdzOiAwLFxuICB9XSxcblxuICBbWyctLWFzeW5jLXRyYWNlJ10sIHtcbiAgICBkZXN0OiAnYXN5bmNUcmFjZScsXG4gICAgZGVmYXVsdFZhbHVlOiBmYWxzZSxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgYWN0aW9uOiAnc3RvcmVUcnVlJyxcbiAgICBoZWxwOiAnQWRkIGxvbmcgc3RhY2sgdHJhY2VzIHRvIGxvZyBlbnRyaWVzLiBSZWNvbW1lbmRlZCBmb3IgZGVidWdnaW5nIG9ubHkuJyxcbiAgfV0sXG5cbiAgW1snLS13ZWJraXQtZGVidWctcHJveHktcG9ydCddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiAyNzc1MyxcbiAgICBkZXN0OiAnd2Via2l0RGVidWdQcm94eVBvcnQnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICB0eXBlOiAnaW50JyxcbiAgICBleGFtcGxlOiBcIjI3NzUzXCIsXG4gICAgaGVscDogJyhJT1Mtb25seSkgTG9jYWwgcG9ydCB1c2VkIGZvciBjb21tdW5pY2F0aW9uIHdpdGggaW9zLXdlYmtpdC1kZWJ1Zy1wcm94eSdcbiAgfV0sXG5cbiAgW1snLS13ZWJkcml2ZXJhZ2VudC1wb3J0J10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IDgxMDAsXG4gICAgZGVzdDogJ3dkYUxvY2FsUG9ydCcsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIHR5cGU6ICdpbnQnLFxuICAgIGV4YW1wbGU6IFwiODEwMFwiLFxuICAgIGhlbHA6ICcoSU9TLW9ubHksIFhDVUlUZXN0LW9ubHkpIExvY2FsIHBvcnQgdXNlZCBmb3IgY29tbXVuaWNhdGlvbiB3aXRoIFdlYkRyaXZlckFnZW50J1xuICB9XSxcblxuICBbWyctZGMnLCAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcyddLCB7XG4gICAgZGVzdDogJ2RlZmF1bHRDYXBhYmlsaXRpZXMnLFxuICAgIGRlZmF1bHRWYWx1ZToge30sXG4gICAgdHlwZTogcGFyc2VEZWZhdWx0Q2FwcyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZXhhbXBsZTogJ1sgXFwne1wiYXBwXCI6IFwibXlhcHAuYXBwXCIsIFwiZGV2aWNlTmFtZVwiOiBcImlQaG9uZSBTaW11bGF0b3JcIn1cXCcgJyArXG4gICAgICAgICAgICAgJ3wgL3BhdGgvdG8vY2Fwcy5qc29uIF0nLFxuICAgIGhlbHA6ICdTZXQgdGhlIGRlZmF1bHQgZGVzaXJlZCBjYXBhYmlsaXRpZXMsIHdoaWNoIHdpbGwgYmUgc2V0IG9uIGVhY2ggJyArXG4gICAgICAgICAgJ3Nlc3Npb24gdW5sZXNzIG92ZXJyaWRkZW4gYnkgcmVjZWl2ZWQgY2FwYWJpbGl0aWVzLidcbiAgfV0sXG5dO1xuXG5jb25zdCBkZXByZWNhdGVkQXJncyA9IFtcbiAgW1snLS1jb21tYW5kLXRpbWVvdXQnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogNjAsXG4gICAgZGVzdDogJ2RlZmF1bHRDb21tYW5kVGltZW91dCcsXG4gICAgdHlwZTogJ2ludCcsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gTm8gZWZmZWN0LiBUaGlzIHVzZWQgdG8gYmUgdGhlIGRlZmF1bHQgY29tbWFuZCAnICtcbiAgICAgICAgICAndGltZW91dCBmb3IgdGhlIHNlcnZlciB0byB1c2UgZm9yIGFsbCBzZXNzaW9ucyAoaW4gc2Vjb25kcyBhbmQgJyArXG4gICAgICAgICAgJ3Nob3VsZCBiZSBsZXNzIHRoYW4gMjE0NzQ4MykuIFVzZSBuZXdDb21tYW5kVGltZW91dCBjYXAgaW5zdGVhZCdcbiAgfV0sXG5cbiAgW1snLWsnLCAnLS1rZWVwLWFydGlmYWN0cyddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiBmYWxzZSxcbiAgICBkZXN0OiAna2VlcEFydGlmYWN0cycsXG4gICAgYWN0aW9uOiAnc3RvcmVUcnVlJyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIG5vIGVmZmVjdCwgdHJhY2UgaXMgbm93IGluIHRtcCBkaXIgYnkgZGVmYXVsdCBhbmQgaXMgJyArXG4gICAgICAgICAgJ2NsZWFyZWQgYmVmb3JlIGVhY2ggcnVuLiBQbGVhc2UgYWxzbyByZWZlciB0byB0aGUgLS10cmFjZS1kaXIgZmxhZy4nLFxuICAgIG5hcmdzOiAwLFxuICB9XSxcblxuICBbWyctLXBsYXRmb3JtLW5hbWUnXSwge1xuICAgIGRlc3Q6ICdwbGF0Zm9ybU5hbWUnLFxuICAgIGRlZmF1bHRWYWx1ZTogbnVsbCxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGV4YW1wbGU6ICdpT1MnLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSBOYW1lIG9mIHRoZSBtb2JpbGUgcGxhdGZvcm06IGlPUywgQW5kcm9pZCwgb3IgRmlyZWZveE9TJyxcbiAgfV0sXG5cbiAgW1snLS1wbGF0Zm9ybS12ZXJzaW9uJ10sIHtcbiAgICBkZXN0OiAncGxhdGZvcm1WZXJzaW9uJyxcbiAgICBkZWZhdWx0VmFsdWU6IG51bGwsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBleGFtcGxlOiAnNy4xJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gVmVyc2lvbiBvZiB0aGUgbW9iaWxlIHBsYXRmb3JtJyxcbiAgfV0sXG5cbiAgW1snLS1hdXRvbWF0aW9uLW5hbWUnXSwge1xuICAgIGRlc3Q6ICdhdXRvbWF0aW9uTmFtZScsXG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgZXhhbXBsZTogJ0FwcGl1bScsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIE5hbWUgb2YgdGhlIGF1dG9tYXRpb24gdG9vbDogQXBwaXVtIG9yIFNlbGVuZHJvaWQnLFxuICB9XSxcblxuICBbWyctLWRldmljZS1uYW1lJ10sIHtcbiAgICBkZXN0OiAnZGV2aWNlTmFtZScsXG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgZXhhbXBsZTogJ2lQaG9uZSBSZXRpbmEgKDQtaW5jaCksIEFuZHJvaWQgRW11bGF0b3InLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSBOYW1lIG9mIHRoZSBtb2JpbGUgZGV2aWNlIHRvIHVzZScsXG4gIH1dLFxuXG4gIFtbJy0tYnJvd3Nlci1uYW1lJ10sIHtcbiAgICBkZXN0OiAnYnJvd3Nlck5hbWUnLFxuICAgIGRlZmF1bHRWYWx1ZTogbnVsbCxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGV4YW1wbGU6ICdTYWZhcmknLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSBOYW1lIG9mIHRoZSBtb2JpbGUgYnJvd3NlcjogU2FmYXJpIG9yIENocm9tZScsXG4gIH1dLFxuXG4gIFtbJy0tYXBwJ10sIHtcbiAgICBkZXN0OiAnYXBwJyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gSU9TOiBhYnMgcGF0aCB0byBzaW11bGF0b3ItY29tcGlsZWQgLmFwcCBmaWxlIG9yIHRoZSBidW5kbGVfaWQgb2YgdGhlIGRlc2lyZWQgdGFyZ2V0IG9uIGRldmljZTsgQW5kcm9pZDogYWJzIHBhdGggdG8gLmFwayBmaWxlJyxcbiAgICBleGFtcGxlOiAnL2Ficy9wYXRoL3RvL215LmFwcCcsXG4gIH1dLFxuXG4gIFtbJy1sdCcsICctLWxhdW5jaC10aW1lb3V0J10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IDkwMDAwLFxuICAgIGRlc3Q6ICdsYXVuY2hUaW1lb3V0JyxcbiAgICB0eXBlOiAnaW50JyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSAoaU9TLW9ubHkpIGhvdyBsb25nIGluIG1zIHRvIHdhaXQgZm9yIEluc3RydW1lbnRzIHRvIGxhdW5jaCcsXG4gIH1dLFxuXG4gIFtbJy0tbGFuZ3VhZ2UnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogbnVsbCxcbiAgICBkZXN0OiAnbGFuZ3VhZ2UnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBleGFtcGxlOiAnZW4nLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gTGFuZ3VhZ2UgZm9yIHRoZSBpT1Mgc2ltdWxhdG9yIC8gQW5kcm9pZCBFbXVsYXRvcicsXG4gIH1dLFxuXG4gIFtbJy0tbG9jYWxlJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IG51bGwsXG4gICAgZGVzdDogJ2xvY2FsZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICdlbl9VUycsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSBMb2NhbGUgZm9yIHRoZSBpT1Mgc2ltdWxhdG9yIC8gQW5kcm9pZCBFbXVsYXRvcicsXG4gIH1dLFxuXG4gIFtbJy1VJywgJy0tdWRpZCddLCB7XG4gICAgZGVzdDogJ3VkaWQnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBkZWZhdWx0VmFsdWU6IG51bGwsXG4gICAgZXhhbXBsZTogJzFhZHNmLXNkZmFzLWFzZGYtMTIzc2RmJyxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIFVuaXF1ZSBkZXZpY2UgaWRlbnRpZmllciBvZiB0aGUgY29ubmVjdGVkIHBoeXNpY2FsIGRldmljZScsXG4gIH1dLFxuXG4gIFtbJy0tb3JpZW50YXRpb24nXSwge1xuICAgIGRlc3Q6ICdvcmllbnRhdGlvbicsXG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBleGFtcGxlOiAnTEFORFNDQVBFJyxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIChJT1Mtb25seSkgdXNlIExBTkRTQ0FQRSBvciBQT1JUUkFJVCB0byBpbml0aWFsaXplIGFsbCByZXF1ZXN0cyAnICtcbiAgICAgICAgICAndG8gdGhpcyBvcmllbnRhdGlvbicsXG4gIH1dLFxuXG4gIFtbJy0tbm8tcmVzZXQnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogZmFsc2UsXG4gICAgZGVzdDogJ25vUmVzZXQnLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gRG8gbm90IHJlc2V0IGFwcCBzdGF0ZSBiZXR3ZWVuIHNlc3Npb25zIChJT1M6IGRvIG5vdCBkZWxldGUgYXBwICcgK1xuICAgICAgICAgICdwbGlzdCBmaWxlczsgQW5kcm9pZDogZG8gbm90IHVuaW5zdGFsbCBhcHAgYmVmb3JlIG5ldyBzZXNzaW9uKScsXG4gICAgbmFyZ3M6IDAsXG4gIH1dLFxuXG4gIFtbJy0tZnVsbC1yZXNldCddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiBmYWxzZSxcbiAgICBkZXN0OiAnZnVsbFJlc2V0JyxcbiAgICBhY3Rpb246ICdzdG9yZVRydWUnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIChpT1MpIERlbGV0ZSB0aGUgZW50aXJlIHNpbXVsYXRvciBmb2xkZXIuIChBbmRyb2lkKSBSZXNldCBhcHAgJyArXG4gICAgICAgICAgJ3N0YXRlIGJ5IHVuaW5zdGFsbGluZyBhcHAgaW5zdGVhZCBvZiBjbGVhcmluZyBhcHAgZGF0YS4gT24gJyArXG4gICAgICAgICAgJ0FuZHJvaWQsIHRoaXMgd2lsbCBhbHNvIHJlbW92ZSB0aGUgYXBwIGFmdGVyIHRoZSBzZXNzaW9uIGlzIGNvbXBsZXRlLicsXG4gICAgbmFyZ3M6IDAsXG4gIH1dLFxuXG4gIFtbJy0tYXBwLXBrZyddLCB7XG4gICAgZGVzdDogJ2FwcFBhY2thZ2UnLFxuICAgIGRlZmF1bHRWYWx1ZTogbnVsbCxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGV4YW1wbGU6ICdjb20uZXhhbXBsZS5hbmRyb2lkLm15QXBwJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKEFuZHJvaWQtb25seSkgSmF2YSBwYWNrYWdlIG9mIHRoZSBBbmRyb2lkIGFwcCB5b3Ugd2FudCB0byBydW4gJyArXG4gICAgICAgICAgJyhlLmcuLCBjb20uZXhhbXBsZS5hbmRyb2lkLm15QXBwKScsXG4gIH1dLFxuXG4gIFtbJy0tYXBwLWFjdGl2aXR5J10sIHtcbiAgICBkZXN0OiAnYXBwQWN0aXZpdHknLFxuICAgIGRlZmF1bHRWYWx1ZTogbnVsbCxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZXhhbXBsZTogJ01haW5BY3Rpdml0eScsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSAoQW5kcm9pZC1vbmx5KSBBY3Rpdml0eSBuYW1lIGZvciB0aGUgQW5kcm9pZCBhY3Rpdml0eSB5b3Ugd2FudCAnICtcbiAgICAgICAgICAndG8gbGF1bmNoIGZyb20geW91ciBwYWNrYWdlIChlLmcuLCBNYWluQWN0aXZpdHkpJyxcbiAgfV0sXG5cbiAgW1snLS1hcHAtd2FpdC1wYWNrYWdlJ10sIHtcbiAgICBkZXN0OiAnYXBwV2FpdFBhY2thZ2UnLFxuICAgIGRlZmF1bHRWYWx1ZTogZmFsc2UsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICdjb20uZXhhbXBsZS5hbmRyb2lkLm15QXBwJyxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIChBbmRyb2lkLW9ubHkpIFBhY2thZ2UgbmFtZSBmb3IgdGhlIEFuZHJvaWQgYWN0aXZpdHkgeW91IHdhbnQgJyArXG4gICAgICAgICAgJ3RvIHdhaXQgZm9yIChlLmcuLCBjb20uZXhhbXBsZS5hbmRyb2lkLm15QXBwKScsXG4gIH1dLFxuXG4gIFtbJy0tYXBwLXdhaXQtYWN0aXZpdHknXSwge1xuICAgIGRlc3Q6ICdhcHBXYWl0QWN0aXZpdHknLFxuICAgIGRlZmF1bHRWYWx1ZTogZmFsc2UsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICdTcGxhc2hBY3Rpdml0eScsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSAoQW5kcm9pZC1vbmx5KSBBY3Rpdml0eSBuYW1lIGZvciB0aGUgQW5kcm9pZCBhY3Rpdml0eSB5b3Ugd2FudCAnICtcbiAgICAgICAgICAndG8gd2FpdCBmb3IgKGUuZy4sIFNwbGFzaEFjdGl2aXR5KScsXG4gIH1dLFxuXG4gIFtbJy0tZGV2aWNlLXJlYWR5LXRpbWVvdXQnXSwge1xuICAgIGRlc3Q6ICdkZXZpY2VSZWFkeVRpbWVvdXQnLFxuICAgIGRlZmF1bHRWYWx1ZTogNSxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgdHlwZTogJ2ludCcsXG4gICAgZXhhbXBsZTogJzUnLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKEFuZHJvaWQtb25seSkgVGltZW91dCBpbiBzZWNvbmRzIHdoaWxlIHdhaXRpbmcgZm9yIGRldmljZSB0byBiZWNvbWUgcmVhZHknLFxuICB9XSxcblxuICBbWyctLWFuZHJvaWQtY292ZXJhZ2UnXSwge1xuICAgIGRlc3Q6ICdhbmRyb2lkQ292ZXJhZ2UnLFxuICAgIGRlZmF1bHRWYWx1ZTogZmFsc2UsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICdjb20ubXkuUGtnL2NvbS5teS5Qa2cuaW5zdHJ1bWVudGF0aW9uLk15SW5zdHJ1bWVudGF0aW9uJyxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIChBbmRyb2lkLW9ubHkpIEZ1bGx5IHF1YWxpZmllZCBpbnN0cnVtZW50YXRpb24gY2xhc3MuIFBhc3NlZCB0byAtdyBpbiAnICtcbiAgICAgICAgICAnYWRiIHNoZWxsIGFtIGluc3RydW1lbnQgLWUgY292ZXJhZ2UgdHJ1ZSAtdyAnLFxuICB9XSxcblxuICBbWyctLWF2ZCddLCB7XG4gICAgZGVzdDogJ2F2ZCcsXG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBleGFtcGxlOiAnQGRlZmF1bHQnLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKEFuZHJvaWQtb25seSkgTmFtZSBvZiB0aGUgYXZkIHRvIGxhdW5jaCcsXG4gIH1dLFxuXG4gIFtbJy0tYXZkLWFyZ3MnXSwge1xuICAgIGRlc3Q6ICdhdmRBcmdzJyxcbiAgICBkZWZhdWx0VmFsdWU6IG51bGwsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICctbm8tc25hcHNob3QtbG9hZCcsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSAoQW5kcm9pZC1vbmx5KSBBZGRpdGlvbmFsIGVtdWxhdG9yIGFyZ3VtZW50cyB0byBsYXVuY2ggdGhlIGF2ZCcsXG4gIH1dLFxuXG4gIFtbJy0tdXNlLWtleXN0b3JlJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGRlc3Q6ICd1c2VLZXlzdG9yZScsXG4gICAgYWN0aW9uOiAnc3RvcmVUcnVlJyxcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSAoQW5kcm9pZC1vbmx5KSBXaGVuIHNldCB0aGUga2V5c3RvcmUgd2lsbCBiZSB1c2VkIHRvIHNpZ24gYXBrcy4nLFxuICB9XSxcblxuICBbWyctLWtleXN0b3JlLXBhdGgnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogcGF0aC5yZXNvbHZlKHByb2Nlc3MuZW52LkhPTUUgfHwgcHJvY2Vzcy5lbnYuVVNFUlBST0ZJTEUgfHwgJycsICcuYW5kcm9pZCcsICdkZWJ1Zy5rZXlzdG9yZScpLFxuICAgIGRlc3Q6ICdrZXlzdG9yZVBhdGgnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIChBbmRyb2lkLW9ubHkpIFBhdGggdG8ga2V5c3RvcmUnLFxuICB9XSxcblxuICBbWyctLWtleXN0b3JlLXBhc3N3b3JkJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6ICdhbmRyb2lkJyxcbiAgICBkZXN0OiAna2V5c3RvcmVQYXNzd29yZCcsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKEFuZHJvaWQtb25seSkgUGFzc3dvcmQgdG8ga2V5c3RvcmUnLFxuICB9XSxcblxuICBbWyctLWtleS1hbGlhcyddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiAnYW5kcm9pZGRlYnVna2V5JyxcbiAgICBkZXN0OiAna2V5QWxpYXMnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIChBbmRyb2lkLW9ubHkpIEtleSBhbGlhcycsXG4gIH1dLFxuXG4gIFtbJy0ta2V5LXBhc3N3b3JkJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6ICdhbmRyb2lkJyxcbiAgICBkZXN0OiAna2V5UGFzc3dvcmQnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIChBbmRyb2lkLW9ubHkpIEtleSBwYXNzd29yZCcsXG4gIH1dLFxuXG4gIFtbJy0taW50ZW50LWFjdGlvbiddLCB7XG4gICAgZGVzdDogJ2ludGVudEFjdGlvbicsXG4gICAgZGVmYXVsdFZhbHVlOiAnYW5kcm9pZC5pbnRlbnQuYWN0aW9uLk1BSU4nLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBleGFtcGxlOiAnYW5kcm9pZC5pbnRlbnQuYWN0aW9uLk1BSU4nLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKEFuZHJvaWQtb25seSkgSW50ZW50IGFjdGlvbiB3aGljaCB3aWxsIGJlIHVzZWQgdG8gc3RhcnQgYWN0aXZpdHknLFxuICB9XSxcblxuICBbWyctLWludGVudC1jYXRlZ29yeSddLCB7XG4gICAgZGVzdDogJ2ludGVudENhdGVnb3J5JyxcbiAgICBkZWZhdWx0VmFsdWU6ICdhbmRyb2lkLmludGVudC5jYXRlZ29yeS5MQVVOQ0hFUicsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGV4YW1wbGU6ICdhbmRyb2lkLmludGVudC5jYXRlZ29yeS5BUFBfQ09OVEFDVFMnLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKEFuZHJvaWQtb25seSkgSW50ZW50IGNhdGVnb3J5IHdoaWNoIHdpbGwgYmUgdXNlZCB0byBzdGFydCBhY3Rpdml0eScsXG4gIH1dLFxuXG4gIFtbJy0taW50ZW50LWZsYWdzJ10sIHtcbiAgICBkZXN0OiAnaW50ZW50RmxhZ3MnLFxuICAgIGRlZmF1bHRWYWx1ZTogJzB4MTAyMDAwMDAnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBleGFtcGxlOiAnMHgxMDIwMDAwMCcsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSAoQW5kcm9pZC1vbmx5KSBGbGFncyB0aGF0IHdpbGwgYmUgdXNlZCB0byBzdGFydCBhY3Rpdml0eScsXG4gIH1dLFxuXG4gIFtbJy0taW50ZW50LWFyZ3MnXSwge1xuICAgIGRlc3Q6ICdvcHRpb25hbEludGVudEFyZ3VtZW50cycsXG4gICAgZGVmYXVsdFZhbHVlOiBudWxsLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBleGFtcGxlOiAnMHgxMDIwMDAwMCcsXG4gICAgZGVwcmVjYXRlZEZvcjogJy0tZGVmYXVsdC1jYXBhYmlsaXRpZXMnLFxuICAgIGhlbHA6ICdbREVQUkVDQVRFRF0gLSAoQW5kcm9pZC1vbmx5KSBBZGRpdGlvbmFsIGludGVudCBhcmd1bWVudHMgdGhhdCB3aWxsIGJlIHVzZWQgdG8gJyArXG4gICAgICAgICAgJ3N0YXJ0IGFjdGl2aXR5JyxcbiAgfV0sXG5cbiAgW1snLS1kb250LXN0b3AtYXBwLW9uLXJlc2V0J10sIHtcbiAgICBkZXN0OiAnZG9udFN0b3BBcHBPblJlc2V0JyxcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKEFuZHJvaWQtb25seSkgV2hlbiBpbmNsdWRlZCwgcmVmcmFpbnMgZnJvbSBzdG9wcGluZyB0aGUgYXBwIGJlZm9yZSByZXN0YXJ0JyxcbiAgfV0sXG5cbiAgW1snLS1jYWxlbmRhci1mb3JtYXQnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogbnVsbCxcbiAgICBkZXN0OiAnY2FsZW5kYXJGb3JtYXQnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBleGFtcGxlOiAnZ3JlZ29yaWFuJyxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIChJT1Mtb25seSkgY2FsZW5kYXIgZm9ybWF0IGZvciB0aGUgaU9TIHNpbXVsYXRvcicsXG4gIH1dLFxuXG4gIFtbJy0tbmF0aXZlLWluc3RydW1lbnRzLWxpYiddLCB7XG4gICAgZGVmYXVsdFZhbHVlOiBmYWxzZSxcbiAgICBkZXN0OiAnbmF0aXZlSW5zdHJ1bWVudHNMaWInLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKElPUy1vbmx5KSBJT1MgaGFzIGEgd2VpcmQgYnVpbHQtaW4gdW5hdm9pZGFibGUgJyArXG4gICAgICAgICAgJ2RlbGF5LiBXZSBwYXRjaCB0aGlzIGluIGFwcGl1bS4gSWYgeW91IGRvIG5vdCB3YW50IGl0IHBhdGNoZWQsICcgK1xuICAgICAgICAgICdwYXNzIGluIHRoaXMgZmxhZy4nLFxuICAgIG5hcmdzOiAwLFxuICB9XSxcblxuICBbWyctLWtlZXAta2V5Y2hhaW5zJ10sIHtcbiAgICBkZWZhdWx0VmFsdWU6IGZhbHNlLFxuICAgIGRlc3Q6ICdrZWVwS2V5Q2hhaW5zJyxcbiAgICBhY3Rpb246ICdzdG9yZVRydWUnLFxuICAgIHJlcXVpcmVkOiBmYWxzZSxcbiAgICBkZXByZWNhdGVkRm9yOiAnLS1kZWZhdWx0LWNhcGFiaWxpdGllcycsXG4gICAgaGVscDogJ1tERVBSRUNBVEVEXSAtIChpT1Mtb25seSkgV2hldGhlciB0byBrZWVwIGtleWNoYWlucyAoTGlicmFyeS9LZXljaGFpbnMpIHdoZW4gcmVzZXQgYXBwIGJldHdlZW4gc2Vzc2lvbnMnLFxuICAgIG5hcmdzOiAwLFxuICB9XSxcblxuICBbWyctLWxvY2FsaXphYmxlLXN0cmluZ3MtZGlyJ10sIHtcbiAgICByZXF1aXJlZDogZmFsc2UsXG4gICAgZGVzdDogJ2xvY2FsaXphYmxlU3RyaW5nc0RpcicsXG4gICAgZGVmYXVsdFZhbHVlOiAnZW4ubHByb2onLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKElPUy1vbmx5KSB0aGUgcmVsYXRpdmUgcGF0aCBvZiB0aGUgZGlyIHdoZXJlIExvY2FsaXphYmxlLnN0cmluZ3MgZmlsZSByZXNpZGVzICcsXG4gICAgZXhhbXBsZTogJ2VuLmxwcm9qJyxcbiAgfV0sXG5cbiAgW1snLS1zaG93LWlvcy1sb2cnXSwge1xuICAgIGRlZmF1bHRWYWx1ZTogZmFsc2UsXG4gICAgZGVzdDogJ3Nob3dJT1NMb2cnLFxuICAgIGFjdGlvbjogJ3N0b3JlVHJ1ZScsXG4gICAgcmVxdWlyZWQ6IGZhbHNlLFxuICAgIGRlcHJlY2F0ZWRGb3I6ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJyxcbiAgICBoZWxwOiAnW0RFUFJFQ0FURURdIC0gKElPUy1vbmx5KSBpZiBzZXQsIHRoZSBpT1Mgc3lzdGVtIGxvZyB3aWxsIGJlIHdyaXR0ZW4gdG8gdGhlIGNvbnNvbGUnLFxuICAgIG5hcmdzOiAwLFxuICB9XVxuXTtcblxuZnVuY3Rpb24gdXBkYXRlUGFyc2VBcmdzRm9yRGVmYXVsdENhcGFiaWxpdGllcyAocGFyc2VyKSB7XG4gIC8vIGhlcmUgd2Ugd2FudCB0byB1cGRhdGUgdGhlIHBhcnNlci5wYXJzZUFyZ3MoKSBmdW5jdGlvblxuICAvLyBpbiBvcmRlciB0byBicmluZyB0b2dldGhlciBhbGwgdGhlIGFyZ3MgdGhhdCBhcmUgYWN0dWFsbHlcbiAgLy8gZGVmYXVsdCBjYXBzLlxuICAvLyBvbmNlIHRob3NlIGRlcHJlY2F0ZWQgYXJncyBhcmUgYWN0dWFsbHkgcmVtb3ZlZCwgdGhpc1xuICAvLyBjYW4gYWxzbyBiZSByZW1vdmVkXG4gIHBhcnNlci5fcGFyc2VBcmdzID0gcGFyc2VyLnBhcnNlQXJncztcbiAgcGFyc2VyLnBhcnNlQXJncyA9IGZ1bmN0aW9uIChhcmdzKSB7XG4gICAgbGV0IHBhcnNlZEFyZ3MgPSBwYXJzZXIuX3BhcnNlQXJncyhhcmdzKTtcbiAgICBwYXJzZWRBcmdzLmRlZmF1bHRDYXBhYmlsaXRpZXMgPSBwYXJzZWRBcmdzLmRlZmF1bHRDYXBhYmlsaXRpZXMgfHwge307XG4gICAgZm9yIChsZXQgYXJnRW50cnkgb2YgZGVwcmVjYXRlZEFyZ3MpIHtcbiAgICAgIGxldCBhcmcgPSBhcmdFbnRyeVsxXS5kZXN0O1xuICAgICAgaWYgKGFyZ0VudHJ5WzFdLmRlcHJlY2F0ZWRGb3IgPT09ICctLWRlZmF1bHQtY2FwYWJpbGl0aWVzJykge1xuICAgICAgICBpZiAoYXJnIGluIHBhcnNlZEFyZ3MgJiYgcGFyc2VkQXJnc1thcmddICE9PSBhcmdFbnRyeVsxXS5kZWZhdWx0VmFsdWUpIHtcbiAgICAgICAgICBwYXJzZWRBcmdzLmRlZmF1bHRDYXBhYmlsaXRpZXNbYXJnXSA9IHBhcnNlZEFyZ3NbYXJnXTtcbiAgICAgICAgICAvLyBqIHMgaCBpIG4gdCBjYW4ndCBoYW5kbGUgY29tcGxleCBpbnRlcnBvbGF0ZWQgc3RyaW5nc1xuICAgICAgICAgIGxldCBjYXBEaWN0ID0ge1thcmddOiBwYXJzZWRBcmdzW2FyZ119O1xuICAgICAgICAgIGFyZ0VudHJ5WzFdLmRlcHJlY2F0ZWRGb3IgPSBgLS1kZWZhdWx0LWNhcGFiaWxpdGllcyBgICtcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYCcke0pTT04uc3RyaW5naWZ5KGNhcERpY3QpfSdgO1xuICAgICAgICB9XG4gICAgICB9XG4gICAgfVxuICAgIHJldHVybiBwYXJzZWRBcmdzO1xuICB9O1xufVxuXG5mdW5jdGlvbiBwYXJzZURlZmF1bHRDYXBzIChjYXBzKSB7XG4gIHRyeSB7XG4gICAgLy8gdXNlIHN5bmNocm9ub3VzIGZpbGUgYWNjZXNzLCBhcyBgYXJncGFyc2VgIHByb3ZpZGVzIG5vIHdheSBvZiBlaXRoZXJcbiAgICAvLyBhd2FpdGluZyBvciB1c2luZyBjYWxsYmFja3MuIFRoaXMgc3RlcCBoYXBwZW5zIGluIHN0YXJ0dXAsIGluIHdoYXQgaXNcbiAgICAvLyBlZmZlY3RpdmVseSBjb21tYW5kLWxpbmUgY29kZSwgc28gbm90aGluZyBpcyBibG9ja2VkIGluIHRlcm1zIG9mXG4gICAgLy8gc2Vzc2lvbnMsIHNvIGhvbGRpbmcgdXAgdGhlIGV2ZW50IGxvb3AgZG9lcyBub3QgaW5jdXIgdGhlIHVzdWFsXG4gICAgLy8gZHJhd2JhY2tzLlxuICAgIGlmIChmcy5zdGF0U3luYyhjYXBzKS5pc0ZpbGUoKSkge1xuICAgICAgY2FwcyA9IGZzLnJlYWRGaWxlU3luYyhjYXBzLCAndXRmOCcpO1xuICAgIH1cbiAgfSBjYXRjaCAoZXJyKSB7XG4gICAgLy8gbm90IGEgZmlsZSwgb3Igbm90IHJlYWRhYmxlXG4gIH1cbiAgY2FwcyA9IEpTT04ucGFyc2UoY2Fwcyk7XG4gIGlmICghXy5pc1BsYWluT2JqZWN0KGNhcHMpKSB7XG4gICAgdGhyb3cgJ0ludmFsaWQgZm9ybWF0IGZvciBkZWZhdWx0IGNhcGFiaWxpdGllcyc7XG4gIH1cbiAgcmV0dXJuIGNhcHM7XG59XG5cbmZ1bmN0aW9uIGdldFBhcnNlciAoKSB7XG4gIGxldCBwYXJzZXIgPSBuZXcgQXJndW1lbnRQYXJzZXIoe1xuICAgIHZlcnNpb246IHBrZ09iai52ZXJzaW9uLFxuICAgIGFkZEhlbHA6IHRydWUsXG4gICAgZGVzY3JpcHRpb246ICdBIHdlYmRyaXZlci1jb21wYXRpYmxlIHNlcnZlciBmb3IgdXNlIHdpdGggbmF0aXZlIGFuZCBoeWJyaWQgaU9TIGFuZCBBbmRyb2lkIGFwcGxpY2F0aW9ucy4nLFxuICAgIHByb2c6IHByb2Nlc3MuYXJndlsxXSB8fCAnQXBwaXVtJ1xuICB9KTtcbiAgbGV0IGFsbEFyZ3MgPSBfLnVuaW9uKGFyZ3MsIGRlcHJlY2F0ZWRBcmdzKTtcbiAgcGFyc2VyLnJhd0FyZ3MgPSBhbGxBcmdzO1xuICBmb3IgKGxldCBhcmcgb2YgYWxsQXJncykge1xuICAgIHBhcnNlci5hZGRBcmd1bWVudChhcmdbMF0sIGFyZ1sxXSk7XG4gIH1cbiAgdXBkYXRlUGFyc2VBcmdzRm9yRGVmYXVsdENhcGFiaWxpdGllcyhwYXJzZXIpO1xuXG4gIHJldHVybiBwYXJzZXI7XG59XG5cbmZ1bmN0aW9uIGdldERlZmF1bHRBcmdzICgpIHtcbiAgbGV0IGRlZmF1bHRzID0ge307XG4gIGZvciAobGV0IFssIGFyZ10gb2YgYXJncykge1xuICAgIGRlZmF1bHRzW2FyZy5kZXN0XSA9IGFyZy5kZWZhdWx0VmFsdWU7XG4gIH1cbiAgcmV0dXJuIGRlZmF1bHRzO1xufVxuXG5leHBvcnQgZGVmYXVsdCBnZXRQYXJzZXI7XG5leHBvcnQgeyBnZXREZWZhdWx0QXJncywgZ2V0UGFyc2VyIH07XG4iXSwic291cmNlUm9vdCI6Ii4uLy4uIn0=
