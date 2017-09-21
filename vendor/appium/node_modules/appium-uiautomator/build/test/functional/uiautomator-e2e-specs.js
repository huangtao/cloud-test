// transpile :mocha

'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

var _chai = require('chai');

var _chai2 = _interopRequireDefault(_chai);

var _chaiAsPromised = require('chai-as-promised');

var _chaiAsPromised2 = _interopRequireDefault(_chaiAsPromised);

var _ = require('../..');

var _2 = _interopRequireDefault(_);

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _appiumAdb = require('appium-adb');

var _appiumAdb2 = _interopRequireDefault(_appiumAdb);

_chai2['default'].should();
_chai2['default'].use(_chaiAsPromised2['default']);

describe('UiAutomator', function () {
  var _this = this;

  var uiAutomator = undefined,
      adb = undefined;
  var rootDir = _path2['default'].resolve(__dirname, '..', '..', process.env.NO_PRECOMPILE ? '' : '..');
  var bootstrapJar = _path2['default'].resolve(rootDir, 'test', 'fixtures', 'AppiumBootstrap.jar');
  beforeEach(function callee$1$0() {
    return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
      while (1) switch (context$2$0.prev = context$2$0.next) {
        case 0:
          context$2$0.next = 2;
          return _regeneratorRuntime.awrap(_appiumAdb2['default'].createADB());

        case 2:
          adb = context$2$0.sent;

          uiAutomator = new _2['default'](adb);

        case 4:
        case 'end':
          return context$2$0.stop();
      }
    }, null, _this);
  });

  it("should start and shutdown uiAutomator", function callee$1$0() {
    var startDetector;
    return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
      while (1) switch (context$2$0.prev = context$2$0.next) {
        case 0:
          startDetector = function startDetector(s) {
            return (/Appium Socket Server Ready/.test(s)
            );
          };

          context$2$0.next = 3;
          return _regeneratorRuntime.awrap(uiAutomator.start(bootstrapJar, 'io.appium.android.bootstrap.Bootstrap', startDetector, '-e', 'disableAndroidWatchers', true));

        case 3:
          uiAutomator.state.should.eql('online');
          context$2$0.next = 6;
          return _regeneratorRuntime.awrap(uiAutomator.shutdown());

        case 6:
          uiAutomator.state.should.eql('stopped');

        case 7:
        case 'end':
          return context$2$0.stop();
      }
    }, null, _this);
  });
});
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvZnVuY3Rpb25hbC91aWF1dG9tYXRvci1lMmUtc3BlY3MuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7b0JBRWlCLE1BQU07Ozs7OEJBQ0ksa0JBQWtCOzs7O2dCQUNyQixPQUFPOzs7O29CQUNkLE1BQU07Ozs7eUJBQ1AsWUFBWTs7OztBQUc1QixrQkFBSyxNQUFNLEVBQUUsQ0FBQztBQUNkLGtCQUFLLEdBQUcsNkJBQWdCLENBQUM7O0FBRXpCLFFBQVEsQ0FBQyxhQUFhLEVBQUUsWUFBWTs7O0FBQ2xDLE1BQUksV0FBVyxZQUFBO01BQUUsR0FBRyxZQUFBLENBQUM7QUFDckIsTUFBSSxPQUFPLEdBQUcsa0JBQUssT0FBTyxDQUFDLFNBQVMsRUFBRSxJQUFJLEVBQUUsSUFBSSxFQUNyQixPQUFPLENBQUMsR0FBRyxDQUFDLGFBQWEsR0FBRyxFQUFFLEdBQUcsSUFBSSxDQUFDLENBQUM7QUFDbEUsTUFBTSxZQUFZLEdBQUcsa0JBQUssT0FBTyxDQUFDLE9BQU8sRUFBRSxNQUFNLEVBQUUsVUFBVSxFQUFFLHFCQUFxQixDQUFDLENBQUM7QUFDdEYsWUFBVSxDQUFDOzs7OzsyQ0FDRyx1QkFBSSxTQUFTLEVBQUU7OztBQUEzQixhQUFHOztBQUNILHFCQUFXLEdBQUcsa0JBQWdCLEdBQUcsQ0FBQyxDQUFDOzs7Ozs7O0dBQ3BDLENBQUMsQ0FBQzs7QUFFSCxJQUFFLENBQUMsdUNBQXVDLEVBQUU7UUFDdEMsYUFBYTs7OztBQUFiLHVCQUFhLEdBQUcsU0FBaEIsYUFBYSxDQUFJLENBQUMsRUFBSztBQUFFLG1CQUFPLDZCQUE0QixDQUFDLElBQUksQ0FBQyxDQUFDLENBQUM7Y0FBQztXQUFFOzs7MkNBQ3JFLFdBQVcsQ0FBQyxLQUFLLENBQUMsWUFBWSxFQUFFLHVDQUF1QyxFQUNyRCxhQUFhLEVBQUUsSUFBSSxFQUFFLHdCQUF3QixFQUFFLElBQUksQ0FBQzs7O0FBQzVFLHFCQUFXLENBQUMsS0FBSyxDQUFDLE1BQU0sQ0FBQyxHQUFHLENBQUMsUUFBUSxDQUFDLENBQUM7OzJDQUNqQyxXQUFXLENBQUMsUUFBUSxFQUFFOzs7QUFDNUIscUJBQVcsQ0FBQyxLQUFLLENBQUMsTUFBTSxDQUFDLEdBQUcsQ0FBQyxTQUFTLENBQUMsQ0FBQzs7Ozs7OztHQUN6QyxDQUFDLENBQUM7Q0FDSixDQUFDLENBQUMiLCJmaWxlIjoidGVzdC9mdW5jdGlvbmFsL3VpYXV0b21hdG9yLWUyZS1zcGVjcy5qcyIsInNvdXJjZXNDb250ZW50IjpbIi8vIHRyYW5zcGlsZSA6bW9jaGFcblxuaW1wb3J0IGNoYWkgZnJvbSAnY2hhaSc7XG5pbXBvcnQgY2hhaUFzUHJvbWlzZWQgZnJvbSAnY2hhaS1hcy1wcm9taXNlZCc7XG5pbXBvcnQgVWlBdXRvbWF0b3IgZnJvbSAnLi4vLi4nO1xuaW1wb3J0IHBhdGggZnJvbSAncGF0aCc7XG5pbXBvcnQgQURCIGZyb20gJ2FwcGl1bS1hZGInO1xuXG5cbmNoYWkuc2hvdWxkKCk7XG5jaGFpLnVzZShjaGFpQXNQcm9taXNlZCk7XG5cbmRlc2NyaWJlKCdVaUF1dG9tYXRvcicsIGZ1bmN0aW9uICgpIHtcbiAgbGV0IHVpQXV0b21hdG9yLCBhZGI7XG4gIGxldCByb290RGlyID0gcGF0aC5yZXNvbHZlKF9fZGlybmFtZSwgJy4uJywgJy4uJyxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJvY2Vzcy5lbnYuTk9fUFJFQ09NUElMRSA/ICcnIDogJy4uJyk7XG4gIGNvbnN0IGJvb3RzdHJhcEphciA9IHBhdGgucmVzb2x2ZShyb290RGlyLCAndGVzdCcsICdmaXh0dXJlcycsICdBcHBpdW1Cb290c3RyYXAuamFyJyk7XG4gIGJlZm9yZUVhY2goYXN5bmMgKCkgPT4ge1xuICAgIGFkYiA9IGF3YWl0IEFEQi5jcmVhdGVBREIoKTtcbiAgICB1aUF1dG9tYXRvciA9IG5ldyBVaUF1dG9tYXRvcihhZGIpO1xuICB9KTtcblxuICBpdChcInNob3VsZCBzdGFydCBhbmQgc2h1dGRvd24gdWlBdXRvbWF0b3JcIiwgYXN5bmMgKCkgPT4ge1xuICAgIGxldCBzdGFydERldGVjdG9yID0gKHMpID0+IHsgcmV0dXJuIC9BcHBpdW0gU29ja2V0IFNlcnZlciBSZWFkeS8udGVzdChzKTsgfTtcbiAgICBhd2FpdCB1aUF1dG9tYXRvci5zdGFydChib290c3RyYXBKYXIsICdpby5hcHBpdW0uYW5kcm9pZC5ib290c3RyYXAuQm9vdHN0cmFwJyxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydERldGVjdG9yLCAnLWUnLCAnZGlzYWJsZUFuZHJvaWRXYXRjaGVycycsIHRydWUpO1xuICAgIHVpQXV0b21hdG9yLnN0YXRlLnNob3VsZC5lcWwoJ29ubGluZScpO1xuICAgIGF3YWl0IHVpQXV0b21hdG9yLnNodXRkb3duKCk7XG4gICAgdWlBdXRvbWF0b3Iuc3RhdGUuc2hvdWxkLmVxbCgnc3RvcHBlZCcpO1xuICB9KTtcbn0pO1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLi8uLiJ9
