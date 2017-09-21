var adbkit = require('adbkit')
var Promise = require('bluebird')
//var adb = adbkit.createClient()
var promiseutil = require('../lib/util/promiseutil')
var fs = require('fs')
var serial='M95QACPCFQSAH'
var serialll='024a137a308691d4'
var pngpath='/data/local/tmp/cloudTestScreen.png'
var cmdmonitor='am monitor '
var stream = require('stream')
var amMonitor=null

var adb = adbkit.createClient({
  //  host: options.host
    host: '172.20.104.10'
    , port: '5037'
  })
adb.shell(serial,'echo 1')
.then(adbkit.util.readAll)
 .then(function(output) {
  console.log(output.toString().trim())
})

var adb2 = adbkit.createClient({
  //  host: options.host
    host: '127.0.0.1'
    , port: '5037'
  })
adb2.shell(serialll,'echo 2')
.then(adbkit.util.readAll)
 .then(function(output) {
  console.log(output.toString().trim())
})



/*exec('ls', function (err, stdout, stderr) {
  console.log(stdout.split('\n'))
})*/




/*adb.pull(serial,pngpath)
.then(function(transfer){
          return new Promise(function(resolve, reject) {
            var fn = '/tmp/1.png'
            transfer.on('progress', function(stats) {
              console.log('Pulled %d bytes so far',
                stats.bytesTransferred)
            })
            transfer.on('end', function() {
              console.log('Pull complete')
              resolve()
            })
            transfer.on('error', reject)
            transfer.pipe(fs.createWriteStream(fn))
          })
})*/



/*adb.listDevices()
  .then(function(devices) {
    return Promise.map(devices, function(device) {
      return client.pull(device.id, '/system/build.prop')
        .then(function(transfer) {
          return new Promise(function(resolve, reject) {
            var fn = '/tmp/' + device.id + '.build.prop'
            transfer.on('progress', function(stats) {
              console.log('[%s] Pulled %d bytes so far',
                device.id,
                stats.bytesTransferred)
            })
            transfer.on('end', function() {
              console.log('[%s] Pull complete', device.id)
              resolve(device.id)
            })
            transfer.on('error', reject)
            transfer.pipe(fs.createWriteStream(fn))
          })
        })
    })
  })
  .then(function() {
    console.log('Done pulling /system/build.prop from all connected devices')
  })
  .catch(function(err) {
    console.error('Something went wrong:', err.stack)
  })
*/
