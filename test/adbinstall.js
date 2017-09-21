var adbkit = require('adbkit')
var adb = adbkit.createClient({host:'172.20.101.130'})
//var path = '/var/stf/file/apk/'
var serial = '21feb4fb'

adb.shell(serial, 'ls')
  .then(adbkit.util.readAll)
  .then(function(output){
     console.log(output.toString())
  })

