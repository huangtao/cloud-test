var adbkit = require('adbkit')
var Promise = require('bluebird')
var option ={host:'172.20.104.10'}
var adb = adbkit.createClient({host:option.host, port:5037})
adb.Keycode = adbkit.Keycode
adb.listDevices()
    .then(function(devices){
        console.log(devices)
     })
adb.shell('ZTEBV0730', 'ps')
.then(adbkit.util.readAll)
.then(function(output){
console.log(output.toString())})
//var serial = 'IN89MNGI99999999'


/*var launchActivity = {
                action: 'android.intent.action.MAIN'
              , component: "com.boyaa.engineddz.main/com.boyaa.engineddz.Game"
              , category: ['android.intent.category.LAUNCHER']
              , flags: 0x10200000
              }

adb.startActivity(serial, launchActivity)
*/


/*    adb.openLogcat(serial,{
      clear: true
    })
      .then(function (logcat) {
        function entryListener(entry){
          console.log(entry)
        }
        logcat.on('entry', entryListener)
        logcat.on('error',function (err) {
          log.error('entry error')
          log.error(err)

        })
      })

setInterval(function(){}, 10)*/


