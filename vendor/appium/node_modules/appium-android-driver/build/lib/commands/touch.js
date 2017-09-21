'use strict';

var _toConsumableArray = require('babel-runtime/helpers/to-consumable-array')['default'];

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _getIterator = require('babel-runtime/core-js/get-iterator')['default'];

var _Object$assign = require('babel-runtime/core-js/object/assign')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _logger = require('../logger');

var _logger2 = _interopRequireDefault(_logger);

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

var _androidHelpers = require('../android-helpers');

var _androidHelpers2 = _interopRequireDefault(_androidHelpers);

var _bluebird = require('bluebird');

var _bluebird2 = _interopRequireDefault(_bluebird);

var _appiumBaseDriver = require('appium-base-driver');

var _asyncbox = require('asyncbox');

var commands = {},
    helpers = {},
    extensions = {};

commands.doTouchAction = function callee$0$0(action, opts) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.t0 = action;
        context$1$0.next = context$1$0.t0 === 'tap' ? 3 : context$1$0.t0 === 'press' ? 6 : context$1$0.t0 === 'release' ? 9 : context$1$0.t0 === 'moveTo' ? 12 : context$1$0.t0 === 'wait' ? 15 : context$1$0.t0 === 'longPress' ? 18 : context$1$0.t0 === 'cancel' ? 22 : 24;
        break;

      case 3:
        context$1$0.next = 5;
        return _regeneratorRuntime.awrap(this.tap(opts.element, opts.x, opts.y, opts.count));

      case 5:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 6:
        context$1$0.next = 8;
        return _regeneratorRuntime.awrap(this.touchDown(opts.element, opts.x, opts.y));

      case 8:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 9:
        context$1$0.next = 11;
        return _regeneratorRuntime.awrap(this.touchUp(opts.element, opts.x, opts.y));

      case 11:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 12:
        context$1$0.next = 14;
        return _regeneratorRuntime.awrap(this.touchMove(opts.element, opts.x, opts.y));

      case 14:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 15:
        context$1$0.next = 17;
        return _regeneratorRuntime.awrap(_bluebird2['default'].delay(opts.ms));

      case 17:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 18:
        if (typeof opts.duration === 'undefined' || !opts.duration) {
          opts.duration = 1000;
        }
        context$1$0.next = 21;
        return _regeneratorRuntime.awrap(this.touchLongClick(opts.element, opts.x, opts.y, opts.duration));

      case 21:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 22:
        // TODO: clarify behavior of 'cancel' action and fix this
        _logger2['default'].warn("Cancel action currently has no effect");
        return context$1$0.abrupt('break', 25);

      case 24:
        _logger2['default'].errorAndThrow('unknown action ' + action);

      case 25:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

// drag is *not* press-move-release, so we need to translate
// drag works fine for scroll, as well
helpers.doTouchDrag = function callee$0$0(gestures) {
  var longPress, moveTo, startX, startY, endX, endY, _ref, x, y, _ref2, apiLevel, duration;

  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        longPress = gestures[0];
        moveTo = gestures[1];
        startX = longPress.options.x || 0, startY = longPress.options.y || 0, endX = moveTo.options.x || 0, endY = moveTo.options.y || 0;

        if (!longPress.options.element) {
          context$1$0.next = 11;
          break;
        }

        context$1$0.next = 6;
        return _regeneratorRuntime.awrap(this.getLocationInView(longPress.options.element));

      case 6:
        _ref = context$1$0.sent;
        x = _ref.x;
        y = _ref.y;

        startX += x || 0;
        startY += y || 0;

      case 11:
        if (!moveTo.options.element) {
          context$1$0.next = 19;
          break;
        }

        context$1$0.next = 14;
        return _regeneratorRuntime.awrap(this.getLocationInView(moveTo.options.element));

      case 14:
        _ref2 = context$1$0.sent;
        x = _ref2.x;
        y = _ref2.y;

        endX += x || 0;
        endY += y || 0;

      case 19:
        context$1$0.next = 21;
        return _regeneratorRuntime.awrap(this.adb.getApiLevel());

      case 21:
        apiLevel = context$1$0.sent;
        duration = apiLevel >= 5 ? 2 : 1;

        // make sure that if the long press has a duration, we use it.
        if (longPress.options && longPress.options.duration) {
          duration = Math.max(longPress.options.duration / 1000, duration);
        }

        // `drag` will take care of whether there is an element or not at that level
        context$1$0.next = 26;
        return _regeneratorRuntime.awrap(this.drag(startX, startY, endX, endY, duration, 1, longPress.options.element, moveTo.options.element));

      case 26:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 27:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

// Release gesture needs element or co-ordinates to release it from that position
// or else release gesture is performed from center of the screen, so to fix it
// This method sets co-ordinates/element to release gesture if it has no options set already.
helpers.fixRelease = function callee$0$0(gestures) {
  var release, ref, _iteratorNormalCompletion, _didIteratorError, _iteratorError, _iterator, _step, gesture, opts, loc, size;

  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        release = _lodash2['default'].last(gestures);

        // sometimes there are no options
        release.options = release.options || {};
        // nothing to do if release options are already set

        if (!(release.options.element || release.options.x && release.options.y)) {
          context$1$0.next = 4;
          break;
        }

        return context$1$0.abrupt('return');

      case 4:
        // without coordinates, `release` uses the center of the screen, which,
        // generally speaking, is not what we want
        // therefore: loop backwards and use the last command with an element and/or
        // offset coordinates
        gestures = _lodash2['default'].clone(gestures);
        ref = null;
        _iteratorNormalCompletion = true;
        _didIteratorError = false;
        _iteratorError = undefined;
        context$1$0.prev = 9;
        _iterator = _getIterator(gestures.reverse());

      case 11:
        if (_iteratorNormalCompletion = (_step = _iterator.next()).done) {
          context$1$0.next = 20;
          break;
        }

        gesture = _step.value;
        opts = gesture.options;

        if (!(opts.element || opts.x && opts.y)) {
          context$1$0.next = 17;
          break;
        }

        ref = gesture;
        return context$1$0.abrupt('break', 20);

      case 17:
        _iteratorNormalCompletion = true;
        context$1$0.next = 11;
        break;

      case 20:
        context$1$0.next = 26;
        break;

      case 22:
        context$1$0.prev = 22;
        context$1$0.t0 = context$1$0['catch'](9);
        _didIteratorError = true;
        _iteratorError = context$1$0.t0;

      case 26:
        context$1$0.prev = 26;
        context$1$0.prev = 27;

        if (!_iteratorNormalCompletion && _iterator['return']) {
          _iterator['return']();
        }

      case 29:
        context$1$0.prev = 29;

        if (!_didIteratorError) {
          context$1$0.next = 32;
          break;
        }

        throw _iteratorError;

      case 32:
        return context$1$0.finish(29);

      case 33:
        return context$1$0.finish(26);

      case 34:
        if (!ref) {
          context$1$0.next = 51;
          break;
        }

        opts = ref.options;

        if (!opts.element) {
          context$1$0.next = 50;
          break;
        }

        context$1$0.next = 39;
        return _regeneratorRuntime.awrap(this.getLocationInView(opts.element));

      case 39:
        loc = context$1$0.sent;

        if (!(opts.x && opts.y)) {
          context$1$0.next = 44;
          break;
        }

        // this is an offset from the element
        release.options = {
          x: loc.x + opts.x,
          y: loc.y + opts.y
        };
        context$1$0.next = 48;
        break;

      case 44:
        context$1$0.next = 46;
        return _regeneratorRuntime.awrap(this.getSize(opts.element));

      case 46:
        size = context$1$0.sent;

        release.options = {
          x: loc.x + size.width / 2,
          y: loc.y + size.height / 2
        };

      case 48:
        context$1$0.next = 51;
        break;

      case 50:
        release.options = _lodash2['default'].pick(opts, 'x', 'y');

      case 51:
        return context$1$0.abrupt('return', release);

      case 52:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[9, 22, 26, 34], [27,, 29, 33]]);
};

// Perform one gesture
helpers.performGesture = function callee$0$0(gesture) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.prev = 0;
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap(this.doTouchAction(gesture.action, gesture.options || {}));

      case 3:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 6:
        context$1$0.prev = 6;
        context$1$0.t0 = context$1$0['catch'](0);

        if (!((0, _appiumBaseDriver.isErrorType)(context$1$0.t0, _appiumBaseDriver.errors.NoSuchElementError) && gesture.action === 'release' && gesture.options.element)) {
          context$1$0.next = 14;
          break;
        }

        delete gesture.options.element;
        _logger2['default'].debug('retrying release without element opts: ' + gesture.options + '.');
        context$1$0.next = 13;
        return _regeneratorRuntime.awrap(this.doTouchAction(gesture.action, gesture.options || {}));

      case 13:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 14:
        throw context$1$0.t0;

      case 15:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[0, 6]]);
};

commands.performTouch = function callee$0$0(gestures) {
  var swipeOpts, actions, press, wait, fixedGestures, _iteratorNormalCompletion2, _didIteratorError2, _iteratorError2, _iterator2, _step2, g;

  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        if (!this.isWebContext()) {
          context$1$0.next = 2;
          break;
        }

        throw new _appiumBaseDriver.errors.NotYetImplementedError();

      case 2:
        if (!(gestures.length === 4 && gestures[0].action === 'press' && gestures[1].action === 'wait' && gestures[2].action === 'moveTo' && gestures[3].action === 'release')) {
          context$1$0.next = 9;
          break;
        }

        context$1$0.next = 5;
        return _regeneratorRuntime.awrap(this.getSwipeOptions(gestures));

      case 5:
        swipeOpts = context$1$0.sent;
        context$1$0.next = 8;
        return _regeneratorRuntime.awrap(this.swipe(swipeOpts.startX, swipeOpts.startY, swipeOpts.endX, swipeOpts.endY, swipeOpts.duration, swipeOpts.touchCount, swipeOpts.element));

      case 8:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 9:
        actions = _lodash2['default'].pluck(gestures, "action");

        if (!(actions[0] === 'longPress' && actions[1] === 'moveTo' && actions[2] === 'release')) {
          context$1$0.next = 16;
          break;
        }

        context$1$0.next = 13;
        return _regeneratorRuntime.awrap(this.doTouchDrag(gestures));

      case 13:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 16:
        if (actions.length === 2) {
          // `press` without a wait is too slow and gets interpretted as a `longPress`
          if (_lodash2['default'].first(actions) === 'press' && _lodash2['default'].last(actions) === 'release') {
            actions[0] = 'tap';
            gestures[0].action = 'tap';
          }

          // the `longPress` and `tap` methods release on their own
          if ((_lodash2['default'].first(actions) === 'tap' || _lodash2['default'].first(actions) === 'longPress') && _lodash2['default'].last(actions) === 'release') {
            gestures.pop();
            actions.pop();
          }
        } else {
          // longpress followed by anything other than release should become a press and wait
          if (actions[0] === 'longPress') {
            actions = ['press', 'wait'].concat(_toConsumableArray(actions.slice(1)));

            press = gestures.shift();

            press.action = 'press';
            wait = {
              action: 'wait',
              options: { ms: press.options.duration || 1000 }
            };

            delete press.options.duration;
            gestures = [press, wait].concat(_toConsumableArray(gestures));
          }
        }

        context$1$0.next = 19;
        return _regeneratorRuntime.awrap(this.parseTouch(gestures, false));

      case 19:
        fixedGestures = context$1$0.sent;

        if (!(actions[actions.length - 1] === 'release')) {
          context$1$0.next = 24;
          break;
        }

        context$1$0.next = 23;
        return _regeneratorRuntime.awrap(this.fixRelease(gestures));

      case 23:
        actions[actions.length - 1] = context$1$0.sent;

      case 24:
        _iteratorNormalCompletion2 = true;
        _didIteratorError2 = false;
        _iteratorError2 = undefined;
        context$1$0.prev = 27;
        _iterator2 = _getIterator(fixedGestures);

      case 29:
        if (_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done) {
          context$1$0.next = 36;
          break;
        }

        g = _step2.value;
        context$1$0.next = 33;
        return _regeneratorRuntime.awrap(this.performGesture(g));

      case 33:
        _iteratorNormalCompletion2 = true;
        context$1$0.next = 29;
        break;

      case 36:
        context$1$0.next = 42;
        break;

      case 38:
        context$1$0.prev = 38;
        context$1$0.t0 = context$1$0['catch'](27);
        _didIteratorError2 = true;
        _iteratorError2 = context$1$0.t0;

      case 42:
        context$1$0.prev = 42;
        context$1$0.prev = 43;

        if (!_iteratorNormalCompletion2 && _iterator2['return']) {
          _iterator2['return']();
        }

      case 45:
        context$1$0.prev = 45;

        if (!_didIteratorError2) {
          context$1$0.next = 48;
          break;
        }

        throw _iteratorError2;

      case 48:
        return context$1$0.finish(45);

      case 49:
        return context$1$0.finish(42);

      case 50:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[27, 38, 42, 50], [43,, 45, 49]]);
};

helpers.parseTouch = function callee$0$0(gestures, multi) {
  var touchStateObjects, prevPos, time, _iteratorNormalCompletion3, _didIteratorError3, _iteratorError3, _iterator3, _step3, state, timeOffset;

  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    var _this = this;

    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        // because multi-touch releases at the end by default
        if (multi && _lodash2['default'].last(gestures).action === 'release') {
          gestures.pop();
        }

        context$1$0.next = 3;
        return _regeneratorRuntime.awrap((0, _asyncbox.asyncmap)(gestures, function callee$1$0(gesture) {
          var options, elementId, pos, size, touchStateObject, offset;
          return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
            while (1) switch (context$2$0.prev = context$2$0.next) {
              case 0:
                options = gesture.options || {};

                if (!_lodash2['default'].contains(['press', 'moveTo', 'tap', 'longPress'], gesture.action)) {
                  context$2$0.next = 23;
                  break;
                }

                options.offset = false;
                elementId = gesture.options.element;

                if (!elementId) {
                  context$2$0.next = 16;
                  break;
                }

                context$2$0.next = 7;
                return _regeneratorRuntime.awrap(this.getLocationInView(elementId));

              case 7:
                pos = context$2$0.sent;
                context$2$0.next = 10;
                return _regeneratorRuntime.awrap(this.getSize(elementId));

              case 10:
                size = context$2$0.sent;

                if (gesture.options.x || gesture.options.y) {
                  options.x = pos.x + (gesture.options.x || 0);
                  options.y = pos.y + (gesture.options.y || 0);
                } else {
                  options.x = pos.x + size.width / 2;
                  options.y = pos.y + size.height / 2;
                }
                touchStateObject = {
                  action: gesture.action,
                  options: options,
                  timeOffset: 0.005
                };
                return context$2$0.abrupt('return', touchStateObject);

              case 16:
                // expects absolute coordinates, so we need to save these as offsets
                // and then translate when everything is done
                options.offset = true;
                options.x = gesture.options.x || 0;
                options.y = gesture.options.y || 0;

                touchStateObject = {
                  action: gesture.action,
                  options: options,
                  timeOffset: 0.005
                };
                return context$2$0.abrupt('return', touchStateObject);

              case 21:
                context$2$0.next = 27;
                break;

              case 23:
                offset = 0.005;

                if (gesture.action === 'wait') {
                  options = gesture.options;
                  offset = parseInt(gesture.options.ms) / 1000;
                }
                touchStateObject = {
                  action: gesture.action,
                  options: options,
                  timeOffset: offset
                };
                return context$2$0.abrupt('return', touchStateObject);

              case 27:
              case 'end':
                return context$2$0.stop();
            }
          }, null, _this);
        }, false));

      case 3:
        touchStateObjects = context$1$0.sent;
        prevPos = null, time = 0;
        _iteratorNormalCompletion3 = true;
        _didIteratorError3 = false;
        _iteratorError3 = undefined;
        context$1$0.prev = 8;

        for (_iterator3 = _getIterator(touchStateObjects); !(_iteratorNormalCompletion3 = (_step3 = _iterator3.next()).done); _iteratorNormalCompletion3 = true) {
          state = _step3.value;

          if (_lodash2['default'].isUndefined(state.options.x) && _lodash2['default'].isUndefined(state.options.y) && prevPos !== null) {
            // this happens with wait
            state.options.x = prevPos.x;
            state.options.y = prevPos.y;
          }
          if (state.options.offset && prevPos) {
            // the current position is an offset
            state.options.x += prevPos.x;
            state.options.y += prevPos.y;
          }
          delete state.options.offset;
          if (!_lodash2['default'].isUndefined(state.options.x) && !_lodash2['default'].isUndefined(state.options.y)) prevPos = state.options;

          if (multi) {
            timeOffset = state.timeOffset;

            time += timeOffset;
            state.time = _androidHelpers2['default'].truncateDecimals(time, 3);

            // multi gestures require 'touch' rather than 'options'
            if (!_lodash2['default'].isUndefined(state.options.x) && !_lodash2['default'].isUndefined(state.options.y)) state.touch = {
              x: state.options.x,
              y: state.options.y
            };
            delete state.options;
          }
          delete state.timeOffset;
        }
        context$1$0.next = 16;
        break;

      case 12:
        context$1$0.prev = 12;
        context$1$0.t0 = context$1$0['catch'](8);
        _didIteratorError3 = true;
        _iteratorError3 = context$1$0.t0;

      case 16:
        context$1$0.prev = 16;
        context$1$0.prev = 17;

        if (!_iteratorNormalCompletion3 && _iterator3['return']) {
          _iterator3['return']();
        }

      case 19:
        context$1$0.prev = 19;

        if (!_didIteratorError3) {
          context$1$0.next = 22;
          break;
        }

        throw _iteratorError3;

      case 22:
        return context$1$0.finish(19);

      case 23:
        return context$1$0.finish(16);

      case 24:
        return context$1$0.abrupt('return', touchStateObjects);

      case 25:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[8, 12, 16, 24], [17,, 19, 23]]);
};

commands.performMultiAction = function callee$0$0(actions, elementId) {
  var states;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    var _this2 = this;

    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        if (!this.isWebContext()) {
          context$1$0.next = 2;
          break;
        }

        throw new _appiumBaseDriver.errors.NotYetImplementedError();

      case 2:
        if (!(actions.length === 1)) {
          context$1$0.next = 4;
          break;
        }

        throw new Error("Multi Pointer Gestures need at least two actions. " + "Use Touch Actions for a single action.");

      case 4:
        context$1$0.next = 6;
        return _regeneratorRuntime.awrap((0, _asyncbox.asyncmap)(actions, function callee$1$0(action) {
          return _regeneratorRuntime.async(function callee$1$0$(context$2$0) {
            while (1) switch (context$2$0.prev = context$2$0.next) {
              case 0:
                context$2$0.next = 2;
                return _regeneratorRuntime.awrap(this.parseTouch(action, true));

              case 2:
                return context$2$0.abrupt('return', context$2$0.sent);

              case 3:
              case 'end':
                return context$2$0.stop();
            }
          }, null, _this2);
        }, false));

      case 6:
        states = context$1$0.sent;
        return context$1$0.abrupt('return', this.doPerformMultiAction(elementId, states));

      case 8:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

/**
 * Reason for isolating doPerformMultiAction from performMultiAction is for reusing performMultiAction
 * across android-drivers (like appium-uiautomator2-driver) and to avoid code duplication.
 * Other android-drivers (like appium-uiautomator2-driver) need to override doPerformMultiAction
 * to facilitate performMultiAction.
 */
commands.doPerformMultiAction = function callee$0$0(elementId, states) {
  var opts;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        opts = undefined;

        if (!elementId) {
          context$1$0.next = 8;
          break;
        }

        opts = {
          elementId: elementId,
          actions: states
        };
        context$1$0.next = 5;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:performMultiPointerGesture", opts));

      case 5:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 8:
        opts = {
          actions: states
        };
        context$1$0.next = 11;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("performMultiPointerGesture", opts));

      case 11:
        return context$1$0.abrupt('return', context$1$0.sent);

      case 12:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
};

_Object$assign(extensions, commands, helpers);
exports.commands = commands;
exports.helpers = helpers;
exports['default'] = extensions;

// lollipop takes a little longer to get things rolling

// this is the center of the element

// sometime the element is not available when releasing, retry without it

// press-wait-moveTo-release is `swipe`, so use native method

// some things are special

// fix release action then perform all actions

// we need to change the time (which is now an offset)
// and the position (which may be an offset)

// Android needs at least two actions to be able to perform a multi pointer gesture
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9jb21tYW5kcy90b3VjaC5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7O3NCQUFnQixXQUFXOzs7O3NCQUNiLFFBQVE7Ozs7OEJBQ0ssb0JBQW9COzs7O3dCQUNqQyxVQUFVOzs7O2dDQUNZLG9CQUFvQjs7d0JBQy9CLFVBQVU7O0FBRW5DLElBQUksUUFBUSxHQUFHLEVBQUU7SUFBRSxPQUFPLEdBQUcsRUFBRTtJQUFFLFVBQVUsR0FBRyxFQUFFLENBQUM7O0FBRWpELFFBQVEsQ0FBQyxhQUFhLEdBQUcsb0JBQWdCLE1BQU0sRUFBRSxJQUFJOzs7O3lCQUMzQyxNQUFNOzhDQUNQLEtBQUssMEJBRUwsT0FBTywwQkFFUCxTQUFTLDBCQUVULFFBQVEsMkJBRVIsTUFBTSwyQkFFTixXQUFXLDJCQUtYLFFBQVE7Ozs7O3lDQWRFLElBQUksQ0FBQyxHQUFHLENBQUMsSUFBSSxDQUFDLE9BQU8sRUFBRSxJQUFJLENBQUMsQ0FBQyxFQUFFLElBQUksQ0FBQyxDQUFDLEVBQUUsSUFBSSxDQUFDLEtBQUssQ0FBQzs7Ozs7Ozt5Q0FFbEQsSUFBSSxDQUFDLFNBQVMsQ0FBQyxJQUFJLENBQUMsT0FBTyxFQUFFLElBQUksQ0FBQyxDQUFDLEVBQUUsSUFBSSxDQUFDLENBQUMsQ0FBQzs7Ozs7Ozt5Q0FFNUMsSUFBSSxDQUFDLE9BQU8sQ0FBQyxJQUFJLENBQUMsT0FBTyxFQUFFLElBQUksQ0FBQyxDQUFDLEVBQUUsSUFBSSxDQUFDLENBQUMsQ0FBQzs7Ozs7Ozt5Q0FFMUMsSUFBSSxDQUFDLFNBQVMsQ0FBQyxJQUFJLENBQUMsT0FBTyxFQUFFLElBQUksQ0FBQyxDQUFDLEVBQUUsSUFBSSxDQUFDLENBQUMsQ0FBQzs7Ozs7Ozt5Q0FFNUMsc0JBQUUsS0FBSyxDQUFDLElBQUksQ0FBQyxFQUFFLENBQUM7Ozs7OztBQUU3QixZQUFJLE9BQU8sSUFBSSxDQUFDLFFBQVEsS0FBSyxXQUFXLElBQUksQ0FBQyxJQUFJLENBQUMsUUFBUSxFQUFF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SSxHQUFHO0FBQ0wsaUJBQU8sRUFBRSxNQUFNO1NBQ2hCLENBQUM7O3lDQUNXLElBQUksQ0FBQyxTQUFTLENBQUMsVUFBVSxDQUFDLDRCQUE0QixFQUFFLElBQUksQ0FBQzs7Ozs7Ozs7OztDQUU3RSxDQUFDOztBQUVGLGVBQWMsVUFBVSxFQUFFLFFBQVEsRUFBRSxPQUFPLENBQUMsQ0FBQztRQUNwQyxRQUFRLEdBQVIsUUFBUTtRQUFFLE9BQU8sR0FBUCxPQUFPO3FCQUNYLFVBQVUiLCJmaWxlIjoibGliL2NvbW1hbmRzL3RvdWNoLmpzIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IGxvZyBmcm9tICcuLi9sb2dnZXInO1xuaW1wb3J0IF8gZnJvbSAnbG9kYXNoJztcbmltcG9ydCBhbmRyb2lkSGVscGVycyBmcm9tICcuLi9hbmRyb2lkLWhlbHBlcnMnO1xuaW1wb3J0IEIgZnJvbSAnYmx1ZWJpcmQnO1xuaW1wb3J0IHsgZXJyb3JzLCBpc0Vycm9yVHlwZSB9IGZyb20gJ2FwcGl1bS1iYXNlLWRyaXZlcic7XG5pbXBvcnQgeyBhc3luY21hcCB9IGZyb20gJ2FzeW5jYm94JztcblxubGV0IGNvbW1hbmRzID0ge30sIGhlbHBlcnMgPSB7fSwgZXh0ZW5zaW9ucyA9IHt9O1xuXG5jb21tYW5kcy5kb1RvdWNoQWN0aW9uID0gYXN5bmMgZnVuY3Rpb24gKGFjdGlvbiwgb3B0cykge1xuICBzd2l0Y2ggKGFjdGlvbikge1xuICAgIGNhc2UgJ3RhcCc6XG4gICAgICByZXR1cm4gYXdhaXQgdGhpcy50YXAob3B0cy5lbGVtZW50LCBvcHRzLngsIG9wdHMueSwgb3B0cy5jb3VudCk7XG4gICAgY2FzZSAncHJlc3MnOlxuICAgICAgcmV0dXJuIGF3YWl0IHRoaXMudG91Y2hEb3duKG9wdHMuZWxlbWVudCwgb3B0cy54LCBvcHRzLnkpO1xuICAgIGNhc2UgJ3JlbGVhc2UnOlxuICAgICAgcmV0dXJuIGF3YWl0IHRoaXMudG91Y2hVcChvcHRzLmVsZW1lbnQsIG9wdHMueCwgb3B0cy55KTtcbiAgICBjYXNlICdtb3ZlVG8nOlxuICAgICAgcmV0dXJuIGF3YWl0IHRoaXMudG91Y2hNb3ZlKG9wdHMuZWxlbWVudCwgb3B0cy54LCBvcHRzLnkpO1xuICAgIGNhc2UgJ3dhaXQnOlxuICAgICAgcmV0dXJuIGF3YWl0IEIuZGVsYXkob3B0cy5tcyk7XG4gICAgY2FzZSAnbG9uZ1ByZXNzJzpcbiAgICAgIGlmICh0eXBlb2Ygb3B0cy5kdXJhdGlvbiA9PT0gJ3VuZGVmaW5lZCcgfHwgIW9wdHMuZHVyYXRpb24pIHtcbiAgICAgICAgb3B0cy5kdXJhdGlvbiA9IDEwMDA7XG4gICAgICB9XG4gICAgICByZXR1cm4gYXdhaXQgdGhpcy50b3VjaExvbmdDbGljayhvcHRzLmVsZW1lbnQsIG9wdHMueCwgb3B0cy55LCBvcHRzLmR1cmF0aW9uKTtcbiAgICBjYXNlICdjYW5jZWwnOlxuICAgICAgLy8gVE9ETzogY2xhcmlmeSBiZWhhdmlvciBvZiAnY2FuY2VsJyBhY3Rpb24gYW5kIGZpeCB0aGlzXG4gICAgICBsb2cud2FybihcIkNhbmNlbCBhY3Rpb24gY3VycmVudGx5IGhhcyBubyBlZmZlY3RcIik7XG4gICAgICBicmVhaztcbiAgICBkZWZhdWx0OlxuICAgICAgbG9nLmVycm9yQW5kVGhyb3coYHVua25vd24gYWN0aW9uICR7YWN0aW9ufWApO1xuICB9XG59O1xuXG5cbi8vIGRyYWcgaXMgKm5vdCogcHJlc3MtbW92ZS1yZWxlYXNlLCBzbyB3ZSBuZWVkIHRvIHRyYW5zbGF0ZVxuLy8gZHJhZyB3b3JrcyBmaW5lIGZvciBzY3JvbGwsIGFzIHdlbGxcbmhlbHBlcnMuZG9Ub3VjaERyYWcgPSBhc3luYyBmdW5jdGlvbiAoZ2VzdHVyZXMpIHtcbiAgbGV0IGxvbmdQcmVzcyA9IGdlc3R1cmVzWzBdO1xuICBsZXQgbW92ZVRvID0gZ2VzdHVyZXNbMV07XG4gIGxldCBzdGFydFggPSBsb25nUHJlc3Mub3B0aW9ucy54IHx8IDAsXG4gICAgICBzdGFydFkgPSBsb25nUHJlc3Mub3B0aW9ucy55IHx8IDAsXG4gICAgICBlbmRYID0gbW92ZVRvLm9wdGlvbnMueCB8fCAwLFxuICAgICAgZW5kWSA9IG1vdmVUby5vcHRpb25zLnkgfHwgMDtcbiAgaWYgKGxvbmdQcmVzcy5vcHRpb25zLmVsZW1lbnQpIHtcbiAgICBsZXQge3gsIHl9ID0gYXdhaXQgdGhpcy5nZXRMb2NhdGlvbkluVmlldyhsb25nUHJlc3Mub3B0aW9ucy5lbGVtZW50KTtcbiAgICBzdGFydFggKz0geCB8fCAwO1xuICAgIHN0YXJ0WSArPSB5IHx8IDA7XG4gIH1cbiAgaWYgKG1vdmVUby5vcHRpb25zLmVsZW1lbnQpIHtcbiAgICBsZXQge3gsIHl9ID0gYXdhaXQgdGhpcy5nZXRMb2NhdGlvbkluVmlldyhtb3ZlVG8ub3B0aW9ucy5lbGVtZW50KTtcbiAgICBlbmRYICs9IHggfHwgMDtcbiAgICBlbmRZICs9IHkgfHwgMDtcbiAgfVxuXG4gIGxldCBhcGlMZXZlbCA9IGF3YWl0IHRoaXMuYWRiLmdldEFwaUxldmVsKCk7XG4gIC8vIGxvbGxpcG9wIHRha2VzIGEgbGl0dGxlIGxvbmdlciB0byBnZXQgdGhpbmdzIHJvbGxpbmdcbiAgbGV0IGR1cmF0aW9uID0gYXBpTGV2ZWwgPj0gNSA/IDIgOiAxO1xuICAvLyBtYWtlIHN1cmUgdGhhdCBpZiB0aGUgbG9uZyBwcmVzcyBoYXMgYSBkdXJhdGlvbiwgd2UgdXNlIGl0LlxuICBpZiAobG9uZ1ByZXNzLm9wdGlvbnMgJiYgbG9uZ1ByZXNzLm9wdGlvbnMuZHVyYXRpb24pIHtcbiAgICBkdXJhdGlvbiA9IE1hdGgubWF4KGxvbmdQcmVzcy5vcHRpb25zLmR1cmF0aW9uIC8gMTAwMCwgZHVyYXRpb24pO1xuICB9XG5cbiAgLy8gYGRyYWdgIHdpbGwgdGFrZSBjYXJlIG9mIHdoZXRoZXIgdGhlcmUgaXMgYW4gZWxlbWVudCBvciBub3QgYXQgdGhhdCBsZXZlbFxuICByZXR1cm4gYXdhaXQgdGhpcy5kcmFnKHN0YXJ0WCwgc3RhcnRZLCBlbmRYLCBlbmRZLCBkdXJhdGlvbiwgMSwgbG9uZ1ByZXNzLm9wdGlvbnMuZWxlbWVudCwgbW92ZVRvLm9wdGlvbnMuZWxlbWVudCk7XG59O1xuXG4vLyBSZWxlYXNlIGdlc3R1cmUgbmVlZHMgZWxlbWVudCBvciBjby1vcmRpbmF0ZXMgdG8gcmVsZWFzZSBpdCBmcm9tIHRoYXQgcG9zaXRpb25cbi8vIG9yIGVsc2UgcmVsZWFzZSBnZXN0dXJlIGlzIHBlcmZvcm1lZCBmcm9tIGNlbnRlciBvZiB0aGUgc2NyZWVuLCBzbyB0byBmaXggaXRcbi8vIFRoaXMgbWV0aG9kIHNldHMgY28tb3JkaW5hdGVzL2VsZW1lbnQgdG8gcmVsZWFzZSBnZXN0dXJlIGlmIGl0IGhhcyBubyBvcHRpb25zIHNldCBhbHJlYWR5LlxuaGVscGVycy5maXhSZWxlYXNlID0gYXN5bmMgZnVuY3Rpb24gKGdlc3R1cmVzKSB7XG4gIGxldCByZWxlYXNlID0gXy5sYXN0KGdlc3R1cmVzKTtcbiAgLy8gc29tZXRpbWVzIHRoZXJlIGFyZSBubyBvcHRpb25zXG4gIHJlbGVhc2Uub3B0aW9ucyA9IHJlbGVhc2Uub3B0aW9ucyB8fCB7fTtcbiAgLy8gbm90aGluZyB0byBkbyBpZiByZWxlYXNlIG9wdGlvbnMgYXJlIGFscmVhZHkgc2V0XG4gIGlmIChyZWxlYXNlLm9wdGlvbnMuZWxlbWVudCB8fCAocmVsZWFzZS5vcHRpb25zLnggJiYgcmVsZWFzZS5vcHRpb25zLnkpKSB7XG4gICAgcmV0dXJuO1xuICB9XG4gIC8vIHdpdGhvdXQgY29vcmRpbmF0ZXMsIGByZWxlYXNlYCB1c2VzIHRoZSBjZW50ZXIgb2YgdGhlIHNjcmVlbiwgd2hpY2gsXG4gIC8vIGdlbmVyYWxseSBzcGVha2luZywgaXMgbm90IHdoYXQgd2Ugd2FudFxuICAvLyB0aGVyZWZvcmU6IGxvb3AgYmFja3dhcmRzIGFuZCB1c2UgdGhlIGxhc3QgY29tbWFuZCB3aXRoIGFuIGVsZW1lbnQgYW5kL29yXG4gIC8vIG9mZnNldCBjb29yZGluYXRlc1xuICBnZXN0dXJlcyA9IF8uY2xvbmUoZ2VzdHVyZXMpO1xuICBsZXQgcmVmID0gbnVsbDtcbiAgZm9yIChsZXQgZ2VzdHVyZSBvZiBnZXN0dXJlcy5yZXZlcnNlKCkpIHtcbiAgICBsZXQgb3B0cyA9IGdlc3R1cmUub3B0aW9ucztcbiAgICBpZiAob3B0cy5lbGVtZW50IHx8IChvcHRzLnggJiYgb3B0cy55KSkge1xuICAgICAgcmVmID0gZ2VzdHVyZTtcbiAgICAgIGJyZWFrO1xuICAgIH1cbiAgfVxuICBpZiAocmVmKSB7XG4gICAgbGV0IG9wdHMgPSByZWYub3B0aW9ucztcbiAgICBpZiAob3B0cy5lbGVtZW50KSB7XG4gICAgICBsZXQgbG9jID0gYXdhaXQgdGhpcy5nZXRMb2NhdGlvbkluVmlldyhvcHRzLmVsZW1lbnQpO1xuICAgICAgaWYgKG9wdHMueCAmJiBvcHRzLnkpIHtcbiAgICAgICAgLy8gdGhpcyBpcyBhbiBvZmZzZXQgZnJvbSB0aGUgZWxlbWVudFxuICAgICAgICByZWxlYXNlLm9wdGlvbnMgPSB7XG4gICAgICAgICAgeDogbG9jLnggKyBvcHRzLngsXG4gICAgICAgICAgeTogbG9jLnkgKyBvcHRzLnlcbiAgICAgICAgfTtcbiAgICAgIH0gZWxzZSB7XG4gICAgICAgIC8vIHRoaXMgaXMgdGhlIGNlbnRlciBvZiB0aGUgZWxlbWVudFxuICAgICAgICBsZXQgc2l6ZSA9IGF3YWl0IHRoaXMuZ2V0U2l6ZShvcHRzLmVsZW1lbnQpO1xuICAgICAgICByZWxlYXNlLm9wdGlvbnMgPSB7XG4gICAgICAgICAgeDogbG9jLnggKyBzaXplLndpZHRoIC8gMixcbiAgICAgICAgICB5OiBsb2MueSArIHNpemUuaGVpZ2h0IC8gMlxuICAgICAgICB9O1xuICAgICAgfVxuICAgIH0gZWxzZSB7XG4gICAgICByZWxlYXNlLm9wdGlvbnMgPSBfLnBpY2sob3B0cywgJ3gnLCAneScpO1xuICAgIH1cbiAgfVxuICByZXR1cm4gcmVsZWFzZTtcbn07XG5cbi8vIFBlcmZvcm0gb25lIGdlc3R1cmVcbmhlbHBlcnMucGVyZm9ybUdlc3R1cmUgPSBhc3luYyBmdW5jdGlvbiAoZ2VzdHVyZSkge1xuICB0cnkge1xuICAgIHJldHVybiBhd2FpdCB0aGlzLmRvVG91Y2hBY3Rpb24oZ2VzdHVyZS5hY3Rpb24sIGdlc3R1cmUub3B0aW9ucyB8fCB7fSk7XG4gIH0gY2F0Y2ggKGUpIHtcbiAgICAvLyBzb21ldGltZSB0aGUgZWxlbWVudCBpcyBub3QgYXZhaWxhYmxlIHdoZW4gcmVsZWFzaW5nLCByZXRyeSB3aXRob3V0IGl0XG4gICAgaWYgKGlzRXJyb3JUeXBlKGUsIGVycm9ycy5Ob1N1Y2hFbGVtZW50RXJyb3IpICYmIGdlc3R1cmUuYWN0aW9uID09PSAncmVsZWFzZScgJiZcbiAgICAgICAgZ2VzdHVyZS5vcHRpb25zLmVsZW1lbnQpIHtcbiAgICAgIGRlbGV0ZSBnZXN0dXJlLm9wdGlvbnMuZWxlbWVudDtcbiAgICAgIGxvZy5kZWJ1ZyhgcmV0cnlpbmcgcmVsZWFzZSB3aXRob3V0IGVsZW1lbnQgb3B0czogJHtnZXN0dXJlLm9wdGlvbnN9LmApO1xuICAgICAgcmV0dXJuIGF3YWl0IHRoaXMuZG9Ub3VjaEFjdGlvbihnZXN0dXJlLmFjdGlvbiwgZ2VzdHVyZS5vcHRpb25zIHx8IHt9KTtcbiAgICB9XG4gICAgdGhyb3cgZTtcbiAgfVxufTtcblxuY29tbWFuZHMucGVyZm9ybVRvdWNoID0gYXN5bmMgZnVuY3Rpb24gKGdlc3R1cmVzKSB7XG4gIGlmICh0aGlzLmlzV2ViQ29udGV4dCgpKSB7XG4gICAgdGhyb3cgbmV3IGVycm9ycy5Ob3RZZXRJbXBsZW1lbnRlZEVycm9yKCk7XG4gIH1cblxuICAvLyBwcmVzcy13YWl0LW1vdmVUby1yZWxlYXNlIGlzIGBzd2lwZWAsIHNvIHVzZSBuYXRpdmUgbWV0aG9kXG4gIGlmIChnZXN0dXJlcy5sZW5ndGggPT09IDQgJiZcbiAgICAgIGdlc3R1cmVzWzBdLmFjdGlvbiA9PT0gJ3ByZXNzJyAmJlxuICAgICAgZ2VzdHVyZXNbMV0uYWN0aW9uID09PSAnd2FpdCcgJiZcbiAgICAgIGdlc3R1cmVzWzJdLmFjdGlvbiA9PT0gJ21vdmVUbycgJiZcbiAgICAgIGdlc3R1cmVzWzNdLmFjdGlvbiA9PT0gJ3JlbGVhc2UnKSB7XG5cbiAgICBsZXQgc3dpcGVPcHRzID0gYXdhaXQgdGhpcy5nZXRTd2lwZU9wdGlvbnMoZ2VzdHVyZXMpO1xuICAgIHJldHVybiBhd2FpdCB0aGlzLnN3aXBlKHN3aXBlT3B0cy5zdGFydFgsIHN3aXBlT3B0cy5zdGFydFksIHN3aXBlT3B0cy5lbmRYLFxuICAgICAgICBzd2lwZU9wdHMuZW5kWSwgc3dpcGVPcHRzLmR1cmF0aW9uLCBzd2lwZU9wdHMudG91Y2hDb3VudCxcbiAgICAgICAgc3dpcGVPcHRzLmVsZW1lbnQpO1xuICB9XG4gIGxldCBhY3Rpb25zID0gXy5wbHVjayhnZXN0dXJlcywgXCJhY3Rpb25cIik7XG5cbiAgaWYgKGFjdGlvbnNbMF0gPT09ICdsb25nUHJlc3MnICYmIGFjdGlvbnNbMV0gPT09ICdtb3ZlVG8nICYmIGFjdGlvbnNbMl0gPT09ICdyZWxlYXNlJykge1xuICAgIC8vIHNvbWUgdGhpbmdzIGFyZSBzcGVjaWFsXG4gICAgcmV0dXJuIGF3YWl0IHRoaXMuZG9Ub3VjaERyYWcoZ2VzdHVyZXMpO1xuICB9IGVsc2Uge1xuICAgIGlmIChhY3Rpb25zLmxlbmd0aCA9PT0gMikge1xuICAgICAgLy8gYHByZXNzYCB3aXRob3V0IGEgd2FpdCBpcyB0b28gc2xvdyBhbmQgZ2V0cyBpbnRlcnByZXR0ZWQgYXMgYSBgbG9uZ1ByZXNzYFxuICAgICAgaWYgKF8uZmlyc3QoYWN0aW9ucykgPT09ICdwcmVzcycgJiYgXy5sYXN0KGFjdGlvbnMpID09PSAncmVsZWFzZScpIHtcbiAgICAgICAgYWN0aW9uc1swXSA9ICd0YXAnO1xuICAgICAgICBnZXN0dXJlc1swXS5hY3Rpb24gPSAndGFwJztcbiAgICAgIH1cblxuICAgICAgLy8gdGhlIGBsb25nUHJlc3NgIGFuZCBgdGFwYCBtZXRob2RzIHJlbGVhc2Ugb24gdGhlaXIgb3duXG4gICAgICBpZiAoKF8uZmlyc3QoYWN0aW9ucykgPT09ICd0YXAnIHx8IF8uZmlyc3QoYWN0aW9ucykgPT09ICdsb25nUHJlc3MnKSAmJiBfLmxhc3QoYWN0aW9ucykgPT09ICdyZWxlYXNlJykge1xuICAgICAgICBnZXN0dXJlcy5wb3AoKTtcbiAgICAgICAgYWN0aW9ucy5wb3AoKTtcbiAgICAgIH1cbiAgICB9IGVsc2Uge1xuICAgICAgLy8gbG9uZ3ByZXNzIGZvbGxvd2VkIGJ5IGFueXRoaW5nIG90aGVyIHRoYW4gcmVsZWFzZSBzaG91bGQgYmVjb21lIGEgcHJlc3MgYW5kIHdhaXRcbiAgICAgIGlmIChhY3Rpb25zWzBdID09PSAnbG9uZ1ByZXNzJykge1xuICAgICAgICBhY3Rpb25zID0gWydwcmVzcycsICd3YWl0JywgLi4uYWN0aW9ucy5zbGljZSgxKV07XG5cbiAgICAgICAgbGV0IHByZXNzID0gZ2VzdHVyZXMuc2hpZnQoKTtcbiAgICAgICAgcHJlc3MuYWN0aW9uID0gJ3ByZXNzJztcbiAgICAgICAgbGV0IHdhaXQgPSB7XG4gICAgICAgICAgYWN0aW9uOiAnd2FpdCcsXG4gICAgICAgICAgb3B0aW9uczoge21zOiBwcmVzcy5vcHRpb25zLmR1cmF0aW9uIHx8IDEwMDB9XG4gICAgICAgIH07XG4gICAgICAgIGRlbGV0ZSBwcmVzcy5vcHRpb25zLmR1cmF0aW9uO1xuICAgICAgICBnZXN0dXJlcyA9IFtwcmVzcywgd2FpdCwgLi4uZ2VzdHVyZXNdO1xuICAgICAgfVxuICAgIH1cblxuICAgIGxldCBmaXhlZEdlc3R1cmVzID0gYXdhaXQgdGhpcy5wYXJzZVRvdWNoKGdlc3R1cmVzLCBmYWxzZSk7XG4gICAgLy8gZml4IHJlbGVhc2UgYWN0aW9uIHRoZW4gcGVyZm9ybSBhbGwgYWN0aW9uc1xuICAgIGlmIChhY3Rpb25zW2FjdGlvbnMubGVuZ3RoIC0gMV0gPT09ICdyZWxlYXNlJykge1xuICAgICAgYWN0aW9uc1thY3Rpb25zLmxlbmd0aCAtIDFdID0gYXdhaXQgdGhpcy5maXhSZWxlYXNlKGdlc3R1cmVzKTtcbiAgICB9XG4gICAgZm9yIChsZXQgZyBvZiBmaXhlZEdlc3R1cmVzKSB7XG4gICAgICBhd2FpdCB0aGlzLnBlcmZvcm1HZXN0dXJlKGcpO1xuICAgIH1cbiAgfVxufTtcblxuaGVscGVycy5wYXJzZVRvdWNoID0gYXN5bmMgZnVuY3Rpb24gKGdlc3R1cmVzLCBtdWx0aSkge1xuICAvLyBiZWNhdXNlIG11bHRpLXRvdWNoIHJlbGVhc2VzIGF0IHRoZSBlbmQgYnkgZGVmYXVsdFxuICBpZiAobXVsdGkgJiYgXy5sYXN0KGdlc3R1cmVzKS5hY3Rpb24gPT09ICdyZWxlYXNlJykge1xuICAgIGdlc3R1cmVzLnBvcCgpO1xuICB9XG5cbiAgbGV0IHRvdWNoU3RhdGVPYmplY3RzID0gYXdhaXQgYXN5bmNtYXAoZ2VzdHVyZXMsIGFzeW5jIChnZXN0dXJlKSA9PiB7XG4gICAgbGV0IG9wdGlvbnMgPSBnZXN0dXJlLm9wdGlvbnMgfHwge307XG4gICAgaWYgKF8uY29udGFpbnMoWydwcmVzcycsICdtb3ZlVG8nLCAndGFwJywgJ2xvbmdQcmVzcyddLCBnZXN0dXJlLmFjdGlvbikpIHtcbiAgICAgIG9wdGlvbnMub2Zmc2V0ID0gZmFsc2U7XG4gICAgICBsZXQgZWxlbWVudElkID0gZ2VzdHVyZS5vcHRpb25zLmVsZW1lbnQ7XG4gICAgICBpZiAoZWxlbWVudElkKSB7XG4gICAgICAgIGxldCBwb3MgPSBhd2FpdCB0aGlzLmdldExvY2F0aW9uSW5WaWV3KGVsZW1lbnRJZCk7XG4gICAgICAgIGxldCBzaXplID0gYXdhaXQgdGhpcy5nZXRTaXplKGVsZW1lbnRJZCk7XG4gICAgICAgIGlmIChnZXN0dXJlLm9wdGlvbnMueCB8fCBnZXN0dXJlLm9wdGlvbnMueSkge1xuICAgICAgICAgIG9wdGlvbnMueCA9IHBvcy54ICsgKGdlc3R1cmUub3B0aW9ucy54IHx8IDApO1xuICAgICAgICAgIG9wdGlvbnMueSA9IHBvcy55ICsgKGdlc3R1cmUub3B0aW9ucy55IHx8IDApO1xuICAgICAgICB9IGVsc2Uge1xuICAgICAgICAgIG9wdGlvbnMueCA9IHBvcy54ICsgKHNpemUud2lkdGggLyAyKTtcbiAgICAgICAgICBvcHRpb25zLnkgPSBwb3MueSArIChzaXplLmhlaWdodCAvIDIpO1xuICAgICAgICB9XG4gICAgICAgIGxldCB0b3VjaFN0YXRlT2JqZWN0ID0ge1xuICAgICAgICAgIGFjdGlvbjogZ2VzdHVyZS5hY3Rpb24sXG4gICAgICAgICAgb3B0aW9ucyxcbiAgICAgICAgICB0aW1lT2Zmc2V0OiAwLjAwNSxcbiAgICAgICAgfTtcbiAgICAgICAgcmV0dXJuIHRvdWNoU3RhdGVPYmplY3Q7XG4gICAgICB9IGVsc2Uge1xuICAgICAgICAvLyBleHBlY3RzIGFic29sdXRlIGNvb3JkaW5hdGVzLCBzbyB3ZSBuZWVkIHRvIHNhdmUgdGhlc2UgYXMgb2Zmc2V0c1xuICAgICAgICAvLyBhbmQgdGhlbiB0cmFuc2xhdGUgd2hlbiBldmVyeXRoaW5nIGlzIGRvbmVcbiAgICAgICAgb3B0aW9ucy5vZmZzZXQgPSB0cnVlO1xuICAgICAgICBvcHRpb25zLnggPSAoZ2VzdHVyZS5vcHRpb25zLnggfHwgMCk7XG4gICAgICAgIG9wdGlvbnMueSA9IChnZXN0dXJlLm9wdGlvbnMueSB8fCAwKTtcblxuICAgICAgICBsZXQgdG91Y2hTdGF0ZU9iamVjdCA9IHtcbiAgICAgICAgICBhY3Rpb246IGdlc3R1cmUuYWN0aW9uLFxuICAgICAgICAgIG9wdGlvbnMsXG4gICAgICAgICAgdGltZU9mZnNldDogMC4wMDUsXG4gICAgICAgIH07XG4gICAgICAgIHJldHVybiB0b3VjaFN0YXRlT2JqZWN0O1xuICAgICAgfVxuICAgIH0gZWxzZSB7XG4gICAgICBsZXQgb2Zmc2V0ID0gMC4wMDU7XG4gICAgICBpZiAoZ2VzdHVyZS5hY3Rpb24gPT09ICd3YWl0Jykge1xuICAgICAgICBvcHRpb25zID0gZ2VzdHVyZS5vcHRpb25zO1xuICAgICAgICBvZmZzZXQgPSAocGFyc2VJbnQoZ2VzdHVyZS5vcHRpb25zLm1zKSAvIDEwMDApO1xuICAgICAgfVxuICAgICAgbGV0IHRvdWNoU3RhdGVPYmplY3QgPSB7XG4gICAgICAgIGFjdGlvbjogZ2VzdHVyZS5hY3Rpb24sXG4gICAgICAgIG9wdGlvbnMsXG4gICAgICAgIHRpbWVPZmZzZXQ6IG9mZnNldCxcbiAgICAgIH07XG4gICAgICByZXR1cm4gdG91Y2hTdGF0ZU9iamVjdDtcbiAgICB9XG4gIH0sIGZhbHNlKTtcbiAgLy8gd2UgbmVlZCB0byBjaGFuZ2UgdGhlIHRpbWUgKHdoaWNoIGlzIG5vdyBhbiBvZmZzZXQpXG4gIC8vIGFuZCB0aGUgcG9zaXRpb24gKHdoaWNoIG1heSBiZSBhbiBvZmZzZXQpXG4gIGxldCBwcmV2UG9zID0gbnVsbCxcbiAgICAgIHRpbWUgPSAwO1xuICBmb3IgKGxldCBzdGF0ZSBvZiB0b3VjaFN0YXRlT2JqZWN0cykge1xuICAgIGlmIChfLmlzVW5kZWZpbmVkKHN0YXRlLm9wdGlvbnMueCkgJiYgXy5pc1VuZGVmaW5lZChzdGF0ZS5vcHRpb25zLnkpICYmIHByZXZQb3MgIT09IG51bGwpIHtcbiAgICAgIC8vIHRoaXMgaGFwcGVucyB3aXRoIHdhaXRcbiAgICAgIHN0YXRlLm9wdGlvbnMueCA9IHByZXZQb3MueDtcbiAgICAgIHN0YXRlLm9wdGlvbnMueSA9IHByZXZQb3MueTtcbiAgICB9XG4gICAgaWYgKHN0YXRlLm9wdGlvbnMub2Zmc2V0ICYmIHByZXZQb3MpIHtcbiAgICAgIC8vIHRoZSBjdXJyZW50IHBvc2l0aW9uIGlzIGFuIG9mZnNldFxuICAgICAgc3RhdGUub3B0aW9ucy54ICs9IHByZXZQb3MueDtcbiAgICAgIHN0YXRlLm9wdGlvbnMueSArPSBwcmV2UG9zLnk7XG4gICAgfVxuICAgIGRlbGV0ZSBzdGF0ZS5vcHRpb25zLm9mZnNldDtcbiAgICBpZiAoIV8uaXNVbmRlZmluZWQoc3RhdGUub3B0aW9ucy54KSAmJiAhXy5pc1VuZGVmaW5lZChzdGF0ZS5vcHRpb25zLnkpKVxuICAgICAgcHJldlBvcyA9IHN0YXRlLm9wdGlvbnM7XG5cbiAgICBpZiAobXVsdGkpIHtcbiAgICAgIHZhciB0aW1lT2Zmc2V0ID0gc3RhdGUudGltZU9mZnNldDtcbiAgICAgIHRpbWUgKz0gdGltZU9mZnNldDtcbiAgICAgIHN0YXRlLnRpbWUgPSBhbmRyb2lkSGVscGVycy50cnVuY2F0ZURlY2ltYWxzKHRpbWUsIDMpO1xuXG4gICAgICAvLyBtdWx0aSBnZXN0dXJlcyByZXF1aXJlICd0b3VjaCcgcmF0aGVyIHRoYW4gJ29wdGlvbnMnXG4gICAgICBpZiAoIV8uaXNVbmRlZmluZWQoc3RhdGUub3B0aW9ucy54KSAmJiAhXy5pc1VuZGVmaW5lZChzdGF0ZS5vcHRpb25zLnkpKVxuICAgICAgICBzdGF0ZS50b3VjaCA9IHtcbiAgICAgICAgICB4OiBzdGF0ZS5vcHRpb25zLngsXG4gICAgICAgICAgeTogc3RhdGUub3B0aW9ucy55XG4gICAgICAgIH07XG4gICAgICBkZWxldGUgc3RhdGUub3B0aW9ucztcbiAgICB9XG4gICAgZGVsZXRlIHN0YXRlLnRpbWVPZmZzZXQ7XG4gIH1cbiAgcmV0dXJuIHRvdWNoU3RhdGVPYmplY3RzO1xufTtcblxuXG5jb21tYW5kcy5wZXJmb3JtTXVsdGlBY3Rpb24gPSBhc3luYyBmdW5jdGlvbiAoYWN0aW9ucywgZWxlbWVudElkKSB7XG4gIGlmICh0aGlzLmlzV2ViQ29udGV4dCgpKSB7XG4gICAgdGhyb3cgbmV3IGVycm9ycy5Ob3RZZXRJbXBsZW1lbnRlZEVycm9yKCk7XG4gIH1cblxuICAvLyBBbmRyb2lkIG5lZWRzIGF0IGxlYXN0IHR3byBhY3Rpb25zIHRvIGJlIGFibGUgdG8gcGVyZm9ybSBhIG11bHRpIHBvaW50ZXIgZ2VzdHVyZVxuICBpZiAoYWN0aW9ucy5sZW5ndGggPT09IDEpIHtcbiAgICB0aHJvdyBuZXcgRXJyb3IoXCJNdWx0aSBQb2ludGVyIEdlc3R1cmVzIG5lZWQgYXQgbGVhc3QgdHdvIGFjdGlvbnMuIFwiICtcbiAgICAgICAgXCJVc2UgVG91Y2ggQWN0aW9ucyBmb3IgYSBzaW5nbGUgYWN0aW9uLlwiKTtcbiAgfVxuXG4gIGxldCBzdGF0ZXMgPSBhd2FpdCBhc3luY21hcChhY3Rpb25zLCBhc3luYyAoYWN0aW9uKSA9PiB7XG4gICAgcmV0dXJuIGF3YWl0IHRoaXMucGFyc2VUb3VjaChhY3Rpb24sIHRydWUpO1xuICB9LCBmYWxzZSk7XG5cbiAgcmV0dXJuIHRoaXMuZG9QZXJmb3JtTXVsdGlBY3Rpb24oZWxlbWVudElkLCBzdGF0ZXMpO1xufTtcblxuLyoqXG4gKiBSZWFzb24gZm9yIGlzb2xhdGluZyBkb1BlcmZvcm1NdWx0aUFjdGlvbiBmcm9tIHBlcmZvcm1NdWx0aUFjdGlvbiBpcyBmb3IgcmV1c2luZyBwZXJmb3JtTXVsdGlBY3Rpb25cbiAqIGFjcm9zcyBhbmRyb2lkLWRyaXZlcnMgKGxpa2UgYXBwaXVtLXVpYXV0b21hdG9yMi1kcml2ZXIpIGFuZCB0byBhdm9pZCBjb2RlIGR1cGxpY2F0aW9uLlxuICogT3RoZXIgYW5kcm9pZC1kcml2ZXJzIChsaWtlIGFwcGl1bS11aWF1dG9tYXRvcjItZHJpdmVyKSBuZWVkIHRvIG92ZXJyaWRlIGRvUGVyZm9ybU11bHRpQWN0aW9uXG4gKiB0byBmYWNpbGl0YXRlIHBlcmZvcm1NdWx0aUFjdGlvbi5cbiAqL1xuY29tbWFuZHMuZG9QZXJmb3JtTXVsdGlBY3Rpb24gPSBhc3luYyBmdW5jdGlvbiAoZWxlbWVudElkLCBzdGF0ZXMpIHtcbiAgbGV0IG9wdHM7XG4gIGlmIChlbGVtZW50SWQpIHtcbiAgICBvcHRzID0ge1xuICAgICAgZWxlbWVudElkLFxuICAgICAgYWN0aW9uczogc3RhdGVzXG4gICAgfTtcbiAgICByZXR1cm4gYXdhaXQgdGhpcy5ib290c3RyYXAuc2VuZEFjdGlvbihcImVsZW1lbnQ6cGVyZm9ybU11bHRpUG9pbnRlckdlc3R1cmVcIiwgb3B0cyk7XG4gIH0gZWxzZSB7XG4gICAgb3B0cyA9IHtcbiAgICAgIGFjdGlvbnM6IHN0YXRlc1xuICAgIH07XG4gICAgcmV0dXJuIGF3YWl0IHRoaXMuYm9vdHN0cmFwLnNlbmRBY3Rpb24oXCJwZXJmb3JtTXVsdGlQb2ludGVyR2VzdHVyZVwiLCBvcHRzKTtcbiAgfVxufTtcblxuT2JqZWN0LmFzc2lnbihleHRlbnNpb25zLCBjb21tYW5kcywgaGVscGVycyk7XG5leHBvcnQgeyBjb21tYW5kcywgaGVscGVycyB9O1xuZXhwb3J0IGRlZmF1bHQgZXh0ZW5zaW9ucztcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4vLi4ifQ==
