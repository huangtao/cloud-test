var fs = require('fs')


var info = fs.statSync('test.apk')
console.log(info)
