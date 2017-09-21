'use strict';

var _regeneratorRuntime = require('babel-runtime/regenerator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

Object.defineProperty(exports, '__esModule', {
  value: true
});

var _requestPromise = require('request-promise');

var _requestPromise2 = _interopRequireDefault(_requestPromise);

var _appiumSupport = require('appium-support');

var _logger = require('./logger');

var _logger2 = _interopRequireDefault(_logger);

function registerNode(configFile, addr, port) {
  var data;
  return _regeneratorRuntime.async(function registerNode$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        data = undefined;
        context$1$0.prev = 1;
        context$1$0.next = 4;
        return _regeneratorRuntime.awrap(_appiumSupport.fs.readFile(configFile, 'utf-8'));

      case 4:
        data = context$1$0.sent;
        context$1$0.next = 11;
        break;

      case 7:
        context$1$0.prev = 7;
        context$1$0.t0 = context$1$0['catch'](1);

        _logger2['default'].error('Unable to load node configuration file to register with grid: ' + context$1$0.t0.message);
        return context$1$0.abrupt('return');

      case 11:
        if (data) {
          context$1$0.next = 14;
          break;
        }

        _logger2['default'].error('No data found in the node configuration file to send to the grid');
        return context$1$0.abrupt('return');

      case 14:
        context$1$0.next = 16;
        return _regeneratorRuntime.awrap(postRequest(data, addr, port));

      case 16:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[1, 7]]);
}

function registerToGrid(options_post, jsonObject) {
  var response, logMessage;
  return _regeneratorRuntime.async(function registerToGrid$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        context$1$0.prev = 0;
        context$1$0.next = 3;
        return _regeneratorRuntime.awrap((0, _requestPromise2['default'])(options_post));

      case 3:
        response = context$1$0.sent;

        if (!(response === undefined || response.statusCode !== 200)) {
          context$1$0.next = 6;
          break;
        }

        throw new Error('Request failed');

      case 6:
        logMessage = 'Appium successfully registered with the grid on ' + jsonObject.configuration.hubHost + ':' + jsonObject.configuration.hubPort;

        _logger2['default'].debug(logMessage);
        context$1$0.next = 13;
        break;

      case 10:
        context$1$0.prev = 10;
        context$1$0.t0 = context$1$0['catch'](0);

        _logger2['default'].error('Request to register with grid was unsuccessful: ' + context$1$0.t0.message);

      case 13:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[0, 10]]);
}

function postRequest(data, addr, port) {
  var jsonObject, configuration, property, post_headers, post_options, registerCycleTime;
  return _regeneratorRuntime.async(function postRequest$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        jsonObject = undefined;

        try {
          jsonObject = JSON.parse(data);
        } catch (err) {
          _logger2['default'].errorAndThrow('Syntax error in node configuration file: ' + err.message);
        }

        // Move Selenium 3 configuration properties to configuration object
        if (!jsonObject.hasOwnProperty('configuration')) {
          configuration = {};

          for (property in jsonObject) {
            if (jsonObject.hasOwnProperty(property) && property !== 'capabilities') {
              configuration[property] = jsonObject[property];
              delete jsonObject[property];
            }
          }
          jsonObject.configuration = configuration;
        }

        // if the node config does not have the appium/webdriver url, host, and port,
        // automatically add it based on how appium was initialized
        // otherwise, we will take whatever the user setup
        // because we will always set localhost/127.0.0.1. this won't work if your
        // node and grid aren't in the same place
        if (!jsonObject.configuration.url || !jsonObject.configuration.host || !jsonObject.configuration.port) {
          jsonObject.configuration.url = 'http://' + addr + ':' + port + '/wd/hub';
          jsonObject.configuration.host = addr;
          jsonObject.configuration.port = port;
        }
        // if the node config does not have id automatically add it
        if (!jsonObject.configuration.id) {
          jsonObject.configuration.id = 'http://' + jsonObject.configuration.host + ':' + jsonObject.configuration.port;
        }

        // re-serialize the configuration with the auto populated data
        data = JSON.stringify(jsonObject);

        // prepare the header
        post_headers = {
          'Content-Type': 'application/json',
          'Content-Length': data.length
        };
        post_options = {
          url: 'http://' + jsonObject.configuration.hubHost + ':' + jsonObject.configuration.hubPort + '/grid/register',
          method: 'POST',
          body: data,
          headers: post_headers,
          resolveWithFullResponse: true // return the full response, not just the body
        };

        if (!(jsonObject.configuration.register !== true)) {
          context$1$0.next = 11;
          break;
        }

        _logger2['default'].debug('No registration sent (' + jsonObject.configuration.register + ' = false)');
        return context$1$0.abrupt('return');

      case 11:
        registerCycleTime = jsonObject.configuration.registerCycle;

        if (registerCycleTime !== null && registerCycleTime > 0) {
          (function () {
            // initiate a new Thread
            var first = true;
            _logger2['default'].debug('Starting auto register thread for grid. Will try to register every ' + registerCycleTime + ' ms.');
            setInterval(function callee$2$0() {
              var isRegistered;
              return _regeneratorRuntime.async(function callee$2$0$(context$3$0) {
                while (1) switch (context$3$0.prev = context$3$0.next) {
                  case 0:
                    if (!(first !== true)) {
                      context$3$0.next = 9;
                      break;
                    }

                    context$3$0.next = 3;
                    return _regeneratorRuntime.awrap(isAlreadyRegistered(jsonObject));

                  case 3:
                    isRegistered = context$3$0.sent;

                    if (!(isRegistered !== null && isRegistered !== true)) {
                      context$3$0.next = 7;
                      break;
                    }

                    context$3$0.next = 7;
                    return _regeneratorRuntime.awrap(registerToGrid(post_options, jsonObject));

                  case 7:
                    context$3$0.next = 12;
                    break;

                  case 9:
                    first = false;
                    context$3$0.next = 12;
                    return _regeneratorRuntime.awrap(registerToGrid(post_options, jsonObject));

                  case 12:
                  case 'end':
                    return context$3$0.stop();
                }
              }, null, this);
            }, registerCycleTime);
          })();
        }

      case 13:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this);
}

function isAlreadyRegistered(jsonObject) {
  var id, response, responseData;
  return _regeneratorRuntime.async(function isAlreadyRegistered$(context$1$0) {
    while (1) switch (context$1$0.prev = context$1$0.next) {
      case 0:
        id = jsonObject.configuration.id;
        context$1$0.prev = 1;
        context$1$0.next = 4;
        return _regeneratorRuntime.awrap((0, _requestPromise2['default'])({
          uri: 'http://' + jsonObject.configuration.hubHost + ':' + jsonObject.configuration.hubPort + '/grid/api/proxy?id=' + id,
          method: 'GET',
          timeout: 10000,
          resolveWithFullResponse: true // return the full response, not just the body
        }));

      case 4:
        response = context$1$0.sent;

        if (!(response === undefined || response.statusCode !== 200)) {
          context$1$0.next = 7;
          break;
        }

        throw new Error('Request failed');

      case 7:
        responseData = JSON.parse(response.body);

        if (responseData.success !== true) {
          // if register fail, print the debug msg
          _logger2['default'].debug('Grid registration error: ' + responseData.msg);
        }
        return context$1$0.abrupt('return', responseData.success);

      case 12:
        context$1$0.prev = 12;
        context$1$0.t0 = context$1$0['catch'](1);

        _logger2['default'].debug('Hub down or not responding: ' + context$1$0.t0.message);

      case 15:
      case 'end':
        return context$1$0.stop();
    }
  }, null, this, [[1, 12]]);
}

exports['default'] = registerNode;
module.exports = exports['default'];

// Check presence of data before posting  it to the selenium grid

// parse json to get hub host and port

// the post options

// make the http POST to the grid for registration

//check if node is already registered
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImxpYi9ncmlkLXJlZ2lzdGVyLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7OEJBQW9CLGlCQUFpQjs7Ozs2QkFDbEIsZ0JBQWdCOztzQkFDaEIsVUFBVTs7OztBQUc3QixTQUFlLFlBQVksQ0FBRSxVQUFVLEVBQUUsSUFBSSxFQUFFLElBQUk7TUFDN0MsSUFBSTs7OztBQUFKLFlBQUk7Ozt5Q0FFTyxrQkFBRyxRQUFRLENBQUMsVUFBVSxFQUFFLE9BQU8sQ0FBQzs7O0FBQTdDLFlBQUk7Ozs7Ozs7O0FBRUosNEJBQU8sS0FBSyxvRUFBa0UsZUFBSSxPQUFPLENBQUcsQ0FBQzs7OztZQUsxRixJQUFJOzs7OztBQUNQLDRCQUFPLEtBQUssQ0FBQyxrRUFBa0UsQ0FBQyxDQUFDOzs7Ozt5Q0FHN0UsV0FBVyxDQUFDLElBQUksRUFBRSxJQUFJLEVBQUUsSUFBSSxDQUFDOzs7Ozs7O0NBQ3BDOztBQUVELFNBQWUsY0FBYyxDQUFFLFlBQVksRUFBRSxVQUFVO01BRS9DLFFBQVEsRUFJUixVQUFVOzs7Ozs7eUNBSk8saUNBQVEsWUFBWSxDQUFDOzs7QUFBdEMsZ0JBQVE7O2NBQ1IsUUFBUSxLQUFLLFNBQVMsSUFBSSxRQUFRLENBQUMsVUFBVSxLQUFLLEdBQUcsQ0FBQTs7Ozs7Y0FDakQsSUFBSSxLQUFLLENBQUMsZ0JBQWdCLENBQUM7OztBQUUvQixrQkFBVSx3REFBc0QsVUFBVSxDQUFDLGFBQWEsQ0FBQyxPQUFPLFNBQUksVUFBVSxDQUFDLGFBQWEsQ0FBQyxPQUFPOztBQUN4SSw0QkFBTyxLQUFLLENBQUMsVUFBVSxDQUFDLENBQUM7Ozs7Ozs7O0FBRXpCLDRCQUFPLEtBQUssc0RBQW9ELGVBQUksT0FBTyxDQUFHLENBQUM7Ozs7Ozs7Q0FFbEY7O0FBRUQsU0FBZSxXQUFXLENBQUUsSUFBSSxFQUFFLElBQUksRUFBRSxJQUFJO01BRXRDLFVBQVUsRUFTUixhQUFhLEVBQ1IsUUFBUSxFQTRCZixZQUFZLEVBS1osWUFBWSxFQWFaLGlCQUFp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QUUsaUJBQWlCLENBQUMsQ0FBQzs7U0FDdkI7Ozs7Ozs7Q0FDRjs7QUFFRCxTQUFlLG1CQUFtQixDQUFFLFVBQVU7TUFFeEMsRUFBRSxFQUVBLFFBQVEsRUFTUixZQUFZOzs7O0FBWGQsVUFBRSxHQUFHLFVBQVUsQ0FBQyxhQUFhLENBQUMsRUFBRTs7O3lDQUViLGlDQUFRO0FBQzNCLGFBQUcsY0FBWSxVQUFVLENBQUMsYUFBYSxDQUFDLE9BQU8sU0FBSSxVQUFVLENBQUMsYUFBYSxDQUFDLE9BQU8sMkJBQXNCLEVBQUUsQUFBRTtBQUM3RyxnQkFBTSxFQUFJLEtBQUs7QUFDZixpQkFBTyxFQUFHLEtBQUs7QUFDZixpQ0FBdUIsRUFBRSxJQUFJO1NBQzlCLENBQUM7OztBQUxFLGdCQUFROztjQU1SLFFBQVEsS0FBSyxTQUFTLElBQUksUUFBUSxDQUFDLFVBQVUsS0FBSyxHQUFHLENBQUE7Ozs7O2NBQ2pELElBQUksS0FBSyxrQkFBa0I7OztBQUUvQixvQkFBWSxHQUFHLElBQUksQ0FBQyxLQUFLLENBQUMsUUFBUSxDQUFDLElBQUksQ0FBQzs7QUFDNUMsWUFBSSxZQUFZLENBQUMsT0FBTyxLQUFLLElBQUksRUFBRTs7QUFFakMsOEJBQU8sS0FBSywrQkFBNkIsWUFBWSxDQUFDLEdBQUcsQ0FBRyxDQUFDO1NBQzlEOzRDQUNNLFlBQVksQ0FBQyxPQUFPOzs7Ozs7QUFFM0IsNEJBQU8sS0FBSyxrQ0FBZ0MsZUFBSSxPQUFPLENBQUcsQ0FBQzs7Ozs7OztDQUU5RDs7cUJBR2MsWUFBWSIsImZpbGUiOiJsaWIvZ3JpZC1yZWdpc3Rlci5qcyIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCByZXF1ZXN0IGZyb20gJ3JlcXVlc3QtcHJvbWlzZSc7XG5pbXBvcnQgeyBmcyB9IGZyb20gJ2FwcGl1bS1zdXBwb3J0JztcbmltcG9ydCBsb2dnZXIgZnJvbSAnLi9sb2dnZXInO1xuXG5cbmFzeW5jIGZ1bmN0aW9uIHJlZ2lzdGVyTm9kZSAoY29uZmlnRmlsZSwgYWRkciwgcG9ydCkge1xuICBsZXQgZGF0YTtcbiAgdHJ5IHtcbiAgICBkYXRhID0gYXdhaXQgZnMucmVhZEZpbGUoY29uZmlnRmlsZSwgJ3V0Zi04Jyk7XG4gIH0gY2F0Y2ggKGVycikge1xuICAgIGxvZ2dlci5lcnJvcihgVW5hYmxlIHRvIGxvYWQgbm9kZSBjb25maWd1cmF0aW9uIGZpbGUgdG8gcmVnaXN0ZXIgd2l0aCBncmlkOiAke2Vyci5tZXNzYWdlfWApO1xuICAgIHJldHVybjtcbiAgfVxuXG4gIC8vIENoZWNrIHByZXNlbmNlIG9mIGRhdGEgYmVmb3JlIHBvc3RpbmcgIGl0IHRvIHRoZSBzZWxlbml1bSBncmlkXG4gIGlmICghZGF0YSkge1xuICAgIGxvZ2dlci5lcnJvcignTm8gZGF0YSBmb3VuZCBpbiB0aGUgbm9kZSBjb25maWd1cmF0aW9uIGZpbGUgdG8gc2VuZCB0byB0aGUgZ3JpZCcpO1xuICAgIHJldHVybjtcbiAgfVxuICBhd2FpdCBwb3N0UmVxdWVzdChkYXRhLCBhZGRyLCBwb3J0KTtcbn1cblxuYXN5bmMgZnVuY3Rpb24gcmVnaXN0ZXJUb0dyaWQgKG9wdGlvbnNfcG9zdCwganNvbk9iamVjdCkge1xuICB0cnkge1xuICAgIGxldCByZXNwb25zZSA9IGF3YWl0IHJlcXVlc3Qob3B0aW9uc19wb3N0KTtcbiAgICBpZiAocmVzcG9uc2UgPT09IHVuZGVmaW5lZCB8fCByZXNwb25zZS5zdGF0dXNDb2RlICE9PSAyMDApIHtcbiAgICAgIHRocm93IG5ldyBFcnJvcignUmVxdWVzdCBmYWlsZWQnKTtcbiAgICB9XG4gICAgbGV0IGxvZ01lc3NhZ2UgPSBgQXBwaXVtIHN1Y2Nlc3NmdWxseSByZWdpc3RlcmVkIHdpdGggdGhlIGdyaWQgb24gJHtqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24uaHViSG9zdH06JHtqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24uaHViUG9ydH1gO1xuICAgIGxvZ2dlci5kZWJ1Zyhsb2dNZXNzYWdlKTtcbiAgfSBjYXRjaCAoZXJyKSB7XG4gICAgbG9nZ2VyLmVycm9yKGBSZXF1ZXN0IHRvIHJlZ2lzdGVyIHdpdGggZ3JpZCB3YXMgdW5zdWNjZXNzZnVsOiAke2Vyci5tZXNzYWdlfWApO1xuICB9XG59XG5cbmFzeW5jIGZ1bmN0aW9uIHBvc3RSZXF1ZXN0IChkYXRhLCBhZGRyLCBwb3J0KSB7XG4gIC8vIHBhcnNlIGpzb24gdG8gZ2V0IGh1YiBob3N0IGFuZCBwb3J0XG4gIGxldCBqc29uT2JqZWN0O1xuICB0cnkge1xuICAgIGpzb25PYmplY3QgPSBKU09OLnBhcnNlKGRhdGEpO1xuICB9IGNhdGNoIChlcnIpIHtcbiAgICBsb2dnZXIuZXJyb3JBbmRUaHJvdyhgU3ludGF4IGVycm9yIGluIG5vZGUgY29uZmlndXJhdGlvbiBmaWxlOiAke2Vyci5tZXNzYWdlfWApO1xuICB9XG5cbiAgLy8gTW92ZSBTZWxlbml1bSAzIGNvbmZpZ3VyYXRpb24gcHJvcGVydGllcyB0byBjb25maWd1cmF0aW9uIG9iamVjdFxuICBpZiAoIWpzb25PYmplY3QuaGFzT3duUHJvcGVydHkoJ2NvbmZpZ3VyYXRpb24nKSkge1xuICAgIGxldCBjb25maWd1cmF0aW9uID0ge307XG4gICAgZm9yICh2YXIgcHJvcGVydHkgaW4ganNvbk9iamVjdCkge1xuICAgICAgaWYgKGpzb25PYmplY3QuaGFzT3duUHJvcGVydHkocHJvcGVydHkpICYmIHByb3BlcnR5ICE9PSAnY2FwYWJpbGl0aWVzJykge1xuICAgICAgICBjb25maWd1cmF0aW9uW3Byb3BlcnR5XSA9IGpzb25PYmplY3RbcHJvcGVydHldO1xuICAgICAgICBkZWxldGUganNvbk9iamVjdFtwcm9wZXJ0eV07XG4gICAgICB9XG4gICAgfVxuICAgIGpzb25PYmplY3QuY29uZmlndXJhdGlvbiA9IGNvbmZpZ3VyYXRpb247XG4gIH1cblxuICAvLyBpZiB0aGUgbm9kZSBjb25maWcgZG9lcyBub3QgaGF2ZSB0aGUgYXBwaXVtL3dlYmRyaXZlciB1cmwsIGhvc3QsIGFuZCBwb3J0LFxuICAvLyBhdXRvbWF0aWNhbGx5IGFkZCBpdCBiYXNlZCBvbiBob3cgYXBwaXVtIHdhcyBpbml0aWFsaXplZFxuICAvLyBvdGhlcndpc2UsIHdlIHdpbGwgdGFrZSB3aGF0ZXZlciB0aGUgdXNlciBzZXR1cFxuICAvLyBiZWNhdXNlIHdlIHdpbGwgYWx3YXlzIHNldCBsb2NhbGhvc3QvMTI3LjAuMC4xLiB0aGlzIHdvbid0IHdvcmsgaWYgeW91clxuICAvLyBub2RlIGFuZCBncmlkIGFyZW4ndCBpbiB0aGUgc2FtZSBwbGFjZVxuICBpZiAoIWpzb25PYmplY3QuY29uZmlndXJhdGlvbi51cmwgfHwgIWpzb25PYmplY3QuY29uZmlndXJhdGlvbi5ob3N0IHx8ICFqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24ucG9ydCkge1xuICAgIGpzb25PYmplY3QuY29uZmlndXJhdGlvbi51cmwgPSBgaHR0cDovLyR7YWRkcn06JHtwb3J0fS93ZC9odWJgO1xuICAgIGpzb25PYmplY3QuY29uZmlndXJhdGlvbi5ob3N0ID0gYWRkcjtcbiAgICBqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24ucG9ydCA9IHBvcnQ7XG4gIH1cbiAgLy8gaWYgdGhlIG5vZGUgY29uZmlnIGRvZXMgbm90IGhhdmUgaWQgYXV0b21hdGljYWxseSBhZGQgaXRcbiAgaWYgKCFqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24uaWQpIHtcbiAgICBqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24uaWQgPSBgaHR0cDovLyR7anNvbk9iamVjdC5jb25maWd1cmF0aW9uLmhvc3R9OiR7anNvbk9iamVjdC5jb25maWd1cmF0aW9uLnBvcnR9YDtcbiAgfVxuXG4gIC8vIHJlLXNlcmlhbGl6ZSB0aGUgY29uZmlndXJhdGlvbiB3aXRoIHRoZSBhdXRvIHBvcHVsYXRlZCBkYXRhXG4gIGRhdGEgPSBKU09OLnN0cmluZ2lmeShqc29uT2JqZWN0KTtcblxuICAvLyBwcmVwYXJlIHRoZSBoZWFkZXJcbiAgbGV0IHBvc3RfaGVhZGVycyA9IHtcbiAgICAnQ29udGVudC1UeXBlJzogJ2FwcGxpY2F0aW9uL2pzb24nLFxuICAgICdDb250ZW50LUxlbmd0aCc6IGRhdGEubGVuZ3RoXG4gIH07XG4gIC8vIHRoZSBwb3N0IG9wdGlvbnNcbiAgbGV0IHBvc3Rfb3B0aW9ucyA9IHtcbiAgICB1cmw6IGBodHRwOi8vJHtqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24uaHViSG9zdH06JHtqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24uaHViUG9ydH0vZ3JpZC9yZWdpc3RlcmAsXG4gICAgbWV0aG9kOiAnUE9TVCcsXG4gICAgYm9keTogZGF0YSxcbiAgICBoZWFkZXJzOiBwb3N0X2hlYWRlcnMsXG4gICAgcmVzb2x2ZVdpdGhGdWxsUmVzcG9uc2U6IHRydWUgLy8gcmV0dXJuIHRoZSBmdWxsIHJlc3BvbnNlLCBub3QganVzdCB0aGUgYm9keVxuICB9O1xuXG4gIGlmIChqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24ucmVnaXN0ZXIgIT09IHRydWUpIHtcbiAgICBsb2dnZXIuZGVidWcoYE5vIHJlZ2lzdHJhdGlvbiBzZW50ICgke2pzb25PYmplY3QuY29uZmlndXJhdGlvbi5yZWdpc3Rlcn0gPSBmYWxzZSlgKTtcbiAgICByZXR1cm47XG4gIH1cblxuICBsZXQgcmVnaXN0ZXJDeWNsZVRpbWUgPSBqc29uT2JqZWN0LmNvbmZpZ3VyYXRpb24ucmVnaXN0ZXJDeWNsZTtcbiAgaWYgKHJlZ2lzdGVyQ3ljbGVUaW1lICE9PSBudWxsICYmIHJlZ2lzdGVyQ3ljbGVUaW1lID4gMCkge1xuICAgIC8vIGluaXRpYXRlIGEgbmV3IFRocmVhZFxuICAgIGxldCBmaXJzdCA9IHRydWU7XG4gICAgbG9nZ2VyLmRlYnVnKGBTdGFydGluZyBhdXRvIHJlZ2lzdGVyIHRocmVhZCBmb3IgZ3JpZC4gV2lsbCB0cnkgdG8gcmVnaXN0ZXIgZXZlcnkgJHtyZWdpc3RlckN5Y2xlVGltZX0gbXMuYCk7XG4gICAgc2V0SW50ZXJ2YWwoYXN5bmMgZnVuY3Rpb24gKCkge1xuICAgICAgaWYgKGZpcnN0ICE9PSB0cnVlKSB7XG4gICAgICAgIGxldCBpc1JlZ2lzdGVyZWQgPSBhd2FpdCBpc0FscmVhZHlSZWdpc3RlcmVkKGpzb25PYmplY3QpO1xuICAgICAgICBpZiAoaXNSZWdpc3RlcmVkICE9PSBudWxsICYmIGlzUmVnaXN0ZXJlZCAhPT0gdHJ1ZSkge1xuICAgICAgICAgIC8vIG1ha2UgdGhlIGh0dHAgUE9TVCB0byB0aGUgZ3JpZCBmb3IgcmVnaXN0cmF0aW9uXG4gICAgICAgICAgYXdhaXQgcmVnaXN0ZXJUb0dyaWQocG9zdF9vcHRpb25zLCBqc29uT2JqZWN0KTtcbiAgICAgICAgfVxuICAgICAgfSBlbHNlIHtcbiAgICAgICAgZmlyc3QgPSBmYWxzZTtcbiAgICAgICAgYXdhaXQgcmVnaXN0ZXJUb0dyaWQocG9zdF9vcHRpb25zLCBqc29uT2JqZWN0KTtcbiAgICAgIH1cbiAgICB9LCByZWdpc3RlckN5Y2xlVGltZSk7XG4gIH1cbn1cblxuYXN5bmMgZnVuY3Rpb24gaXNBbHJlYWR5UmVnaXN0ZXJlZCAoanNvbk9iamVjdCkge1xuICAvL2NoZWNrIGlmIG5vZGUgaXMgYWxyZWFkeSByZWdpc3RlcmVkXG4gIGxldCBpZCA9IGpzb25PYmplY3QuY29uZmlndXJhdGlvbi5pZDtcbiAgdHJ5IHtcbiAgICBsZXQgcmVzcG9uc2UgPSBhd2FpdCByZXF1ZXN0KHtcbiAgICAgIHVyaTogYGh0dHA6Ly8ke2pzb25PYmplY3QuY29uZmlndXJhdGlvbi5odWJIb3N0fToke2pzb25PYmplY3QuY29uZmlndXJhdGlvbi5odWJQb3J0fS9ncmlkL2FwaS9wcm94eT9pZD0ke2lkfWAsXG4gICAgICBtZXRob2QgIDogJ0dFVCcsXG4gICAgICB0aW1lb3V0IDogMTAwMDAsXG4gICAgICByZXNvbHZlV2l0aEZ1bGxSZXNwb25zZTogdHJ1ZSAvLyByZXR1cm4gdGhlIGZ1bGwgcmVzcG9uc2UsIG5vdCBqdXN0IHRoZSBib2R5XG4gICAgfSk7XG4gICAgaWYgKHJlc3BvbnNlID09PSB1bmRlZmluZWQgfHwgcmVzcG9uc2Uuc3RhdHVzQ29kZSAhPT0gMjAwKSB7XG4gICAgICB0aHJvdyBuZXcgRXJyb3IoYFJlcXVlc3QgZmFpbGVkYCk7XG4gICAgfVxuICAgIGxldCByZXNwb25zZURhdGEgPSBKU09OLnBhcnNlKHJlc3BvbnNlLmJvZHkpO1xuICAgIGlmIChyZXNwb25zZURhdGEuc3VjY2VzcyAhPT0gdHJ1ZSkge1xuICAgICAgLy8gaWYgcmVnaXN0ZXIgZmFpbCwgcHJpbnQgdGhlIGRlYnVnIG1zZ1xuICAgICAgbG9nZ2VyLmRlYnVnKGBHcmlkIHJlZ2lzdHJhdGlvbiBlcnJvcjogJHtyZXNwb25zZURhdGEubXNnfWApO1xuICAgIH1cbiAgICByZXR1cm4gcmVzcG9uc2VEYXRhLnN1Y2Nlc3M7XG4gIH0gY2F0Y2ggKGVycikge1xuICAgIGxvZ2dlci5kZWJ1ZyhgSHViIGRvd24gb3Igbm90IHJlc3BvbmRpbmc6ICR7ZXJyLm1lc3NhZ2V9YCk7XG4gIH1cbn1cblxuXG5leHBvcnQgZGVmYXVsdCByZWdpc3Rlck5vZGU7XG4iXSwic291cmNlUm9vdCI6Ii4uLy4uIn0=
