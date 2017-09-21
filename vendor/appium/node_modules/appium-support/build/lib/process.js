'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _teen_process = require('teen_process');

/*
 * Exit Status for pgrep and pkill (`man pkill`)
 *  0. One or more processes matched the criteria.
 *  1. No processes matched.
 *  2. Syntax error in the command line.
 *  3. Fatal error: out of memory etc.
 */

function getProcessIds(appName) {
  var pids, _ref, stdout;

  return _regeneratorRuntime.async(function getProcessIds$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        pids = undefined;
        context$1$0.prev = 1;
        context$1$0.next = 4;
        return _regeneratorRuntime.awrap((0, _teen_process.exec)('pgrep', ['-x', appName]));

      case 4:
        _ref = context$1$0.sent;
        stdout = _ref.stdout;

        pids = stdout.trim().split('\n').map(function (pid) {
          return parseInt(pid, 10);
        });
        context$1$0.next = 14;
        break;

      case 9:
        context$1$0.prev = 9;
        context$1$0.t0 = context$1$0['catch'](1);

        if (!(parseInt(context$1$0.t0.code, 10) !== 1)) {
          context$1$0.next = 13;
          break;
        }

        throw new Error('Error getting process ids for app \'' + appName + '\': ' + context$1$0.t0.message);

      case 13:
        pids = [];

      case 14:
        return context$1$0.abrupt('return', pids);

      case 15:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[1, 9]]);
}

function killProcess(appName) {
  var force = arguments.length <= 1 || arguments[1] === undefined ? false : arguments[1];
  var pids, args;
  return _regeneratorRuntime.async(function killProcess$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.next = 2;
        return _regeneratorRuntime.awrap(getProcessIds(appName));

      case 2:
        pids = context$1$0.sent;

        if (!(pids.length === 0)) {
          context$1$0.next = 5;
          break;
        }

        return context$1$0.abrupt('return');

      case 5:
        context$1$0.prev = 5;
        args = force ? ['-9'] : [];

        args.push('-x', appName);
        context$1$0.next = 10;
        return _regeneratorRuntime.awrap((0, _teen_process.exec)('pkill', args));

      case 10:
        context$1$0.next = 16;
        break;

      case 12:
        context$1$0.prev = 12;
        context$1$0.t0 = context$1$0['catch'](5);

        if (!(parseInt(context$1$0.t0.code, 10) !== 1)) {
          context$1$0.next = 16;
          break;
        }

        throw new Error('Error killing app \'' + appName + '\' with pkill: ' + context$1$0.t0.message);

      case 16:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[5, 12]]);
}

exports['default'] = { getProcessIds: getProcessIds, killProcess: killProcess };
module.exports = exports['default'];

// the process is not running
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9wcm9jZXNzLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7OzRCQUFxQixjQUFjOzs7Ozs7Ozs7O0FBV25DLFNBQWUsYUFBYSxDQUFFLE9BQU87TUFDL0IsSUFBSSxRQUVELE1BQU07Ozs7O0FBRlQsWUFBSTs7O3lDQUVlLHdCQUFLLE9BQU8sRUFBRSxDQUFDLElBQUksRUFBRSxPQUFPLENBQUMsQ0FBQzs7OztBQUE5QyxjQUFNLFFBQU4sTUFBTTs7QUFDWCxZQUFJLEdBQUcsTUFBTSxDQUFDLElBQUksRUFBRSxDQUFDLEtBQUssQ0FBQyxJQUFJLENBQUMsQ0FBQyxHQUFHLENBQUMsVUFBQyxHQUFHO2lCQUFLLFFBQVEsQ0FBQyxHQUFHLEVBQUUsRUFBRSxDQUFDO1NBQUEsQ0FBQyxDQUFDOzs7Ozs7OztjQUU3RCxRQUFRLENBQUMsZUFBSSxJQUFJLEVBQUUsRUFBRSxDQUFDLEtBQUssQ0FBQyxDQUFBOzs7OztjQUN4QixJQUFJLEtBQUssMENBQXVDLE9BQU8sWUFBTSxlQUFJLE9BQU8sQ0FBRzs7O0FBRW5GLFlBQUksR0FBRyxFQUFFLENBQUM7Ozs0Q0FFTCxJQUFJOzs7Ozs7O0NBQ1o7O0FBRUQsU0FBZSxXQUFXLENBQUUsT0FBTztNQUFFLEtBQUsseURBQUcsS0FBSztNQUM1QyxJQUFJLEVBT0YsSUFBSTs7Ozs7eUNBUE8sYUFBYSxDQUFDLE9BQU8sQ0FBQzs7O0FBQW5DLFlBQUk7O2NBQ0osSUFBSSxDQUFDLE1BQU0sS0FBSyxDQUFDLENBQUE7Ozs7Ozs7OztBQU1mLFlBQUksR0FBRyxLQUFLLEdBQUcsQ0FBQyxJQUFJLENBQUMsR0FBRyxFQUFFOztBQUM5QixZQUFJLENBQUMsSUFBSSxDQUFDLElBQUksRUFBRSxPQUFPLENBQUMsQ0FBQzs7eUNBQ25CLHdCQUFLLE9BQU8sRUFBRSxJQUFJLENBQUM7Ozs7Ozs7Ozs7Y0FFckIsUUFBUSxDQUFDLGVBQUksSUFBSSxFQUFFLEVBQUUsQ0FBQyxLQUFLLENBQUMsQ0FBQTs7Ozs7Y0FDeEIsSUFBSSxLQUFLLDBCQUF1QixPQUFPLHVCQUFpQixlQUFJLE9BQU8sQ0FBRzs7Ozs7OztDQUdqRjs7cUJBRWMsRUFBRSxhQUFhLEVBQWIsYUFBYSxFQUFFLFdBQVcsRUFBWCxXQUFXLEVBQUUiLCJmaWxlIjoibGliL3Byb2Nlc3MuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgeyBleGVjIH0gZnJvbSAndGVlbl9wcm9jZXNzJztcblxuXG4vKlxuICogRXhpdCBTdGF0dXMgZm9yIHBncmVwIGFuZCBwa2lsbCAoYG1hbiBwa2lsbGApXG4gKiAgMC4gT25lIG9yIG1vcmUgcHJvY2Vzc2VzIG1hdGNoZWQgdGhlIGNyaXRlcmlhLlxuICogIDEuIE5vIHByb2Nlc3NlcyBtYXRjaGVkLlxuICogIDIuIFN5bnRheCBlcnJvciBpbiB0aGUgY29tbWFuZCBsaW5lLlxuICogIDMuIEZhdGFsIGVycm9yOiBvdXQgb2YgbWVtb3J5IGV0Yy5cbiAqL1xuXG5hc3luYyBmdW5jdGlvbiBnZXRQcm9jZXNzSWRzIChhcHBOYW1lKSB7XG4gIGxldCBwaWRzO1xuICB0cnkge1xuICAgIGxldCB7c3Rkb3V0fSA9IGF3YWl0IGV4ZWMoJ3BncmVwJywgWycteCcsIGFwcE5hbWVdKTtcbiAgICBwaWRzID0gc3Rkb3V0LnRyaW0oKS5zcGxpdCgnXFxuJykubWFwKChwaWQpID0+IHBhcnNlSW50KHBpZCwgMTApKTtcbiAgfSBjYXRjaCAoZXJyKSB7XG4gICAgaWYgKHBhcnNlSW50KGVyci5jb2RlLCAxMCkgIT09IDEpIHtcbiAgICAgIHRocm93IG5ldyBFcnJvcihgRXJyb3IgZ2V0dGluZyBwcm9jZXNzIGlkcyBmb3IgYXBwICcke2FwcE5hbWV9JzogJHtlcnIubWVzc2FnZX1gKTtcbiAgICB9XG4gICAgcGlkcyA9IFtdO1xuICB9XG4gIHJldHVybiBwaWRzO1xufVxuXG5hc3luYyBmdW5jdGlvbiBraWxsUHJvY2VzcyAoYXBwTmFtZSwgZm9yY2UgPSBmYWxzZSkge1xuICBsZXQgcGlkcyA9IGF3YWl0IGdldFByb2Nlc3NJZHMoYXBwTmFtZSk7XG4gIGlmIChwaWRzLmxlbmd0aCA9PT0gMCkge1xuICAgIC8vIHRoZSBwcm9jZXNzIGlzIG5vdCBydW5uaW5nXG4gICAgcmV0dXJuO1xuICB9XG5cbiAgdHJ5IHtcbiAgICBsZXQgYXJncyA9IGZvcmNlID8gWyctOSddIDogW107XG4gICAgYXJncy5wdXNoKCcteCcsIGFwcE5hbWUpO1xuICAgIGF3YWl0IGV4ZWMoJ3BraWxsJywgYXJncyk7XG4gIH0gY2F0Y2ggKGVycikge1xuICAgIGlmIChwYXJzZUludChlcnIuY29kZSwgMTApICE9PSAxKSB7XG4gICAgICB0aHJvdyBuZXcgRXJyb3IoYEVycm9yIGtpbGxpbmcgYXBwICcke2FwcE5hbWV9JyB3aXRoIHBraWxsOiAke2Vyci5tZXNzYWdlfWApO1xuICAgIH1cbiAgfVxufVxuXG5leHBvcnQgZGVmYXVsdCB7IGdldFByb2Nlc3NJZHMsIGtpbGxQcm9jZXNzIH07XG4iXSwic291cmNlUm9vdCI6Ii4uLy4uIn0=
