'use strict';

var _slicedToArray = require('babel-runtime/helpers/sliced-to-array')['default'];

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});
function resFixture(url, method, json) {
  if (/\/status$/.test(url)) {
    return [200, { status: 0, value: { foo: 'bar' } }];
  }
  if (/\/element\/bad\/text$/.test(url)) {
    return [500, { status: 11, value: { message: 'Invisible element' } }];
  }
  if (/\/element\/200\/text$/.test(url)) {
    return [200, { status: 11, value: { message: 'Invisible element' } }];
  }
  if (/\/element\/200\/value$/.test(url)) {
    return [200, { status: 0, sessionId: 'innersessionid', value: 'foobar' }];
  }
  if (/\/session$/.test(url) && method === "POST") {
    if (json.desiredCapabilities && json.desiredCapabilities.redirect) {
      return [303, 'http://localhost:4444/wd/hub/session/123'];
    } else {
      return [200, { status: 0, sessionId: '123', value: { browserName: 'boo' } }];
    }
  }
  if (/\/nochrome$/.test(url)) {
    return [100, { status: 0, value: { message: 'chrome not reachable' } }];
  }
  throw new Error("Can't handle url " + url);
}

function request(opts) {
  var _resFixture, _resFixture2, statusCode, body, response;

  return _regeneratorRuntime.async(function request$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        if (!/badurl$/.test(opts.url)) {
          context$1$0.next = 2;
          break;
        }

        throw new Error("noworky");

      case 2:
        _resFixture = resFixture(opts.url, opts.method, opts.json);
        _resFixture2 = _slicedToArray(_resFixture, 2);
        statusCode = _resFixture2[0];
        body = _resFixture2[1];
        response = {
          statusCode: statusCode,
          headers: { 'Content-type': 'application/json' },
          body: body
        };
        return context$1$0.abrupt('return', response);

      case 8:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}

exports['default'] = request;
module.exports = exports['default'];
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvanNvbndwLXByb3h5L21vY2stcmVxdWVzdC5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7QUFBQSxTQUFTLFVBQVUsQ0FBRSxHQUFHLEVBQUUsTUFBTSxFQUFFLElBQUksRUFBRTtBQUN0QyxNQUFJLFdBQVcsQ0FBQyxJQUFJLENBQUMsR0FBRyxDQUFDLEVBQUU7QUFDekIsV0FBTyxDQUFDLEdBQUcsRUFBRSxFQUFDLE1BQU0sRUFBRSxDQUFDLEVBQUUsS0FBSyxFQUFFLEVBQUMsR0FBRyxFQUFFLEtBQUssRUFBQyxFQUFDLENBQUMsQ0FBQztHQUNoRDtBQUNELE1BQUksdUJBQXVCLENBQUMsSUFBSSxDQUFDLEdBQUcsQ0FBQyxFQUFFO0FBQ3JDLFdBQU8sQ0FBQyxHQUFHLEVBQUUsRUFBQyxNQUFNLEVBQUUsRUFBRSxFQUFFLEtBQUssRUFBRSxFQUFDLE9BQU8sRUFBRSxtQkFBbUIsRUFBQyxFQUFDLENBQUMsQ0FBQztHQUNuRTtBQUNELE1BQUksdUJBQXVCLENBQUMsSUFBSSxDQUFDLEdBQUcsQ0FBQyxFQUFFO0FBQ3JDLFdBQU8sQ0FBQyxHQUFHLEVBQUUsRUFBQyxNQUFNLEVBQUUsRUFBRSxFQUFFLEtBQUssRUFBRSxFQUFDLE9BQU8sRUFBRSxtQkFBbUIsRUFBQyxFQUFDLENBQUMsQ0FBQztHQUNuRTtBQUNELE1BQUksd0JBQXdCLENBQUMsSUFBSSxDQUFDLEdBQUcsQ0FBQyxFQUFFO0FBQ3RDLFdBQU8sQ0FBQyxHQUFHLEVBQUUsRUFBQyxNQUFNLEVBQUUsQ0FBQyxFQUFFLFNBQVMsRUFBRSxnQkFBZ0IsRUFBRSxLQUFLLEVBQUUsUUFBUSxFQUFDLENBQUMsQ0FBQztHQUN6RTtBQUNELE1BQUksWUFBWSxDQUFDLElBQUksQ0FBQyxHQUFHLENBQUMsSUFBSSxNQUFNLEtBQUssTUFBTSxFQUFFO0FBQy9DLFFBQUksSUFBSSxDQUFDLG1CQUFtQixJQUFJLElBQUksQ0FBQyxtQkFBbUIsQ0FBQyxRQUFRLEVBQUU7QUFDakUsYUFBTyxDQUFDLEdBQUcsRUFBRSwwQ0FBMEMsQ0FBQyxDQUFDO0tBQzFELE1BQU07QUFDTCxhQUFPLENBQUMsR0FBRyxFQUFFLEVBQUMsTUFBTSxFQUFFLENBQUMsRUFBRSxTQUFTLEVBQUUsS0FBSyxFQUFFLEtBQUssRUFBRSxFQUFDLFdBQVcsRUFBRSxLQUFLLEVBQUMsRUFBQyxDQUFDLENBQUM7S0FDMUU7R0FDRjtBQUNELE1BQUksYUFBYSxDQUFDLElBQUksQ0FBQyxHQUFHLENBQUMsRUFBRTtBQUMzQixXQUFPLENBQUMsR0FBRyxFQUFFLEVBQUMsTUFBTSxFQUFFLENBQUMsRUFBRSxLQUFLLEVBQUUsRUFBQyxPQUFPLEVBQUUsc0JBQXNCLEVBQUMsRUFBQyxDQUFDLENBQUM7R0FDckU7QUFDRCxRQUFNLElBQUksS0FBSyxDQUFDLG1CQUFtQixHQUFHLEdBQUcsQ0FBQyxDQUFDO0NBQzVDOztBQUVELFNBQWUsT0FBTyxDQUFFLElBQUk7aUNBS3JCLFVBQVUsRUFBRSxJQUFJLEVBQ2pCLFFBQVE7Ozs7O2FBTFIsU0FBUyxDQUFDLElBQUksQ0FBQyxJQUFJLENBQUMsR0FBRyxDQUFDOzs7OztjQUNwQixJQUFJLEtBQUssQ0FBQyxTQUFTLENBQUM7OztzQkFHSCxVQUFVLENBQUMsSUFBSSxDQUFDLEdBQUcsRUFBRSxJQUFJLENBQUMsTUFBTSxFQUFFLElBQUksQ0FBQyxJQUFJLENBQUM7O0FBQWhFLGtCQUFVO0FBQUUsWUFBSTtBQUNqQixnQkFBUSxHQUFHO0FBQ2Isb0JBQVUsRUFBVixVQUFVO0FBQ1YsaUJBQU8sRUFBRSxFQUFDLGNBQWMsRUFBRSxrQkFBa0IsRUFBQztBQUM3QyxjQUFJLEVBQUosSUFBSTtTQUNMOzRDQUNNLFFBQVE7Ozs7Ozs7Q0FDaEI7O3FCQUVjLE9BQU8iLCJmaWxlIjoidGVzdC9qc29ud3AtcHJveHkvbW9jay1yZXF1ZXN0LmpzIiwic291cmNlc0NvbnRlbnQiOlsiZnVuY3Rpb24gcmVzRml4dHVyZSAodXJsLCBtZXRob2QsIGpzb24pIHtcbiAgaWYgKC9cXC9zdGF0dXMkLy50ZXN0KHVybCkpIHtcbiAgICByZXR1cm4gWzIwMCwge3N0YXR1czogMCwgdmFsdWU6IHtmb286ICdiYXInfX1dO1xuICB9XG4gIGlmICgvXFwvZWxlbWVudFxcL2JhZFxcL3RleHQkLy50ZXN0KHVybCkpIHtcbiAgICByZXR1cm4gWzUwMCwge3N0YXR1czogMTEsIHZhbHVlOiB7bWVzc2FnZTogJ0ludmlzaWJsZSBlbGVtZW50J319XTtcbiAgfVxuICBpZiAoL1xcL2VsZW1lbnRcXC8yMDBcXC90ZXh0JC8udGVzdCh1cmwpKSB7XG4gICAgcmV0dXJuIFsyMDAsIHtzdGF0dXM6IDExLCB2YWx1ZToge21lc3NhZ2U6ICdJbnZpc2libGUgZWxlbWVudCd9fV07XG4gIH1cbiAgaWYgKC9cXC9lbGVtZW50XFwvMjAwXFwvdmFsdWUkLy50ZXN0KHVybCkpIHtcbiAgICByZXR1cm4gWzIwMCwge3N0YXR1czogMCwgc2Vzc2lvbklkOiAnaW5uZXJzZXNzaW9uaWQnLCB2YWx1ZTogJ2Zvb2Jhcid9XTtcbiAgfVxuICBpZiAoL1xcL3Nlc3Npb24kLy50ZXN0KHVybCkgJiYgbWV0aG9kID09PSBcIlBPU1RcIikge1xuICAgIGlmIChqc29uLmRlc2lyZWRDYXBhYmlsaXRpZXMgJiYganNvbi5kZXNpcmVkQ2FwYWJpbGl0aWVzLnJlZGlyZWN0KSB7XG4gICAgICByZXR1cm4gWzMwMywgJ2h0dHA6Ly9sb2NhbGhvc3Q6NDQ0NC93ZC9odWIvc2Vzc2lvbi8xMjMnXTtcbiAgICB9IGVsc2Uge1xuICAgICAgcmV0dXJuIFsyMDAsIHtzdGF0dXM6IDAsIHNlc3Npb25JZDogJzEyMycsIHZhbHVlOiB7YnJvd3Nlck5hbWU6ICdib28nfX1dO1xuICAgIH1cbiAgfVxuICBpZiAoL1xcL25vY2hyb21lJC8udGVzdCh1cmwpKSB7XG4gICAgcmV0dXJuIFsxMDAsIHtzdGF0dXM6IDAsIHZhbHVlOiB7bWVzc2FnZTogJ2Nocm9tZSBub3QgcmVhY2hhYmxlJ319XTtcbiAgfVxuICB0aHJvdyBuZXcgRXJyb3IoXCJDYW4ndCBoYW5kbGUgdXJsIFwiICsgdXJsKTtcbn1cblxuYXN5bmMgZnVuY3Rpb24gcmVxdWVzdCAob3B0cykge1xuICBpZiAoL2JhZHVybCQvLnRlc3Qob3B0cy51cmwpKSB7XG4gICAgdGhyb3cgbmV3IEVycm9yKFwibm93b3JreVwiKTtcbiAgfVxuXG4gIGxldCBbc3RhdHVzQ29kZSwgYm9keV0gPSByZXNGaXh0dXJlKG9wdHMudXJsLCBvcHRzLm1ldGhvZCwgb3B0cy5qc29uKTtcbiAgbGV0IHJlc3BvbnNlID0ge1xuICAgIHN0YXR1c0NvZGUsXG4gICAgaGVhZGVyczogeydDb250ZW50LXR5cGUnOiAnYXBwbGljYXRpb24vanNvbid9LFxuICAgIGJvZHlcbiAgfTtcbiAgcmV0dXJuIHJlc3BvbnNlO1xufVxuXG5leHBvcnQgZGVmYXVsdCByZXF1ZXN0O1xuIl0sInNvdXJjZVJvb3QiOiIuLi8uLi8uLiJ9
