var DOMParser = require('xmldom').DOMParser
var fs = require('fs')
var path  = require('path')
var r = require('rethinkdb')
var util = require('util')

module.exports = function (reportpath) {

  var testReportPath = path.join(reportpath, 'TestReport.xml')
  // 不存在的话
  if (!fs.existsSync(testReportPath)) {
      return {
        error: testReportPath + ' not exists'
      }
  }

  var reportdoc = new DOMParser().parseFromString(fs.readFileSync(testReportPath, {encoding: 'utf8'}))


    var cases = []
    var testresults = reportdoc.getElementsByTagName('TestResult')
    for (var i = 0; i < testresults.length; i++) {
        var tr = testresults[i]
        var name = tr.getAttribute('name')
        if (fs.existsSync(path.join(reportpath, name + '.xml'))) {
            var testcasedoc = new DOMParser().parseFromString(fs.readFileSync(path.join(reportpath, name + '.xml'), {encoding: 'utf8'}))
            var test = testcasedoc.getElementsByTagName('TEST')[0]

            var o = {
                starttime: test.getAttribute('begintime'),
                endtime: test.getAttribute('endtime'),
                name: test.getAttribute('name'),
                result: test.getAttribute('result')
            }
            var steps = testcasedoc.getElementsByTagName('STEP')
            var error = getError(steps)
            o.error = error
/*            for (var j = 0; j < steps.length; j++) {
                var s = steps[j]
                var result = s.getAttribute('result')
                if (result == 'False') {
                    o.error = s.toString()
                    break
                }
            }*/
            cases.push(o)
        }
    }
    return {
        cases: cases,
        starttime: r.ISO8601(new Date(reportdoc.getElementsByTagName('StartTime')[0].textContent).toISOString()).inTimezone('+08:00'),
        endtime: r.ISO8601(new Date(reportdoc.getElementsByTagName('EndTime')[0].textContent).toISOString()).inTimezone('+08:00')

    }
}

function getError(steps) {
    var error = '<div>'
    for (var i = 0; i < steps.length; i++) {
        var s = steps[i]
        var result = s.getAttribute('result')
        var time = s.getAttribute('time')
        var title =  s.getAttribute('title')

        var css = (result == 'True' ? 'success' : 'error')
        var t = util.format('<p class=\"%s\">步骤: %s  %s  %s</p>', css, title, time, result == 'True' ? '通过' : '失败')
        error = error + t
        if(result == 'False') {
            // 要从1开始
            for(var j = 0; j < s.childNodes.length; j++) {
                // 这是一个 error 标签
                if(s.childNodes[j].tagName == 'ERROR') {
                    var errorChildNodes = s.childNodes[j].childNodes
                    var error_titile = errorChildNodes[0].data
                    var error_content = errorChildNodes[1] ? errorChildNodes[1].textContent : ''
                    var n = util.format('<div class=\"errormsg\"><p class=\"title\">%s</p><p class=\"error_content\">%s</p></div>', error_titile, error_content)
                    error = error + n
                    //console.log(n)
                }
            }
        }
    }
    error = error + '</div>'
    return error
}
/*
var reportpath = 'C:\\Users\\LukeJiang\\Desktop\\tt\\difangdating(2)\\difangdating\\src\\cases\\report'
var reportdoc = new DOMParser().parseFromString(fs.readFileSync(path.join(reportpath, 'HallSetting.xml'), {encoding: 'utf8'}))

var error = ''
var steps = reportdoc.getElementsByTagName('STEP')
for (var i = 0; i < steps.length; i++) {
    var s = steps[i]
    var result = s.getAttribute('result')
    var time = s.getAttribute('time')
    var title =  s.getAttribute('title')

    var css = (result == 'True' ? 'success' : 'error')
    var t = util.format('<p class=\"%s\">步骤: %s  %s  %s</p>', css, title, time, result == 'True' ? '通过' : '失败')
    error = error + t + '<br />'
    if(result == 'False') {
        // 要从1开始
        for(var j = 0; j < s.childNodes.length; j++) {
            // 这是一个 error 标签
            if(s.childNodes[j].tagName == 'ERROR') {
                var errorChildNodes = s.childNodes[j].childNodes
                var error_titile = errorChildNodes[0].data
                var error_content = errorChildNodes[1].textContent
                var n = util.format('<p class=\"errormsg\"><p>%s</p><br />%s</p>', error_titile, error_content)
                error = error + n + '<br />'
                //console.log(n)
            }
        }
    }
}
console.log(error)*/

