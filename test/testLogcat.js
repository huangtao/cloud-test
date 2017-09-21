var adbkit = require('adbkit')
var adb = adbkit.createClient()
// var serial = '5671f02d'
// var serial = 'D8YDU16115003258'
// var serial = 'd353c4bb'
// var serial= 'F3D7N15B04010834'
var serial = 'GWY0216B26001020'
var logcatclient = null

adb.openLogcat(serial,{clear:true})
.then(function (logcat) {
    logcatclient = logcat
    function entryListener(entry){
        console.log(entry)
    }
    logcat.on('entry', entryListener)
    logcat.on('error',function (err) {
        console.log('entry error')
        console.log(err)

    })
    logcat.on('exit', function () {
        console.log('exit')
    })
    logcat.on('finish', function () {
        console.log('finish')
    })
    // logcat.end()
    return
})
