var adbkit = require('adbkit')
var Promise = require('bluebird')
var adb = adbkit.createClient({host:'172.20.101.12', port:5037})
adb.Keycode = adbkit.Keycode
var serial = 'HKR4C16107026057'

adb.listDevices()
.then(function(devices){
devices.forEach(function(device){console.log(device.id)})
})

/*adb.shell(serial, 'pm list package')
.then(adbkit.util.readAll)
.then(function(output){
var platformNeedPkgs = ['com.boyaa.stf.pt', 'com.boyaa.checkjar', 'com.boyaa.checkjar.test', 'com.boyaa.application.testbundle']
var str = output.toString().trim()
var strs = str.split(/[\r\n]/)
for(var i = 0; i<strs.length; i++){
if (/com.boyaa/i.test(strs[i])){
var pkg = strs[i].split(':')[1]
console.log(pkg)
console.log(platformNeedPkgs.indexOf(pkg))
}
}
})*/

/*var launchActivity = {
                action: 'android.intent.action.MAIN'
              , component: "com.boyaa.engineddz.main/com.boyaa.engineddz.Game"
              , category: ['android.intent.category.LAUNCHER']
              , flags: 0x10200000
              }
*/
/*adb.install(serial, '/var/tmp/ddztest.apk')
.then(function(){

return new Promise(function(resolve,reject){
setTimeout(function(){resolve('')},20000)
})
})
.then(function(){
var launchActivity = {
                action: 'android.intent.action.MAIN'
              , component: "com.boyaa.engineddz.main/com.boyaa.engineddz.Game"
              , category: ['android.intent.category.LAUNCHER']
              , flags: 0x10200000
              }
console.log(launchActivity)
return adb.startActivity(serial, launchActivity)
})
.catch(function(err){
console.log(err.stack)
})
*/
//adb.startActivity(serial, launchActivity)



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


