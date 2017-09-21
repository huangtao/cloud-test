var adbkit = require('adbkit')
var Promise = require('bluebird')
//var adb = adbkit.createClient()
var promiseutil = require('../lib/util/promiseutil')
var fs = require('fs')
var serial='CoolpadY803-9-0x20b9040f'
var pngpath='/mnt/sdcard/Robotium-Screenshots/'
var cmdmonitor='am monitor '
var stream = require('stream')
var amMonitor=null

var adb = adbkit.createClient({
  //  host: options.host
    host: '127.0.0.1'
    , port: '5037'
  })
var fns=[]
adb.readdir(serial,pngpath)
.then(function(files){
	files.forEach(function(file){
	return  new Promise(function(resolve, reject) {
	if (file.isFile()) {
	 path=pngpath+file.name
	adb.pull(serial,pngpath+file.name)
	.then(function(transfer){
          return new Promise(function(resolve, reject) {
            var fn = '/tmp/123/'+file.name
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
	})
        }
	fns=files
	resolve()
	})
})
})
.then(function(){
console.log(fns)
})





/*adb.shell(serial,'ls')
.then(adbkit.util.readAll)
 .then(function(output) {
  console.log(output.toString().trim())
})*/



/*exec('ls', function (err, stdout, stderr) {
  console.log(stdout.split('\n'))
})*/

/*adb.pull(serial,pngpath)
.then(function(transfer){
          return new Promise(function(resolve, reject) {
            var fn = '/tmp/123'
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
