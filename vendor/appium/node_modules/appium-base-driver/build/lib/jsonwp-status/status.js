'use strict';

var _getIterator = require('babel-runtime/core-js/get-iterator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

var codes = {
  Success: {
    code: 0,
    summary: 'The command executed successfully.'
  },
  NoSuchDriver: {
    code: 6,
    summary: 'A session is either terminated or not started'
  },
  NoSuchElement: {
    code: 7,
    summary: 'An element could not be located on the page using the given search parameters.'
  },
  NoSuchFrame: {
    code: 8,
    summary: 'A request to switch to a frame could not be satisfied because the frame could not be found.'
  },
  UnknownCommand: {
    code: 9,
    summary: 'The requested resource could not be found, or a request was received using an HTTP method that is not supported by the mapped resource.'
  },
  StaleElementReference: {
    code: 10,
    summary: 'An element command failed because the referenced element is no longer attached to the DOM.'
  },
  ElementNotVisible: {
    code: 11,
    summary: 'An element command could not be completed because the element is not visible on the page.'
  },
  InvalidElementState: {
    code: 12,
    summary: 'An element command could not be completed because the element is in an invalid state (e.g. attempting to click a disabled element).'
  },
  UnknownError: {
    code: 13,
    summary: 'An unknown server-side error occurred while processing the command.'
  },
  ElementIsNotSelectable: {
    code: 15,
    summary: 'An attempt was made to select an element that cannot be selected.'
  },
  JavaScriptError: {
    code: 17,
    summary: 'An error occurred while executing user supplied JavaScript.'
  },
  XPathLookupError: {
    code: 19,
    summary: 'An error occurred while searching for an element by XPath.'
  },
  Timeout: {
    code: 21,
    summary: 'An operation did not complete before its timeout expired.'
  },
  NoSuchWindow: {
    code: 23,
    summary: 'A request to switch to a different window could not be satisfied because the window could not be found.'
  },
  InvalidCookieDomain: {
    code: 24,
    summary: 'An illegal attempt was made to set a cookie under a different domain than the current page.'
  },
  UnableToSetCookie: {
    code: 25,
    summary: 'A request to set a cookie\'s value could not be satisfied.'
  },
  UnexpectedAlertOpen: {
    code: 26,
    summary: 'A modal dialog was open, blocking this operation'
  },
  NoAlertOpenError: {
    code: 27,
    summary: 'An attempt was made to operate on a modal dialog when one was not open.'
  },
  ScriptTimeout: {
    code: 28,
    summary: 'A script did not complete before its timeout expired.'
  },
  InvalidElementCoordinates: {
    code: 29,
    summary: 'The coordinates provided to an interactions operation are invalid.'
  },
  IMENotAvailable: {
    code: 30,
    summary: 'IME was not available.'
  },
  IMEEngineActivationFailed: {
    code: 31,
    summary: 'An IME engine could not be started.'
  },
  InvalidSelector: {
    code: 32,
    summary: 'Argument was an invalid selector (e.g. XPath/CSS).'
  },
  SessionNotCreatedException: {
    code: 33,
    summary: 'A new session could not be created.'
  },
  MoveTargetOutOfBounds: {
    code: 34,
    summary: 'Target provided for a move action is out of bounds.'
  },
  NoSuchContext: {
    code: 35,
    summary: 'No such context found.'
  }
};

function getSummaryByCode(code) {
  code = parseInt(code, 10);
  var _iteratorNormalCompletion = true;
  var _didIteratorError = false;
  var _iteratorError = undefined;

  try {
    for (var _iterator = _getIterator(_lodash2['default'].values(codes)), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
      var obj = _step.value;

      if (!_lodash2['default'].isUndefined(obj.code) && obj.code === code) {
        return obj.summary;
      }
    }
  } catch (err) {
    _didIteratorError = true;
    _iteratorError = err;
  } finally {
    try {
      if (!_iteratorNormalCompletion && _iterator['return']) {
        _iterator['return']();
      }
    } finally {
      if (_didIteratorError) {
        throw _iteratorError;
      }
    }
  }

  return 'An error occurred';
}

exports['default'] = codes;
exports.codes = codes;
exports.getSummaryByCode = getSummaryByCode;
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9qc29ud3Atc3RhdHVzL3N0YXR1cy5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7O3NCQUFjLFFBQVE7Ozs7QUFFdEIsSUFBTSxLQUFLLEdBQUc7QUFDWixTQUFPLEVBQUU7QUFDUCxRQUFJLEVBQUUsQ0FBQztBQUNQLFdBQU8sRUFBRSxvQ0FBb0M7R0FDOUM7QUFDRCxjQUFZLEVBQUU7QUFDWixRQUFJLEVBQUUsQ0FBQztBQUNQLFdBQU8sRUFBRSwrQ0FBK0M7R0FDekQ7QUFDRCxlQUFhLEVBQUU7QUFDYixRQUFJLEVBQUUsQ0FBQztBQUNQLFdBQU8sRUFBRSxnRkFBZ0Y7R0FDMUY7QUFDRCxhQUFXLEVBQUU7QUFDWCxRQUFJLEVBQUUsQ0FBQztBQUNQLFdBQU8sRUFBRSw2RkFBNkY7R0FDdkc7QUFDRCxnQkFBYyxFQUFFO0FBQ2QsUUFBSSxFQUFFLENBQUM7QUFDUCxXQUFPLEVBQUUseUlBQXlJO0dBQ25KO0FBQ0QsdUJBQXFCLEVBQUU7QUFDckIsUUFBSSxFQUFFLEVBQUU7QUFDUixXQUFPLEVBQUUsNEZBQTRGO0dBQ3RHO0FBQ0QsbUJBQWlCLEVBQUU7QUFDakIsUUFBSSxFQUFFLEVBQUU7QUFDUixXQUFPLEVBQUUsMkZBQTJGO0dBQ3JHO0FBQ0QscUJBQW1CLEVBQUU7QUFDbkIsUUFBSSxFQUFFLEVBQUU7QUFDUixXQUFPLEVBQUUscUlBQXFJO0dBQy9JO0FBQ0QsY0FBWSxFQUFFO0FBQ1osUUFBSSxFQUFFLEVBQUU7QUFDUixXQUFPLEVBQUUscUVBQXFFO0dBQy9FO0FBQ0Qsd0JBQXNCLEVBQUU7QUFDdEIsUUFBSSxFQUFFLEVBQUU7QUFDUixXQUFPLEVBQUUsbUVBQW1FO0dBQzdFO0FBQ0QsaUJBQWUsRUFBRTtBQUNmLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLDZEQUE2RDtHQUN2RTtBQUNELGtCQUFnQixFQUFFO0FBQ2hCLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLDREQUE0RDtHQUN0RTtBQUNELFNBQU8sRUFBRTtBQUNQLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLDJEQUEyRDtHQUNyRTtBQUNELGNBQVksRUFBRTtBQUNaLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLHlHQUF5RztHQUNuSDtBQUNELHFCQUFtQixFQUFFO0FBQ25CLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLDZGQUE2RjtHQUN2RztBQUNELG1CQUFpQixFQUFFO0FBQ2pCLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLDREQUE0RDtHQUN0RTtBQUNELHFCQUFtQixFQUFFO0FBQ25CLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLGtEQUFrRDtHQUM1RDtBQUNELGtCQUFnQixFQUFFO0FBQ2hCLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLHlFQUF5RTtHQUNuRjtBQUNELGVBQWEsRUFBRTtBQUNiLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLHVEQUF1RDtHQUNqRTtBQUNELDJCQUF5QixFQUFFO0FBQ3pCLFFBQUksRUFBRSxFQUFFO0FBQ1IsV0FBTyxFQUFFLG9FQUFvRTtHQUM5RTtBQUNELGlCQUFlLEVBQUU7QUFDZixRQUFJLEVBQUUsRUFBRTtBQUNSLFdBQU8sRUFBRSx3QkFBd0I7R0FDbEM7QUFDRCwyQkFBeUIsRUFBRTtBQUN6QixRQUFJLEVBQUUsRUFBRTtBQUNSLFdBQU8sRUFBRSxxQ0FBcUM7R0FDL0M7QUFDRCxpQkFBZSxFQUFFO0FBQ2YsUUFBSSxFQUFFLEVBQUU7QUFDUixXQUFPLEVBQUUsb0RBQW9EO0dBQzlEO0FBQ0QsNEJBQTBCLEVBQUU7QUFDMUIsUUFBSSxFQUFFLEVBQUU7QUFDUixXQUFPLEVBQUUscUNBQXFDO0dBQy9DO0FBQ0QsdUJBQXFCLEVBQUU7QUFDckIsUUFBSSxFQUFFLEVBQUU7QUFDUixXQUFPLEVBQUUscURBQXFEO0dBQy9EO0FBQ0QsZUFBYSxFQUFFO0FBQ2IsUUFBSSxFQUFFLEVBQUU7QUFDUixXQUFPLEVBQUUsd0JBQXdCO0dBQ2xDO0NBQ0YsQ0FBQzs7QUFFRixTQUFTLGdCQUFnQixDQUFFLElBQUksRUFBRTtBQUMvQixNQUFJLEdBQUcsUUFBUSxDQUFDLElBQUksRUFBRSxFQUFFLENBQUMsQ0FBQzs7Ozs7O0FBQzFCLHNDQUFnQixvQkFBRSxNQUFNLENBQUMsS0FBSyxDQUFDLDRHQUFFO1VBQXhCLEdBQUc7O0FBQ1YsVUFBSSxDQUFDLG9CQUFFLFdBQVcsQ0FBQyxHQUFHLENBQUMsSUFBSSxDQUFDLElBQUksR0FBRyxDQUFDLElBQUksS0FBSyxJQUFJLEVBQUU7QUFDakQsZUFBTyxHQUFHLENBQUMsT0FBTyxDQUFDO09BQ3BCO0tBQ0Y7Ozs7Ozs7Ozs7Ozs7Ozs7QUFDRCxTQUFPLG1CQUFtQixDQUFDO0NBQzVCOztxQkFFYyxLQUFLO1FBQ1gsS0FBSyxHQUFMLEtBQUs7UUFBRSxnQkFBZ0IsR0FBaEIsZ0JBQWdCIiwiZmlsZSI6ImxpYi9qc29ud3Atc3RhdHVzL3N0YXR1cy5qcyIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCBfIGZyb20gJ2xvZGFzaCc7XG5cbmNvbnN0IGNvZGVzID0ge1xuICBTdWNjZXNzOiB7XG4gICAgY29kZTogMCxcbiAgICBzdW1tYXJ5OiAnVGhlIGNvbW1hbmQgZXhlY3V0ZWQgc3VjY2Vzc2Z1bGx5LidcbiAgfSxcbiAgTm9TdWNoRHJpdmVyOiB7XG4gICAgY29kZTogNixcbiAgICBzdW1tYXJ5OiAnQSBzZXNzaW9uIGlzIGVpdGhlciB0ZXJtaW5hdGVkIG9yIG5vdCBzdGFydGVkJ1xuICB9LFxuICBOb1N1Y2hFbGVtZW50OiB7XG4gICAgY29kZTogNyxcbiAgICBzdW1tYXJ5OiAnQW4gZWxlbWVudCBjb3VsZCBub3QgYmUgbG9jYXRlZCBvbiB0aGUgcGFnZSB1c2luZyB0aGUgZ2l2ZW4gc2VhcmNoIHBhcmFtZXRlcnMuJ1xuICB9LFxuICBOb1N1Y2hGcmFtZToge1xuICAgIGNvZGU6IDgsXG4gICAgc3VtbWFyeTogJ0EgcmVxdWVzdCB0byBzd2l0Y2ggdG8gYSBmcmFtZSBjb3VsZCBub3QgYmUgc2F0aXNmaWVkIGJlY2F1c2UgdGhlIGZyYW1lIGNvdWxkIG5vdCBiZSBmb3VuZC4nXG4gIH0sXG4gIFVua25vd25Db21tYW5kOiB7XG4gICAgY29kZTogOSxcbiAgICBzdW1tYXJ5OiAnVGhlIHJlcXVlc3RlZCByZXNvdXJjZSBjb3VsZCBub3QgYmUgZm91bmQsIG9yIGEgcmVxdWVzdCB3YXMgcmVjZWl2ZWQgdXNpbmcgYW4gSFRUUCBtZXRob2QgdGhhdCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBtYXBwZWQgcmVzb3VyY2UuJ1xuICB9LFxuICBTdGFsZUVsZW1lbnRSZWZlcmVuY2U6IHtcbiAgICBjb2RlOiAxMCxcbiAgICBzdW1tYXJ5OiAnQW4gZWxlbWVudCBjb21tYW5kIGZhaWxlZCBiZWNhdXNlIHRoZSByZWZlcmVuY2VkIGVsZW1lbnQgaXMgbm8gbG9uZ2VyIGF0dGFjaGVkIHRvIHRoZSBET00uJ1xuICB9LFxuICBFbGVtZW50Tm90VmlzaWJsZToge1xuICAgIGNvZGU6IDExLFxuICAgIHN1bW1hcnk6ICdBbiBlbGVtZW50IGNvbW1hbmQgY291bGQgbm90IGJlIGNvbXBsZXRlZCBiZWNhdXNlIHRoZSBlbGVtZW50IGlzIG5vdCB2aXNpYmxlIG9uIHRoZSBwYWdlLidcbiAgfSxcbiAgSW52YWxpZEVsZW1lbnRTdGF0ZToge1xuICAgIGNvZGU6IDEyLFxuICAgIHN1bW1hcnk6ICdBbiBlbGVtZW50IGNvbW1hbmQgY291bGQgbm90IGJlIGNvbXBsZXRlZCBiZWNhdXNlIHRoZSBlbGVtZW50IGlzIGluIGFuIGludmFsaWQgc3RhdGUgKGUuZy4gYXR0ZW1wdGluZyB0byBjbGljayBhIGRpc2FibGVkIGVsZW1lbnQpLidcbiAgfSxcbiAgVW5rbm93bkVycm9yOiB7XG4gICAgY29kZTogMTMsXG4gICAgc3VtbWFyeTogJ0FuIHVua25vd24gc2VydmVyLXNpZGUgZXJyb3Igb2NjdXJyZWQgd2hpbGUgcHJvY2Vzc2luZyB0aGUgY29tbWFuZC4nXG4gIH0sXG4gIEVsZW1lbnRJc05vdFNlbGVjdGFibGU6IHtcbiAgICBjb2RlOiAxNSxcbiAgICBzdW1tYXJ5OiAnQW4gYXR0ZW1wdCB3YXMgbWFkZSB0byBzZWxlY3QgYW4gZWxlbWVudCB0aGF0IGNhbm5vdCBiZSBzZWxlY3RlZC4nXG4gIH0sXG4gIEphdmFTY3JpcHRFcnJvcjoge1xuICAgIGNvZGU6IDE3LFxuICAgIHN1bW1hcnk6ICdBbiBlcnJvciBvY2N1cnJlZCB3aGlsZSBleGVjdXRpbmcgdXNlciBzdXBwbGllZCBKYXZhU2NyaXB0LidcbiAgfSxcbiAgWFBhdGhMb29rdXBFcnJvcjoge1xuICAgIGNvZGU6IDE5LFxuICAgIHN1bW1hcnk6ICdBbiBlcnJvciBvY2N1cnJlZCB3aGlsZSBzZWFyY2hpbmcgZm9yIGFuIGVsZW1lbnQgYnkgWFBhdGguJ1xuICB9LFxuICBUaW1lb3V0OiB7XG4gICAgY29kZTogMjEsXG4gICAgc3VtbWFyeTogJ0FuIG9wZXJhdGlvbiBkaWQgbm90IGNvbXBsZXRlIGJlZm9yZSBpdHMgdGltZW91dCBleHBpcmVkLidcbiAgfSxcbiAgTm9TdWNoV2luZG93OiB7XG4gICAgY29kZTogMjMsXG4gICAgc3VtbWFyeTogJ0EgcmVxdWVzdCB0byBzd2l0Y2ggdG8gYSBkaWZmZXJlbnQgd2luZG93IGNvdWxkIG5vdCBiZSBzYXRpc2ZpZWQgYmVjYXVzZSB0aGUgd2luZG93IGNvdWxkIG5vdCBiZSBmb3VuZC4nXG4gIH0sXG4gIEludmFsaWRDb29raWVEb21haW46IHtcbiAgICBjb2RlOiAyNCxcbiAgICBzdW1tYXJ5OiAnQW4gaWxsZWdhbCBhdHRlbXB0IHdhcyBtYWRlIHRvIHNldCBhIGNvb2tpZSB1bmRlciBhIGRpZmZlcmVudCBkb21haW4gdGhhbiB0aGUgY3VycmVudCBwYWdlLidcbiAgfSxcbiAgVW5hYmxlVG9TZXRDb29raWU6IHtcbiAgICBjb2RlOiAyNSxcbiAgICBzdW1tYXJ5OiAnQSByZXF1ZXN0IHRvIHNldCBhIGNvb2tpZVxcJ3MgdmFsdWUgY291bGQgbm90IGJlIHNhdGlzZmllZC4nXG4gIH0sXG4gIFVuZXhwZWN0ZWRBbGVydE9wZW46IHtcbiAgICBjb2RlOiAyNixcbiAgICBzdW1tYXJ5OiAnQSBtb2RhbCBkaWFsb2cgd2FzIG9wZW4sIGJsb2NraW5nIHRoaXMgb3BlcmF0aW9uJ1xuICB9LFxuICBOb0FsZXJ0T3BlbkVycm9yOiB7XG4gICAgY29kZTogMjcsXG4gICAgc3VtbWFyeTogJ0FuIGF0dGVtcHQgd2FzIG1hZGUgdG8gb3BlcmF0ZSBvbiBhIG1vZGFsIGRpYWxvZyB3aGVuIG9uZSB3YXMgbm90IG9wZW4uJ1xuICB9LFxuICBTY3JpcHRUaW1lb3V0OiB7XG4gICAgY29kZTogMjgsXG4gICAgc3VtbWFyeTogJ0Egc2NyaXB0IGRpZCBub3QgY29tcGxldGUgYmVmb3JlIGl0cyB0aW1lb3V0IGV4cGlyZWQuJ1xuICB9LFxuICBJbnZhbGlkRWxlbWVudENvb3JkaW5hdGVzOiB7XG4gICAgY29kZTogMjksXG4gICAgc3VtbWFyeTogJ1RoZSBjb29yZGluYXRlcyBwcm92aWRlZCB0byBhbiBpbnRlcmFjdGlvbnMgb3BlcmF0aW9uIGFyZSBpbnZhbGlkLidcbiAgfSxcbiAgSU1FTm90QXZhaWxhYmxlOiB7XG4gICAgY29kZTogMzAsXG4gICAgc3VtbWFyeTogJ0lNRSB3YXMgbm90IGF2YWlsYWJsZS4nXG4gIH0sXG4gIElNRUVuZ2luZUFjdGl2YXRpb25GYWlsZWQ6IHtcbiAgICBjb2RlOiAzMSxcbiAgICBzdW1tYXJ5OiAnQW4gSU1FIGVuZ2luZSBjb3VsZCBub3QgYmUgc3RhcnRlZC4nXG4gIH0sXG4gIEludmFsaWRTZWxlY3Rvcjoge1xuICAgIGNvZGU6IDMyLFxuICAgIHN1bW1hcnk6ICdBcmd1bWVudCB3YXMgYW4gaW52YWxpZCBzZWxlY3RvciAoZS5nLiBYUGF0aC9DU1MpLidcbiAgfSxcbiAgU2Vzc2lvbk5vdENyZWF0ZWRFeGNlcHRpb246IHtcbiAgICBjb2RlOiAzMyxcbiAgICBzdW1tYXJ5OiAnQSBuZXcgc2Vzc2lvbiBjb3VsZCBub3QgYmUgY3JlYXRlZC4nXG4gIH0sXG4gIE1vdmVUYXJnZXRPdXRPZkJvdW5kczoge1xuICAgIGNvZGU6IDM0LFxuICAgIHN1bW1hcnk6ICdUYXJnZXQgcHJvdmlkZWQgZm9yIGEgbW92ZSBhY3Rpb24gaXMgb3V0IG9mIGJvdW5kcy4nXG4gIH0sXG4gIE5vU3VjaENvbnRleHQ6IHtcbiAgICBjb2RlOiAzNSxcbiAgICBzdW1tYXJ5OiAnTm8gc3VjaCBjb250ZXh0IGZvdW5kLidcbiAgfVxufTtcblxuZnVuY3Rpb24gZ2V0U3VtbWFyeUJ5Q29kZSAoY29kZSkge1xuICBjb2RlID0gcGFyc2VJbnQoY29kZSwgMTApO1xuICBmb3IgKGxldCBvYmogb2YgXy52YWx1ZXMoY29kZXMpKSB7XG4gICAgaWYgKCFfLmlzVW5kZWZpbmVkKG9iai5jb2RlKSAmJiBvYmouY29kZSA9PT0gY29kZSkge1xuICAgICAgcmV0dXJuIG9iai5zdW1tYXJ5O1xuICAgIH1cbiAgfVxuICByZXR1cm4gJ0FuIGVycm9yIG9jY3VycmVkJztcbn1cblxuZXhwb3J0IGRlZmF1bHQgY29kZXM7XG5leHBvcnQgeyBjb2RlcywgZ2V0U3VtbWFyeUJ5Q29kZSB9O1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLi8uLiJ9
