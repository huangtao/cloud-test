'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _Object$assign = require('babel-runtime/core-js/object/assign')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

var _2 = require('../..');

var _requestPromise = require('request-promise');

var _requestPromise2 = _interopRequireDefault(_requestPromise);

var _chai = require('chai');

var _chai2 = _interopRequireDefault(_chai);

var _chaiAsPromised = require('chai-as-promised');

var _chaiAsPromised2 = _interopRequireDefault(_chaiAsPromised);

var _bluebird = require('bluebird');

var _bluebird2 = _interopRequireDefault(_bluebird);

var should = _chai2['default'].should();
_chai2['default'].use(_chaiAsPromised2['default']);

function baseDriverE2ETests(DriverClass) {
  var _this = this;

  var defaultCaps = arguments.length <= 1 || arguments[1] === undefined ? {} : arguments[1];

  describe('BaseDriver (e2e)', function () {
    var baseServer = undefined,
        d = new DriverClass();
    before(function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            context$3$0.next = 2;
            return _regeneratorRuntime.awrap((0, _2.server)((0, _2.routeConfiguringFunction)(d), 8181));

          case 2:
            baseServer = context$3$0.sent;

          case 3:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });
    after(function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
            context$3$0.next = 2;
            return _regeneratorRuntime.awrap(baseServer.close());

          case 2:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });

    function startSession(caps) {
      return (0, _requestPromise2['default'])({
        url: 'http://localhost:8181/wd/hub/session',
        method: 'POST',
        json: { desiredCapabilities: caps, requiredCapabilities: {} }
      });
    }

    function endSession(id) {
      return (0, _requestPromise2['default'])({
        url: 'http://localhost:8181/wd/hub/session/' + id,
        method: 'DELETE',
        json: true,
        simple: false
      });
    }

    function getSession(id) {
      return (0, _requestPromise2['default'])({
        url: 'http://localhost:8181/wd/hub/session/' + id,
        method: 'GET',
        json: true,
        simple: false
      });
    }

    describe('session handling', function () {
      it('should create session and retrieve a session id, then delete it', function callee$3$0() {
        var res;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              context$4$0.next = 2;
              return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/session',
                method: 'POST',
                json: { desiredCapabilities: defaultCaps, requiredCapabilities: {} },
                simple: false,
                resolveWithFullResponse: true
              }));

            case 2:
              res = context$4$0.sent;

              res.statusCode.should.equal(200);
              res.body.status.should.equal(0);
              should.exist(res.body.sessionId);
              res.body.value.should.eql(defaultCaps);

              context$4$0.next = 9;
              return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/session/' + d.sessionId,
                method: 'DELETE',
                json: true,
                simple: false,
                resolveWithFullResponse: true
              }));

            case 9:
              res = context$4$0.sent;

              res.statusCode.should.equal(200);
              res.body.status.should.equal(0);
              should.equal(d.sessionId, null);

            case 13:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });
    });

    it.skip('should throw NYI for commands not implemented', function callee$2$0() {
      return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
        while (1) switch (context$3$0.prev = context$3$0.next) {
          case 0:
          case 'end':
            return context$3$0.stop();
        }
      }, null, _this);
    });

    describe('command timeouts', function () {
      function startTimeoutSession(timeout) {
        var caps = _lodash2['default'].clone(defaultCaps);
        caps.newCommandTimeout = timeout;
        return startSession(caps);
      }

      d.findElement = (function () {
        return 'foo';
      }).bind(d);

      d.findElements = (function callee$3$0() {
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              context$4$0.next = 2;
              return _regeneratorRuntime.awrap(_bluebird2['default'].delay(200));

            case 2:
              return context$4$0.abrupt('return', ['foo']);

            case 3:
            case 'end':
              return context$4$0.stop();
          }
        }, null, this);
      }).bind(d);

      it('should set a default commandTimeout', function callee$3$0() {
        var newSession;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              context$4$0.next = 2;
              return _regeneratorRuntime.awrap(startTimeoutSession());

            case 2:
              newSession = context$4$0.sent;

              d.newCommandTimeoutMs.should.be.above(0);
              context$4$0.next = 6;
              return _regeneratorRuntime.awrap(endSession(newSession.sessionId));

            case 6:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });

      it('should timeout on commands using commandTimeout cap', function callee$3$0() {
        var newSession, res;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              context$4$0.next = 2;
              return _regeneratorRuntime.awrap(startTimeoutSession(0.25));

            case 2:
              newSession = context$4$0.sent;
              context$4$0.next = 5;
              return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/session/' + d.sessionId + '/element',
                method: 'POST',
                json: { using: 'name', value: 'foo' }
              }));

            case 5:
              context$4$0.next = 7;
              return _regeneratorRuntime.awrap(_bluebird2['default'].delay(400));

            case 7:
              context$4$0.next = 9;
              return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/session/' + d.sessionId,
                method: 'GET',
                json: true,
                simple: false
              }));

            case 9:
              res = context$4$0.sent;

              res.status.should.equal(6);
              should.equal(d.sessionId, null);
              context$4$0.next = 14;
              return _regeneratorRuntime.awrap(endSession(newSession.sessionId));

            case 14:
              res = context$4$0.sent;

              res.status.should.equal(6);

            case 16:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });

      it('should not timeout with commandTimeout of false', function callee$3$0() {
        var newSession, start, res;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              context$4$0.next = 2;
              return _regeneratorRuntime.awrap(startTimeoutSession(0.1));

            case 2:
              newSession = context$4$0.sent;
              start = Date.now();
              context$4$0.next = 6;
              return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/session/' + d.sessionId + '/elements',
                method: 'POST',
                json: { using: 'name', value: 'foo' }
              }));

            case 6:
              res = context$4$0.sent;

              (Date.now() - start).should.be.above(150);
              res.value.should.eql(['foo']);
              context$4$0.next = 11;
              return _regeneratorRuntime.awrap(endSession(newSession.sessionId));

            case 11:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });

      it('should not timeout with commandTimeout of 0', function callee$3$0() {
        var newSession, res;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              d.newCommandTimeoutMs = 2;
              context$4$0.next = 3;
              return _regeneratorRuntime.awrap(startTimeoutSession(0));

            case 3:
              newSession = context$4$0.sent;
              context$4$0.next = 6;
              return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/session/' + d.sessionId + '/element',
                method: 'POST',
                json: { using: 'name', value: 'foo' }
              }));

            case 6:
              context$4$0.next = 8;
              return _regeneratorRuntime.awrap(_bluebird2['default'].delay(400));

            case 8:
              context$4$0.next = 10;
              return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/session/' + d.sessionId,
                method: 'GET',
                json: true,
                simple: false
              }));

            case 10:
              res = context$4$0.sent;

              res.status.should.equal(0);
              context$4$0.next = 14;
              return _regeneratorRuntime.awrap(endSession(newSession.sessionId));

            case 14:
              res = context$4$0.sent;

              res.status.should.equal(0);

              d.newCommandTimeoutMs = 60 * 1000;

            case 17:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });

      it('should not timeout if its just the command taking awhile', function callee$3$0() {
        var newSession, res;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              context$4$0.next = 2;
              return _regeneratorRuntime.awrap(startTimeoutSession(0.25));

            case 2:
              newSession = context$4$0.sent;
              context$4$0.next = 5;
              return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/session/' + d.sessionId + '/element',
                method: 'POST',
                json: { using: 'name', value: 'foo' }
              }));

            case 5:
              context$4$0.next = 7;
              return _regeneratorRuntime.awrap(_bluebird2['default'].delay(400));

            case 7:
              context$4$0.next = 9;
              return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/session/' + d.sessionId,
                method: 'GET',
                json: true,
                simple: false
              }));

            case 9:
              res = context$4$0.sent;

              res.status.should.equal(6);
              should.equal(d.sessionId, null);
              context$4$0.next = 14;
              return _regeneratorRuntime.awrap(endSession(newSession.sessionId));

            case 14:
              res = context$4$0.sent;

              res.status.should.equal(6);

            case 16:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });

      it('should not have a timer running before or after a session', function callee$3$0() {
        var newSession;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              should.not.exist(d.noCommandTimer);
              context$4$0.next = 3;
              return _regeneratorRuntime.awrap(startTimeoutSession(0.25));

            case 3:
              newSession = context$4$0.sent;

              newSession.sessionId.should.equal(d.sessionId);
              should.exist(d.noCommandTimer);
              context$4$0.next = 8;
              return _regeneratorRuntime.awrap(endSession(newSession.sessionId));

            case 8:
              should.not.exist(d.noCommandTimer);

            case 9:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });
    });

    describe('settings api', function () {
      before(function () {
        d.settings = new _2.DeviceSettings({ ignoreUnimportantViews: false });
      });
      it('should be able to get settings object', function () {
        d.settings.getSettings().ignoreUnimportantViews.should.be['false'];
      });
      it('should throw error when updateSettings method is not defined', function callee$3$0() {
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              context$4$0.next = 2;
              return _regeneratorRuntime.awrap(d.settings.update({ ignoreUnimportantViews: true }).should.eventually.be.rejectedWith('onSettingsUpdate'));

            case 2:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });
      it('should throw error for invalid update object', function callee$3$0() {
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              context$4$0.next = 2;
              return _regeneratorRuntime.awrap(d.settings.update('invalid json').should.eventually.be.rejectedWith('JSON'));

            case 2:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });
    });

    describe('unexpected exits', function () {
      it('should reject a current command when the driver crashes', function callee$3$0() {
        var p, res;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              d._oldGetStatus = d.getStatus;
              d.getStatus = (function callee$4$0() {
                return _regeneratorRuntime.async(function callee$4$0$(context$5$0) {
                  while (1) switch (context$5$0.prev = context$5$0.next) {
                    case 0:
                      context$5$0.next = 2;
                      return _regeneratorRuntime.awrap(_bluebird2['default'].delay(5000));

                    case 2:
                    case 'end':
                      return context$5$0.stop();
                  }
                }, null, this);
              }).bind(d);
              p = (0, _requestPromise2['default'])({
                url: 'http://localhost:8181/wd/hub/status',
                method: 'GET',
                json: true,
                simple: false
              });
              context$4$0.next = 5;
              return _regeneratorRuntime.awrap(_bluebird2['default'].delay(20));

            case 5:
              d.startUnexpectedShutdown(new Error('Crashytimes'));
              context$4$0.next = 8;
              return _regeneratorRuntime.awrap(p);

            case 8:
              res = context$4$0.sent;

              res.status.should.equal(13);
              res.value.message.should.contain('Crashytimes');
              context$4$0.next = 13;
              return _regeneratorRuntime.awrap(d.onUnexpectedShutdown.should.be.rejectedWith('Crashytimes'));

            case 13:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });
    });

    describe('event timings', function () {
      it('should not add timings if not using opt-in cap', function callee$3$0() {
        var session, res;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              context$4$0.next = 2;
              return _regeneratorRuntime.awrap(startSession(defaultCaps));

            case 2:
              session = context$4$0.sent;
              context$4$0.next = 5;
              return _regeneratorRuntime.awrap(getSession(session.sessionId));

            case 5:
              res = context$4$0.sent;

              should.not.exist(res.events);
              context$4$0.next = 9;
              return _regeneratorRuntime.awrap(endSession(session.sessionId));

            case 9:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });
      it('should add start session timings', function callee$3$0() {
        var caps, session, res;
        return _regeneratorRuntime.async(function callee$3$0$(context$4$0) {
          while (1) switch (context$4$0.prev = context$4$0.next) {
            case 0:
              caps = _Object$assign({}, defaultCaps, { eventTimings: true });
              context$4$0.next = 3;
              return _regeneratorRuntime.awrap(startSession(caps));

            case 3:
              session = context$4$0.sent;
              context$4$0.next = 6;
              return _regeneratorRuntime.awrap(getSession(session.sessionId));

            case 6:
              res = context$4$0.sent.value;

              should.exist(res.events);
              should.exist(res.events.newSessionRequested);
              should.exist(res.events.newSessionStarted);
              res.events.newSessionRequested[0].should.be.a('number');
              res.events.newSessionStarted[0].should.be.a('number');
              context$4$0.next = 14;
              return _regeneratorRuntime.awrap(endSession(session.sessionId));

            case 14:
            case 'end':
              return context$4$0.stop();
          }
        }, null, _this);
      });
    });
  });
}

exports['default'] = baseDriverE2ETests;
module.exports = exports['default'];

// make sure that the request gets to the server before our shutdown
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvYmFzZWRyaXZlci9kcml2ZXItZTJlLXRlc3RzLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7OztzQkFBYyxRQUFROzs7O2lCQUMyQyxPQUFPOzs4QkFDcEQsaUJBQWlCOzs7O29CQUNwQixNQUFNOzs7OzhCQUNJLGtCQUFrQjs7Ozt3QkFDL0IsVUFBVTs7OztBQUV4QixJQUFNLE1BQU0sR0FBRyxrQkFBSyxNQUFNLEVBQUUsQ0FBQztBQUM3QixrQkFBSyxHQUFHLDZCQUFnQixDQUFDOztBQUV6QixTQUFTLGtCQUFrQixDQUFFLFdBQVcsRUFBb0I7OztNQUFsQixXQUFXLHlEQUFHLEVBQUU7O0FBQ3hELFVBQVEsQ0FBQyxrQkFBa0IsRUFBRSxZQUFNO0FBQ2pDLFFBQUksVUFBVSxZQUFBO1FBQUUsQ0FBQyxHQUFHLElBQUksV0FBVyxFQUFFLENBQUM7QUFDdEMsVUFBTSxDQUFDOzs7Ozs2Q0FDYyxlQUFPLGlDQUF5QixDQUFDLENBQUMsRUFBRSxJQUFJLENBQUM7OztBQUE1RCxzQkFBVTs7Ozs7OztLQUNYLENBQUMsQ0FBQztBQUNILFNBQUssQ0FBQzs7Ozs7NkNBQ0UsVUFBVSxDQUFDLEtBQUssRUFBRTs7Ozs7OztLQUN6QixDQUFDLENBQUM7O0FBRUgsYUFBUyxZQUFZLENBQUUsSUFBSSxFQUFFO0FBQzNCLGFBQU8saUNBQVE7QUFDYixXQUFHLEVBQUUsc0NBQXNDO0FBQzNDLGNBQU0sRUFBRSxNQUFNO0FBQ2QsWUFBSSxFQUFFLEVBQUMsbUJBQW1CLEVBQUUsSUFBSSxFQUFFLG9CQUFvQixFQUFFLEVBQUUsRUFBQztPQUM1RCxDQUFDLENBQUM7S0FDSjs7QUFFRCxhQUFTLFVBQVUsQ0FBRSxFQUFFLEVBQUU7QUFDdkIsYUFBTyxpQ0FBUTtBQUNiLFdBQUcsNENBQTBDLEVBQUUsQUFBRTtBQUNqRCxjQUFNLEVBQUUsUUFBUTtBQUNoQixZQUFJLEVBQUUsSUFBSTtBQUNWLGNBQU0sRUFBRSxLQUFLO09BQ2QsQ0FBQyxDQUFD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dCI6WyJpbXBvcnQgXyBmcm9tICdsb2Rhc2gnO1xuaW1wb3J0IHsgc2VydmVyLCByb3V0ZUNvbmZpZ3VyaW5nRnVuY3Rpb24sIERldmljZVNldHRpbmdzIH0gZnJvbSAnLi4vLi4nO1xuaW1wb3J0IHJlcXVlc3QgZnJvbSAncmVxdWVzdC1wcm9taXNlJztcbmltcG9ydCBjaGFpIGZyb20gJ2NoYWknO1xuaW1wb3J0IGNoYWlBc1Byb21pc2VkIGZyb20gJ2NoYWktYXMtcHJvbWlzZWQnO1xuaW1wb3J0IEIgZnJvbSAnYmx1ZWJpcmQnO1xuXG5jb25zdCBzaG91bGQgPSBjaGFpLnNob3VsZCgpO1xuY2hhaS51c2UoY2hhaUFzUHJvbWlzZWQpO1xuXG5mdW5jdGlvbiBiYXNlRHJpdmVyRTJFVGVzdHMgKERyaXZlckNsYXNzLCBkZWZhdWx0Q2FwcyA9IHt9KSB7XG4gIGRlc2NyaWJlKCdCYXNlRHJpdmVyIChlMmUpJywgKCkgPT4ge1xuICAgIGxldCBiYXNlU2VydmVyLCBkID0gbmV3IERyaXZlckNsYXNzKCk7XG4gICAgYmVmb3JlKGFzeW5jICgpID0+IHtcbiAgICAgIGJhc2VTZXJ2ZXIgPSBhd2FpdCBzZXJ2ZXIocm91dGVDb25maWd1cmluZ0Z1bmN0aW9uKGQpLCA4MTgxKTtcbiAgICB9KTtcbiAgICBhZnRlcihhc3luYyAoKSA9PiB7XG4gICAgICBhd2FpdCBiYXNlU2VydmVyLmNsb3NlKCk7XG4gICAgfSk7XG5cbiAgICBmdW5jdGlvbiBzdGFydFNlc3Npb24gKGNhcHMpIHtcbiAgICAgIHJldHVybiByZXF1ZXN0KHtcbiAgICAgICAgdXJsOiAnaHR0cDovL2xvY2FsaG9zdDo4MTgxL3dkL2h1Yi9zZXNzaW9uJyxcbiAgICAgICAgbWV0aG9kOiAnUE9TVCcsXG4gICAgICAgIGpzb246IHtkZXNpcmVkQ2FwYWJpbGl0aWVzOiBjYXBzLCByZXF1aXJlZENhcGFiaWxpdGllczoge319LFxuICAgICAgfSk7XG4gICAgfVxuXG4gICAgZnVuY3Rpb24gZW5kU2Vzc2lvbiAoaWQpIHtcbiAgICAgIHJldHVybiByZXF1ZXN0KHtcbiAgICAgICAgdXJsOiBgaHR0cDovL2xvY2FsaG9zdDo4MTgxL3dkL2h1Yi9zZXNzaW9uLyR7aWR9YCxcbiAgICAgICAgbWV0aG9kOiAnREVMRVRFJyxcbiAgICAgICAganNvbjogdHJ1ZSxcbiAgICAgICAgc2ltcGxlOiBmYWxzZVxuICAgICAgfSk7XG4gICAgfVxuXG4gICAgZnVuY3Rpb24gZ2V0U2Vzc2lvbiAoaWQpIHtcbiAgICAgIHJldHVybiByZXF1ZXN0KHtcbiAgICAgICAgdXJsOiBgaHR0cDovL2xvY2FsaG9zdDo4MTgxL3dkL2h1Yi9zZXNzaW9uLyR7aWR9YCxcbiAgICAgICAgbWV0aG9kOiAnR0VUJyxcbiAgICAgICAganNvbjogdHJ1ZSxcbiAgICAgICAgc2ltcGxlOiBmYWxzZVxuICAgICAgfSk7XG4gICAgfVxuXG4gICAgZGVzY3JpYmUoJ3Nlc3Npb24gaGFuZGxpbmcnLCAoKSA9PiB7XG4gICAgICBpdCgnc2hvdWxkIGNyZWF0ZSBzZXNzaW9uIGFuZCByZXRyaWV2ZSBhIHNlc3Npb24gaWQsIHRoZW4gZGVsZXRlIGl0JywgYXN5bmMgKCkgPT4ge1xuICAgICAgICBsZXQgcmVzID0gYXdhaXQgcmVxdWVzdCh7XG4gICAgICAgICAgdXJsOiAnaHR0cDovL2xvY2FsaG9zdDo4MTgxL3dkL2h1Yi9zZXNzaW9uJyxcbiAgICAgICAgICBtZXRob2Q6ICdQT1NUJyxcbiAgICAgICAgICBqc29uOiB7ZGVzaXJlZENhcGFiaWxpdGllczogZGVmYXVsdENhcHMsIHJlcXVpcmVkQ2FwYWJpbGl0aWVzOiB7fX0sXG4gICAgICAgICAgc2ltcGxlOiBmYWxzZSxcbiAgICAgICAgICByZXNvbHZlV2l0aEZ1bGxSZXNwb25zZTogdHJ1ZVxuICAgICAgICB9KTtcblxuICAgICAgICByZXMuc3RhdHVzQ29kZS5zaG91bGQuZXF1YWwoMjAwKTtcbiAgICAgICAgcmVzLmJvZHkuc3RhdHVzLnNob3VsZC5lcXVhbCgwKTtcbiAgICAgICAgc2hvdWxkLmV4aXN0KHJlcy5ib2R5LnNlc3Npb25JZCk7XG4gICAgICAgIHJlcy5ib2R5LnZhbHVlLnNob3VsZC5lcWwoZGVmYXVsdENhcHMpO1xuXG4gICAgICAgIHJlcyA9IGF3YWl0IHJlcXVlc3Qoe1xuICAgICAgICAgIHVybDogYGh0dHA6Ly9sb2NhbGhvc3Q6ODE4MS93ZC9odWIvc2Vzc2lvbi8ke2Quc2Vzc2lvbklkfWAsXG4gICAgICAgICAgbWV0aG9kOiAnREVMRVRFJyxcbiAgICAgICAgICBqc29uOiB0cnVlLFxuICAgICAgICAgIHNpbXBsZTogZmFsc2UsXG4gICAgICAgICAgcmVzb2x2ZVdpdGhGdWxsUmVzcG9uc2U6IHRydWVcbiAgICAgICAgfSk7XG5cbiAgICAgICAgcmVzLnN0YXR1c0NvZGUuc2hvdWxkLmVxdWFsKDIwMCk7XG4gICAgICAgIHJlcy5ib2R5LnN0YXR1cy5zaG91bGQuZXF1YWwoMCk7XG4gICAgICAgIHNob3VsZC5lcXVhbChkLnNlc3Npb25JZCwgbnVsbCk7XG4gICAgICB9KTtcbiAgICB9KTtcblxuICAgIGl0LnNraXAoJ3Nob3VsZCB0aHJvdyBOWUkgZm9yIGNvbW1hbmRzIG5vdCBpbXBsZW1lbnRlZCcsIGFzeW5jICgpID0+IHtcbiAgICB9KTtcblxuICAgIGRlc2NyaWJlKCdjb21tYW5kIHRpbWVvdXRzJywgKCkgPT4ge1xuICAgICAgZnVuY3Rpb24gc3RhcnRUaW1lb3V0U2Vzc2lvbiAodGltZW91dCkge1xuICAgICAgICBsZXQgY2FwcyA9IF8uY2xvbmUoZGVmYXVsdENhcHMpO1xuICAgICAgICBjYXBzLm5ld0NvbW1hbmRUaW1lb3V0ID0gdGltZW91dDtcbiAgICAgICAgcmV0dXJuIHN0YXJ0U2Vzc2lvbihjYXBzKTtcbiAgICAgIH1cblxuICAgICAgZC5maW5kRWxlbWVudCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgcmV0dXJuICdmb28nO1xuICAgICAgfS5iaW5kKGQpO1xuXG4gICAgICBkLmZpbmRFbGVtZW50cyA9IGFzeW5jIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgYXdhaXQgQi5kZWxheSgyMDApO1xuICAgICAgICByZXR1cm4gWydmb28nXTtcbiAgICAgIH0uYmluZChkKTtcblxuICAgICAgaXQoJ3Nob3VsZCBzZXQgYSBkZWZhdWx0IGNvbW1hbmRUaW1lb3V0JywgYXN5bmMgKCkgPT4ge1xuICAgICAgICBsZXQgbmV3U2Vzc2lvbiA9IGF3YWl0IHN0YXJ0VGltZW91dFNlc3Npb24oKTtcbiAgICAgICAgZC5uZXdDb21tYW5kVGltZW91dE1zLnNob3VsZC5iZS5hYm92ZSgwKTtcbiAgICAgICAgYXdhaXQgZW5kU2Vzc2lvbihuZXdTZXNzaW9uLnNlc3Npb25JZCk7XG4gICAgICB9KTtcblxuICAgICAgaXQoJ3Nob3VsZCB0aW1lb3V0IG9uIGNvbW1hbmRzIHVzaW5nIGNvbW1hbmRUaW1lb3V0IGNhcCcsIGFzeW5jICgpID0+IHtcbiAgICAgICAgbGV0IG5ld1Nlc3Npb24gPSBhd2FpdCBzdGFydFRpbWVvdXRTZXNzaW9uKDAuMjUpO1xuXG4gICAgICAgIGF3YWl0IHJlcXVlc3Qoe1xuICAgICAgICAgIHVybDogYGh0dHA6Ly9sb2NhbGhvc3Q6ODE4MS93ZC9odWIvc2Vzc2lvbi8ke2Quc2Vzc2lvbklkfS9lbGVtZW50YCxcbiAgICAgICAgICBtZXRob2Q6ICdQT1NUJyxcbiAgICAgICAgICBqc29uOiB7dXNpbmc6ICduYW1lJywgdmFsdWU6ICdmb28nfSxcbiAgICAgICAgfSk7XG4gICAgICAgIGF3YWl0IEIuZGVsYXkoNDAwKTtcbiAgICAgICAgbGV0IHJlcyA9IGF3YWl0IHJlcXVlc3Qoe1xuICAgICAgICAgIHVybDogYGh0dHA6Ly9sb2NhbGhvc3Q6ODE4MS93ZC9odWIvc2Vzc2lvbi8ke2Quc2Vzc2lvbklkfWAsXG4gICAgICAgICAgbWV0aG9kOiAnR0VUJyxcbiAgICAgICAgICBqc29uOiB0cnVlLFxuICAgICAgICAgIHNpbXBsZTogZmFsc2VcbiAgICAgICAgfSk7XG4gICAgICAgIHJlcy5zdGF0dXMuc2hvdWxkLmVxdWFsKDYpO1xuICAgICAgICBzaG91bGQuZXF1YWwoZC5zZXNzaW9uSWQsIG51bGwpO1xuICAgICAgICByZXMgPSBhd2FpdCBlbmRTZXNzaW9uKG5ld1Nlc3Npb24uc2Vzc2lvbklkKTtcbiAgICAgICAgcmVzLnN0YXR1cy5zaG91bGQuZXF1YWwoNik7XG4gICAgICB9KTtcblxuICAgICAgaXQoJ3Nob3VsZCBub3QgdGltZW91dCB3aXRoIGNvbW1hbmRUaW1lb3V0IG9mIGZhbHNlJywgYXN5bmMgKCkgPT4ge1xuICAgICAgICBsZXQgbmV3U2Vzc2lvbiA9IGF3YWl0IHN0YXJ0VGltZW91dFNlc3Npb24oMC4xKTtcbiAgICAgICAgbGV0IHN0YXJ0ID0gRGF0ZS5ub3coKTtcbiAgICAgICAgbGV0IHJlcyA9IGF3YWl0IHJlcXVlc3Qoe1xuICAgICAgICAgIHVybDogYGh0dHA6Ly9sb2NhbGhvc3Q6ODE4MS93ZC9odWIvc2Vzc2lvbi8ke2Quc2Vzc2lvbklkfS9lbGVtZW50c2AsXG4gICAgICAgICAgbWV0aG9kOiAnUE9TVCcsXG4gICAgICAgICAganNvbjoge3VzaW5nOiAnbmFtZScsIHZhbHVlOiAnZm9vJ30sXG4gICAgICAgIH0pO1xuICAgICAgICAoRGF0ZS5ub3coKSAtIHN0YXJ0KS5zaG91bGQuYmUuYWJvdmUoMTUwKTtcbiAgICAgICAgcmVzLnZhbHVlLnNob3VsZC5lcWwoWydmb28nXSk7XG4gICAgICAgIGF3YWl0IGVuZFNlc3Npb24obmV3U2Vzc2lvbi5zZXNzaW9uSWQpO1xuICAgICAgfSk7XG5cbiAgICAgIGl0KCdzaG91bGQgbm90IHRpbWVvdXQgd2l0aCBjb21tYW5kVGltZW91dCBvZiAwJywgYXN5bmMgKCkgPT4ge1xuICAgICAgICBkLm5ld0NvbW1hbmRUaW1lb3V0TXMgPSAyO1xuICAgICAgICBsZXQgbmV3U2Vzc2lvbiA9IGF3YWl0IHN0YXJ0VGltZW91dFNlc3Npb24oMCk7XG5cbiAgICAgICAgYXdhaXQgcmVxdWVzdCh7XG4gICAgICAgICAgdXJsOiBgaHR0cDovL2xvY2FsaG9zdDo4MTgxL3dkL2h1Yi9zZXNzaW9uLyR7ZC5zZXNzaW9uSWR9L2VsZW1lbnRgLFxuICAgICAgICAgIG1ldGhvZDogJ1BPU1QnLFxuICAgICAgICAgIGpzb246IHt1c2luZzogJ25hbWUnLCB2YWx1ZTogJ2Zvbyd9LFxuICAgICAgICB9KTtcbiAgICAgICAgYXdhaXQgQi5kZWxheSg0MDApO1xuICAgICAgICBsZXQgcmVzID0gYXdhaXQgcmVxdWVzdCh7XG4gICAgICAgICAgdXJsOiBgaHR0cDovL2xvY2FsaG9zdDo4MTgxL3dkL2h1Yi9zZXNzaW9uLyR7ZC5zZXNzaW9uSWR9YCxcbiAgICAgICAgICBtZXRob2Q6ICdHRVQnLFxuICAgICAgICAgIGpzb246IHRydWUsXG4gICAgICAgICAgc2ltcGxlOiBmYWxzZVxuICAgICAgICB9KTtcbiAgICAgICAgcmVzLnN0YXR1cy5zaG91bGQuZXF1YWwoMCk7XG4gICAgICAgIHJlcyA9IGF3YWl0IGVuZFNlc3Npb24obmV3U2Vzc2lvbi5zZXNzaW9uSWQpO1xuICAgICAgICByZXMuc3RhdHVzLnNob3VsZC5lcXVhbCgwKTtcblxuICAgICAgICBkLm5ld0NvbW1hbmRUaW1lb3V0TXMgPSA2MCAqIDEwMDA7XG4gICAgICB9KTtcblxuICAgICAgaXQoJ3Nob3VsZCBub3QgdGltZW91dCBpZiBpdHMganVzdCB0aGUgY29tbWFuZCB0YWtpbmcgYXdoaWxlJywgYXN5bmMgKCkgPT4ge1xuICAgICAgICBsZXQgbmV3U2Vzc2lvbiA9IGF3YWl0IHN0YXJ0VGltZW91dFNlc3Npb24oMC4yNSk7XG4gICAgICAgIGF3YWl0IHJlcXVlc3Qoe1xuICAgICAgICAgIHVybDogYGh0dHA6Ly9sb2NhbGhvc3Q6ODE4MS93ZC9odWIvc2Vzc2lvbi8ke2Quc2Vzc2lvbklkfS9lbGVtZW50YCxcbiAgICAgICAgICBtZXRob2Q6ICdQT1NUJyxcbiAgICAgICAgICBqc29uOiB7dXNpbmc6ICduYW1lJywgdmFsdWU6ICdmb28nfSxcbiAgICAgICAgfSk7XG4gICAgICAgIGF3YWl0IEIuZGVsYXkoNDAwKTtcbiAgICAgICAgbGV0IHJlcyA9IGF3YWl0IHJlcXVlc3Qoe1xuICAgICAgICAgIHVybDogYGh0dHA6Ly9sb2NhbGhvc3Q6ODE4MS93ZC9odWIvc2Vzc2lvbi8ke2Quc2Vzc2lvbklkfWAsXG4gICAgICAgICAgbWV0aG9kOiAnR0VUJyxcbiAgICAgICAgICBqc29uOiB0cnVlLFxuICAgICAgICAgIHNpbXBsZTogZmFsc2VcbiAgICAgICAgfSk7XG4gICAgICAgIHJlcy5zdGF0dXMuc2hvdWxkLmVxdWFsKDYpO1xuICAgICAgICBzaG91bGQuZXF1YWwoZC5zZXNzaW9uSWQsIG51bGwpO1xuICAgICAgICByZXMgPSBhd2FpdCBlbmRTZXNzaW9uKG5ld1Nlc3Npb24uc2Vzc2lvbklkKTtcbiAgICAgICAgcmVzLnN0YXR1cy5zaG91bGQuZXF1YWwoNik7XG4gICAgICB9KTtcblxuICAgICAgaXQoJ3Nob3VsZCBub3QgaGF2ZSBhIHRpbWVyIHJ1bm5pbmcgYmVmb3JlIG9yIGFmdGVyIGEgc2Vzc2lvbicsIGFzeW5jICgpID0+IHtcbiAgICAgICAgc2hvdWxkLm5vdC5leGlzdChkLm5vQ29tbWFuZFRpbWVyKTtcbiAgICAgICAgbGV0IG5ld1Nlc3Npb24gPSBhd2FpdCBzdGFydFRpbWVvdXRTZXNzaW9uKDAuMjUpO1xuICAgICAgICBuZXdTZXNzaW9uLnNlc3Npb25JZC5zaG91bGQuZXF1YWwoZC5zZXNzaW9uSWQpO1xuICAgICAgICBzaG91bGQuZXhpc3QoZC5ub0NvbW1hbmRUaW1lcik7XG4gICAgICAgIGF3YWl0IGVuZFNlc3Npb24obmV3U2Vzc2lvbi5zZXNzaW9uSWQpO1xuICAgICAgICBzaG91bGQubm90LmV4aXN0KGQubm9Db21tYW5kVGltZXIpO1xuICAgICAgfSk7XG5cbiAgICB9KTtcblxuICAgIGRlc2NyaWJlKCdzZXR0aW5ncyBhcGknLCAoKSA9PiB7XG4gICAgICBiZWZvcmUoKCkgPT4ge1xuICAgICAgICBkLnNldHRpbmdzID0gbmV3IERldmljZVNldHRpbmdzKHtpZ25vcmVVbmltcG9ydGFudFZpZXdzOiBmYWxzZX0pO1xuICAgICAgfSk7XG4gICAgICBpdCgnc2hvdWxkIGJlIGFibGUgdG8gZ2V0IHNldHRpbmdzIG9iamVjdCcsICgpID0+IHtcbiAgICAgICAgZC5zZXR0aW5ncy5nZXRTZXR0aW5ncygpLmlnbm9yZVVuaW1wb3J0YW50Vmlld3Muc2hvdWxkLmJlLmZhbHNlO1xuICAgICAgfSk7XG4gICAgICBpdCgnc2hvdWxkIHRocm93IGVycm9yIHdoZW4gdXBkYXRlU2V0dGluZ3MgbWV0aG9kIGlzIG5vdCBkZWZpbmVkJywgYXN5bmMgKCkgPT4ge1xuICAgICAgICBhd2FpdCBkLnNldHRpbmdzLnVwZGF0ZSh7aWdub3JlVW5pbXBvcnRhbnRWaWV3czogdHJ1ZX0pLnNob3VsZC5ldmVudHVhbGx5XG4gICAgICAgICAgICAgICAgLmJlLnJlamVjdGVkV2l0aCgnb25TZXR0aW5nc1VwZGF0ZScpO1xuICAgICAgfSk7XG4gICAgICBpdCgnc2hvdWxkIHRocm93IGVycm9yIGZvciBpbnZhbGlkIHVwZGF0ZSBvYmplY3QnLCBhc3luYyAoKSA9PiB7XG4gICAgICAgIGF3YWl0IGQuc2V0dGluZ3MudXBkYXRlKCdpbnZhbGlkIGpzb24nKS5zaG91bGQuZXZlbnR1YWxseVxuICAgICAgICAgICAgICAgIC5iZS5yZWplY3RlZFdpdGgoJ0pTT04nKTtcbiAgICAgIH0pO1xuICAgIH0pO1xuXG4gICAgZGVzY3JpYmUoJ3VuZXhwZWN0ZWQgZXhpdHMnLCAoKSA9PiB7XG4gICAgICBpdCgnc2hvdWxkIHJlamVjdCBhIGN1cnJlbnQgY29tbWFuZCB3aGVuIHRoZSBkcml2ZXIgY3Jhc2hlcycsIGFzeW5jICgpID0+IHtcbiAgICAgICAgZC5fb2xkR2V0U3RhdHVzID0gZC5nZXRTdGF0dXM7XG4gICAgICAgIGQuZ2V0U3RhdHVzID0gYXN5bmMgZnVuY3Rpb24gKCkge1xuICAgICAgICAgIGF3YWl0IEIuZGVsYXkoNTAwMCk7XG4gICAgICAgIH0uYmluZChkKTtcbiAgICAgICAgbGV0IHAgPSByZXF1ZXN0KHtcbiAgICAgICAgICB1cmw6ICdodHRwOi8vbG9jYWxob3N0OjgxODEvd2QvaHViL3N0YXR1cycsXG4gICAgICAgICAgbWV0aG9kOiAnR0VUJyxcbiAgICAgICAgICBqc29uOiB0cnVlLFxuICAgICAgICAgIHNpbXBsZTogZmFsc2VcbiAgICAgICAgfSk7XG4gICAgICAgIC8vIG1ha2Ugc3VyZSB0aGF0IHRoZSByZXF1ZXN0IGdldHMgdG8gdGhlIHNlcnZlciBiZWZvcmUgb3VyIHNodXRkb3duXG4gICAgICAgIGF3YWl0IEIuZGVsYXkoMjApO1xuICAgICAgICBkLnN0YXJ0VW5leHBlY3RlZFNodXRkb3duKG5ldyBFcnJvcignQ3Jhc2h5dGltZXMnKSk7XG4gICAgICAgIGxldCByZXMgPSBhd2FpdCBwO1xuICAgICAgICByZXMuc3RhdHVzLnNob3VsZC5lcXVhbCgxMyk7XG4gICAgICAgIHJlcy52YWx1ZS5tZXNzYWdlLnNob3VsZC5jb250YWluKCdDcmFzaHl0aW1lcycpO1xuICAgICAgICBhd2FpdCBkLm9uVW5leHBlY3RlZFNodXRkb3duLnNob3VsZC5iZS5yZWplY3RlZFdpdGgoJ0NyYXNoeXRpbWVzJyk7XG4gICAgICB9KTtcbiAgICB9KTtcblxuICAgIGRlc2NyaWJlKCdldmVudCB0aW1pbmdzJywgKCkgPT4ge1xuICAgICAgaXQoJ3Nob3VsZCBub3QgYWRkIHRpbWluZ3MgaWYgbm90IHVzaW5nIG9wdC1pbiBjYXAnLCBhc3luYyAoKSA9PiB7XG4gICAgICAgIGxldCBzZXNzaW9uID0gYXdhaXQgc3RhcnRTZXNzaW9uKGRlZmF1bHRDYXBzKTtcbiAgICAgICAgbGV0IHJlcyA9IGF3YWl0IGdldFNlc3Npb24oc2Vzc2lvbi5zZXNzaW9uSWQpO1xuICAgICAgICBzaG91bGQubm90LmV4aXN0KHJlcy5ldmVudHMpO1xuICAgICAgICBhd2FpdCBlbmRTZXNzaW9uKHNlc3Npb24uc2Vzc2lvbklkKTtcbiAgICAgIH0pO1xuICAgICAgaXQoJ3Nob3VsZCBhZGQgc3RhcnQgc2Vzc2lvbiB0aW1pbmdzJywgYXN5bmMgKCkgPT4ge1xuICAgICAgICBsZXQgY2FwcyA9IE9iamVjdC5hc3NpZ24oe30sIGRlZmF1bHRDYXBzLCB7ZXZlbnRUaW1pbmdzOiB0cnVlfSk7XG4gICAgICAgIGxldCBzZXNzaW9uID0gYXdhaXQgc3RhcnRTZXNzaW9uKGNhcHMpO1xuICAgICAgICBsZXQgcmVzID0gKGF3YWl0IGdldFNlc3Npb24oc2Vzc2lvbi5zZXNzaW9uSWQpKS52YWx1ZTtcbiAgICAgICAgc2hvdWxkLmV4aXN0KHJlcy5ldmVudHMpO1xuICAgICAgICBzaG91bGQuZXhpc3QocmVzLmV2ZW50cy5uZXdTZXNzaW9uUmVxdWVzdGVkKTtcbiAgICAgICAgc2hvdWxkLmV4aXN0KHJlcy5ldmVudHMubmV3U2Vzc2lvblN0YXJ0ZWQpO1xuICAgICAgICByZXMuZXZlbnRzLm5ld1Nlc3Npb25SZXF1ZXN0ZWRbMF0uc2hvdWxkLmJlLmEoJ251bWJlcicpO1xuICAgICAgICByZXMuZXZlbnRzLm5ld1Nlc3Npb25TdGFydGVkWzBdLnNob3VsZC5iZS5hKCdudW1iZXInKTtcbiAgICAgICAgYXdhaXQgZW5kU2Vzc2lvbihzZXNzaW9uLnNlc3Npb25JZCk7XG4gICAgICB9KTtcbiAgICB9KTtcblxuICB9KTtcbn1cblxuZXhwb3J0IGRlZmF1bHQgYmFzZURyaXZlckUyRVRlc3RzO1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLi8uLiJ9
