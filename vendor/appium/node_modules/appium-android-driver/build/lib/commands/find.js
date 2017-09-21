'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _Object$assign = require('babel-runtime/core-js/object/assign')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

var _appiumBaseDriver = require('appium-base-driver');

var helpers = {},
    extensions = {};

/**
 * Reason for isolating doFindElementOrEls from findElOrEls is for reusing findElOrEls
 * across android-drivers (like appium-uiautomator2-driver) to avoid code duplication.
 * Other android-drivers (like appium-uiautomator2-driver) need to override doFindElementOrEls
 * to facilitate findElOrEls.
 */
helpers.doFindElementOrEls = function callee$0$0(params) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction('find', params));

      case 2:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 3:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

// stategy: locator strategy
// selector: the actual selector for finding an element
// mult: multiple elements or just one?
// context: finding an element from the root context? or starting from another element
helpers.findElOrEls = function callee$0$0(strategy, selector, mult) {
  var context = arguments.length <= 3 || arguments[3] === undefined ? '' : arguments[3];
  var params, element, doFind;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    var _this = this;

    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        // throws error if not valid, uses this.locatorStrategies
        this.validateLocatorStrategy(strategy);

        if (selector) {
          context$1$0.next = 3;
          break;
        }

        throw new Error("Must provide a selector when finding elements");

      case 3:
        params = {
          strategy: strategy,
          selector: selector,
          context: context,
          multiple: mult
        };
        element = undefined;

        doFind = function doFind() {
          return _regeneratorRuntime.async(function doFind$(context$2$0) {
            while (1) switch (context$2$0.prev = context$2$0.next) {
              case 0:
                context$2$0.prev = 0;
                context$2$0.next = 3;
                return _regeneratorRuntime.awrap(this.doFindElementOrEls(params));

              case 3:
                element = context$2$0.sent;
                context$2$0.next = 11;
                break;

              case 6:
                context$2$0.prev = 6;
                context$2$0.t0 = context$2$0['catch'](0);

                if (!(context$2$0.t0.message && context$2$0.t0.message.match(/An element could not be located/))) {
                  context$2$0.next = 10;
                  break;
                }

                return context$2$0.abrupt('return', false);

              case 10:
                throw context$2$0.t0;

              case 11:
                if (!params.multiple) {
                  context$2$0.next = 15;
                  break;
                }

                return context$2$0.abrupt('return', element && element.length !== 0);

              case 15:
                return context$2$0.abrupt('return', !_lodash2['default'].isNull(element));

              case 16:
              case 'end':
                return context$2$0.stop();
            }
          }, null, _this, [[0, 6]]);
        };

        context$1$0.prev = 6;
        context$1$0.next = 9;
        return _regeneratorRuntime.awrap(this.implicitWaitForCondition(doFind));

      case 9:
        context$1$0.next = 18;
        break;

      case 11:
        context$1$0.prev = 11;
        context$1$0.t0 = context$1$0['catch'](6);

        if (!(context$1$0.t0.message && context$1$0.t0.message.match(/Condition unmet/))) {
          context$1$0.next = 17;
          break;
        }

        // only get here if we are looking for multiple elements
        // condition was not met setting res to empty array
        element = [];
        context$1$0.next = 18;
        break;

      case 17:
        throw context$1$0.t0;

      case 18:
        if (!mult) {
          context$1$0.next = 22;
          break;
        }

        return context$1$0.abrupt('return', element);

      case 22:
        if (!(!element || _lodash2['default'].size(element) === 0)) {
          context$1$0.next = 24;
          break;
        }

        throw new _appiumBaseDriver.errors.NoSuchElementError();

      case 24:
        return context$1$0.abrupt('return', element);

      case 25:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[6, 11]]);
};

_Object$assign(extensions, helpers);
exports.helpers = helpers;
exports['default'] = extensions;

// we are fine with this, just indicate a retry

// we want to return false if we want to potentially try again
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9jb21tYW5kcy9maW5kLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7OztzQkFBYyxRQUFROzs7O2dDQUNDLG9CQUFvQjs7QUFHM0MsSUFBSSxPQUFPLEdBQUcsRUFBRTtJQUFFLFVBQVUsR0FBRyxFQUFFLENBQUM7Ozs7Ozs7O0FBUWxDLE9BQU8sQ0FBQyxrQkFBa0IsR0FBRyxvQkFBZ0IsTUFBTTs7Ozs7eUNBQ3BDLElBQUksQ0FBQyxTQUFTLENBQUMsVUFBVSxDQUFDLE1BQU0sRUFBRSxNQUFNLENBQUM7Ozs7Ozs7Ozs7Q0FDdkQsQ0FBQzs7Ozs7O0FBTUYsT0FBTyxDQUFDLFdBQVcsR0FBRyxvQkFBZ0IsUUFBUSxFQUFFLFFBQVEsRUFBRSxJQUFJO01BQUUsT0FBTyx5REFBRyxFQUFFO01BUXRFLE1BQU0sRUFPTixPQUFPLEVBQ1AsTUFBTTs7Ozs7OztBQWRWLFlBQUksQ0FBQyx1QkFBdUIsQ0FBQyxRQUFRLENBQUMsQ0FBQzs7WUFFbEMsUUFBUTs7Ozs7Y0FDTCxJQUFJLEtBQUssQ0FBQywrQ0FBK0MsQ0FBQzs7O0FBRzlELGNBQU0sR0FBRztBQUNYLGtCQUFRLEVBQVIsUUFBUTtBQUNSLGtCQUFRLEVBQVIsUUFBUTtBQUNSLGlCQUFPLEVBQVAsT0FBTztBQUNQLGtCQUFRLEVBQUUsSUFBSTtTQUNmO0FBRUcsZUFBTzs7QUFDUCxjQUFNLEdBQUcsU0FBVCxNQUFNOzs7Ozs7aURBRVUsSUFBSSxDQUFDLGtCQUFrQixDQUFDLE1BQU0sQ0FBQzs7O0FBQS9DLHVCQUFPOzs7Ozs7OztzQkFFSCxlQUFJLE9BQU8sSUFBSSxlQUFJLE9BQU8sQ0FBQyxLQUFLLENBQUMsaUNBQWlDLENBQUMsQ0FBQTs7Ozs7b0RBRTlELEtBQUs7Ozs7OztxQkFNWixNQUFNLENBQUMsUUFBUTs7Ozs7b0RBQ1YsT0FBTyxJQUFJLE9BQU8sQ0FBQyxNQUFNLEtBQUssQ0FBQzs7O29EQUUvQixDQUFDLG9CQUFFLE1BQU0sQ0FBQyxPQUFPLENBQUM7Ozs7Ozs7U0FFNUI7Ozs7eUNBR08sSUFBSSxDQUFDLHdCQUF3QixDQUFDLE1BQU0sQ0FBQzs7Ozs7Ozs7OztjQUV2QyxlQUFJLE9BQU8sSUFBSSxlQUFJLE9BQU8sQ0FBQyxLQUFLLENBQUMsaUJBQWlCLENBQUMsQ0FBQTs7Ozs7OztBQUdyRCxlQUFPLEdBQUcsRUFBRSxDQUFDOzs7Ozs7OzthQU1iLElBQUk7Ozs7OzRDQUNDLE9BQU87OztjQUVWLENBQUMsT0FBTyxJQUFJLG9CQUFFLElBQUksQ0FBQyxPQUFPLENBQUMsS0FBSyxDQUFDLENBQUE7Ozs7O2NBQzdCLElBQUkseUJBQU8sa0JBQWtCLEVBQUU7Ozs0Q0FFaEMsT0FBTzs7Ozs7OztDQUVqQixDQUFDOztBQUVGLGVBQWMsVUFBVSxFQUFFLE9BQU8sQ0FBQyxDQUFDO1FBQzFCLE9BQU8sR0FBUCxPQUFPO3FCQUNELFVBQVUiLCJmaWxlIjoibGliL2NvbW1hbmRzL2ZpbmQuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgXyBmcm9tICdsb2Rhc2gnO1xuaW1wb3J0IHsgZXJyb3JzIH0gZnJvbSAnYXBwaXVtLWJhc2UtZHJpdmVyJztcblxuXG5sZXQgaGVscGVycyA9IHt9LCBleHRlbnNpb25zID0ge307XG5cbi8qKlxuICogUmVhc29uIGZvciBpc29sYXRpbmcgZG9GaW5kRWxlbWVudE9yRWxzIGZyb20gZmluZEVsT3JFbHMgaXMgZm9yIHJldXNpbmcgZmluZEVsT3JFbHNcbiAqIGFjcm9zcyBhbmRyb2lkLWRyaXZlcnMgKGxpa2UgYXBwaXVtLXVpYXV0b21hdG9yMi1kcml2ZXIpIHRvIGF2b2lkIGNvZGUgZHVwbGljYXRpb24uXG4gKiBPdGhlciBhbmRyb2lkLWRyaXZlcnMgKGxpa2UgYXBwaXVtLXVpYXV0b21hdG9yMi1kcml2ZXIpIG5lZWQgdG8gb3ZlcnJpZGUgZG9GaW5kRWxlbWVudE9yRWxzXG4gKiB0byBmYWNpbGl0YXRlIGZpbmRFbE9yRWxzLlxuICovXG5oZWxwZXJzLmRvRmluZEVsZW1lbnRPckVscyA9IGFzeW5jIGZ1bmN0aW9uIChwYXJhbXMpIHtcbiAgcmV0dXJuIGF3YWl0IHRoaXMuYm9vdHN0cmFwLnNlbmRBY3Rpb24oJ2ZpbmQnLCBwYXJhbXMpO1xufTtcblxuLy8gc3RhdGVneTogbG9jYXRvciBzdHJhdGVneVxuLy8gc2VsZWN0b3I6IHRoZSBhY3R1YWwgc2VsZWN0b3IgZm9yIGZpbmRpbmcgYW4gZWxlbWVudFxuLy8gbXVsdDogbXVsdGlwbGUgZWxlbWVudHMgb3IganVzdCBvbmU/XG4vLyBjb250ZXh0OiBmaW5kaW5nIGFuIGVsZW1lbnQgZnJvbSB0aGUgcm9vdCBjb250ZXh0PyBvciBzdGFydGluZyBmcm9tIGFub3RoZXIgZWxlbWVudFxuaGVscGVycy5maW5kRWxPckVscyA9IGFzeW5jIGZ1bmN0aW9uIChzdHJhdGVneSwgc2VsZWN0b3IsIG11bHQsIGNvbnRleHQgPSAnJykge1xuICAvLyB0aHJvd3MgZXJyb3IgaWYgbm90IHZhbGlkLCB1c2VzIHRoaXMubG9jYXRvclN0cmF0ZWdpZXNcbiAgdGhpcy52YWxpZGF0ZUxvY2F0b3JTdHJhdGVneShzdHJhdGVneSk7XG5cbiAgaWYgKCFzZWxlY3Rvcikge1xuICAgIHRocm93IG5ldyBFcnJvcihcIk11c3QgcHJvdmlkZSBhIHNlbGVjdG9yIHdoZW4gZmluZGluZyBlbGVtZW50c1wiKTtcbiAgfVxuXG4gIGxldCBwYXJhbXMgPSB7XG4gICAgc3RyYXRlZ3ksXG4gICAgc2VsZWN0b3IsXG4gICAgY29udGV4dCxcbiAgICBtdWx0aXBsZTogbXVsdFxuICB9O1xuXG4gIGxldCBlbGVtZW50O1xuICBsZXQgZG9GaW5kID0gYXN5bmMgKCkgPT4ge1xuICAgIHRyeSB7XG4gICAgICBlbGVtZW50ID0gYXdhaXQgdGhpcy5kb0ZpbmRFbGVtZW50T3JFbHMocGFyYW1zKTtcbiAgICB9IGNhdGNoIChlcnIpIHtcbiAgICAgIGlmIChlcnIubWVzc2FnZSAmJiBlcnIubWVzc2FnZS5tYXRjaCgvQW4gZWxlbWVudCBjb3VsZCBub3QgYmUgbG9jYXRlZC8pKSB7XG4gICAgICAgIC8vIHdlIGFyZSBmaW5lIHdpdGggdGhpcywganVzdCBpbmRpY2F0ZSBhIHJldHJ5XG4gICAgICAgIHJldHVybiBmYWxzZTtcbiAgICAgIH1cbiAgICAgIHRocm93IGVycjtcbiAgICB9XG5cbiAgICAvLyB3ZSB3YW50IHRvIHJldHVybiBmYWxzZSBpZiB3ZSB3YW50IHRvIHBvdGVudGlhbGx5IHRyeSBhZ2FpblxuICAgIGlmIChwYXJhbXMubXVsdGlwbGUpIHtcbiAgICAgIHJldHVybiBlbGVtZW50ICYmIGVsZW1lbnQubGVuZ3RoICE9PSAwO1xuICAgIH0gZWxzZSB7XG4gICAgICByZXR1cm4gIV8uaXNOdWxsKGVsZW1lbnQpO1xuICAgIH1cbiAgfTtcblxuICB0cnkge1xuICAgIGF3YWl0IHRoaXMuaW1wbGljaXRXYWl0Rm9yQ29uZGl0aW9uKGRvRmluZCk7XG4gIH0gY2F0Y2ggKGVycikge1xuICAgIGlmIChlcnIubWVzc2FnZSAmJiBlcnIubWVzc2FnZS5tYXRjaCgvQ29uZGl0aW9uIHVubWV0LykpIHtcbiAgICAgIC8vIG9ubHkgZ2V0IGhlcmUgaWYgd2UgYXJlIGxvb2tpbmcgZm9yIG11bHRpcGxlIGVsZW1lbnRzXG4gICAgICAvLyBjb25kaXRpb24gd2FzIG5vdCBtZXQgc2V0dGluZyByZXMgdG8gZW1wdHkgYXJyYXlcbiAgICAgIGVsZW1lbnQgPSBbXTtcbiAgICB9IGVsc2Uge1xuICAgICAgdGhyb3cgZXJyO1xuICAgIH1cbiAgfVxuXG4gIGlmIChtdWx0KSB7XG4gICAgcmV0dXJuIGVsZW1lbnQ7XG4gIH0gZWxzZSB7XG4gICAgaWYgKCFlbGVtZW50IHx8IF8uc2l6ZShlbGVtZW50KSA9PT0gMCkge1xuICAgICAgdGhyb3cgbmV3IGVycm9ycy5Ob1N1Y2hFbGVtZW50RXJyb3IoKTtcbiAgICB9XG4gICAgcmV0dXJuIGVsZW1lbnQ7XG4gIH1cbn07XG5cbk9iamVjdC5hc3NpZ24oZXh0ZW5zaW9ucywgaGVscGVycyk7XG5leHBvcnQgeyBoZWxwZXJzIH07XG5leHBvcnQgZGVmYXVsdCBleHRlbnNpb25zO1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLi8uLiJ9
