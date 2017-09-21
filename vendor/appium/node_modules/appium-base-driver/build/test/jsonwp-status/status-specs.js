require('source-map-support').install();

/* global describe:true, it:true */

'use strict';

var _getIterator = require('babel-runtime/core-js/get-iterator')['default'];

var _interopRequireDefault = require('babel-runtime/helpers/interop-require-default')['default'];

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

var _2 = require('../..');

var _chai = require('chai');

var _chai2 = _interopRequireDefault(_chai);

var should = _chai2['default'].should();

describe('jsonwp-status', function () {
  describe('codes', function () {
    it('should export code numbers and summaries', function () {
      var _iteratorNormalCompletion = true;
      var _didIteratorError = false;
      var _iteratorError = undefined;

      try {
        for (var _iterator = _getIterator(_lodash2['default'].values(_2.statusCodes)), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
          var obj = _step.value;

          should.exist(obj.code);
          obj.code.should.be.a('number');
          should.exist(obj.summary);
          obj.summary.should.be.a('string');
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
    });
  });
  describe('getSummaryByCode', function () {
    it('should get the summary for a code', function () {
      (0, _2.getSummaryByCode)(0).should.equal('The command executed successfully.');
    });
    it('should convert codes to ints', function () {
      (0, _2.getSummaryByCode)('0').should.equal('The command executed successfully.');
    });
    it('should return an error string for unknown code', function () {
      (0, _2.getSummaryByCode)(1000).should.equal('An error occurred');
    });
  });
});
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInRlc3QvanNvbndwLXN0YXR1cy9zdGF0dXMtc3BlY3MuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7O3NCQUdjLFFBQVE7Ozs7aUJBQ3dCLE9BQU87O29CQUNwQyxNQUFNOzs7O0FBR3ZCLElBQU0sTUFBTSxHQUFHLGtCQUFLLE1BQU0sRUFBRSxDQUFDOztBQUU3QixRQUFRLENBQUMsZUFBZSxFQUFFLFlBQU07QUFDOUIsVUFBUSxDQUFDLE9BQU8sRUFBRSxZQUFNO0FBQ3RCLE1BQUUsQ0FBQywwQ0FBMEMsRUFBRSxZQUFNOzs7Ozs7QUFDbkQsMENBQWdCLG9CQUFFLE1BQU0sZ0JBQWEsNEdBQUU7Y0FBOUIsR0FBRzs7QUFDVixnQkFBTSxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsSUFBSSxDQUFDLENBQUM7QUFDdkIsYUFBRyxDQUFDLElBQUksQ0FBQyxNQUFNLENBQUMsRUFBRSxDQUFDLENBQUMsQ0FBQyxRQUFRLENBQUMsQ0FBQztBQUMvQixnQkFBTSxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsT0FBTyxDQUFDLENBQUM7QUFDMUIsYUFBRyxDQUFDLE9BQU8sQ0FBQyxNQUFNLENBQUMsRUFBRSxDQUFDLENBQUMsQ0FBQyxRQUFRLENBQUMsQ0FBQztTQUNuQzs7Ozs7Ozs7Ozs7Ozs7O0tBQ0YsQ0FBQyxDQUFDO0dBQ0osQ0FBQyxDQUFDO0FBQ0gsVUFBUSxDQUFDLGtCQUFrQixFQUFFLFlBQU07QUFDakMsTUFBRSxDQUFDLG1DQUFtQyxFQUFFLFlBQU07QUFDNUMsK0JBQWlCLENBQUMsQ0FBQyxDQUFDLE1BQU0sQ0FBQyxLQUFLLENBQUMsb0NBQW9DLENBQUMsQ0FBQztLQUN4RSxDQUFDLENBQUM7QUFDSCxNQUFFLENBQUMsOEJBQThCLEVBQUUsWUFBTTtBQUN2QywrQkFBaUIsR0FBRyxDQUFDLENBQUMsTUFBTSxDQUFDLEtBQUssQ0FBQyxvQ0FBb0MsQ0FBQyxDQUFDO0tBQzFFLENBQUMsQ0FBQztBQUNILE1BQUUsQ0FBQyxnREFBZ0QsRUFBRSxZQUFNO0FBQ3pELCtCQUFpQixJQUFJLENBQUMsQ0FBQyxNQUFNLENBQUMsS0FBSyxDQUFDLG1CQUFtQixDQUFDLENBQUM7S0FDMUQsQ0FBQyxDQUFDO0dBQ0osQ0FBQyxDQUFDO0NBQ0osQ0FBQyxDQUFDIiwiZmlsZSI6InRlc3QvanNvbndwLXN0YXR1cy9zdGF0dXMtc3BlY3MuanMiLCJzb3VyY2VzQ29udGVudCI6WyIvLyB0cmFuc3BpbGU6bW9jaGFcbi8qIGdsb2JhbCBkZXNjcmliZTp0cnVlLCBpdDp0cnVlICovXG5cbmltcG9ydCBfIGZyb20gJ2xvZGFzaCc7XG5pbXBvcnQgeyBzdGF0dXNDb2RlcywgZ2V0U3VtbWFyeUJ5Q29kZSB9IGZyb20gJy4uLy4uJztcbmltcG9ydCBjaGFpIGZyb20gJ2NoYWknO1xuXG5cbmNvbnN0IHNob3VsZCA9IGNoYWkuc2hvdWxkKCk7XG5cbmRlc2NyaWJlKCdqc29ud3Atc3RhdHVzJywgKCkgPT4ge1xuICBkZXNjcmliZSgnY29kZXMnLCAoKSA9PiB7XG4gICAgaXQoJ3Nob3VsZCBleHBvcnQgY29kZSBudW1iZXJzIGFuZCBzdW1tYXJpZXMnLCAoKSA9PiB7XG4gICAgICBmb3IgKGxldCBvYmogb2YgXy52YWx1ZXMoc3RhdHVzQ29kZXMpKSB7XG4gICAgICAgIHNob3VsZC5leGlzdChvYmouY29kZSk7XG4gICAgICAgIG9iai5jb2RlLnNob3VsZC5iZS5hKCdudW1iZXInKTtcbiAgICAgICAgc2hvdWxkLmV4aXN0KG9iai5zdW1tYXJ5KTtcbiAgICAgICAgb2JqLnN1bW1hcnkuc2hvdWxkLmJlLmEoJ3N0cmluZycpO1xuICAgICAgfVxuICAgIH0pO1xuICB9KTtcbiAgZGVzY3JpYmUoJ2dldFN1bW1hcnlCeUNvZGUnLCAoKSA9PiB7XG4gICAgaXQoJ3Nob3VsZCBnZXQgdGhlIHN1bW1hcnkgZm9yIGEgY29kZScsICgpID0+IHtcbiAgICAgIGdldFN1bW1hcnlCeUNvZGUoMCkuc2hvdWxkLmVxdWFsKCdUaGUgY29tbWFuZCBleGVjdXRlZCBzdWNjZXNzZnVsbHkuJyk7XG4gICAgfSk7XG4gICAgaXQoJ3Nob3VsZCBjb252ZXJ0IGNvZGVzIHRvIGludHMnLCAoKSA9PiB7XG4gICAgICBnZXRTdW1tYXJ5QnlDb2RlKCcwJykuc2hvdWxkLmVxdWFsKCdUaGUgY29tbWFuZCBleGVjdXRlZCBzdWNjZXNzZnVsbHkuJyk7XG4gICAgfSk7XG4gICAgaXQoJ3Nob3VsZCByZXR1cm4gYW4gZXJyb3Igc3RyaW5nIGZvciB1bmtub3duIGNvZGUnLCAoKSA9PiB7XG4gICAgICBnZXRTdW1tYXJ5QnlDb2RlKDEwMDApLnNob3VsZC5lcXVhbCgnQW4gZXJyb3Igb2NjdXJyZWQnKTtcbiAgICB9KTtcbiAgfSk7XG59KTtcbiJdLCJzb3VyY2VSb290IjoiLi4vLi4vLi4ifQ==
