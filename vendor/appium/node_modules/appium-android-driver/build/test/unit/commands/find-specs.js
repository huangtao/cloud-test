'use strict';

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

var _chai = require('chai');

var _chai2 = _interopRequireDefault(_chai);

var _chaiAsPromised = require('chai-as-promised');

var _chaiAsPromised2 = _interopRequireDefault(_chaiAsPromised);

var _sinon = require('sinon');

var _sinon2 = _interopRequireDefault(_sinon);

var _appiumAndroidBootstrap = require('appium-android-bootstrap');

var _appiumAndroidBootstrap2 = _interopRequireDefault(_appiumAndroidBootstrap);

var _ = require('../../..');

var _2 = _interopRequireDefault(_);

var driver = undefined;
var sandbox = _sinon2['default'].sandbox.create();
_chai2['default'].should();
_chai2['default'].use(_chaiAsPromised2['default']);

describe('Find', function () {
  before(function () {
    driver = new _2['default']();
    driver.bootstrap = new _appiumAndroidBootstrap2['default']();
    sandbox.stub(driver, 'validateLocatorStrategy');
    sandbox.stub(driver.bootstrap, 'sendAction');
  });
  after(function () {
    sandbox.restore();
  });
  describe('findElorEls', function () {
    it('should throw an error if both strategy and context are defined', function () {
      driver.findElOrEls('xpath', 'selector', false, 'some context').should.be.rejectedWith(/from an element/);
    });
    it('should throw an error if there is no selector', function () {
      driver.findElOrEls('xpath', null, false, 'some context').should.be.rejectedWith(/provide a selector/);
    });
  });
});
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvdW5pdC9jb21tYW5kcy9maW5kLXNwZWNzLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7b0JBQWlCLE1BQU07Ozs7OEJBQ0ksa0JBQWtCOzs7O3FCQUMzQixPQUFPOzs7O3NDQUNILDBCQUEwQjs7OztnQkFDdEIsVUFBVTs7OztBQUVwQyxJQUFJLE1BQU0sWUFBQSxDQUFDO0FBQ1gsSUFBSSxPQUFPLEdBQUcsbUJBQU0sT0FBTyxDQUFDLE1BQU0sRUFBRSxDQUFDO0FBQ3JDLGtCQUFLLE1BQU0sRUFBRSxDQUFDO0FBQ2Qsa0JBQUssR0FBRyw2QkFBZ0IsQ0FBQzs7QUFFekIsUUFBUSxDQUFDLE1BQU0sRUFBRSxZQUFNO0FBQ3JCLFFBQU0sQ0FBQyxZQUFNO0FBQ1gsVUFBTSxHQUFHLG1CQUFtQixDQUFDO0FBQzdCLFVBQU0sQ0FBQyxTQUFTLEdBQUcseUNBQWUsQ0FBQztBQUNuQyxXQUFPLENBQUMsSUFBSSxDQUFDLE1BQU0sRUFBRSx5QkFBeUIsQ0FBQyxDQUFDO0FBQ2hELFdBQU8sQ0FBQyxJQUFJLENBQUMsTUFBTSxDQUFDLFNBQVMsRUFBRSxZQUFZLENBQUMsQ0FBQztHQUM5QyxDQUFDLENBQUM7QUFDSCxPQUFLLENBQUMsWUFBTTtBQUNWLFdBQU8sQ0FBQyxPQUFPLEVBQUUsQ0FBQztHQUNuQixDQUFDLENBQUM7QUFDSCxVQUFRLENBQUMsYUFBYSxFQUFFLFlBQU07QUFDNUIsTUFBRSxDQUFDLGdFQUFnRSxFQUFFLFlBQU07QUFDekUsWUFBTSxDQUFDLFdBQVcsQ0FBQyxPQUFPLEVBQUUsVUFBVSxFQUFFLEtBQUssRUFBRSxjQUFjLENBQUMsQ0FBQyxNQUFNLENBQUMsRUFBRSxDQUFDLFlBQVksQ0FBQyxpQkFBaUIsQ0FBQyxDQUFDO0tBQzFHLENBQUMsQ0FBQztBQUNILE1BQUUsQ0FBQywrQ0FBK0MsRUFBRSxZQUFNO0FBQ3hELFlBQU0sQ0FBQyxXQUFXLENBQUMsT0FBTyxFQUFFLElBQUksRUFBRSxLQUFLLEVBQUUsY0FBYyxDQUFDLENBQUMsTUFBTSxDQUFDLEVBQUUsQ0FBQyxZQUFZLENBQUMsb0JBQW9CLENBQUMsQ0FBQztLQUN2RyxDQUFDLENBQUM7R0FDSixDQUFDLENBQUM7Q0FDSixDQUFDLENBQUMiLCJmaWxlIjoidGVzdC91bml0L2NvbW1hbmRzL2ZpbmQtc3BlY3MuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgY2hhaSBmcm9tICdjaGFpJztcbmltcG9ydCBjaGFpQXNQcm9taXNlZCBmcm9tICdjaGFpLWFzLXByb21pc2VkJztcbmltcG9ydCBzaW5vbiBmcm9tICdzaW5vbic7XG5pbXBvcnQgQm9vdHN0cmFwIGZyb20gJ2FwcGl1bS1hbmRyb2lkLWJvb3RzdHJhcCc7XG5pbXBvcnQgQW5kcm9pZERyaXZlciBmcm9tICcuLi8uLi8uLic7XG5cbmxldCBkcml2ZXI7XG5sZXQgc2FuZGJveCA9IHNpbm9uLnNhbmRib3guY3JlYXRlKCk7XG5jaGFpLnNob3VsZCgpO1xuY2hhaS51c2UoY2hhaUFzUHJvbWlzZWQpO1xuXG5kZXNjcmliZSgnRmluZCcsICgpID0+IHtcbiAgYmVmb3JlKCgpID0+IHtcbiAgICBkcml2ZXIgPSBuZXcgQW5kcm9pZERyaXZlcigpO1xuICAgIGRyaXZlci5ib290c3RyYXAgPSBuZXcgQm9vdHN0cmFwKCk7XG4gICAgc2FuZGJveC5zdHViKGRyaXZlciwgJ3ZhbGlkYXRlTG9jYXRvclN0cmF0ZWd5Jyk7XG4gICAgc2FuZGJveC5zdHViKGRyaXZlci5ib290c3RyYXAsICdzZW5kQWN0aW9uJyk7XG4gIH0pO1xuICBhZnRlcigoKSA9PiB7XG4gICAgc2FuZGJveC5yZXN0b3JlKCk7XG4gIH0pO1xuICBkZXNjcmliZSgnZmluZEVsb3JFbHMnLCAoKSA9PiB7XG4gICAgaXQoJ3Nob3VsZCB0aHJvdyBhbiBlcnJvciBpZiBib3RoIHN0cmF0ZWd5IGFuZCBjb250ZXh0IGFyZSBkZWZpbmVkJywgKCkgPT4ge1xuICAgICAgZHJpdmVyLmZpbmRFbE9yRWxzKCd4cGF0aCcsICdzZWxlY3RvcicsIGZhbHNlLCAnc29tZSBjb250ZXh0Jykuc2hvdWxkLmJlLnJlamVjdGVkV2l0aCgvZnJvbSBhbiBlbGVtZW50Lyk7XG4gICAgfSk7XG4gICAgaXQoJ3Nob3VsZCB0aHJvdyBhbiBlcnJvciBpZiB0aGVyZSBpcyBubyBzZWxlY3RvcicsICgpID0+IHtcbiAgICAgIGRyaXZlci5maW5kRWxPckVscygneHBhdGgnLCBudWxsLCBmYWxzZSwgJ3NvbWUgY29udGV4dCcpLnNob3VsZC5iZS5yZWplY3RlZFdpdGgoL3Byb3ZpZGUgYSBzZWxlY3Rvci8pO1xuICAgIH0pO1xuICB9KTtcbn0pO1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLi8uLi8uLiJ9
