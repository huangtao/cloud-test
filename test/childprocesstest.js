var spawn = require('child_process').spawn
var serial = 'F3D7N15B04010834'

var logcat = spawn('adb', ['-s',serial,'logcat', '-v', 'time'])

logcat.stdout.on('data', function(data){console.log(data.toString())})
