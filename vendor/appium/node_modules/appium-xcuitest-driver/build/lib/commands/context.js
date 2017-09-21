'use strict';

var _Object$assign = require('babel-runtime/core-js/object/assign')['default'];

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _getIterator = require('babel-runtime/core-js/get-iterator')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _appiumIosDriver = require('appium-ios-driver');

var extensions = {};

_Object$assign(extensions, _appiumIosDriver.iosCommands.context);

// override, as appium-ios-driver's version uses UI Automation to close
extensions.closeAlertBeforeTest = function callee$0$0() {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        return context$1$0.abrupt('return', true);

      case 1:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

// the appium-ios-driver version of this function fails in CI,
// and the wrong webview is almost always retrieved
extensions._getLatestWebviewContextForTitle = extensions.getLatestWebviewContextForTitle;
extensions.getLatestWebviewContextForTitle = function callee$0$0(regExp) {
  var currentUrl, contexts, matchingCtx, _iteratorNormalCompletion, _didIteratorError, _iteratorError, _iterator, _step, ctx, url;

  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        currentUrl = this.getCurrentUrl();

        if (currentUrl) {
          context$1$0.next = 3;
          break;
        }

        return context$1$0.abrupt('return', this._getLatestWebviewContextForTitle(regExp));

      case 3:
        context$1$0.next = 5;
        return _regeneratorRuntime.awrap(this.getContextsAndViews());

      case 5:
        contexts = context$1$0.sent;
        matchingCtx = undefined;
        _iteratorNormalCompletion = true;
        _didIteratorError = false;
        _iteratorError = undefined;
        context$1$0.prev = 10;
        _iterator = _getIterator(contexts);

      case 12:
        if (_iteratorNormalCompletion = (_step = _iterator.next()).done) {
          context$1$0.next = 22;
          break;
        }

        ctx = _step.value;

        if (!ctx.view) {
          context$1$0.next = 19;
          break;
        }

        url = ctx.view.url || '';

        if (!(url === this.getCurrentUrl())) {
          context$1$0.next = 19;
          break;
        }

        matchingCtx = ctx;
        return context$1$0.abrupt('break', 22);

      case 19:
        _iteratorNormalCompletion = true;
        context$1$0.next = 12;
        break;

      case 22:
        context$1$0.next = 28;
        break;

      case 24:
        context$1$0.prev = 24;
        context$1$0.t0 = context$1$0['catch'](10);
        _didIteratorError = true;
        _iteratorError = context$1$0.t0;

      case 28:
        context$1$0.prev = 28;
        context$1$0.prev = 29;

        if (!_iteratorNormalCompletion && _iterator['return']) {
          _iterator['return']();
        }

      case 31:
        context$1$0.prev = 31;

        if (!_didIteratorError) {
          context$1$0.next = 34;
          break;
        }

        throw _iteratorError;

      case 34:
        return context$1$0.finish(31);

      case 35:
        return context$1$0.finish(28);

      case 36:
        if (!matchingCtx) {
          context$1$0.next = 40;
          break;
        }

        return context$1$0.abrupt('return', matchingCtx.id);

      case 40:
        context$1$0.next = 42;
        return _regeneratorRuntime.awrap(this._getLatestWebviewContextForTitle(regExp));

      case 42:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 43:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[10, 24, 28, 36], [29,, 31, 35]]);
};

extensions.isWebContext = function () {
  return !!this.curContext && this.curContext !== _appiumIosDriver.iosCommands.context.NATIVE_WIN;
};

extensions.isWebview = function () {
  return this.isWebContext();
};

exports['default'] = extensions;
module.exports = exports['default'];
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9jb21tYW5kcy9jb250ZXh0LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7OzsrQkFBNEIsbUJBQW1COztBQUcvQyxJQUFJLFVBQVUsR0FBRyxFQUFFLENBQUM7O0FBRXBCLGVBQWMsVUFBVSxFQUFFLDZCQUFZLE9BQU8sQ0FBQyxDQUFDOzs7QUFHL0MsVUFBVSxDQUFDLG9CQUFvQixHQUFHOzs7OzRDQUN6QixJQUFJOzs7Ozs7O0NBQ1osQ0FBQzs7OztBQUlGLFVBQVUsQ0FBQyxnQ0FBZ0MsR0FBRyxVQUFVLENBQUMsK0JBQStCLENBQUM7QUFDekYsVUFBVSxDQUFDLCtCQUErQixHQUFHLG9CQUFnQixNQUFNO01BQzdELFVBQVUsRUFLVixRQUFRLEVBQ1IsV0FBVyxrRkFDTixHQUFHLEVBRUosR0FBRzs7Ozs7QUFUUCxrQkFBVSxHQUFHLElBQUksQ0FBQyxhQUFhLEVBQUU7O1lBQ2hDLFVBQVU7Ozs7OzRDQUNOLElBQUksQ0FBQyxnQ0FBZ0MsQ0FBQyxNQUFNLENBQUM7Ozs7eUNBR2pDLElBQUksQ0FBQyxtQkFBbUIsRUFBRTs7O0FBQTNDLGdCQUFRO0FBQ1IsbUJBQVc7Ozs7O2lDQUNDLFFBQVE7Ozs7Ozs7O0FBQWYsV0FBRzs7YUFDTixHQUFHLENBQUMsSUFBSTs7Ozs7QUFDTixXQUFHLEdBQUcsR0FBRyxDQUFDLElBQUksQ0FBQyxHQUFHLElBQUksRUFBRTs7Y0FDeEIsR0FBRyxLQUFLLElBQUksQ0FBQyxhQUFhLEVBQUUsQ0FBQTs7Ozs7QUFDOUIsbUJBQVcsR0FBRyxHQUFHLENBQUM7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7YUFLcEIsV0FBVzs7Ozs7NENBQ04sV0FBVyxDQUFDLEVBQUU7Ozs7eUNBRVIsSUFBSSxDQUFDLGdDQUFnQyxDQUFDLE1BQU0sQ0FBQzs7Ozs7Ozs7OztDQUU3RCxDQUFDOztBQUVGLFVBQVUsQ0FBQyxZQUFZLEdBQUcsWUFBWTtBQUNwQyxTQUFPLENBQUMsQ0FBQyxJQUFJLENBQUMsVUFBVSxJQUFJLElBQUksQ0FBQyxVQUFVLEtBQUssNkJBQVksT0FBTyxDQUFDLFVBQVUsQ0FBQztDQUNoRixDQUFDOztBQUVGLFVBQVUsQ0FBQyxTQUFTLEdBQUcsWUFBWTtBQUNqQyxTQUFPLElBQUksQ0FBQyxZQUFZLEVBQUUsQ0FBQztDQUM1QixDQUFDOztxQkFHYSxVQUFVIiwiZmlsZSI6ImxpYi9jb21tYW5kcy9jb250ZXh0LmpzIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IHsgaW9zQ29tbWFuZHMgfSBmcm9tICdhcHBpdW0taW9zLWRyaXZlcic7XG5cblxubGV0IGV4dGVuc2lvbnMgPSB7fTtcblxuT2JqZWN0LmFzc2lnbihleHRlbnNpb25zLCBpb3NDb21tYW5kcy5jb250ZXh0KTtcblxuLy8gb3ZlcnJpZGUsIGFzIGFwcGl1bS1pb3MtZHJpdmVyJ3MgdmVyc2lvbiB1c2VzIFVJIEF1dG9tYXRpb24gdG8gY2xvc2VcbmV4dGVuc2lvbnMuY2xvc2VBbGVydEJlZm9yZVRlc3QgPSBhc3luYyBmdW5jdGlvbiAoKSB7XG4gIHJldHVybiB0cnVlO1xufTtcblxuLy8gdGhlIGFwcGl1bS1pb3MtZHJpdmVyIHZlcnNpb24gb2YgdGhpcyBmdW5jdGlvbiBmYWlscyBpbiBDSSxcbi8vIGFuZCB0aGUgd3Jvbmcgd2VidmlldyBpcyBhbG1vc3QgYWx3YXlzIHJldHJpZXZlZFxuZXh0ZW5zaW9ucy5fZ2V0TGF0ZXN0V2Vidmlld0NvbnRleHRGb3JUaXRsZSA9IGV4dGVuc2lvbnMuZ2V0TGF0ZXN0V2Vidmlld0NvbnRleHRGb3JUaXRsZTtcbmV4dGVuc2lvbnMuZ2V0TGF0ZXN0V2Vidmlld0NvbnRleHRGb3JUaXRsZSA9IGFzeW5jIGZ1bmN0aW9uIChyZWdFeHApIHtcbiAgbGV0IGN1cnJlbnRVcmwgPSB0aGlzLmdldEN1cnJlbnRVcmwoKTtcbiAgaWYgKCFjdXJyZW50VXJsKSB7XG4gICAgcmV0dXJuIHRoaXMuX2dldExhdGVzdFdlYnZpZXdDb250ZXh0Rm9yVGl0bGUocmVnRXhwKTtcbiAgfVxuXG4gIGxldCBjb250ZXh0cyA9IGF3YWl0IHRoaXMuZ2V0Q29udGV4dHNBbmRWaWV3cygpO1xuICBsZXQgbWF0Y2hpbmdDdHg7XG4gIGZvciAobGV0IGN0eCBvZiBjb250ZXh0cykge1xuICAgIGlmIChjdHgudmlldykge1xuICAgICAgbGV0IHVybCA9IGN0eC52aWV3LnVybCB8fCAnJztcbiAgICAgIGlmICh1cmwgPT09IHRoaXMuZ2V0Q3VycmVudFVybCgpKSB7XG4gICAgICAgIG1hdGNoaW5nQ3R4ID0gY3R4O1xuICAgICAgICBicmVhaztcbiAgICAgIH1cbiAgICB9XG4gIH1cbiAgaWYgKG1hdGNoaW5nQ3R4KSB7XG4gICAgcmV0dXJuIG1hdGNoaW5nQ3R4LmlkO1xuICB9IGVsc2Uge1xuICAgIHJldHVybiBhd2FpdCB0aGlzLl9nZXRMYXRlc3RXZWJ2aWV3Q29udGV4dEZvclRpdGxlKHJlZ0V4cCk7XG4gIH1cbn07XG5cbmV4dGVuc2lvbnMuaXNXZWJDb250ZXh0ID0gZnVuY3Rpb24gKCkge1xuICByZXR1cm4gISF0aGlzLmN1ckNvbnRleHQgJiYgdGhpcy5jdXJDb250ZXh0ICE9PSBpb3NDb21tYW5kcy5jb250ZXh0Lk5BVElWRV9XSU47XG59O1xuXG5leHRlbnNpb25zLmlzV2VidmlldyA9IGZ1bmN0aW9uICgpIHtcbiAgcmV0dXJuIHRoaXMuaXNXZWJDb250ZXh0KCk7XG59O1xuXG5cbmV4cG9ydCBkZWZhdWx0IGV4dGVuc2lvbnM7XG4iXSwic291cmNlUm9vdCI6Ii4uLy4uLy4uIn0=
