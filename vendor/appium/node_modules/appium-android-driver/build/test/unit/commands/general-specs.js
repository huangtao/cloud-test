'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

var _this = this;

var _chai = require('chai');

var _chai2 = _interopRequireDefault(_chai);

var _chaiAsPromised = require('chai-as-promised');

var _chaiAsPromised2 = _interopRequireDefault(_chaiAsPromised);

var _ = require('../../..');

var _2 = _interopRequireDefault(_);

var _libCommandsGeneral = require('../../../lib/commands/general');

var _libAndroidHelpers = require('../../../lib/android-helpers');

var _libAndroidHelpers2 = _interopRequireDefault(_libAndroidHelpers);

var _appiumTestSupport = require('appium-test-support');

var driver = undefined;
_chai2['default'].should();
_chai2['default'].use(_chaiAsPromised2['default']);
var expect = _chai2['default'].expect;

describe('General', function () {
  describe('hideKeyboard', function () {
    it('should throw an error if no keyboard is present', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.isSoftKeyboardPresent = function () {
              return false;
            };
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.hideKeyboard().should.be.rejectedWith(/not present/));

          case 5:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should throw an error if there is no selector', function () {
      driver.findElOrEls('xpath', null, false, 'some context').should.be.rejected;
    });
  });
  describe('isKeyboardShown', function () {
    it('should return true if the keyboard is shown', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.isSoftKeyboardPresent = function () {
              return { isKeyboardShown: true, canCloseKeyboard: true };
            };
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.isKeyboardShown());

          case 5:
            context$3$0.sent.should.equal(true);

          case 6:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should return false if the keyboard is not shown', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.isSoftKeyboardPresent = function () {
              return { isKeyboardShown: false, canCloseKeyboard: true };
            };
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.isKeyboardShown());

          case 5:
            context$3$0.sent.should.equal(false);

          case 6:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
  });
  describe('Install App', function () {
    it('should throw an error if APK does not exist', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            context$3$0.next = 3;
            return _regeneratorRuntime.awrap(driver.installApp('non/existent/app.apk').should.be.rejectedWith(/Could not find/));

          case 3:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
  });
  describe('Run installed App', (0, _appiumTestSupport.withMocks)({ helpers: _libAndroidHelpers2['default'] }, function (mocks) {
    it('should throw error if run with full reset', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.opts = { appPackage: "app.package", appActivity: "act", fullReset: true };
            driver.caps = {};
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.initAUT().should.be.rejectedWith(/Full reset requires an app capability/));

          case 5:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should reset if run with fast reset', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.opts = { appPackage: "app.package", appActivity: "act", fullReset: false, fastReset: true };
            driver.caps = {};
            driver.adb = "mock_adb";
            mocks.helpers.expects("resetApp").withExactArgs("mock_adb", undefined, "app.package", true);
            context$3$0.next = 7;
            return _regeneratorRuntime.awrap(driver.initAUT());

          case 7:
            mocks.helpers.verify();

          case 8:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should keep data if run without reset', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.opts = { appPackage: "app.package", appActivity: "act", fullReset: false, fastReset: false };
            driver.caps = {};
            mocks.helpers.expects("resetApp").never();
            context$3$0.next = 6;
            return _regeneratorRuntime.awrap(driver.initAUT());

          case 6:
            mocks.helpers.verify();

          case 7:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
  }));
  describe('getStrings', (0, _appiumTestSupport.withMocks)({ helpers: _libAndroidHelpers2['default'] }, function (mocks) {
    it('should return app strings', function callee$2$0() {
      var strings;
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.bootstrap = {};
            driver.bootstrap.sendAction = function () {
              return '';
            };
            mocks.helpers.expects("pushStrings").returns({ 'test': 'en_value' });
            context$3$0.next = 6;
            return _regeneratorRuntime.awrap(driver.getStrings('en'));

          case 6:
            strings = context$3$0.sent;

            strings.test.should.equal('en_value');
            mocks.helpers.verify();

          case 9:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should return cached app strings for the specified language', function callee$2$0() {
      var strings;
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.getDeviceLanguage = function () {
              return 'en';
            };
            driver.apkStrings.en = { 'test': 'en_value' };
            driver.apkStrings.fr = { 'test': 'fr_value' };
            context$3$0.next = 7;
            return _regeneratorRuntime.awrap(driver.getStrings('fr'));

          case 7:
            strings = context$3$0.sent;

            strings.test.should.equal('fr_value');

          case 9:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should return cached app strings for the device language', function callee$2$0() {
      var strings;
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.getDeviceLanguage = function () {
              return 'en';
            };
            driver.apkStrings.en = { 'test': 'en_value' };
            driver.apkStrings.fr = { 'test': 'fr_value' };
            context$3$0.next = 7;
            return _regeneratorRuntime.awrap(driver.getStrings());

          case 7:
            strings = context$3$0.sent;

            strings.test.should.equal('en_value');

          case 9:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
  }));
  describe('getDisplayDensity', function () {
    it('should return the display density of a device', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.shell = function () {
              return '123';
            };
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.getDisplayDensity());

          case 5:
            context$3$0.sent.should.equal(123);

          case 6:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should return the display density of an emulator', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.shell = function (cmd) {
              var joinedCmd = cmd.join(' ');
              if (joinedCmd.indexOf('ro.sf') !== -1) {
                // device property look up
                return '';
              } else if (joinedCmd.indexOf('qemu.sf') !== -1) {
                // emulator property look up
                return '456';
              }
              return '';
            };
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.getDisplayDensity());

          case 5:
            context$3$0.sent.should.equal(456);

          case 6:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should throw an error if the display density property can\'t be found', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.shell = function () {
              return '';
            };
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.getDisplayDensity().should.be.rejectedWith(/Failed to get display density property/));

          case 5:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should throw and error if the display density is not a number', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.shell = function () {
              return 'abc';
            };
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.getDisplayDensity().should.be.rejectedWith(/Failed to get display density property/));

          case 5:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
  });
  describe('parseSurfaceLine', function () {
    it('should return visible true if the surface is visible', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            (0, _libCommandsGeneral.parseSurfaceLine)('shown=true rect=1 1 1 1').should.be.eql({
              visible: true,
              x: 1,
              y: 1,
              width: 1,
              height: 1
            });

          case 1:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should return visible false if the surface is not visible', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            (0, _libCommandsGeneral.parseSurfaceLine)('shown=false rect=1 1 1 1').should.be.eql({
              visible: false,
              x: 1,
              y: 1,
              width: 1,
              height: 1
            });

          case 1:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should return the parsed surface bounds', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            (0, _libCommandsGeneral.parseSurfaceLine)('shown=true rect=(1.0,2.0) 3.0 x 4.0').should.be.eql({
              visible: true,
              x: 1,
              y: 2,
              width: 3,
              height: 4
            });

          case 1:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
  });

  // these are used for both parseWindows and getSystemBars tests
  var validWindowOutput = ['  Window #1 Derp', '    stuff', '      Surface: derp shown=false lalalala rect=(9.0,8.0) 7.0 x 6.0', '    more stuff', '  Window #2 StatusBar', '    blah blah blah', '      Surface: blah blah shown=true blah blah rect=(1.0,2.0) 3.0 x 4.0', '    blah blah blah', '  Window #3 NavigationBar', '    womp womp', '      Surface: blah blah shown=false womp womp rect=(5.0,6.0) 50.0 x 60.0', '    qwerty asd zxc'].join('\n');
  var validSystemBars = {
    statusBar: { visible: true, x: 1, y: 2, width: 3, height: 4 },
    navigationBar: { visible: false, x: 5, y: 6, width: 50, height: 60 }
  };

  describe('parseWindows', function () {
    it('should throw an error if the status bar info wasn\'t found', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            expect(function () {
              (0, _libCommandsGeneral.parseWindows)('');
            }).to['throw'](Error, /Failed to parse status bar information./);

          case 1:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should throw an error if the navigation bar info wasn\'t found', function callee$2$0() {
      var windowOutput;
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            windowOutput = ['  Window #1 StatusBar', '    blah blah blah', '      Surface: blah blah shown=true blah blah rect=(1.0,2.0) 3.0 x 4.0', '    blah blah blah'].join('\n');

            expect(function () {
              (0, _libCommandsGeneral.parseWindows)(windowOutput);
            }).to['throw'](Error, /Failed to parse navigation bar information./);

          case 2:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should return status and navigation bar info when both are given', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            (0, _libCommandsGeneral.parseWindows)(validWindowOutput).should.be.eql(validSystemBars);

          case 1:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
  });
  describe('getSystemBars', function () {
    it('should throw an error if there\'s no window manager output', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.shell = function () {
              return '';
            };
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.getSystemBars().should.be.rejectedWith(/Did not get window manager output./));

          case 5:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    it('should return the parsed system bar info', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            driver = new _2['default']();
            driver.adb = {};
            driver.adb.shell = function () {
              return validWindowOutput;
            };
            context$3$0.next = 5;
            return _regeneratorRuntime.awrap(driver.getSystemBars());

          case 5:
            context$3$0.t0 = validSystemBars;
            context$3$0.sent.should.be.eql(context$3$0.t0);

          case 7:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
  });
});
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvdW5pdC9jb21tYW5kcy9nZW5lcmFsLXNwZWNzLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7O29CQUFpQixNQUFNOzs7OzhCQUNJLGtCQUFrQjs7OztnQkFDbkIsVUFBVTs7OztrQ0FDVywrQkFBK0I7O2lDQUMxRCw4QkFBOEI7Ozs7aUNBQ3hCLHFCQUFxQjs7QUFFL0MsSUFBSSxNQUFNLFlBQUEsQ0FBQztBQUNYLGtCQUFLLE1BQU0sRUFBRSxDQUFDO0FBQ2Qsa0JBQUssR0FBRyw2QkFBZ0IsQ0FBQztBQUN6QixJQUFJLE1BQU0sR0FBRyxrQkFBSyxNQUFNLENBQUM7O0FBRXpCLFFBQVEsQ0FBQyxTQUFTLEVBQUUsWUFBTTtBQUN4QixVQUFRLENBQUMsY0FBYyxFQUFFLFlBQU07QUFDN0IsTUFBRSxDQUFDLGlEQUFpRCxFQUFFOzs7O0FBQ3BELGtCQUFNLEdBQUcsbUJBQW1CLENBQUM7QUFDN0Isa0JBQU0sQ0FBQyxHQUFHLEdBQUcsRUFBRSxDQUFDO0FBQ2hCLGtCQUFNLENBQUMsR0FBRyxDQUFDLHFCQUFxQixHQUFHLFlBQU07QUFBRSxxQkFBTyxLQUFLLENBQUM7YUFBRSxDQUFDOzs2Q0FDckQsTUFBTSxDQUFDLFlBQVksRUFBRSxDQUFDLE1BQU0sQ0FBQyxFQUFFLENBQUMsWUFBWSxDQUFDLGFBQWEsQ0FBQzs7Ozs7OztLQUNsRSxDQUFDLENBQUM7QUFDSCxNQUFFLENBQUMsK0NBQStDLEVBQUUsWUFBTTtBQUN4RCxZQUFNLENBQUMsV0FBVyxDQUFDLE9BQU8sRUFBRSxJQUFJLEVBQUUsS0FBSyxFQUFFLGNBQWMsQ0FBQyxDQUFDLE1BQU0sQ0FBQyxFQUFFLENBQUMsUUFBUSxDQUFDO0tBQzdFLENBQUMsQ0FBQztHQUNKLENBQUMsQ0FBQztBQUNILFVBQVEsQ0FBQyxpQkFBaUIsRUFBRSxZQUFNO0FBQ2hDLE1BQUUsQ0FBQyw2Q0FBNkMsRUFBRTs7OztBQUNoRCxrQkFBTSxHQUFHLG1CQUFtQixDQUFDO0FBQzdCLGtCQUFN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cmNlc0NvbnRlbnQiOlsiaW1wb3J0IGNoYWkgZnJvbSAnY2hhaSc7XG5pbXBvcnQgY2hhaUFzUHJvbWlzZWQgZnJvbSAnY2hhaS1hcy1wcm9taXNlZCc7XG5pbXBvcnQgQW5kcm9pZERyaXZlciBmcm9tICcuLi8uLi8uLic7XG5pbXBvcnQgeyBwYXJzZVN1cmZhY2VMaW5lLCBwYXJzZVdpbmRvd3MgfSBmcm9tICcuLi8uLi8uLi9saWIvY29tbWFuZHMvZ2VuZXJhbCc7XG5pbXBvcnQgaGVscGVycyBmcm9tICcuLi8uLi8uLi9saWIvYW5kcm9pZC1oZWxwZXJzJztcbmltcG9ydCB7IHdpdGhNb2NrcyB9IGZyb20gJ2FwcGl1bS10ZXN0LXN1cHBvcnQnO1xuXG5sZXQgZHJpdmVyO1xuY2hhaS5zaG91bGQoKTtcbmNoYWkudXNlKGNoYWlBc1Byb21pc2VkKTtcbmxldCBleHBlY3QgPSBjaGFpLmV4cGVjdDtcblxuZGVzY3JpYmUoJ0dlbmVyYWwnLCAoKSA9PiB7XG4gIGRlc2NyaWJlKCdoaWRlS2V5Ym9hcmQnLCAoKSA9PiB7XG4gICAgaXQoJ3Nob3VsZCB0aHJvdyBhbiBlcnJvciBpZiBubyBrZXlib2FyZCBpcyBwcmVzZW50JywgYXN5bmMgKCkgPT4ge1xuICAgICAgZHJpdmVyID0gbmV3IEFuZHJvaWREcml2ZXIoKTtcbiAgICAgIGRyaXZlci5hZGIgPSB7fTtcbiAgICAgIGRyaXZlci5hZGIuaXNTb2Z0S2V5Ym9hcmRQcmVzZW50ID0gKCkgPT4geyByZXR1cm4gZmFsc2U7IH07XG4gICAgICBhd2FpdCBkcml2ZXIuaGlkZUtleWJvYXJkKCkuc2hvdWxkLmJlLnJlamVjdGVkV2l0aCgvbm90IHByZXNlbnQvKTtcbiAgICB9KTtcbiAgICBpdCgnc2hvdWxkIHRocm93IGFuIGVycm9yIGlmIHRoZXJlIGlzIG5vIHNlbGVjdG9yJywgKCkgPT4ge1xuICAgICAgZHJpdmVyLmZpbmRFbE9yRWxzKCd4cGF0aCcsIG51bGwsIGZhbHNlLCAnc29tZSBjb250ZXh0Jykuc2hvdWxkLmJlLnJlamVjdGVkO1xuICAgIH0pO1xuICB9KTtcbiAgZGVzY3JpYmUoJ2lzS2V5Ym9hcmRTaG93bicsICgpID0+IHtcbiAgICBpdCgnc2hvdWxkIHJldHVybiB0cnVlIGlmIHRoZSBrZXlib2FyZCBpcyBzaG93bicsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBkcml2ZXIuYWRiID0ge307XG4gICAgICBkcml2ZXIuYWRiLmlzU29mdEtleWJvYXJkUHJlc2VudCA9ICgpID0+IHsgcmV0dXJuIHsgaXNLZXlib2FyZFNob3duOiB0cnVlLCBjYW5DbG9zZUtleWJvYXJkOiB0cnVlIH07IH07XG4gICAgICAoYXdhaXQgZHJpdmVyLmlzS2V5Ym9hcmRTaG93bigpKS5zaG91bGQuZXF1YWwodHJ1ZSk7XG4gICAgfSk7XG4gICAgaXQoJ3Nob3VsZCByZXR1cm4gZmFsc2UgaWYgdGhlIGtleWJvYXJkIGlzIG5vdCBzaG93bicsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBkcml2ZXIuYWRiID0ge307XG4gICAgICBkcml2ZXIuYWRiLmlzU29mdEtleWJvYXJkUHJlc2VudCA9ICgpID0+IHsgcmV0dXJuIHsgaXNLZXlib2FyZFNob3duOiBmYWxzZSwgY2FuQ2xvc2VLZXlib2FyZDogdHJ1ZSB9OyB9O1xuICAgICAgKGF3YWl0IGRyaXZlci5pc0tleWJvYXJkU2hvd24oKSkuc2hvdWxkLmVxdWFsKGZhbHNlKTtcbiAgICB9KTtcbiAgfSk7XG4gIGRlc2NyaWJlKCdJbnN0YWxsIEFwcCcsICgpID0+IHtcbiAgICBpdCgnc2hvdWxkIHRocm93IGFuIGVycm9yIGlmIEFQSyBkb2VzIG5vdCBleGlzdCcsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBhd2FpdCBkcml2ZXIuaW5zdGFsbEFwcCgnbm9uL2V4aXN0ZW50L2FwcC5hcGsnKS5zaG91bGQuYmUucmVqZWN0ZWRXaXRoKC9Db3VsZCBub3QgZmluZC8pO1xuICAgIH0pO1xuICB9KTtcbiAgZGVzY3JpYmUoJ1J1biBpbnN0YWxsZWQgQXBwJywgd2l0aE1vY2tzKHtoZWxwZXJzfSwgKG1vY2tzKSA9PiB7XG4gICAgaXQoJ3Nob3VsZCB0aHJvdyBlcnJvciBpZiBydW4gd2l0aCBmdWxsIHJlc2V0JywgYXN5bmMgKCkgPT4ge1xuICAgICAgZHJpdmVyID0gbmV3IEFuZHJvaWREcml2ZXIoKTtcbiAgICAgIGRyaXZlci5vcHRzID0ge2FwcFBhY2thZ2U6IFwiYXBwLnBhY2thZ2VcIiwgYXBwQWN0aXZpdHk6IFwiYWN0XCIsIGZ1bGxSZXNldDogdHJ1ZX07XG4gICAgICBkcml2ZXIuY2FwcyA9IHt9O1xuICAgICAgYXdhaXQgZHJpdmVyLmluaXRBVVQoKS5zaG91bGQuYmUucmVqZWN0ZWRXaXRoKC9GdWxsIHJlc2V0IHJlcXVpcmVzIGFuIGFwcCBjYXBhYmlsaXR5Lyk7XG4gICAgfSk7XG4gICAgaXQoJ3Nob3VsZCByZXNldCBpZiBydW4gd2l0aCBmYXN0IHJlc2V0JywgYXN5bmMgKCkgPT4ge1xuICAgICAgZHJpdmVyID0gbmV3IEFuZHJvaWREcml2ZXIoKTtcbiAgICAgIGRyaXZlci5vcHRzID0ge2FwcFBhY2thZ2U6IFwiYXBwLnBhY2thZ2VcIiwgYXBwQWN0aXZpdHk6IFwiYWN0XCIsIGZ1bGxSZXNldDogZmFsc2UsIGZhc3RSZXNldDogdHJ1ZX07XG4gICAgICBkcml2ZXIuY2FwcyA9IHt9O1xuICAgICAgZHJpdmVyLmFkYiA9IFwibW9ja19hZGJcIjtcbiAgICAgIG1vY2tzLmhlbHBlcnMuZXhwZWN0cyhcInJlc2V0QXBwXCIpLndpdGhFeGFjdEFyZ3MoXCJtb2NrX2FkYlwiLCB1bmRlZmluZWQsIFwiYXBwLnBhY2thZ2VcIiwgdHJ1ZSk7XG4gICAgICBhd2FpdCBkcml2ZXIuaW5pdEFVVCgpO1xuICAgICAgbW9ja3MuaGVscGVycy52ZXJpZnkoKTtcbiAgICB9KTtcbiAgICBpdCgnc2hvdWxkIGtlZXAgZGF0YSBpZiBydW4gd2l0aG91dCByZXNldCcsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBkcml2ZXIub3B0cyA9IHthcHBQYWNrYWdlOiBcImFwcC5wYWNrYWdlXCIsIGFwcEFjdGl2aXR5OiBcImFjdFwiLCBmdWxsUmVzZXQ6IGZhbHNlLCBmYXN0UmVzZXQ6IGZhbHNlfTtcbiAgICAgIGRyaXZlci5jYXBzID0ge307XG4gICAgICBtb2Nrcy5oZWxwZXJzLmV4cGVjdHMoXCJyZXNldEFwcFwiKS5uZXZlcigpO1xuICAgICAgYXdhaXQgZHJpdmVyLmluaXRBVVQoKTtcbiAgICAgIG1vY2tzLmhlbHBlcnMudmVyaWZ5KCk7XG4gICAgfSk7XG4gIH0pKTtcbiAgZGVzY3JpYmUoJ2dldFN0cmluZ3MnLCB3aXRoTW9ja3Moe2hlbHBlcnN9LCAobW9ja3MpID0+IHtcbiAgICBpdCgnc2hvdWxkIHJldHVybiBhcHAgc3RyaW5ncycsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBkcml2ZXIuYm9vdHN0cmFwID0ge307XG4gICAgICBkcml2ZXIuYm9vdHN0cmFwLnNlbmRBY3Rpb24gPSAoKSA9PiB7IHJldHVybiAnJzsgfTtcbiAgICAgIG1vY2tzLmhlbHBlcnMuZXhwZWN0cyhcInB1c2hTdHJpbmdzXCIpXG4gICAgICAgICAgLnJldHVybnMoeyd0ZXN0JzogJ2VuX3ZhbHVlJ30pO1xuICAgICAgbGV0IHN0cmluZ3MgPSBhd2FpdCBkcml2ZXIuZ2V0U3RyaW5ncygnZW4nKTtcbiAgICAgIHN0cmluZ3MudGVzdC5zaG91bGQuZXF1YWwoJ2VuX3ZhbHVlJyk7XG4gICAgICBtb2Nrcy5oZWxwZXJzLnZlcmlmeSgpO1xuICAgIH0pO1xuICAgIGl0KCdzaG91bGQgcmV0dXJuIGNhY2hlZCBhcHAgc3RyaW5ncyBmb3IgdGhlIHNwZWNpZmllZCBsYW5ndWFnZScsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBkcml2ZXIuYWRiID0ge307XG4gICAgICBkcml2ZXIuYWRiLmdldERldmljZUxhbmd1YWdlID0gKCkgPT4geyByZXR1cm4gJ2VuJzsgfTtcbiAgICAgIGRyaXZlci5hcGtTdHJpbmdzLmVuID0geyd0ZXN0JzogJ2VuX3ZhbHVlJ307XG4gICAgICBkcml2ZXIuYXBrU3RyaW5ncy5mciA9IHsndGVzdCc6ICdmcl92YWx1ZSd9O1xuICAgICAgbGV0IHN0cmluZ3MgPSBhd2FpdCBkcml2ZXIuZ2V0U3RyaW5ncygnZnInKTtcbiAgICAgIHN0cmluZ3MudGVzdC5zaG91bGQuZXF1YWwoJ2ZyX3ZhbHVlJyk7XG4gICAgfSk7XG4gICAgaXQoJ3Nob3VsZCByZXR1cm4gY2FjaGVkIGFwcCBzdHJpbmdzIGZvciB0aGUgZGV2aWNlIGxhbmd1YWdlJywgYXN5bmMgKCkgPT4ge1xuICAgICAgZHJpdmVyID0gbmV3IEFuZHJvaWREcml2ZXIoKTtcbiAgICAgIGRyaXZlci5hZGIgPSB7fTtcbiAgICAgIGRyaXZlci5hZGIuZ2V0RGV2aWNlTGFuZ3VhZ2UgPSAoKSA9PiB7IHJldHVybiAnZW4nOyB9O1xuICAgICAgZHJpdmVyLmFwa1N0cmluZ3MuZW4gPSB7J3Rlc3QnOiAnZW5fdmFsdWUnfTtcbiAgICAgIGRyaXZlci5hcGtTdHJpbmdzLmZyID0geyd0ZXN0JzogJ2ZyX3ZhbHVlJ307XG4gICAgICBsZXQgc3RyaW5ncyA9IGF3YWl0IGRyaXZlci5nZXRTdHJpbmdzKCk7XG4gICAgICBzdHJpbmdzLnRlc3Quc2hvdWxkLmVxdWFsKCdlbl92YWx1ZScpO1xuICAgIH0pO1xuICB9KSk7XG4gIGRlc2NyaWJlKCdnZXREaXNwbGF5RGVuc2l0eScsICgpID0+IHtcbiAgICBpdCgnc2hvdWxkIHJldHVybiB0aGUgZGlzcGxheSBkZW5zaXR5IG9mIGEgZGV2aWNlJywgYXN5bmMgKCkgPT4ge1xuICAgICAgZHJpdmVyID0gbmV3IEFuZHJvaWREcml2ZXIoKTtcbiAgICAgIGRyaXZlci5hZGIgPSB7fTtcbiAgICAgIGRyaXZlci5hZGIuc2hlbGwgPSAoKSA9PiB7IHJldHVybiAnMTIzJzsgfTtcbiAgICAgIChhd2FpdCBkcml2ZXIuZ2V0RGlzcGxheURlbnNpdHkoKSkuc2hvdWxkLmVxdWFsKDEyMyk7XG4gICAgfSk7XG4gICAgaXQoJ3Nob3VsZCByZXR1cm4gdGhlIGRpc3BsYXkgZGVuc2l0eSBvZiBhbiBlbXVsYXRvcicsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBkcml2ZXIuYWRiID0ge307XG4gICAgICBkcml2ZXIuYWRiLnNoZWxsID0gKGNtZCkgPT4ge1xuICAgICAgICBsZXQgam9pbmVkQ21kID0gY21kLmpvaW4oJyAnKTtcbiAgICAgICAgaWYgKGpvaW5lZENtZC5pbmRleE9mKCdyby5zZicpICE9PSAtMSkge1xuICAgICAgICAgIC8vIGRldmljZSBwcm9wZXJ0eSBsb29rIHVwXG4gICAgICAgICAgcmV0dXJuICcnO1xuICAgICAgICB9IGVsc2UgaWYgKGpvaW5lZENtZC5pbmRleE9mKCdxZW11LnNmJykgIT09IC0xKSB7XG4gICAgICAgICAgLy8gZW11bGF0b3IgcHJvcGVydHkgbG9vayB1cFxuICAgICAgICAgIHJldHVybiAnNDU2JztcbiAgICAgICAgfVxuICAgICAgICByZXR1cm4gJyc7XG4gICAgICB9O1xuICAgICAgKGF3YWl0IGRyaXZlci5nZXREaXNwbGF5RGVuc2l0eSgpKS5zaG91bGQuZXF1YWwoNDU2KTtcbiAgICB9KTtcbiAgICBpdCgnc2hvdWxkIHRocm93IGFuIGVycm9yIGlmIHRoZSBkaXNwbGF5IGRlbnNpdHkgcHJvcGVydHkgY2FuXFwndCBiZSBmb3VuZCcsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBkcml2ZXIuYWRiID0ge307XG4gICAgICBkcml2ZXIuYWRiLnNoZWxsID0gKCkgPT4geyByZXR1cm4gJyc7IH07XG4gICAgICBhd2FpdCBkcml2ZXIuZ2V0RGlzcGxheURlbnNpdHkoKS5zaG91bGQuYmUucmVqZWN0ZWRXaXRoKC9GYWlsZWQgdG8gZ2V0IGRpc3BsYXkgZGVuc2l0eSBwcm9wZXJ0eS8pO1xuICAgIH0pO1xuICAgIGl0KCdzaG91bGQgdGhyb3cgYW5kIGVycm9yIGlmIHRoZSBkaXNwbGF5IGRlbnNpdHkgaXMgbm90IGEgbnVtYmVyJywgYXN5bmMgKCkgPT4ge1xuICAgICAgZHJpdmVyID0gbmV3IEFuZHJvaWREcml2ZXIoKTtcbiAgICAgIGRyaXZlci5hZGIgPSB7fTtcbiAgICAgIGRyaXZlci5hZGIuc2hlbGwgPSAoKSA9PiB7IHJldHVybiAnYWJjJzsgfTtcbiAgICAgIGF3YWl0IGRyaXZlci5nZXREaXNwbGF5RGVuc2l0eSgpLnNob3VsZC5iZS5yZWplY3RlZFdpdGgoL0ZhaWxlZCB0byBnZXQgZGlzcGxheSBkZW5zaXR5IHByb3BlcnR5Lyk7XG4gICAgfSk7XG4gIH0pO1xuICBkZXNjcmliZSgncGFyc2VTdXJmYWNlTGluZScsICgpID0+IHtcbiAgICBpdCgnc2hvdWxkIHJldHVybiB2aXNpYmxlIHRydWUgaWYgdGhlIHN1cmZhY2UgaXMgdmlzaWJsZScsIGFzeW5jICgpID0+IHtcbiAgICAgIHBhcnNlU3VyZmFjZUxpbmUoJ3Nob3duPXRydWUgcmVjdD0xIDEgMSAxJykuc2hvdWxkLmJlLmVxbCh7XG4gICAgICAgIHZpc2libGU6IHRydWUsXG4gICAgICAgIHg6IDEsXG4gICAgICAgIHk6IDEsXG4gICAgICAgIHdpZHRoOiAxLFxuICAgICAgICBoZWlnaHQ6IDFcbiAgICAgIH0pO1xuICAgIH0pO1xuICAgIGl0KCdzaG91bGQgcmV0dXJuIHZpc2libGUgZmFsc2UgaWYgdGhlIHN1cmZhY2UgaXMgbm90IHZpc2libGUnLCBhc3luYyAoKSA9PiB7XG4gICAgICBwYXJzZVN1cmZhY2VMaW5lKCdzaG93bj1mYWxzZSByZWN0PTEgMSAxIDEnKS5zaG91bGQuYmUuZXFsKHtcbiAgICAgICAgdmlzaWJsZTogZmFsc2UsXG4gICAgICAgIHg6IDEsXG4gICAgICAgIHk6IDEsXG4gICAgICAgIHdpZHRoOiAxLFxuICAgICAgICBoZWlnaHQ6IDFcbiAgICAgIH0pO1xuICAgIH0pO1xuICAgIGl0KCdzaG91bGQgcmV0dXJuIHRoZSBwYXJzZWQgc3VyZmFjZSBib3VuZHMnLCBhc3luYyAoKSA9PiB7XG4gICAgICBwYXJzZVN1cmZhY2VMaW5lKCdzaG93bj10cnVlIHJlY3Q9KDEuMCwyLjApIDMuMCB4IDQuMCcpLnNob3VsZC5iZS5lcWwoe1xuICAgICAgICB2aXNpYmxlOiB0cnVlLFxuICAgICAgICB4OiAxLFxuICAgICAgICB5OiAyLFxuICAgICAgICB3aWR0aDogMyxcbiAgICAgICAgaGVpZ2h0OiA0XG4gICAgICB9KTtcbiAgICB9KTtcbiAgfSk7XG5cbiAgLy8gdGhlc2UgYXJlIHVzZWQgZm9yIGJvdGggcGFyc2VXaW5kb3dzIGFuZCBnZXRTeXN0ZW1CYXJzIHRlc3RzXG4gIGxldCB2YWxpZFdpbmRvd091dHB1dCA9IFtcbiAgICAnICBXaW5kb3cgIzEgRGVycCcsXG4gICAgJyAgICBzdHVmZicsXG4gICAgJyAgICAgIFN1cmZhY2U6IGRlcnAgc2hvd249ZmFsc2UgbGFsYWxhbGEgcmVjdD0oOS4wLDguMCkgNy4wIHggNi4wJyxcbiAgICAnICAgIG1vcmUgc3R1ZmYnLFxuICAgICcgIFdpbmRvdyAjMiBTdGF0dXNCYXInLFxuICAgICcgICAgYmxhaCBibGFoIGJsYWgnLFxuICAgICcgICAgICBTdXJmYWNlOiBibGFoIGJsYWggc2hvd249dHJ1ZSBibGFoIGJsYWggcmVjdD0oMS4wLDIuMCkgMy4wIHggNC4wJyxcbiAgICAnICAgIGJsYWggYmxhaCBibGFoJyxcbiAgICAnICBXaW5kb3cgIzMgTmF2aWdhdGlvbkJhcicsXG4gICAgJyAgICB3b21wIHdvbXAnLFxuICAgICcgICAgICBTdXJmYWNlOiBibGFoIGJsYWggc2hvd249ZmFsc2Ugd29tcCB3b21wIHJlY3Q9KDUuMCw2LjApIDUwLjAgeCA2MC4wJyxcbiAgICAnICAgIHF3ZXJ0eSBhc2QgenhjJ1xuICBdLmpvaW4oJ1xcbicpO1xuICBsZXQgdmFsaWRTeXN0ZW1CYXJzID0ge1xuICAgIHN0YXR1c0Jhcjoge3Zpc2libGU6IHRydWUsIHg6IDEsIHk6IDIsIHdpZHRoOiAzLCBoZWlnaHQ6IDR9LFxuICAgIG5hdmlnYXRpb25CYXI6IHt2aXNpYmxlOiBmYWxzZSwgeDogNSwgeTogNiwgd2lkdGg6IDUwLCBoZWlnaHQ6IDYwfVxuICB9O1xuXG4gIGRlc2NyaWJlKCdwYXJzZVdpbmRvd3MnLCAoKSA9PiB7XG4gICAgaXQoJ3Nob3VsZCB0aHJvdyBhbiBlcnJvciBpZiB0aGUgc3RhdHVzIGJhciBpbmZvIHdhc25cXCd0IGZvdW5kJywgYXN5bmMgKCkgPT4ge1xuICAgICAgZXhwZWN0KCgpID0+IHsgcGFyc2VXaW5kb3dzKCcnKTsgfSlcbiAgICAgICAgLnRvLnRocm93KEVycm9yLCAvRmFpbGVkIHRvIHBhcnNlIHN0YXR1cyBiYXIgaW5mb3JtYXRpb24uLyk7XG4gICAgfSk7XG4gICAgaXQoJ3Nob3VsZCB0aHJvdyBhbiBlcnJvciBpZiB0aGUgbmF2aWdhdGlvbiBiYXIgaW5mbyB3YXNuXFwndCBmb3VuZCcsIGFzeW5jICgpID0+IHtcbiAgICAgIGxldCB3aW5kb3dPdXRwdXQgPSBbXG4gICAgICAgICcgIFdpbmRvdyAjMSBTdGF0dXNCYXInLFxuICAgICAgICAnICAgIGJsYWggYmxhaCBibGFoJyxcbiAgICAgICAgJyAgICAgIFN1cmZhY2U6IGJsYWggYmxhaCBzaG93bj10cnVlIGJsYWggYmxhaCByZWN0PSgxLjAsMi4wKSAzLjAgeCA0LjAnLFxuICAgICAgICAnICAgIGJsYWggYmxhaCBibGFoJ1xuICAgICAgXS5qb2luKCdcXG4nKTtcbiAgICAgIGV4cGVjdCgoKSA9PiB7IHBhcnNlV2luZG93cyh3aW5kb3dPdXRwdXQpOyB9KVxuICAgICAgICAudG8udGhyb3coRXJyb3IsIC9GYWlsZWQgdG8gcGFyc2UgbmF2aWdhdGlvbiBiYXIgaW5mb3JtYXRpb24uLyk7XG4gICAgfSk7XG4gICAgaXQoJ3Nob3VsZCByZXR1cm4gc3RhdHVzIGFuZCBuYXZpZ2F0aW9uIGJhciBpbmZvIHdoZW4gYm90aCBhcmUgZ2l2ZW4nLCBhc3luYyAoKSA9PiB7XG4gICAgICBwYXJzZVdpbmRvd3ModmFsaWRXaW5kb3dPdXRwdXQpLnNob3VsZC5iZS5lcWwodmFsaWRTeXN0ZW1CYXJzKTtcbiAgICB9KTtcbiAgfSk7XG4gIGRlc2NyaWJlKCdnZXRTeXN0ZW1CYXJzJywgKCkgPT4ge1xuICAgIGl0KCdzaG91bGQgdGhyb3cgYW4gZXJyb3IgaWYgdGhlcmVcXCdzIG5vIHdpbmRvdyBtYW5hZ2VyIG91dHB1dCcsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBkcml2ZXIuYWRiID0ge307XG4gICAgICBkcml2ZXIuYWRiLnNoZWxsID0gKCkgPT4geyByZXR1cm4gJyc7IH07XG4gICAgICBhd2FpdCBkcml2ZXIuZ2V0U3lzdGVtQmFycygpLnNob3VsZC5iZS5yZWplY3RlZFdpdGgoL0RpZCBub3QgZ2V0IHdpbmRvdyBtYW5hZ2VyIG91dHB1dC4vKTtcbiAgICB9KTtcbiAgICBpdCgnc2hvdWxkIHJldHVybiB0aGUgcGFyc2VkIHN5c3RlbSBiYXIgaW5mbycsIGFzeW5jICgpID0+IHtcbiAgICAgIGRyaXZlciA9IG5ldyBBbmRyb2lkRHJpdmVyKCk7XG4gICAgICBkcml2ZXIuYWRiID0ge307XG4gICAgICBkcml2ZXIuYWRiLnNoZWxsID0gKCkgPT4geyByZXR1cm4gdmFsaWRXaW5kb3dPdXRwdXQ7IH07XG4gICAgICAoYXdhaXQgZHJpdmVyLmdldFN5c3RlbUJhcnMoKSkuc2hvdWxkLmJlLmVxbCh2YWxpZFN5c3RlbUJhcnMpO1xuICAgIH0pO1xuICB9KTtcbn0pO1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLi8uLi8uLiJ9
