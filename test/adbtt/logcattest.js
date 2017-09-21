/**
 * Created by YorickYe on 2017/3/28.
 */

var adbkit= require('adbkit')
var adb=adbkit.createClient()

var serial = 'F3D7N15B04010834'
adb.openLogcat(serial).then(function (log) {
    log.on('entry',function (output) {
        console.log(output)
    })
})


// var logcat = require('adbkit-logcat');
// var spawn = require('child_process').spawn;
//
// // Retrieve a binary log stream
// var proc = spawn('adb', ['logcat', '-B']);
//
// // Connect logcat to the stream
// reader = logcat.readStream(proc.stdout);
// reader.on('entry', function(entry) {
//     console.log(entry.message);
// });
//
// // Make sure we don't leave anything hanging
// process.on('exit', function() {
//     proc.kill();
// });

//monkey -p  com.boyaa.enginedlqp.main --throttle 100 -v -v 12000
//boyaa!@#456

//ok : KN7TRCQWQ4KNKJPB  HC496MY00456  022AUM213A011856

