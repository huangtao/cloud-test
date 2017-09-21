var fs = require('fs')
var util = require('util')
var date = new Date().getTime()
setInterval(function () {
  var info = process.memoryUsage()
  var info = JSON.stringify(info)
  fs.appendFileSync('kk_' + date, info + '\n')
}, 2000)
