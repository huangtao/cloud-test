require('source-map-support').install();

/* global describe:true, it:true, before:true, after:true */

'use strict';

var _slicedToArray = require('babel-runtime/helpers/sliced-to-array')['default'];

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

var _this = this;

var _ = require('../..');

var _child_process = require('child_process');

var _child_process2 = _interopRequireDefault(_child_process);

var _chai = require('chai');

var _chai2 = _interopRequireDefault(_chai);

var _asyncbox = require('asyncbox');

var _chromedriver = require('chromedriver');

var _chromedriver2 = _interopRequireDefault(_chromedriver);

var _chaiAsPromised = require('chai-as-promised');

var _chaiAsPromised2 = _interopRequireDefault(_chaiAsPromised);

var should = _chai2['default'].should();
_chai2['default'].use(_chaiAsPromised2['default']);

describe('proxy', function () {
  var cdProc = null;
  var j = new _.JWProxy();
  before(function callee$1$0() {
    return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
      while (1) switch (context$2$0.prev = context$2$0.next) {
        case 0:
          cdProc = _child_process2['default'].spawn(_chromedriver2['default'].path, ['--url-base=/wd/hub', '--port=4444']);
          context$2$0.next = 3;
          return _regeneratorRuntime.awrap((0, _asyncbox.sleep)(1000));

        case 3:
        case 'end':
          return context$2$0.stop();
      }
    }, null, _this);
  });
  after(function callee$1$0() {
    return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
      while (1) switch (context$2$0.prev = context$2$0.next) {
        case 0:
          cdProc.kill();
          context$2$0.next = 3;
          return _regeneratorRuntime.awrap((0, _asyncbox.sleep)(500));

        case 3:
        case 'end':
          return context$2$0.stop();
      }
    }, null, _this);
  });

  it('should proxy status straight', function callee$1$0() {
    var _ref, _ref2, res, resBody;

    return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
      while (1) switch (context$2$0.prev = context$2$0.next) {
        case 0:
          context$2$0.next = 2;
          return _regeneratorRuntime.awrap(j.proxy('/status', 'GET'));

        case 2:
          _ref = context$2$0.sent;
          _ref2 = _slicedToArray(_ref, 2);
          res = _ref2[0];
          resBody = _ref2[1];

          resBody = JSON.parse(resBody);
          res.statusCode.should.equal(200);
          resBody.status.should.equal(0);
          resBody.value.should.have.property('build');

        case 10:
        case 'end':
          return context$2$0.stop();
      }
    }, null, _this);
  });
  it('should proxy status as command', function callee$1$0() {
    var res;
    return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
      while (1) switch (context$2$0.prev = context$2$0.next) {
        case 0:
          context$2$0.next = 2;
          return _regeneratorRuntime.awrap(j.command('/status', 'GET'));

        case 2:
          res = context$2$0.sent;

          res.should.have.property('build');

        case 4:
        case 'end':
          return context$2$0.stop();
      }
    }, null, _this);
  });
  it('should start a new session', function callee$1$0() {
    var caps, res;
    return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
      while (1) switch (context$2$0.prev = context$2$0.next) {
        case 0:
          caps = { browserName: 'chrome' };
          context$2$0.next = 3;
          return _regeneratorRuntime.awrap(j.command('/session', 'POST', { desiredCapabilities: caps }));

        case 3:
          res = context$2$0.sent;

          res.should.have.property('browserName');
          j.sessionId.should.have.length(32);

        case 6:
        case 'end':
          return context$2$0.stop();
      }
    }, null, _this);
  });
  it('should quit a session', function callee$1$0() {
    var res;
    return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
      while (1) switch (context$2$0.prev = context$2$0.next) {
        case 0:
          context$2$0.next = 2;
          return _regeneratorRuntime.awrap(j.command('', 'DELETE'));

        case 2:
          res = context$2$0.sent;

          should.not.exist(res);

        case 4:
        case 'end':
          return context$2$0.stop();
      }
    }, null, _this);
  });
});
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvanNvbndwLXByb3h5L3Byb3h5LWUyZS1zcGVjcy5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7O2dCQUd3QixPQUFPOzs2QkFDaEIsZUFBZTs7OztvQkFDYixNQUFNOzs7O3dCQUNELFVBQVU7OzRCQUNQLGNBQWM7Ozs7OEJBQ1osa0JBQWtCOzs7O0FBRzdDLElBQUksTUFBTSxHQUFHLGtCQUFLLE1BQU0sRUFBRSxDQUFDO0FBQzNCLGtCQUFLLEdBQUcsNkJBQWdCLENBQUM7O0FBRXpCLFFBQVEsQ0FBQyxPQUFPLEVBQUUsWUFBTTtBQUN0QixNQUFJLE1BQU0sR0FBRyxJQUFJLENBQUM7QUFDbEIsTUFBSSxDQUFDLEdBQUcsZUFBYSxDQUFDO0FBQ3RCLFFBQU0sQ0FBQzs7OztBQUNMLGdCQUFNLEdBQUcsMkJBQUcsS0FBSyxDQUFDLDBCQUFhLElBQUksRUFBRSxDQUFDLG9CQUFvQixFQUFFLGFBQWEsQ0FBQyxDQUFDLENBQUM7OzJDQUN0RSxxQkFBTSxJQUFJLENBQUM7Ozs7Ozs7R0FDbEIsQ0FBQyxDQUFDO0FBQ0gsT0FBSyxDQUFDOzs7O0FBQ0osZ0JBQU0sQ0FBQyxJQUFJLEVBQUUsQ0FBQzs7MkNBQ1IscUJBQU0sR0FBRyxDQUFDOzs7Ozs7O0dBQ2pCLENBQUMsQ0FBQzs7QUFFSCxJQUFFLENBQUMsOEJBQThCLEVBQUU7cUJBQzVCLEdBQUcsRUFBRSxPQUFPOzs7Ozs7MkNBQVUsQ0FBQyxDQUFDLEtBQUssQ0FBQyxTQUFTLEVBQUUsS0FBSyxDQUFDOzs7OztBQUEvQyxhQUFHO0FBQUUsaUJBQU87O0FBQ2pCLGlCQUFPLEdBQUcsSUFBSSxDQUFDLEtBQUssQ0FBQyxPQUFPLENBQUMsQ0FBQztBQUM5QixhQUFHLENBQUMsVUFBVSxDQUFDLE1BQU0sQ0FBQyxLQUFLLENBQUMsR0FBRyxDQUFDLENBQUM7QUFDakMsaUJBQU8sQ0FBQyxNQUFNLENBQUMsTUFBTSxDQUFDLEtBQUssQ0FBQyxDQUFDLENBQUMsQ0FBQztBQUMvQixpQkFBTyxDQUFDLEtBQUssQ0FBQyxNQUFNLENBQUMsSUFBSSxDQUFDLFFBQVEsQ0FBQyxPQUFPLENBQUMsQ0FBQzs7Ozs7OztHQUM3QyxDQUFDLENBQUM7QUFDSCxJQUFFLENBQUMsZ0NBQWdDLEVBQUU7UUFDL0IsR0FBRzs7Ozs7MkNBQVMsQ0FBQyxDQUFDLE9BQU8sQ0FBQyxTQUFTLEVBQUUsS0FBSyxDQUFDOzs7QUFBdkMsYUFBRzs7QUFDUCxhQUFHLENBQUMsTUFBTSxDQUFDLElBQUksQ0FBQyxRQUFRLENBQUMsT0FBTyxDQUFDLENBQUM7Ozs7Ozs7R0FDbkMsQ0FBQyxDQUFDO0FBQ0gsSUFBRSxDQUFDLDRCQUE0QixFQUFFO1FBQzNCLElBQUksRUFDSixHQUFHOzs7O0FBREgsY0FBSSxHQUFHLEVBQUMsV0FBVyxFQUFFLFFBQVEsRUFBQzs7MkNBQ2xCLENBQUMsQ0FBQyxPQUFPLENBQUMsVUFBVSxFQUFFLE1BQU0sRUFBRSxFQUFDLG1CQUFtQixFQUFFLElBQUksRUFBQyxDQUFDOzs7QUFBdEUsYUFBRzs7QUFDUCxhQUFHLENBQUMsTUFBTSxDQUFDLElBQUksQ0FBQyxRQUFRLENBQUMsYUFBYSxDQUFDLENBQUM7QUFDeEMsV0FBQyxDQUFDLFNBQVMsQ0FBQyxNQUFNLENBQUMsSUFBSSxDQUFDLE1BQU0sQ0FBQyxFQUFFLENBQUMsQ0FBQzs7Ozs7OztHQUNwQyxDQUFDLENBQUM7QUFDSCxJQUFFLENBQUMsdUJBQXVCLEVBQUU7UUFDdEIsR0FBRzs7Ozs7MkNBQVMsQ0FBQyxDQUFDLE9BQU8sQ0FBQyxFQUFFLEVBQUUsUUFBUSxDQUFDOzs7QUFBbkMsYUFBRzs7QUFDUCxnQkFBTSxDQUFDLEdBQUcsQ0FBQyxLQUFLLENBQUMsR0FBRyxDQUFDLENBQUM7Ozs7Ozs7R0FDdkIsQ0FBQyxDQUFDO0NBQ0osQ0FBQyxDQUFDIiwiZmlsZSI6InRlc3QvanNvbndwLXByb3h5L3Byb3h5LWUyZS1zcGVjcy5qcyIsInNvdXJjZXNDb250ZW50IjpbIi8vIHRyYW5zcGlsZTptb2NoYVxuLyogZ2xvYmFsIGRlc2NyaWJlOnRydWUsIGl0OnRydWUsIGJlZm9yZTp0cnVlLCBhZnRlcjp0cnVlICovXG5cbmltcG9ydCB7IEpXUHJveHkgfSBmcm9tICcuLi8uLic7XG5pbXBvcnQgY3AgZnJvbSAnY2hpbGRfcHJvY2Vzcyc7XG5pbXBvcnQgY2hhaSBmcm9tICdjaGFpJztcbmltcG9ydCB7IHNsZWVwIH0gZnJvbSAnYXN5bmNib3gnO1xuaW1wb3J0IGNocm9tZWRyaXZlciBmcm9tICdjaHJvbWVkcml2ZXInO1xuaW1wb3J0IGNoYWlBc1Byb21pc2VkIGZyb20gJ2NoYWktYXMtcHJvbWlzZWQnO1xuXG5cbmxldCBzaG91bGQgPSBjaGFpLnNob3VsZCgpO1xuY2hhaS51c2UoY2hhaUFzUHJvbWlzZWQpO1xuXG5kZXNjcmliZSgncHJveHknLCAoKSA9PiB7XG4gIGxldCBjZFByb2MgPSBudWxsO1xuICBsZXQgaiA9IG5ldyBKV1Byb3h5KCk7XG4gIGJlZm9yZShhc3luYyAoKSA9PiB7XG4gICAgY2RQcm9jID0gY3Auc3Bhd24oY2hyb21lZHJpdmVyLnBhdGgsIFsnLS11cmwtYmFzZT0vd2QvaHViJywgJy0tcG9ydD00NDQ0J10pO1xuICAgIGF3YWl0IHNsZWVwKDEwMDApO1xuICB9KTtcbiAgYWZ0ZXIoYXN5bmMgKCkgPT4ge1xuICAgIGNkUHJvYy5raWxsKCk7XG4gICAgYXdhaXQgc2xlZXAoNTAwKTtcbiAgfSk7XG5cbiAgaXQoJ3Nob3VsZCBwcm94eSBzdGF0dXMgc3RyYWlnaHQnLCBhc3luYyAoKSA9PiB7XG4gICAgbGV0IFtyZXMsIHJlc0JvZHldID0gYXdhaXQgai5wcm94eSgnL3N0YXR1cycsICdHRVQnKTtcbiAgICByZXNCb2R5ID0gSlNPTi5wYXJzZShyZXNCb2R5KTtcbiAgICByZXMuc3RhdHVzQ29kZS5zaG91bGQuZXF1YWwoMjAwKTtcbiAgICByZXNCb2R5LnN0YXR1cy5zaG91bGQuZXF1YWwoMCk7XG4gICAgcmVzQm9keS52YWx1ZS5zaG91bGQuaGF2ZS5wcm9wZXJ0eSgnYnVpbGQnKTtcbiAgfSk7XG4gIGl0KCdzaG91bGQgcHJveHkgc3RhdHVzIGFzIGNvbW1hbmQnLCBhc3luYyAoKSA9PiB7XG4gICAgbGV0IHJlcyA9IGF3YWl0IGouY29tbWFuZCgnL3N0YXR1cycsICdHRVQnKTtcbiAgICByZXMuc2hvdWxkLmhhdmUucHJvcGVydHkoJ2J1aWxkJyk7XG4gIH0pO1xuICBpdCgnc2hvdWxkIHN0YXJ0IGEgbmV3IHNlc3Npb24nLCBhc3luYyAoKSA9PiB7XG4gICAgbGV0IGNhcHMgPSB7YnJvd3Nlck5hbWU6ICdjaHJvbWUnfTtcbiAgICBsZXQgcmVzID0gYXdhaXQgai5jb21tYW5kKCcvc2Vzc2lvbicsICdQT1NUJywge2Rlc2lyZWRDYXBhYmlsaXRpZXM6IGNhcHN9KTtcbiAgICByZXMuc2hvdWxkLmhhdmUucHJvcGVydHkoJ2Jyb3dzZXJOYW1lJyk7XG4gICAgai5zZXNzaW9uSWQuc2hvdWxkLmhhdmUubGVuZ3RoKDMyKTtcbiAgfSk7XG4gIGl0KCdzaG91bGQgcXVpdCBhIHNlc3Npb24nLCBhc3luYyAoKSA9PiB7XG4gICAgbGV0IHJlcyA9IGF3YWl0IGouY29tbWFuZCgnJywgJ0RFTEVURScpO1xuICAgIHNob3VsZC5ub3QuZXhpc3QocmVzKTtcbiAgfSk7XG59KTtcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4vLi4ifQ==
