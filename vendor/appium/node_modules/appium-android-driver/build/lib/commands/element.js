"use strict";

var _regeneratorRuntime = require("babel-runtime/regenerator")["default"];

var _Object$assign = require("babel-runtime/core-js/object/assign")["default"];

var _interopRequireDefault = require("babel-runtime/helpers/interop-require-default")["default"];

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _androidHelpers = require('../android-helpers');

var _androidHelpers2 = _interopRequireDefault(_androidHelpers);

var commands = {},
    helpers = {},
    extensions = {};

commands.getAttribute = function callee$0$0(attribute, elementId) {
  var p;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        p = { attribute: attribute, elementId: elementId };
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:getAttribute", p));

      case 3:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 4:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.getName = function callee$0$0(elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.getAttribute("className", elementId));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.elementDisplayed = function callee$0$0(elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.getAttribute("displayed", elementId));

      case 2:
        context$1$0.t0 = context$1$0.sent;
        return context$1$0.abrupt("return", context$1$0.t0 === 'true');

      case 4:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.elementEnabled = function callee$0$0(elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.getAttribute("enabled", elementId));

      case 2:
        context$1$0.t0 = context$1$0.sent;
        return context$1$0.abrupt("return", context$1$0.t0 === 'true');

      case 4:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.elementSelected = function callee$0$0(elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.getAttribute("selected", elementId));

      case 2:
        context$1$0.t0 = context$1$0.sent;
        return context$1$0.abrupt("return", context$1$0.t0 === 'true');

      case 4:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

helpers.setElementValue = function callee$0$0(keys, elementId) {
  var replace = arguments.length <= 2 || arguments[2] === undefined ? false : arguments[2];
  var text, params;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        text = keys;

        if (keys instanceof Array) {
          text = keys.join("");
        }

        params = {
          elementId: elementId,
          text: text,
          replace: replace,
          unicodeKeyboard: this.opts.unicodeKeyboard
        };
        return context$1$0.abrupt("return", this.doSetElementValue(params));

      case 4:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

/**
 * Reason for isolating doSetElementValue from setElementValue is for reusing setElementValue
 * across android-drivers (like appium-uiautomator2-driver) and to avoid code duplication.
 * Other android-drivers (like appium-uiautomator2-driver) need to override doSetElementValue
 * to facilitate setElementValue.
 */
helpers.doSetElementValue = function callee$0$0(params) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:setText", params));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.setValue = function callee$0$0(keys, elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.setElementValue(keys, elementId, false));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.replaceValue = function callee$0$0(keys, elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.setElementValue(keys, elementId, true));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.setValueImmediate = function callee$0$0(keys, elementId) {
  var text;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        text = keys;

        if (keys instanceof Array) {
          text = keys.join("");
        }

        // first, make sure we are focused on the element
        context$1$0.next = 4;
        return _regeneratorRuntime.awrap(this.click(elementId));

      case 4:
        context$1$0.next = 6;
        return _regeneratorRuntime.awrap(this.adb.inputText(text));

      case 6:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.getText = function callee$0$0(elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:getText", { elementId: elementId }));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.clear = function callee$0$0(elementId) {
  var text, length;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.getText(elementId));

      case 2:
        context$1$0.t0 = context$1$0.sent;

        if (context$1$0.t0) {
          context$1$0.next = 5;
          break;
        }

        context$1$0.t0 = '';

      case 5:
        text = context$1$0.t0;
        length = text.length;

        if (length === 0) {
          // if length is zero there are two possibilities:
          //   1. there is nothing in the text field
          //   2. it is a password field
          // since there is little overhead to the adb call, delete 100 elements
          // if we get zero, just in case it is #2
          length = 100;
        }
        context$1$0.next = 10;
        return _regeneratorRuntime.awrap(this.click(elementId));

      case 10:
        context$1$0.next = 12;
        return _regeneratorRuntime.awrap(this.adb.clearTextField(length));

      case 12:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 13:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.click = function callee$0$0(elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:click", { elementId: elementId }));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.getLocation = function callee$0$0(elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:getLocation", { elementId: elementId }));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.getLocationInView = function callee$0$0(elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.getLocation(elementId));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.getSize = function callee$0$0(elementId) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:getSize", { elementId: elementId }));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.touchLongClick = function callee$0$0(elementId, x, y, duration) {
  var params;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        params = { elementId: elementId, x: x, y: y, duration: duration };

        _androidHelpers2["default"].removeNullProperties(params);
        context$1$0.next = 4;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:touchLongClick", params));

      case 4:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 5:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.touchDown = function callee$0$0(elementId, x, y) {
  var params;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        params = { elementId: elementId, x: x, y: y };

        _androidHelpers2["default"].removeNullProperties(params);
        context$1$0.next = 4;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:touchDown", params));

      case 4:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 5:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.touchUp = function callee$0$0(elementId, x, y) {
  var params;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        params = { elementId: elementId, x: x, y: y };

        _androidHelpers2["default"].removeNullProperties(params);
        context$1$0.next = 4;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:touchUp", params));

      case 4:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 5:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.touchMove = function callee$0$0(elementId, x, y) {
  var params;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        params = { elementId: elementId, x: x, y: y };

        _androidHelpers2["default"].removeNullProperties(params);
        context$1$0.next = 4;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:touchMove", params));

      case 4:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 5:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.complexTap = function callee$0$0(tapCount, touchCount, duration, x, y) {
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("click", { x: x, y: y }));

      case 2:
        return context$1$0.abrupt("return", context$1$0.sent);

      case 3:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

commands.tap = function callee$0$0(elementId) {
  var x = arguments.length <= 1 || arguments[1] === undefined ? 0 : arguments[1];
  var y = arguments.length <= 2 || arguments[2] === undefined ? 0 : arguments[2];
  var count = arguments.length <= 3 || arguments[3] === undefined ? 1 : arguments[3];
  var i;
  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        i = 0;

      case 1:
        if (!(i < count)) {
          context$1$0.next = 17;
          break;
        }

        if (!elementId) {
          context$1$0.next = 12;
          break;
        }

        if (!(x !== 0 || y !== 0)) {
          context$1$0.next = 8;
          break;
        }

        context$1$0.next = 6;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:click", { elementId: elementId, x: x, y: y }));

      case 6:
        context$1$0.next = 10;
        break;

      case 8:
        context$1$0.next = 10;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("element:click", { elementId: elementId }));

      case 10:
        context$1$0.next = 14;
        break;

      case 12:
        context$1$0.next = 14;
        return _regeneratorRuntime.awrap(this.bootstrap.sendAction("click", { x: x, y: y }));

      case 14:
        i++;
        context$1$0.next = 1;
        break;

      case 17:
      case "end":
        return context$1$0.stop();
    }
  }, null, this);
};

_Object$assign(extensions, commands, helpers);
exports.commands = commands;
exports.helpers = helpers;
exports["default"] = extensions;

// then send through adb

// we are either tapping on the default location of the element
// or an offset from the top left corner
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9jb21tYW5kcy9lbGVtZW50LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs4QkFBMkIsb0JBQW9COzs7O0FBRS9DLElBQUksUUFBUSxHQUFHLEVBQUU7SUFBRSxPQUFPLEdBQUcsRUFBRTtJQUFFLFVBQVUsR0FBRyxFQUFFLENBQUM7O0FBRWpELFFBQVEsQ0FBQyxZQUFZLEdBQUcsb0JBQWdCLFNBQVMsRUFBRSxTQUFTO01BQ3RELENBQUM7Ozs7QUFBRCxTQUFDLEdBQUcsRUFBQyxTQUFTLEVBQVQsU0FBUyxFQUFFLFNBQVMsRUFBVCxTQUFTLEVBQUM7O3lDQUNqQixJQUFJLENBQUMsU0FBUyxDQUFDLFVBQVUsQ0FBQyxzQkFBc0IsRUFBRSxDQUFDLENBQUM7Ozs7Ozs7Ozs7Q0FDbEUsQ0FBQzs7QUFFRixRQUFRLENBQUMsT0FBTyxHQUFHLG9CQUFnQixTQUFTOzs7Ozt5Q0FDN0IsSUFBSSxDQUFDLFlBQVksQ0FBQyxXQUFXLEVBQUUsU0FBUyxDQUFDOzs7Ozs7Ozs7O0NBQ3ZELENBQUM7O0FBRUYsUUFBUSxDQUFDLGdCQUFnQixHQUFHLG9CQUFnQixTQUFTOzs7Ozt5Q0FDdEMsSUFBSSxDQUFDLFlBQVksQ0FBQyxXQUFXLEVBQUUsU0FBUyxDQUFDOzs7OytEQUFLLE1BQU07Ozs7Ozs7Q0FDbEUsQ0FBQzs7QUFFRixRQUFRLENBQUMsY0FBYyxHQUFHLG9CQUFnQixTQUFTOzs7Ozt5Q0FDcEMsSUFBSSxDQUFDLFlBQVksQ0FBQyxTQUFTLEVBQUUsU0FBUyxDQUFDOzs7OytEQUFLLE1BQU07Ozs7Ozs7Q0FDaEUsQ0FBQzs7QUFFRixRQUFRLENBQUMsZUFBZSxHQUFHLG9CQUFnQixTQUFTOzs7Ozt5Q0FDckMsSUFBSSxDQUFDLFlBQVksQ0FBQyxVQUFVLEVBQUUsU0FBUyxDQUFDOzs7OytEQUFLLE1BQU07Ozs7Ozs7Q0FDakUsQ0FBQzs7QUFFRixPQUFPLENBQUMsZUFBZSxHQUFHLG9CQUFnQixJQUFJLEVBQUUsU0FBUztNQUFF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QVQsU0FBUyxFQUFFLENBQUMsRUFBRCxDQUFDLEVBQUUsQ0FBQyxFQUFELENBQUMsRUFBQyxDQUFDOzs7Ozs7Ozt5Q0FFN0QsSUFBSSxDQUFDLFNBQVMsQ0FBQyxVQUFVLENBQUMsZUFBZSxFQUFFLEVBQUMsU0FBUyxFQUFULFNBQVMsRUFBQyxDQUFDOzs7Ozs7Ozt5Q0FHekQsSUFBSSxDQUFDLFNBQVMsQ0FBQyxVQUFVLENBQUMsT0FBTyxFQUFFLEVBQUMsQ0FBQyxFQUFELENBQUMsRUFBRSxDQUFDLEVBQUQsQ0FBQyxFQUFDLENBQUM7OztBQVZ6QixTQUFDLEVBQUU7Ozs7Ozs7OztDQWEvQixDQUFDOztBQUVGLGVBQWMsVUFBVSxFQUFFLFFBQVEsRUFBRSxPQUFPLENBQUMsQ0FBQztRQUNwQyxRQUFRLEdBQVIsUUFBUTtRQUFFLE9BQU8sR0FBUCxPQUFPO3FCQUNYLFVBQVUiLCJmaWxlIjoibGliL2NvbW1hbmRzL2VsZW1lbnQuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgYW5kcm9pZEhlbHBlcnMgZnJvbSAnLi4vYW5kcm9pZC1oZWxwZXJzJztcblxubGV0IGNvbW1hbmRzID0ge30sIGhlbHBlcnMgPSB7fSwgZXh0ZW5zaW9ucyA9IHt9O1xuXG5jb21tYW5kcy5nZXRBdHRyaWJ1dGUgPSBhc3luYyBmdW5jdGlvbiAoYXR0cmlidXRlLCBlbGVtZW50SWQpIHtcbiAgbGV0IHAgPSB7YXR0cmlidXRlLCBlbGVtZW50SWR9O1xuICByZXR1cm4gYXdhaXQgdGhpcy5ib290c3RyYXAuc2VuZEFjdGlvbihcImVsZW1lbnQ6Z2V0QXR0cmlidXRlXCIsIHApO1xufTtcblxuY29tbWFuZHMuZ2V0TmFtZSA9IGFzeW5jIGZ1bmN0aW9uIChlbGVtZW50SWQpIHtcbiAgcmV0dXJuIGF3YWl0IHRoaXMuZ2V0QXR0cmlidXRlKFwiY2xhc3NOYW1lXCIsIGVsZW1lbnRJZCk7XG59O1xuXG5jb21tYW5kcy5lbGVtZW50RGlzcGxheWVkID0gYXN5bmMgZnVuY3Rpb24gKGVsZW1lbnRJZCkge1xuICByZXR1cm4gYXdhaXQgdGhpcy5nZXRBdHRyaWJ1dGUoXCJkaXNwbGF5ZWRcIiwgZWxlbWVudElkKSA9PT0gJ3RydWUnO1xufTtcblxuY29tbWFuZHMuZWxlbWVudEVuYWJsZWQgPSBhc3luYyBmdW5jdGlvbiAoZWxlbWVudElkKSB7XG4gIHJldHVybiBhd2FpdCB0aGlzLmdldEF0dHJpYnV0ZShcImVuYWJsZWRcIiwgZWxlbWVudElkKSA9PT0gJ3RydWUnO1xufTtcblxuY29tbWFuZHMuZWxlbWVudFNlbGVjdGVkID0gYXN5bmMgZnVuY3Rpb24gKGVsZW1lbnRJZCkge1xuICByZXR1cm4gYXdhaXQgdGhpcy5nZXRBdHRyaWJ1dGUoXCJzZWxlY3RlZFwiLCBlbGVtZW50SWQpID09PSAndHJ1ZSc7XG59O1xuXG5oZWxwZXJzLnNldEVsZW1lbnRWYWx1ZSA9IGFzeW5jIGZ1bmN0aW9uIChrZXlzLCBlbGVtZW50SWQsIHJlcGxhY2UgPSBmYWxzZSkge1xuICBsZXQgdGV4dCA9IGtleXM7XG4gIGlmIChrZXlzIGluc3RhbmNlb2YgQXJyYXkpIHtcbiAgICB0ZXh0ID0ga2V5cy5qb2luKFwiXCIpO1xuICB9XG5cbiAgbGV0IHBhcmFtcyA9IHtcbiAgICBlbGVtZW50SWQsXG4gICAgdGV4dCxcbiAgICByZXBsYWNlLFxuICAgIHVuaWNvZGVLZXlib2FyZDogdGhpcy5vcHRzLnVuaWNvZGVLZXlib2FyZFxuICB9O1xuXG4gIHJldHVybiB0aGlzLmRvU2V0RWxlbWVudFZhbHVlKHBhcmFtcyk7XG59O1xuXG4vKipcbiAqIFJlYXNvbiBmb3IgaXNvbGF0aW5nIGRvU2V0RWxlbWVudFZhbHVlIGZyb20gc2V0RWxlbWVudFZhbHVlIGlzIGZvciByZXVzaW5nIHNldEVsZW1lbnRWYWx1ZVxuICogYWNyb3NzIGFuZHJvaWQtZHJpdmVycyAobGlrZSBhcHBpdW0tdWlhdXRvbWF0b3IyLWRyaXZlcikgYW5kIHRvIGF2b2lkIGNvZGUgZHVwbGljYXRpb24uXG4gKiBPdGhlciBhbmRyb2lkLWRyaXZlcnMgKGxpa2UgYXBwaXVtLXVpYXV0b21hdG9yMi1kcml2ZXIpIG5lZWQgdG8gb3ZlcnJpZGUgZG9TZXRFbGVtZW50VmFsdWVcbiAqIHRvIGZhY2lsaXRhdGUgc2V0RWxlbWVudFZhbHVlLlxuICovXG5oZWxwZXJzLmRvU2V0RWxlbWVudFZhbHVlID0gYXN5bmMgZnVuY3Rpb24gKHBhcmFtcykge1xuICByZXR1cm4gYXdhaXQgdGhpcy5ib290c3RyYXAuc2VuZEFjdGlvbihcImVsZW1lbnQ6c2V0VGV4dFwiLCBwYXJhbXMpO1xufTtcblxuY29tbWFuZHMuc2V0VmFsdWUgPSBhc3luYyBmdW5jdGlvbiAoa2V5cywgZWxlbWVudElkKSB7XG4gIHJldHVybiBhd2FpdCB0aGlzLnNldEVsZW1lbnRWYWx1ZShrZXlzLCBlbGVtZW50SWQsIGZhbHNlKTtcbn07XG5cbmNvbW1hbmRzLnJlcGxhY2VWYWx1ZSA9IGFzeW5jIGZ1bmN0aW9uIChrZXlzLCBlbGVtZW50SWQpIHtcbiAgcmV0dXJuIGF3YWl0IHRoaXMuc2V0RWxlbWVudFZhbHVlKGtleXMsIGVsZW1lbnRJZCwgdHJ1ZSk7XG59O1xuXG5jb21tYW5kcy5zZXRWYWx1ZUltbWVkaWF0ZSA9IGFzeW5jIGZ1bmN0aW9uIChrZXlzLCBlbGVtZW50SWQpIHtcbiAgbGV0IHRleHQgPSBrZXlzO1xuICBpZiAoa2V5cyBpbnN0YW5jZW9mIEFycmF5KSB7XG4gICAgdGV4dCA9IGtleXMuam9pbihcIlwiKTtcbiAgfVxuXG4gIC8vIGZpcnN0LCBtYWtlIHN1cmUgd2UgYXJlIGZvY3VzZWQgb24gdGhlIGVsZW1lbnRcbiAgYXdhaXQgdGhpcy5jbGljayhlbGVtZW50SWQpO1xuXG4gIC8vIHRoZW4gc2VuZCB0aHJvdWdoIGFkYlxuICBhd2FpdCB0aGlzLmFkYi5pbnB1dFRleHQodGV4dCk7XG59O1xuXG5jb21tYW5kcy5nZXRUZXh0ID0gYXN5bmMgZnVuY3Rpb24gKGVsZW1lbnRJZCkge1xuICByZXR1cm4gYXdhaXQgdGhpcy5ib290c3RyYXAuc2VuZEFjdGlvbihcImVsZW1lbnQ6Z2V0VGV4dFwiLCB7ZWxlbWVudElkfSk7XG59O1xuXG5jb21tYW5kcy5jbGVhciA9IGFzeW5jIGZ1bmN0aW9uIChlbGVtZW50SWQpIHtcbiAgbGV0IHRleHQgPSAoYXdhaXQgdGhpcy5nZXRUZXh0KGVsZW1lbnRJZCkpIHx8ICcnO1xuICBsZXQgbGVuZ3RoID0gdGV4dC5sZW5ndGg7XG4gIGlmIChsZW5ndGggPT09IDApIHtcbiAgICAvLyBpZiBsZW5ndGggaXMgemVybyB0aGVyZSBhcmUgdHdvIHBvc3NpYmlsaXRpZXM6XG4gICAgLy8gICAxLiB0aGVyZSBpcyBub3RoaW5nIGluIHRoZSB0ZXh0IGZpZWxkXG4gICAgLy8gICAyLiBpdCBpcyBhIHBhc3N3b3JkIGZpZWxkXG4gICAgLy8gc2luY2UgdGhlcmUgaXMgbGl0dGxlIG92ZXJoZWFkIHRvIHRoZSBhZGIgY2FsbCwgZGVsZXRlIDEwMCBlbGVtZW50c1xuICAgIC8vIGlmIHdlIGdldCB6ZXJvLCBqdXN0IGluIGNhc2UgaXQgaXMgIzJcbiAgICBsZW5ndGggPSAxMDA7XG4gIH1cbiAgYXdhaXQgdGhpcy5jbGljayhlbGVtZW50SWQpO1xuICByZXR1cm4gYXdhaXQgdGhpcy5hZGIuY2xlYXJUZXh0RmllbGQobGVuZ3RoKTtcbn07XG5cbmNvbW1hbmRzLmNsaWNrID0gYXN5bmMgZnVuY3Rpb24gKGVsZW1lbnRJZCkge1xuICByZXR1cm4gYXdhaXQgdGhpcy5ib290c3RyYXAuc2VuZEFjdGlvbihcImVsZW1lbnQ6Y2xpY2tcIiwge2VsZW1lbnRJZH0pO1xufTtcblxuY29tbWFuZHMuZ2V0TG9jYXRpb24gPSBhc3luYyBmdW5jdGlvbiAoZWxlbWVudElkKSB7XG4gIHJldHVybiBhd2FpdCB0aGlzLmJvb3RzdHJhcC5zZW5kQWN0aW9uKFwiZWxlbWVudDpnZXRMb2NhdGlvblwiLCB7ZWxlbWVudElkfSk7XG59O1xuXG5jb21tYW5kcy5nZXRMb2NhdGlvbkluVmlldyA9IGFzeW5jIGZ1bmN0aW9uIChlbGVtZW50SWQpIHtcbiAgcmV0dXJuIGF3YWl0IHRoaXMuZ2V0TG9jYXRpb24oZWxlbWVudElkKTtcbn07XG5cbmNvbW1hbmRzLmdldFNpemUgPSBhc3luYyBmdW5jdGlvbiAoZWxlbWVudElkKSB7XG4gIHJldHVybiBhd2FpdCB0aGlzLmJvb3RzdHJhcC5zZW5kQWN0aW9uKFwiZWxlbWVudDpnZXRTaXplXCIsIHtlbGVtZW50SWR9KTtcbn07XG5cbmNvbW1hbmRzLnRvdWNoTG9uZ0NsaWNrID0gYXN5bmMgZnVuY3Rpb24gKGVsZW1lbnRJZCwgeCwgeSwgZHVyYXRpb24pIHtcbiAgbGV0IHBhcmFtcyA9IHtlbGVtZW50SWQsIHgsIHksIGR1cmF0aW9ufTtcbiAgYW5kcm9pZEhlbHBlcnMucmVtb3ZlTnVsbFByb3BlcnRpZXMocGFyYW1zKTtcbiAgcmV0dXJuIGF3YWl0IHRoaXMuYm9vdHN0cmFwLnNlbmRBY3Rpb24oXCJlbGVtZW50OnRvdWNoTG9uZ0NsaWNrXCIsIHBhcmFtcyk7XG59O1xuXG5jb21tYW5kcy50b3VjaERvd24gPSBhc3luYyBmdW5jdGlvbiAoZWxlbWVudElkLCB4LCB5KSB7XG4gIGxldCBwYXJhbXMgPSB7ZWxlbWVudElkLCB4LCB5fTtcbiAgYW5kcm9pZEhlbHBlcnMucmVtb3ZlTnVsbFByb3BlcnRpZXMocGFyYW1zKTtcbiAgcmV0dXJuIGF3YWl0IHRoaXMuYm9vdHN0cmFwLnNlbmRBY3Rpb24oXCJlbGVtZW50OnRvdWNoRG93blwiLCBwYXJhbXMpO1xufTtcblxuY29tbWFuZHMudG91Y2hVcCA9IGFzeW5jIGZ1bmN0aW9uIChlbGVtZW50SWQsIHgsIHkpIHtcbiAgbGV0IHBhcmFtcyA9IHtlbGVtZW50SWQsIHgsIHl9O1xuICBhbmRyb2lkSGVscGVycy5yZW1vdmVOdWxsUHJvcGVydGllcyhwYXJhbXMpO1xuICByZXR1cm4gYXdhaXQgdGhpcy5ib290c3RyYXAuc2VuZEFjdGlvbihcImVsZW1lbnQ6dG91Y2hVcFwiLCBwYXJhbXMpO1xufTtcblxuY29tbWFuZHMudG91Y2hNb3ZlID0gYXN5bmMgZnVuY3Rpb24gKGVsZW1lbnRJZCwgeCwgeSkge1xuICBsZXQgcGFyYW1zID0ge2VsZW1lbnRJZCwgeCwgeX07XG4gIGFuZHJvaWRIZWxwZXJzLnJlbW92ZU51bGxQcm9wZXJ0aWVzKHBhcmFtcyk7XG4gIHJldHVybiBhd2FpdCB0aGlzLmJvb3RzdHJhcC5zZW5kQWN0aW9uKFwiZWxlbWVudDp0b3VjaE1vdmVcIiwgcGFyYW1zKTtcbn07XG5cbmNvbW1hbmRzLmNvbXBsZXhUYXAgPSBhc3luYyBmdW5jdGlvbiAodGFwQ291bnQsIHRvdWNoQ291bnQsIGR1cmF0aW9uLCB4LCB5KSB7XG4gIHJldHVybiBhd2FpdCB0aGlzLmJvb3RzdHJhcC5zZW5kQWN0aW9uKFwiY2xpY2tcIiwge3gsIHl9KTtcbn07XG5cbmNvbW1hbmRzLnRhcCA9IGFzeW5jIGZ1bmN0aW9uIChlbGVtZW50SWQsIHggPSAwLCB5ID0gMCwgY291bnQgPSAxKSB7XG4gIGZvciAobGV0IGkgPSAwOyBpIDwgY291bnQ7IGkrKykge1xuICAgIGlmIChlbGVtZW50SWQpIHtcbiAgICAgIC8vIHdlIGFyZSBlaXRoZXIgdGFwcGluZyBvbiB0aGUgZGVmYXVsdCBsb2NhdGlvbiBvZiB0aGUgZWxlbWVudFxuICAgICAgLy8gb3IgYW4gb2Zmc2V0IGZyb20gdGhlIHRvcCBsZWZ0IGNvcm5lclxuICAgICAgaWYgKHggIT09IDAgfHwgeSAhPT0gMCkge1xuICAgICAgICBhd2FpdCB0aGlzLmJvb3RzdHJhcC5zZW5kQWN0aW9uKFwiZWxlbWVudDpjbGlja1wiLCB7ZWxlbWVudElkLCB4LCB5fSk7XG4gICAgICB9IGVsc2Uge1xuICAgICAgICBhd2FpdCB0aGlzLmJvb3RzdHJhcC5zZW5kQWN0aW9uKFwiZWxlbWVudDpjbGlja1wiLCB7ZWxlbWVudElkfSk7XG4gICAgICB9XG4gICAgfSBlbHNlIHtcbiAgICAgIGF3YWl0IHRoaXMuYm9vdHN0cmFwLnNlbmRBY3Rpb24oXCJjbGlja1wiLCB7eCwgeX0pO1xuICAgIH1cbiAgfVxufTtcblxuT2JqZWN0LmFzc2lnbihleHRlbnNpb25zLCBjb21tYW5kcywgaGVscGVycyk7XG5leHBvcnQgeyBjb21tYW5kcywgaGVscGVycyB9O1xuZXhwb3J0IGRlZmF1bHQgZXh0ZW5zaW9ucztcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4vLi4ifQ==
