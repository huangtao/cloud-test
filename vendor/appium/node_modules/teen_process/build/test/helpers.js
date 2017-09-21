'use strict';

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _appiumSupport = require('appium-support');

function getFixture(fix) {
  // Append .bat or .sh is there's no extention
  if (fix.indexOf('.') === -1) {
    fix = fix + (_appiumSupport.system.isWindows() ? '.bat' : '.sh');
  }
  return _path2['default'].resolve(__dirname, "..", "..", "test", "fixtures", fix);
}

exports.getFixture = getFixture;
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvaGVscGVycy5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7OztvQkFBaUIsTUFBTTs7Ozs2QkFDQSxnQkFBZ0I7O0FBRXZDLFNBQVMsVUFBVSxDQUFFLEdBQUcsRUFBRTs7QUFFeEIsTUFBSSxHQUFHLENBQUMsT0FBTyxDQUFDLEdBQUcsQ0FBQyxLQUFLLENBQUMsQ0FBQyxFQUFFO0FBQzNCLE9BQUcsR0FBRyxHQUFHLElBQUksc0JBQU8sU0FBUyxFQUFFLEdBQUcsTUFBTSxHQUFHLEtBQUssQ0FBQSxBQUFDLENBQUM7R0FDbkQ7QUFDRCxTQUFPLGtCQUFLLE9BQU8sQ0FBQyxTQUFTLEVBQUUsSUFBSSxFQUFFLElBQUksRUFBRSxNQUFNLEVBQUUsVUFBVSxFQUFFLEdBQUcsQ0FBQyxDQUFDO0NBQ3JFOztRQUVRLFVBQVUsR0FBVixVQUFVIiwiZmlsZSI6InRlc3QvaGVscGVycy5qcyIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCBwYXRoIGZyb20gJ3BhdGgnO1xuaW1wb3J0IHsgc3lzdGVtIH0gZnJvbSAnYXBwaXVtLXN1cHBvcnQnO1xuXG5mdW5jdGlvbiBnZXRGaXh0dXJlIChmaXgpIHtcbiAgLy8gQXBwZW5kIC5iYXQgb3IgLnNoIGlzIHRoZXJlJ3Mgbm8gZXh0ZW50aW9uXG4gIGlmIChmaXguaW5kZXhPZignLicpID09PSAtMSkge1xuICAgIGZpeCA9IGZpeCArIChzeXN0ZW0uaXNXaW5kb3dzKCkgPyAnLmJhdCcgOiAnLnNoJyk7XG4gIH1cbiAgcmV0dXJuIHBhdGgucmVzb2x2ZShfX2Rpcm5hbWUsIFwiLi5cIiwgXCIuLlwiLCBcInRlc3RcIiwgXCJmaXh0dXJlc1wiLCBmaXgpO1xufVxuXG5leHBvcnQgeyBnZXRGaXh0dXJlIH07XG4iXSwic291cmNlUm9vdCI6Ii4uLy4uIn0=
