'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _logger = require('./logger');

var _logger2 = _interopRequireDefault(_logger);

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _appiumSupport = require('appium-support');

var helpers = {};

helpers.truncateDecimals = function (number, digits) {
  var multiplier = Math.pow(10, digits),
      adjustedNum = number * multiplier,
      truncatedNum = Math[adjustedNum < 0 ? 'ceil' : 'floor'](adjustedNum);

  return truncatedNum / multiplier;
};

helpers.pushStrings = function callee$0$0(language, adb, opts) {
  var remotePath, stringsJson, stringsTmpDir, _ref, apkStrings, localPath, remoteFile;

  return _regeneratorRuntime.async(function callee$0$0$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        remotePath = '/data/local/tmp';
        stringsJson = 'strings.json';
        stringsTmpDir = _path2['default'].resolve(opts.tmpDir, opts.appPackage);
        context$1$0.prev = 3;

        _logger2['default'].debug('Extracting strings from apk', opts.app, language, stringsTmpDir);
        context$1$0.next = 7;
        return _regeneratorRuntime.awrap(adb.extractStringsFromApk(opts.app, language, stringsTmpDir));

      case 7:
        _ref = context$1$0.sent;
        apkStrings = _ref.apkStrings;
        localPath = _ref.localPath;
        context$1$0.next = 12;
        return _regeneratorRuntime.awrap(adb.push(localPath, remotePath));

      case 12:
        return context$1$0.abrupt('return', apkStrings);

      case 15:
        context$1$0.prev = 15;
        context$1$0.t0 = context$1$0['catch'](3);
        context$1$0.next = 19;
        return _regeneratorRuntime.awrap(_appiumSupport.fs.exists(opts.app));

      case 19:
        if (context$1$0.sent) {
          context$1$0.next = 24;
          break;
        }

        context$1$0.next = 22;
        return _regeneratorRuntime.awrap(adb.rimraf(remotePath + '/' + stringsJson));

      case 22:
        context$1$0.next = 28;
        break;

      case 24:
        _logger2['default'].warn("Could not get strings, continuing anyway");
        remoteFile = remotePath + '/' + stringsJson;
        context$1$0.next = 28;
        return _regeneratorRuntime.awrap(adb.shell('echo', ['\'{}\' > ' + remoteFile]));

      case 28:
        return context$1$0.abrupt('return', {});

      case 29:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[3, 15]]);
};

exports['default'] = helpers;
module.exports = exports['default'];

// delete remote string.json if present
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9hbmRyb2lkLWhlbHBlcnMuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7OztzQkFBbUIsVUFBVTs7OztvQkFDWixNQUFNOzs7OzZCQUNKLGdCQUFnQjs7QUFFbkMsSUFBSSxPQUFPLEdBQUcsRUFBRSxDQUFDOztBQUVqQixPQUFPLENBQUMsZ0JBQWdCLEdBQUcsVUFBVSxNQUFNLEVBQUUsTUFBTSxFQUFFO0FBQ25ELE1BQUksVUFBVSxHQUFHLElBQUksQ0FBQyxHQUFHLENBQUMsRUFBRSxFQUFFLE1BQU0sQ0FBQztNQUNqQyxXQUFXLEdBQUcsTUFBTSxHQUFHLFVBQVU7TUFDakMsWUFBWSxHQUFHLElBQUksQ0FBQyxXQUFXLEdBQUcsQ0FBQyxHQUFHLE1BQU0sR0FBRyxPQUFPLENBQUMsQ0FBQyxXQUFXLENBQUMsQ0FBQzs7QUFFekUsU0FBTyxZQUFZLEdBQUcsVUFBVSxDQUFDO0NBQ2xDLENBQUM7O0FBRUYsT0FBTyxDQUFDLFdBQVcsR0FBRyxvQkFBZ0IsUUFBUSxFQUFFLEdBQUcsRUFBRSxJQUFJO01BQ25ELFVBQVUsRUFDVixXQUFXLEVBQ1gsYUFBYSxRQUdWLFVBQVUsRUFBRSxTQUFTLEVBVXBCLFVBQVU7Ozs7O0FBZmQsa0JBQVUsR0FBRyxpQkFBaUI7QUFDOUIsbUJBQVcsR0FBRyxjQUFjO0FBQzVCLHFCQUFhLEdBQUcsa0JBQUssT0FBTyxDQUFDLElBQUksQ0FBQyxNQUFNLEVBQUUsSUFBSSxDQUFDLFVBQVUsQ0FBQzs7O0FBRTVELDRCQUFPLEtBQUssQ0FBQyw2QkFBNkIsRUFBRSxJQUFJLENBQUMsR0FBRyxFQUFFLFFBQVEsRUFBRSxhQUFhLENBQUMsQ0FBQzs7eUNBQzNDLEdBQUcsQ0FBQyxxQkFBcUIsQ0FDdkQsSUFBSSxDQUFDLEdBQUcsRUFBRSxRQUFRLEVBQUUsYUFBYSxDQUFDOzs7O0FBRG5DLGtCQUFVLFFBQVYsVUFBVTtBQUFFLGlCQUFTLFFBQVQsU0FBUzs7eUNBRXBCLEdBQUcsQ0FBQyxJQUFJLENBQUMsU0FBUyxFQUFFLFVBQVUsQ0FBQzs7OzRDQUM5QixVQUFVOzs7Ozs7eUNBRUwsa0JBQUcsTUFBTSxDQUFDLElBQUksQ0FBQyxHQUFHLENBQUM7Ozs7Ozs7Ozt5Q0FFdkIsR0FBRyxDQUFDLE1BQU0sQ0FBSSxVQUFVLFNBQUksV0FBVyxDQUFHOzs7Ozs7O0FBRWhELDRCQUFPLElBQUksQ0FBQywwQ0FBMEMsQ0FBQyxDQUFDO0FBQ3BELGtCQUFVLEdBQU0sVUFBVSxTQUFJLFdBQVc7O3lDQUN2QyxHQUFHLENBQUMsS0FBSyxDQUFDLE1BQU0sRUFBRSxlQUFXLFVBQVUsQ0FBRyxDQUFDOzs7NENBRzlDLEVBQUU7Ozs7Ozs7Q0FDVixDQUFDOztxQkFFYSxPQUFPIiwiZmlsZSI6ImxpYi9hbmRyb2lkLWhlbHBlcnMuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgbG9nZ2VyIGZyb20gJy4vbG9nZ2VyJztcbmltcG9ydCBwYXRoIGZyb20gJ3BhdGgnO1xuaW1wb3J0IHsgZnMgfSBmcm9tICdhcHBpdW0tc3VwcG9ydCc7XG5cbmxldCBoZWxwZXJzID0ge307XG5cbmhlbHBlcnMudHJ1bmNhdGVEZWNpbWFscyA9IGZ1bmN0aW9uIChudW1iZXIsIGRpZ2l0cykge1xuICBsZXQgbXVsdGlwbGllciA9IE1hdGgucG93KDEwLCBkaWdpdHMpLFxuICAgICAgYWRqdXN0ZWROdW0gPSBudW1iZXIgKiBtdWx0aXBsaWVyLFxuICAgICAgdHJ1bmNhdGVkTnVtID0gTWF0aFthZGp1c3RlZE51bSA8IDAgPyAnY2VpbCcgOiAnZmxvb3InXShhZGp1c3RlZE51bSk7XG5cbiAgcmV0dXJuIHRydW5jYXRlZE51bSAvIG11bHRpcGxpZXI7XG59O1xuXG5oZWxwZXJzLnB1c2hTdHJpbmdzID0gYXN5bmMgZnVuY3Rpb24gKGxhbmd1YWdlLCBhZGIsIG9wdHMpIHtcbiAgbGV0IHJlbW90ZVBhdGggPSAnL2RhdGEvbG9jYWwvdG1wJztcbiAgbGV0IHN0cmluZ3NKc29uID0gJ3N0cmluZ3MuanNvbic7XG4gIGxldCBzdHJpbmdzVG1wRGlyID0gcGF0aC5yZXNvbHZlKG9wdHMudG1wRGlyLCBvcHRzLmFwcFBhY2thZ2UpO1xuICB0cnkge1xuICAgIGxvZ2dlci5kZWJ1ZygnRXh0cmFjdGluZyBzdHJpbmdzIGZyb20gYXBrJywgb3B0cy5hcHAsIGxhbmd1YWdlLCBzdHJpbmdzVG1wRGlyKTtcbiAgICBsZXQge2Fwa1N0cmluZ3MsIGxvY2FsUGF0aH0gPSBhd2FpdCBhZGIuZXh0cmFjdFN0cmluZ3NGcm9tQXBrKFxuICAgICAgICAgIG9wdHMuYXBwLCBsYW5ndWFnZSwgc3RyaW5nc1RtcERpcik7XG4gICAgYXdhaXQgYWRiLnB1c2gobG9jYWxQYXRoLCByZW1vdGVQYXRoKTtcbiAgICByZXR1cm4gYXBrU3RyaW5ncztcbiAgfSBjYXRjaCAoZXJyKSB7XG4gICAgaWYgKCEoYXdhaXQgZnMuZXhpc3RzKG9wdHMuYXBwKSkpIHtcbiAgICAgIC8vIGRlbGV0ZSByZW1vdGUgc3RyaW5nLmpzb24gaWYgcHJlc2VudFxuICAgICAgYXdhaXQgYWRiLnJpbXJhZihgJHtyZW1vdGVQYXRofS8ke3N0cmluZ3NKc29ufWApO1xuICAgIH0gZWxzZSB7XG4gICAgICBsb2dnZXIud2FybihcIkNvdWxkIG5vdCBnZXQgc3RyaW5ncywgY29udGludWluZyBhbnl3YXlcIik7XG4gICAgICBsZXQgcmVtb3RlRmlsZSA9IGAke3JlbW90ZVBhdGh9LyR7c3RyaW5nc0pzb259YDtcbiAgICAgIGF3YWl0IGFkYi5zaGVsbCgnZWNobycsIFtgJ3t9JyA+ICR7cmVtb3RlRmlsZX1gXSk7XG4gICAgfVxuICB9XG4gIHJldHVybiB7fTtcbn07XG5cbmV4cG9ydCBkZWZhdWx0IGhlbHBlcnM7XG4iXSwic291cmNlUm9vdCI6Ii4uLy4uIn0=
