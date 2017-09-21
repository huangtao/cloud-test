require('source-map-support').install();

'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

var _this = this;

var _libExpressStatic = require('../../lib/express/static');

var _chai = require('chai');

var _chai2 = _interopRequireDefault(_chai);

var _chaiAsPromised = require('chai-as-promised');

var _chaiAsPromised2 = _interopRequireDefault(_chaiAsPromised);

var _sinon = require('sinon');

var _sinon2 = _interopRequireDefault(_sinon);

_chai2['default'].should();
_chai2['default'].use(_chaiAsPromised2['default']);

describe('welcome', function () {
  it('should fill the template', function callee$1$0() {
    var res;
    return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
      while (1) switch (context$2$0.prev = context$2$0.next) {
        case 0:
          res = {
            send: _sinon2['default'].spy()
          };
          context$2$0.next = 3;
          return _regeneratorRuntime.awrap((0, _libExpressStatic.welcome)({}, res));

        case 3:

          res.send.calledOnce.should.be['true'];
          res.send.args[0][0].should.include('Let\'s browse!');

        case 5:
        case 'end':
          return context$2$0.stop();
      }
    }, null, _this);
  });
});
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvZXhwcmVzcy9zdGF0aWMtc3BlY3MuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7OztnQ0FFd0IsMEJBQTBCOztvQkFDakMsTUFBTTs7Ozs4QkFDSSxrQkFBa0I7Ozs7cUJBQzNCLE9BQU87Ozs7QUFHekIsa0JBQUssTUFBTSxFQUFFLENBQUM7QUFDZCxrQkFBSyxHQUFHLDZCQUFnQixDQUFDOztBQUV6QixRQUFRLENBQUMsU0FBUyxFQUFFLFlBQU07QUFDeEIsSUFBRSxDQUFDLDBCQUEwQixFQUFFO1FBQ3pCLEdBQUc7Ozs7QUFBSCxhQUFHLEdBQUc7QUFDUixnQkFBSSxFQUFFLG1CQUFNLEdBQUcsRUFBRTtXQUNsQjs7MkNBQ0ssK0JBQVEsRUFBRSxFQUFFLEdBQUcsQ0FBQzs7OztBQUV0QixhQUFHLENBQUMsSUFBSSxDQUFDLFVBQVUsQ0FBQyxNQUFNLENBQUMsRUFBRSxRQUFLLENBQUM7QUFDbkMsYUFBRyxDQUFDLElBQUksQ0FBQyxJQUFJLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUMsTUFBTSxDQUFDLE9BQU8sQ0FBQyxnQkFBZ0IsQ0FBQyxDQUFDOzs7Ozs7O0dBQ3RELENBQUMsQ0FBQztDQUNKLENBQUMsQ0FBQyIsImZpbGUiOiJ0ZXN0L2V4cHJlc3Mvc3RhdGljLXNwZWNzLmpzIiwic291cmNlc0NvbnRlbnQiOlsiLy8gdHJhbnNwaWxlOm1vY2hhXG5cbmltcG9ydCB7IHdlbGNvbWUgfSBmcm9tICcuLi8uLi9saWIvZXhwcmVzcy9zdGF0aWMnO1xuaW1wb3J0IGNoYWkgZnJvbSAnY2hhaSc7XG5pbXBvcnQgY2hhaUFzUHJvbWlzZWQgZnJvbSAnY2hhaS1hcy1wcm9taXNlZCc7XG5pbXBvcnQgc2lub24gZnJvbSAnc2lub24nO1xuXG5cbmNoYWkuc2hvdWxkKCk7XG5jaGFpLnVzZShjaGFpQXNQcm9taXNlZCk7XG5cbmRlc2NyaWJlKCd3ZWxjb21lJywgKCkgPT4ge1xuICBpdCgnc2hvdWxkIGZpbGwgdGhlIHRlbXBsYXRlJywgYXN5bmMgKCkgPT4ge1xuICAgIGxldCByZXMgPSB7XG4gICAgICBzZW5kOiBzaW5vbi5zcHkoKVxuICAgIH07XG4gICAgYXdhaXQgd2VsY29tZSh7fSwgcmVzKTtcblxuICAgIHJlcy5zZW5kLmNhbGxlZE9uY2Uuc2hvdWxkLmJlLnRydWU7XG4gICAgcmVzLnNlbmQuYXJnc1swXVswXS5zaG91bGQuaW5jbHVkZSgnTGV0XFwncyBicm93c2UhJyk7XG4gIH0pO1xufSk7XG4iXSwic291cmNlUm9vdCI6Ii4uLy4uLy4uIn0=
