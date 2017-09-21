'use strict';

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _logger = require('./logger');

var _logger2 = _interopRequireDefault(_logger);

var _mjsonwp = require('../mjsonwp');

function allowCrossDomain(req, res, next) {
  try {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,POST,PUT,OPTIONS,DELETE');
    res.header('Access-Control-Allow-Headers', 'origin, content-type, accept');

    // need to respond 200 to OPTIONS
    if ('OPTIONS' === req.method) {
      res.sendStatus(200);
    } else {
      next();
    }
  } catch (err) {
    _logger2['default'].error('Unexpected error: ' + err.stack);
    next();
  }
}

function fixPythonContentType(req, res, next) {
  // hack because python client library gives us wrong content-type
  if (/^\/wd/.test(req.path) && /^Python/.test(req.headers['user-agent'])) {
    if (req.headers['content-type'] === 'application/x-www-form-urlencoded') {
      req.headers['content-type'] = 'application/json';
    }
  }
  next();
}

function defaultToJSONContentType(req, res, next) {
  if (!req.headers['content-type']) {
    req.headers['content-type'] = 'application/json';
  }
  next();
}

function catchAllHandler(err, req, res, next) {
  _logger2['default'].error('Uncaught error: ' + err.message);
  _logger2['default'].error('Sending generic error response');
  try {
    res.status(500).send({
      status: _mjsonwp.errors.UnknownError.code(),
      value: 'ERROR running Appium command: ' + err.message
    });
    _logger2['default'].error(err);
  } catch (ign) {
    next(ign);
  }
}

function catch4XXHandler(err, req, res, next) {
  if (err.status >= 400 && err.status < 500) {
    // set the content type to `text/plain`
    // https://code.google.com/p/selenium/wiki/JsonWireProtocol#Responses
    _logger2['default'].debug('Setting content type to \'text/plain\' for HTTP status \'' + err.status + '\'');
    res.set('Content-Type', 'text/plain');
    res.status(err.status).send('Unable to process request: ' + err.message);
  } else {
    next(err);
  }
}

function catch404Handler(req, res) {
  // set the content type to `text/plain`
  // https://code.google.com/p/selenium/wiki/JsonWireProtocol#Responses
  _logger2['default'].debug('No route found. Setting content type to \'text/plain\'');
  res.set('Content-Type', 'text/plain');
  res.status(404).send('The URL \'' + req.originalUrl + '\' did not map to a valid resource');
}

exports.allowCrossDomain = allowCrossDomain;
exports.fixPythonContentType = fixPythonContentType;
exports.defaultToJSONContentType = defaultToJSONContentType;
exports.catchAllHandler = catchAllHandler;
exports.catch404Handler = catch404Handler;
exports.catch4XXHandler = catch4XXHandler;
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9leHByZXNzL21pZGRsZXdhcmUuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7c0JBQWdCLFVBQVU7Ozs7dUJBQ0gsWUFBWTs7QUFHbkMsU0FBUyxnQkFBZ0IsQ0FBRSxHQUFHLEVBQUUsR0FBRyxFQUFFLElBQUksRUFBRTtBQUN6QyxNQUFJO0FBQ0YsT0FBRyxDQUFDLE1BQU0sQ0FBQyw2QkFBNkIsRUFBRSxHQUFHLENBQUMsQ0FBQztBQUMvQyxPQUFHLENBQUMsTUFBTSxDQUFDLDhCQUE4QixFQUFFLDZCQUE2QixDQUFDLENBQUM7QUFDMUUsT0FBRyxDQUFDLE1BQU0sQ0FBQyw4QkFBOEIsRUFBRSw4QkFBOEIsQ0FBQyxDQUFDOzs7QUFHM0UsUUFBSSxTQUFTLEtBQUssR0FBRyxDQUFDLE1BQU0sRUFBRTtBQUM1QixTQUFHLENBQUMsVUFBVSxDQUFDLEdBQUcsQ0FBQyxDQUFDO0tBQ3JCLE1BQU07QUFDTCxVQUFJLEVBQUUsQ0FBQztLQUNSO0dBQ0YsQ0FBQyxPQUFPLEdBQUcsRUFBRTtBQUNaLHdCQUFJLEtBQUssd0JBQXNCLEdBQUcsQ0FBQyxLQUFLLENBQUcsQ0FBQztBQUM1QyxRQUFJLEVBQUUsQ0FBQztHQUNSO0NBQ0Y7O0FBRUQsU0FBUyxvQkFBb0IsQ0FBRSxHQUFHLEVBQUUsR0FBRyxFQUFFLElBQUksRUFBRTs7QUFFN0MsTUFBSSxPQUFPLENBQUMsSUFBSSxDQUFDLEdBQUcsQ0FBQyxJQUFJLENBQUMsSUFBSSxTQUFTLENBQUMsSUFBSSxDQUFDLEdBQUcsQ0FBQyxPQUFPLENBQUMsWUFBWSxDQUFDLENBQUMsRUFBRTtBQUN2RSxRQUFJLEdBQUcsQ0FBQyxPQUFPLENBQUMsY0FBYyxDQUFDLEtBQUssbUNBQW1DLEVBQUU7QUFDdkUsU0FBRyxDQUFDLE9BQU8sQ0FBQyxjQUFjLENBQUMsR0FBRyxrQkFBa0IsQ0FBQztLQUNsRDtHQUNGO0FBQ0QsTUFBSSxFQUFFLENBQUM7Q0FDUjs7QUFFRCxTQUFTLHdCQUF3QixDQUFFLEdBQUcsRUFBRSxHQUFHLEVBQUUsSUFBSSxFQUFFO0FBQ2pELE1BQUksQ0FBQyxHQUFHLENBQUMsT0FBTyxDQUFDLGNBQWMsQ0FBQyxFQUFFO0FBQ2hDLE9BQUcsQ0FBQyxPQUFPLENBQUMsY0FBYyxDQUFDLEdBQUcsa0JBQWtCLENBQUM7R0FDbEQ7QUFDRCxNQUFJLEVBQUUsQ0FBQztDQUNSOztBQUVELFNBQVMsZUFBZSxDQUFFLEdBQUcsRUFBRSxHQUFHLEVBQUUsR0FBRyxFQUFFLElBQUksRUFBRTtBQUM3QyxzQkFBSSxLQUFLLHNCQUFvQixHQUFHLENBQUMsT0FBTyxDQUFHLENBQUM7QUFDNUMsc0JBQUksS0FBSyxDQUFDLGdDQUFnQyxDQUFDLENBQUM7QUFDNUMsTUFBSTtBQUNGLE9BQUcsQ0FBQyxNQUFNLENBQUMsR0FBRyxDQUFDLENBQUMsSUFBSSxDQUFDO0FBQ25CLFlBQU0sRUFBRSxnQkFBTyxZQUFZLENBQUMsSUFBSSxFQUFFO0FBQ2xDLFdBQUsscUNBQW1DLEdBQUcsQ0FBQyxPQUFPLEFBQUU7S0FDdEQsQ0FBQyxDQUFDO0FBQ0gsd0JBQUksS0FBSyxDQUFDLEdBQUcsQ0FBQyxDQUFDO0dBQ2hCLENBQUMsT0FBTyxHQUFHLEVBQUU7QUFDWixRQUFJLENBQUMsR0FBRyxDQUFDLENBQUM7R0FDWDtDQUNGOztBQUVELFNBQVMsZUFBZSxDQUFFLEdBQUcsRUFBRSxHQUFHLEVBQUUsR0FBRyxFQUFFLElBQUksRUFBRTtBQUM3QyxNQUFJLEdBQUcsQ0FBQyxNQUFNLElBQUksR0FBRyxJQUFJLEdBQUcsQ0FBQyxNQUFNLEdBQUcsR0FBRyxFQUFFOzs7QUFHekMsd0JBQUksS0FBSywrREFBMEQsR0FBRyxDQUFDLE1BQU0sUUFBSSxDQUFDO0FBQ2xGLE9BQUcsQ0FBQyxHQUFHLENBQUMsY0FBYyxFQUFFLFlBQVksQ0FBQyxDQUFDO0FBQ3RDLE9BQUcsQ0FBQyxNQUFNLENBQUMsR0FBRyxDQUFDLE1BQU0sQ0FBQyxDQUFDLElBQUksaUNBQStCLEdBQUcsQ0FBQyxPQUFPLENBQUcsQ0FBQztHQUMxRSxNQUFNO0FBQ0wsUUFBSSxDQUFDLEdBQUcsQ0FBQyxDQUFDO0dBQ1g7Q0FDRjs7QUFFRCxTQUFTLGVBQWUsQ0FBRSxHQUFHLEVBQUUsR0FBRyxFQUFFOzs7QUFHbEMsc0JBQUksS0FBSyxDQUFDLHdEQUF3RCxDQUFDLENBQUM7QUFDcEUsS0FBRyxDQUFDLEdBQUcsQ0FBQyxjQUFjLEVBQUUsWUFBWSxDQUFDLENBQUM7QUFDdEMsS0FBRyxDQUFDLE1BQU0sQ0FBQyxHQUFHLENBQUMsQ0FBQyxJQUFJLGdCQUFhLEdBQUcsQ0FBQyxXQUFXLHdDQUFvQyxDQUFDO0NBQ3RGOztRQUVRLGdCQUFnQixHQUFoQixnQkFBZ0I7UUFBRSxvQkFBb0IsR0FBcEIsb0JBQW9CO1FBQUUsd0JBQXdCLEdBQXhCLHdCQUF3QjtRQUFFLGVBQWUsR0FBZixlQUFlO1FBQUUsZUFBZSxHQUFmLGVBQWU7UUFBRSxlQUFlLEdBQWYsZUFBZSIsImZpbGUiOiJsaWIvZXhwcmVzcy9taWRkbGV3YXJlLmpzIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IGxvZyBmcm9tICcuL2xvZ2dlcic7XG5pbXBvcnQgeyBlcnJvcnMgfSBmcm9tICcuLi9tanNvbndwJztcblxuXG5mdW5jdGlvbiBhbGxvd0Nyb3NzRG9tYWluIChyZXEsIHJlcywgbmV4dCkge1xuICB0cnkge1xuICAgIHJlcy5oZWFkZXIoJ0FjY2Vzcy1Db250cm9sLUFsbG93LU9yaWdpbicsICcqJyk7XG4gICAgcmVzLmhlYWRlcignQWNjZXNzLUNvbnRyb2wtQWxsb3ctTWV0aG9kcycsICdHRVQsUE9TVCxQVVQsT1BUSU9OUyxERUxFVEUnKTtcbiAgICByZXMuaGVhZGVyKCdBY2Nlc3MtQ29udHJvbC1BbGxvdy1IZWFkZXJzJywgJ29yaWdpbiwgY29udGVudC10eXBlLCBhY2NlcHQnKTtcblxuICAgIC8vIG5lZWQgdG8gcmVzcG9uZCAyMDAgdG8gT1BUSU9OU1xuICAgIGlmICgnT1BUSU9OUycgPT09IHJlcS5tZXRob2QpIHtcbiAgICAgIHJlcy5zZW5kU3RhdHVzKDIwMCk7XG4gICAgfSBlbHNlIHtcbiAgICAgIG5leHQoKTtcbiAgICB9XG4gIH0gY2F0Y2ggKGVycikge1xuICAgIGxvZy5lcnJvcihgVW5leHBlY3RlZCBlcnJvcjogJHtlcnIuc3RhY2t9YCk7XG4gICAgbmV4dCgpO1xuICB9XG59XG5cbmZ1bmN0aW9uIGZpeFB5dGhvbkNvbnRlbnRUeXBlIChyZXEsIHJlcywgbmV4dCkge1xuICAvLyBoYWNrIGJlY2F1c2UgcHl0aG9uIGNsaWVudCBsaWJyYXJ5IGdpdmVzIHVzIHdyb25nIGNvbnRlbnQtdHlwZVxuICBpZiAoL15cXC93ZC8udGVzdChyZXEucGF0aCkgJiYgL15QeXRob24vLnRlc3QocmVxLmhlYWRlcnNbJ3VzZXItYWdlbnQnXSkpIHtcbiAgICBpZiAocmVxLmhlYWRlcnNbJ2NvbnRlbnQtdHlwZSddID09PSAnYXBwbGljYXRpb24veC13d3ctZm9ybS11cmxlbmNvZGVkJykge1xuICAgICAgcmVxLmhlYWRlcnNbJ2NvbnRlbnQtdHlwZSddID0gJ2FwcGxpY2F0aW9uL2pzb24nO1xuICAgIH1cbiAgfVxuICBuZXh0KCk7XG59XG5cbmZ1bmN0aW9uIGRlZmF1bHRUb0pTT05Db250ZW50VHlwZSAocmVxLCByZXMsIG5leHQpIHtcbiAgaWYgKCFyZXEuaGVhZGVyc1snY29udGVudC10eXBlJ10pIHtcbiAgICByZXEuaGVhZGVyc1snY29udGVudC10eXBlJ10gPSAnYXBwbGljYXRpb24vanNvbic7XG4gIH1cbiAgbmV4dCgpO1xufVxuXG5mdW5jdGlvbiBjYXRjaEFsbEhhbmRsZXIgKGVyciwgcmVxLCByZXMsIG5leHQpIHtcbiAgbG9nLmVycm9yKGBVbmNhdWdodCBlcnJvcjogJHtlcnIubWVzc2FnZX1gKTtcbiAgbG9nLmVycm9yKCdTZW5kaW5nIGdlbmVyaWMgZXJyb3IgcmVzcG9uc2UnKTtcbiAgdHJ5IHtcbiAgICByZXMuc3RhdHVzKDUwMCkuc2VuZCh7XG4gICAgICBzdGF0dXM6IGVycm9ycy5Vbmtub3duRXJyb3IuY29kZSgpLFxuICAgICAgdmFsdWU6IGBFUlJPUiBydW5uaW5nIEFwcGl1bSBjb21tYW5kOiAke2Vyci5tZXNzYWdlfWBcbiAgICB9KTtcbiAgICBsb2cuZXJyb3IoZXJyKTtcbiAgfSBjYXRjaCAoaWduKSB7XG4gICAgbmV4dChpZ24pO1xuICB9XG59XG5cbmZ1bmN0aW9uIGNhdGNoNFhYSGFuZGxlciAoZXJyLCByZXEsIHJlcywgbmV4dCkge1xuICBpZiAoZXJyLnN0YXR1cyA+PSA0MDAgJiYgZXJyLnN0YXR1cyA8IDUwMCkge1xuICAgIC8vIHNldCB0aGUgY29udGVudCB0eXBlIHRvIGB0ZXh0L3BsYWluYFxuICAgIC8vIGh0dHBzOi8vY29kZS5nb29nbGUuY29tL3Avc2VsZW5pdW0vd2lraS9Kc29uV2lyZVByb3RvY29sI1Jlc3BvbnNlc1xuICAgIGxvZy5kZWJ1ZyhgU2V0dGluZyBjb250ZW50IHR5cGUgdG8gJ3RleHQvcGxhaW4nIGZvciBIVFRQIHN0YXR1cyAnJHtlcnIuc3RhdHVzfSdgKTtcbiAgICByZXMuc2V0KCdDb250ZW50LVR5cGUnLCAndGV4dC9wbGFpbicpO1xuICAgIHJlcy5zdGF0dXMoZXJyLnN0YXR1cykuc2VuZChgVW5hYmxlIHRvIHByb2Nlc3MgcmVxdWVzdDogJHtlcnIubWVzc2FnZX1gKTtcbiAgfSBlbHNlIHtcbiAgICBuZXh0KGVycik7XG4gIH1cbn1cblxuZnVuY3Rpb24gY2F0Y2g0MDRIYW5kbGVyIChyZXEsIHJlcykge1xuICAvLyBzZXQgdGhlIGNvbnRlbnQgdHlwZSB0byBgdGV4dC9wbGFpbmBcbiAgLy8gaHR0cHM6Ly9jb2RlLmdvb2dsZS5jb20vcC9zZWxlbml1bS93aWtpL0pzb25XaXJlUHJvdG9jb2wjUmVzcG9uc2VzXG4gIGxvZy5kZWJ1ZygnTm8gcm91dGUgZm91bmQuIFNldHRpbmcgY29udGVudCB0eXBlIHRvIFxcJ3RleHQvcGxhaW5cXCcnKTtcbiAgcmVzLnNldCgnQ29udGVudC1UeXBlJywgJ3RleHQvcGxhaW4nKTtcbiAgcmVzLnN0YXR1cyg0MDQpLnNlbmQoYFRoZSBVUkwgJyR7cmVxLm9yaWdpbmFsVXJsfScgZGlkIG5vdCBtYXAgdG8gYSB2YWxpZCByZXNvdXJjZWApO1xufVxuXG5leHBvcnQgeyBhbGxvd0Nyb3NzRG9tYWluLCBmaXhQeXRob25Db250ZW50VHlwZSwgZGVmYXVsdFRvSlNPTkNvbnRlbnRUeXBlLCBjYXRjaEFsbEhhbmRsZXIsIGNhdGNoNDA0SGFuZGxlciwgY2F0Y2g0WFhIYW5kbGVyIH07XG4iXSwic291cmNlUm9vdCI6Ii4uLy4uLy4uIn0=
