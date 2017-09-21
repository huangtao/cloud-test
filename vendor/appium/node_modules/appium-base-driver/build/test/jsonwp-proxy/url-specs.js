require('source-map-support').install();

/* global describe:true, it:true */

'use strict';

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

var _ = require('../..');

var _chai = require('chai');

var _chai2 = _interopRequireDefault(_chai);

var _chaiAsPromised = require('chai-as-promised');

var _chaiAsPromised2 = _interopRequireDefault(_chaiAsPromised);

_chai2['default'].should();
_chai2['default'].use(_chaiAsPromised2['default']);

describe('proxying full urls', function () {
  it('should translate host and port', function () {
    var incomingUrl = 'http://127.0.0.2:4723/wd/hub/status';
    var j = new _.JWProxy();
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/wd/hub/status');
  });
  it('should translate the scheme', function () {
    var incomingUrl = 'http://127.0.0.2:4723/wd/hub/status';
    var j = new _.JWProxy({ scheme: 'HTTPS' });
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('https://localhost:4444/wd/hub/status');
  });
  it('should translate the base', function () {
    var incomingUrl = 'http://127.0.0.2:4723/wd/hub/status';
    var j = new _.JWProxy({ base: '' });
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/status');
  });
  it('should translate the session id', function () {
    var incomingUrl = 'http://127.0.0.2:4723/wd/hub/session/foobar/element';
    var j = new _.JWProxy({ sessionId: 'barbaz' });
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/wd/hub/session/barbaz/element');
  });
  it('should error when translating session commands without session id', function () {
    var incomingUrl = 'http://127.0.0.2:4723/wd/hub/session/foobar/element';
    var j = new _.JWProxy();
    (function () {
      j.getUrlForProxy(incomingUrl);
    }).should['throw']('session id');
  });
});

describe('proxying partial urls', function () {
  it('should proxy /status', function () {
    var incomingUrl = '/status';
    var j = new _.JWProxy();
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/wd/hub/status');
  });
  it('should proxy /session', function () {
    var incomingUrl = '/session';
    var j = new _.JWProxy();
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/wd/hub/session');
  });
  it('should proxy /sessions', function () {
    var incomingUrl = '/sessions';
    var j = new _.JWProxy();
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/wd/hub/sessions');
  });
  it('should proxy session commands based off /session', function () {
    var incomingUrl = '/session/foobar/element';
    var j = new _.JWProxy({ sessionId: 'barbaz' });
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/wd/hub/session/barbaz/element');
  });
  it('should error session commands based off /session without session id', function () {
    var incomingUrl = '/session/foobar/element';
    var j = new _.JWProxy();
    (function () {
      j.getUrlForProxy(incomingUrl);
    }).should['throw']('session id');
  });
  it('should proxy session commands based off /wd/hub', function () {
    var incomingUrl = '/wd/hub/session/3d001db2-7987-42a7-975d-8d5d5304083f/timeouts/implicit_wait';
    var j = new _.JWProxy({ sessionId: '123' });
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/wd/hub/session/123/timeouts/implicit_wait');
  });
  it('should proxy session commands based off /session as ""', function () {
    var incomingUrl = '';
    var j = new _.JWProxy();
    (function () {
      j.getUrlForProxy(incomingUrl);
    }).should['throw']('session id');
    j = new _.JWProxy({ sessionId: '123' });
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/wd/hub/session/123');
  });
  it('should proxy session commands without /session', function () {
    var incomingUrl = '/element';
    var j = new _.JWProxy({ sessionId: 'barbaz' });
    var proxyUrl = j.getUrlForProxy(incomingUrl);
    proxyUrl.should.equal('http://localhost:4444/wd/hub/session/barbaz/element');
  });
  it('should error session commands without /session without session id', function () {
    var incomingUrl = '/element';
    var j = new _.JWProxy();
    (function () {
      j.getUrlForProxy(incomingUrl);
    }).should['throw']('session id');
  });
});
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvanNvbndwLXByb3h5L3VybC1zcGVjcy5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7O2dCQUd3QixPQUFPOztvQkFDZCxNQUFNOzs7OzhCQUNJLGtCQUFrQjs7OztBQUc3QyxrQkFBSyxNQUFNLEVBQUUsQ0FBQztBQUNkLGtCQUFLLEdBQUcsNkJBQWdCLENBQUM7O0FBRXpCLFFBQVEsQ0FBQyxvQkFBb0IsRUFBRSxZQUFNO0FBQ25DLElBQUUsQ0FBQyxnQ0FBZ0MsRUFBRSxZQUFNO0FBQ3pDLFFBQUksV0FBVyxHQUFHLHFDQUFxQyxDQUFDO0FBQ3hELFFBQUksQ0FBQyxHQUFHLGVBQWEsQ0FBQztBQUN0QixRQUFJLFFBQVEsR0FBRyxDQUFDLENBQUMsY0FBYyxDQUFDLFdBQVcsQ0FBQyxDQUFDO0FBQzdDLFlBQVEsQ0FBQyxNQUFNLENBQUMsS0FBSyxDQUFDLHFDQUFxQyxDQUFDLENBQUM7R0FDOUQsQ0FBQyxDQUFDO0FBQ0gsSUFBRSxDQUFDLDZCQUE2QixFQUFFLFlBQU07QUFDdEMsUUFBSSxXQUFXLEdBQUcscUNBQXFDLENBQUM7QUFDeEQsUUFBSSxDQUFDLEdBQUcsY0FBWSxFQUFDLE1BQU0sRUFBRSxPQUFPLEVBQUMsQ0FBQyxDQUFDO0FBQ3ZDLFFBQUksUUFBUSxHQUFHLENBQUMsQ0FBQyxjQUFjLENBQUMsV0FBVyxDQUFDLENBQUM7QUFDN0MsWUFBUSxDQUFDLE1BQU0sQ0FBQyxLQUFLLENBQUMsc0NBQXNDLENBQUMsQ0FBQztHQUMvRCxDQUFDLENBQUM7QUFDSCxJQUFFLENBQUMsMkJBQTJCLEVBQUUsWUFBTTtBQUNwQyxRQUFJLFdBQVcsR0FBRyxxQ0FBcUMsQ0FBQztBQUN4RCxRQUFJLENBQUMsR0FBRyxjQUFZLEVBQUMsSUFBSSxFQUFFLEVBQUUsRUFBQyxDQUFDLENBQUM7QUFDaEMsUUFBSSxRQUFRLEdBQUcsQ0FBQyxDQUFDLGNBQWMsQ0FBQyxXQUFXLENBQUMsQ0FBQztBQUM3QyxZQUFRLENBQUMsTUFBTSxDQUFD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QUFDO0tBQUUsQ0FBQSxDQUFFLE1BQU0sU0FBTSxDQUFDLFlBQVksQ0FBQyxDQUFDO0dBQ3ZFLENBQUMsQ0FBQztDQUNKLENBQUMsQ0FBQyIsImZpbGUiOiJ0ZXN0L2pzb253cC1wcm94eS91cmwtc3BlY3MuanMiLCJzb3VyY2VzQ29udGVudCI6WyIvLyB0cmFuc3BpbGU6bW9jaGFcbi8qIGdsb2JhbCBkZXNjcmliZTp0cnVlLCBpdDp0cnVlICovXG5cbmltcG9ydCB7IEpXUHJveHkgfSBmcm9tICcuLi8uLic7XG5pbXBvcnQgY2hhaSBmcm9tICdjaGFpJztcbmltcG9ydCBjaGFpQXNQcm9taXNlZCBmcm9tICdjaGFpLWFzLXByb21pc2VkJztcblxuXG5jaGFpLnNob3VsZCgpO1xuY2hhaS51c2UoY2hhaUFzUHJvbWlzZWQpO1xuXG5kZXNjcmliZSgncHJveHlpbmcgZnVsbCB1cmxzJywgKCkgPT4ge1xuICBpdCgnc2hvdWxkIHRyYW5zbGF0ZSBob3N0IGFuZCBwb3J0JywgKCkgPT4ge1xuICAgIGxldCBpbmNvbWluZ1VybCA9ICdodHRwOi8vMTI3LjAuMC4yOjQ3MjMvd2QvaHViL3N0YXR1cyc7XG4gICAgbGV0IGogPSBuZXcgSldQcm94eSgpO1xuICAgIGxldCBwcm94eVVybCA9IGouZ2V0VXJsRm9yUHJveHkoaW5jb21pbmdVcmwpO1xuICAgIHByb3h5VXJsLnNob3VsZC5lcXVhbCgnaHR0cDovL2xvY2FsaG9zdDo0NDQ0L3dkL2h1Yi9zdGF0dXMnKTtcbiAgfSk7XG4gIGl0KCdzaG91bGQgdHJhbnNsYXRlIHRoZSBzY2hlbWUnLCAoKSA9PiB7XG4gICAgbGV0IGluY29taW5nVXJsID0gJ2h0dHA6Ly8xMjcuMC4wLjI6NDcyMy93ZC9odWIvc3RhdHVzJztcbiAgICBsZXQgaiA9IG5ldyBKV1Byb3h5KHtzY2hlbWU6ICdIVFRQUyd9KTtcbiAgICBsZXQgcHJveHlVcmwgPSBqLmdldFVybEZvclByb3h5KGluY29taW5nVXJsKTtcbiAgICBwcm94eVVybC5zaG91bGQuZXF1YWwoJ2h0dHBzOi8vbG9jYWxob3N0OjQ0NDQvd2QvaHViL3N0YXR1cycpO1xuICB9KTtcbiAgaXQoJ3Nob3VsZCB0cmFuc2xhdGUgdGhlIGJhc2UnLCAoKSA9PiB7XG4gICAgbGV0IGluY29taW5nVXJsID0gJ2h0dHA6Ly8xMjcuMC4wLjI6NDcyMy93ZC9odWIvc3RhdHVzJztcbiAgICBsZXQgaiA9IG5ldyBKV1Byb3h5KHtiYXNlOiAnJ30pO1xuICAgIGxldCBwcm94eVVybCA9IGouZ2V0VXJsRm9yUHJveHkoaW5jb21pbmdVcmwpO1xuICAgIHByb3h5VXJsLnNob3VsZC5lcXVhbCgnaHR0cDovL2xvY2FsaG9zdDo0NDQ0L3N0YXR1cycpO1xuICB9KTtcbiAgaXQoJ3Nob3VsZCB0cmFuc2xhdGUgdGhlIHNlc3Npb24gaWQnLCAoKSA9PiB7XG4gICAgbGV0IGluY29taW5nVXJsID0gJ2h0dHA6Ly8xMjcuMC4wLjI6NDcyMy93ZC9odWIvc2Vzc2lvbi9mb29iYXIvZWxlbWVudCc7XG4gICAgbGV0IGogPSBuZXcgSldQcm94eSh7c2Vzc2lvbklkOiAnYmFyYmF6J30pO1xuICAgIGxldCBwcm94eVVybCA9IGouZ2V0VXJsRm9yUHJveHkoaW5jb21pbmdVcmwpO1xuICAgIHByb3h5VXJsLnNob3VsZC5lcXVhbCgnaHR0cDovL2xvY2FsaG9zdDo0NDQ0L3dkL2h1Yi9zZXNzaW9uL2JhcmJhei9lbGVtZW50Jyk7XG4gIH0pO1xuICBpdCgnc2hvdWxkIGVycm9yIHdoZW4gdHJhbnNsYXRpbmcgc2Vzc2lvbiBjb21tYW5kcyB3aXRob3V0IHNlc3Npb24gaWQnLCAoKSA9PiB7XG4gICAgbGV0IGluY29taW5nVXJsID0gJ2h0dHA6Ly8xMjcuMC4wLjI6NDcyMy93ZC9odWIvc2Vzc2lvbi9mb29iYXIvZWxlbWVudCc7XG4gICAgbGV0IGogPSBuZXcgSldQcm94eSgpO1xuICAgICgoKSA9PiB7IGouZ2V0VXJsRm9yUHJveHkoaW5jb21pbmdVcmwpOyB9KS5zaG91bGQudGhyb3coJ3Nlc3Npb24gaWQnKTtcbiAgfSk7XG59KTtcblxuZGVzY3JpYmUoJ3Byb3h5aW5nIHBhcnRpYWwgdXJscycsICgpID0+IHtcbiAgaXQoJ3Nob3VsZCBwcm94eSAvc3RhdHVzJywgKCkgPT4ge1xuICAgIGxldCBpbmNvbWluZ1VybCA9ICcvc3RhdHVzJztcbiAgICBsZXQgaiA9IG5ldyBKV1Byb3h5KCk7XG4gICAgbGV0IHByb3h5VXJsID0gai5nZXRVcmxGb3JQcm94eShpbmNvbWluZ1VybCk7XG4gICAgcHJveHlVcmwuc2hvdWxkLmVxdWFsKCdodHRwOi8vbG9jYWxob3N0OjQ0NDQvd2QvaHViL3N0YXR1cycpO1xuICB9KTtcbiAgaXQoJ3Nob3VsZCBwcm94eSAvc2Vzc2lvbicsICgpID0+IHtcbiAgICBsZXQgaW5jb21pbmdVcmwgPSAnL3Nlc3Npb24nO1xuICAgIGxldCBqID0gbmV3IEpXUHJveHkoKTtcbiAgICBsZXQgcHJveHlVcmwgPSBqLmdldFVybEZvclByb3h5KGluY29taW5nVXJsKTtcbiAgICBwcm94eVVybC5zaG91bGQuZXF1YWwoJ2h0dHA6Ly9sb2NhbGhvc3Q6NDQ0NC93ZC9odWIvc2Vzc2lvbicpO1xuICB9KTtcbiAgaXQoJ3Nob3VsZCBwcm94eSAvc2Vzc2lvbnMnLCAoKSA9PiB7XG4gICAgbGV0IGluY29taW5nVXJsID0gJy9zZXNzaW9ucyc7XG4gICAgbGV0IGogPSBuZXcgSldQcm94eSgpO1xuICAgIGxldCBwcm94eVVybCA9IGouZ2V0VXJsRm9yUHJveHkoaW5jb21pbmdVcmwpO1xuICAgIHByb3h5VXJsLnNob3VsZC5lcXVhbCgnaHR0cDovL2xvY2FsaG9zdDo0NDQ0L3dkL2h1Yi9zZXNzaW9ucycpO1xuICB9KTtcbiAgaXQoJ3Nob3VsZCBwcm94eSBzZXNzaW9uIGNvbW1hbmRzIGJhc2VkIG9mZiAvc2Vzc2lvbicsICgpID0+IHtcbiAgICBsZXQgaW5jb21pbmdVcmwgPSAnL3Nlc3Npb24vZm9vYmFyL2VsZW1lbnQnO1xuICAgIGxldCBqID0gbmV3IEpXUHJveHkoe3Nlc3Npb25JZDogJ2JhcmJheid9KTtcbiAgICBsZXQgcHJveHlVcmwgPSBqLmdldFVybEZvclByb3h5KGluY29taW5nVXJsKTtcbiAgICBwcm94eVVybC5zaG91bGQuZXF1YWwoJ2h0dHA6Ly9sb2NhbGhvc3Q6NDQ0NC93ZC9odWIvc2Vzc2lvbi9iYXJiYXovZWxlbWVudCcpO1xuICB9KTtcbiAgaXQoJ3Nob3VsZCBlcnJvciBzZXNzaW9uIGNvbW1hbmRzIGJhc2VkIG9mZiAvc2Vzc2lvbiB3aXRob3V0IHNlc3Npb24gaWQnLCAoKSA9PiB7XG4gICAgbGV0IGluY29taW5nVXJsID0gJy9zZXNzaW9uL2Zvb2Jhci9lbGVtZW50JztcbiAgICBsZXQgaiA9IG5ldyBKV1Byb3h5KCk7XG4gICAgKCgpID0+IHsgai5nZXRVcmxGb3JQcm94eShpbmNvbWluZ1VybCk7IH0pLnNob3VsZC50aHJvdygnc2Vzc2lvbiBpZCcpO1xuICB9KTtcbiAgaXQoJ3Nob3VsZCBwcm94eSBzZXNzaW9uIGNvbW1hbmRzIGJhc2VkIG9mZiAvd2QvaHViJywgKCkgPT4ge1xuICAgIGxldCBpbmNvbWluZ1VybCA9ICcvd2QvaHViL3Nlc3Npb24vM2QwMDFkYjItNzk4Ny00MmE3LTk3NWQtOGQ1ZDUzMDQwODNmL3RpbWVvdXRzL2ltcGxpY2l0X3dhaXQnO1xuICAgIGxldCBqID0gbmV3IEpXUHJveHkoe3Nlc3Npb25JZDogJzEyMyd9KTtcbiAgICBsZXQgcHJveHlVcmwgPSBqLmdldFVybEZvclByb3h5KGluY29taW5nVXJsKTtcbiAgICBwcm94eVVybC5zaG91bGQuZXF1YWwoJ2h0dHA6Ly9sb2NhbGhvc3Q6NDQ0NC93ZC9odWIvc2Vzc2lvbi8xMjMvdGltZW91dHMvaW1wbGljaXRfd2FpdCcpO1xuXG4gIH0pO1xuICBpdCgnc2hvdWxkIHByb3h5IHNlc3Npb24gY29tbWFuZHMgYmFzZWQgb2ZmIC9zZXNzaW9uIGFzIFwiXCInLCAoKSA9PiB7XG4gICAgbGV0IGluY29taW5nVXJsID0gJyc7XG4gICAgbGV0IGogPSBuZXcgSldQcm94eSgpO1xuICAgICgoKSA9PiB7IGouZ2V0VXJsRm9yUHJveHkoaW5jb21pbmdVcmwpOyB9KS5zaG91bGQudGhyb3coJ3Nlc3Npb24gaWQnKTtcbiAgICBqID0gbmV3IEpXUHJveHkoe3Nlc3Npb25JZDogJzEyMyd9KTtcbiAgICBsZXQgcHJveHlVcmwgPSBqLmdldFVybEZvclByb3h5KGluY29taW5nVXJsKTtcbiAgICBwcm94eVVybC5zaG91bGQuZXF1YWwoJ2h0dHA6Ly9sb2NhbGhvc3Q6NDQ0NC93ZC9odWIvc2Vzc2lvbi8xMjMnKTtcbiAgfSk7XG4gIGl0KCdzaG91bGQgcHJveHkgc2Vzc2lvbiBjb21tYW5kcyB3aXRob3V0IC9zZXNzaW9uJywgKCkgPT4ge1xuICAgIGxldCBpbmNvbWluZ1VybCA9ICcvZWxlbWVudCc7XG4gICAgbGV0IGogPSBuZXcgSldQcm94eSh7c2Vzc2lvbklkOiAnYmFyYmF6J30pO1xuICAgIGxldCBwcm94eVVybCA9IGouZ2V0VXJsRm9yUHJveHkoaW5jb21pbmdVcmwpO1xuICAgIHByb3h5VXJsLnNob3VsZC5lcXVhbCgnaHR0cDovL2xvY2FsaG9zdDo0NDQ0L3dkL2h1Yi9zZXNzaW9uL2JhcmJhei9lbGVtZW50Jyk7XG4gIH0pO1xuICBpdCgnc2hvdWxkIGVycm9yIHNlc3Npb24gY29tbWFuZHMgd2l0aG91dCAvc2Vzc2lvbiB3aXRob3V0IHNlc3Npb24gaWQnLCAoKSA9PiB7XG4gICAgbGV0IGluY29taW5nVXJsID0gJy9lbGVtZW50JztcbiAgICBsZXQgaiA9IG5ldyBKV1Byb3h5KCk7XG4gICAgKCgpID0+IHsgai5nZXRVcmxGb3JQcm94eShpbmNvbWluZ1VybCk7IH0pLnNob3VsZC50aHJvdygnc2Vzc2lvbiBpZCcpO1xuICB9KTtcbn0pO1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLi8uLiJ9
