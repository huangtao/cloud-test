var adbkit = require('adbkit')
var Promise = require('bluebird')
var adb = adbkit.createClient()
var promiseutil = require('../lib/util/promiseutil')
//var serial = 'IN89MNGI99999999'
//var serial = '0216026890651005'
//var serial = '2113ca22'
//var serial = '14255e08'
//var serial = 'HC496MY00456'
//var serial = 'N7BAO7TC7DB6WWHM'
//var serial = 'ca8a7642'
var serial = 'F3D7N15B04010834'
//var serial = 'F4AZFG02A261'

var apkPath = '/var/stf/file/apk/upload_948a4bf11f79166c25c15bc9925b6b76'
var startPerformanceServiceCMD = 'am start --user 0 -n com.boyaa.stf.pt/.MainActivity --es "packageName" "com.boyaa.catur" --es "filePath" "/mnt/sdcard/guitest.csv" --ei "delayTime" 2000'
var cmd = 'am start -W com.boyaa.catur/com.boyaa.catur.GameActivity'

beforinstall()
    .then(function () {
        return promiseutil.periodicNotify(adb.install(serial, apkPath)
          .then(function(output){console.log(Date.now())}), 250)
    })
    .then(function () {
        return new Promise(function (resolve, reject) {
            setTimeout(function () {
//                console.log('install finish stop uiautomator', Date.now())
//                adb.shell(serial, 'ps')
//                    .then(adbkit.util.readAll)
//                    .then(function (output) {
//                        var str = output.toString().trim().match(/shell.*uiautomator/)
//                        if(str){
//                            var uiautomatorPid = str[0].split(/\s+/)[1]
//                            adb.shell(serial, 'kill ' + uiautomatorPid)
//                        }

//                    })
                resolve('')
            }, 1000*10)
        })
    })
    .then(function () {
      return adb.shell(serial, cmd)
            .then(adbkit.util.readAll)
            .timeout(30000)
    })
    .then(function(output){
                console.log(output.toString())
                return new Promise(function (resolve, reject) {
                   console.log('wait performance')
                   setTimeout(function () {
                     adb.shell(serial, startPerformanceServiceCMD)
                     console.log('start performance')
                     resolve('')
                   }, 1000*7)
                })

            })

    .then(function(){
       return new Promise(function (resolve, reject) {
            console.log('wait')
            setTimeout(function () {
               console.log('timeout')
               resolve('')
            }, 1000*5)
        })

    })
    .then(function () {
        var command = 'monkey -p com.boyaa.catur --pct-touch 45 --pct-motion 25 --pct-syskeys 1 --pct-anyevent 2 --pct-nav 0 --pct-majornav 0 --throttle 50 -v -v 1000'
        console.log('monkey')
        return adb.shell(serial,command)
    })
    .then(function(){
       adb.shell(serial, 'ps')
      .then(adbkit.util.readAll)
      .then(function (output) {
        var str = output.toString().trim().match(/shell.*uiautomator/)
        if(str){
          var uiautomatorPid = str[0].split(/\s+/)[1]
          adb.shell(serial, 'kill ' + uiautomatorPid)
          .then(adbkit.util.readAll)
          .then(function(output){console.log(output.toString())})
        }

      })
    })
    
function beforinstall() {
    return new Promise(function (resolve, reject) {
        var startuiautomatorCmd = 'uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall'
        adb .shell(serial, startuiautomatorCmd)
        var wakeUpCMD = 'am start -n com.example.unlock/.Unlock'
        console.log('wake up the phone start')
        adb.shell(serial,wakeUpCMD)
        resolve('')
    })
}

/*var adbkit = require('adbkit')
var Promise = require('bluebird')
var adb = adbkit.createClient()
//var serial = 'IN89MNGI99999999'
//var serial = '0216026890651005'
//var serial = '2113ca22'
//var serial = '14255e08'
//var serial = 'HC496MY00456'
var serial = 'N7BAO7TC7DB6WWHM'

var startPerformanceServiceCMD = 'am start --user 0 -n com.boyaa.stf.pt/.MainActivity --es "packageName" "com.boyaa.lordland.sina" --es "filePath" "/mnt/sdcard/guitest.csv" --ei "delayTime" 2000'
var cmd = 'am start -W com.boyaa.lordland.sina/.LoginAcitivity'

adb.shell(serial, cmd)
.then(adbkit.util.readAll)
.then(function(output){
  adb.shell(serial, startPerformanceServiceCMD)
  console.log('++++++++++++++++++++++++++++++++')
  console.log(output.toString())
})*/

/*function pushUiautomator(){
    var uiautomatorPath = '/var/stf/vendor/installuiautomator/autoinstall.jar'
    var phoneTmp = '/data/local/tmp/autoinstall.jar'
    return adb .push(serial, uiautomatorPath, phoneTmp)
      .then(function (transfer){
        var resolver = Promise.defer()
        function endlistenter() {
          resolver.resolve()
        }
        transfer.on('end', endlistenter)

        return resolver.promise.finally(function () {
          transfer.removeListener('end', endlistenter)
        })
      })
  }

pushUiautomator()
.then(function () {
      var startuiautomatorCmd = 'uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall'
      adb .shell(serial, startuiautomatorCmd)
      var wakeUpCMD = 'am start -S -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -f 0x10200000 -n com.example.unlock/.Unlock'
      adb.shell(serial,wakeUpCMD)
    })
.then(function(){
var apkPath = '/var/stf/file/apk/upload_4ee6de7afb38a67ae0f320e845720183'
adb.install(serial, apkPath)
})*/
