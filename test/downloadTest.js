/**
 * Created by GuixiangGui on 2017/4/24.
 */

var dbapi = require('../lib/db/api')
var Promise = require('bluebird')
var adbkit = require('adbkit')
var apkP = '/tmp/tudou_87.apk'
var hosts = ['172.20.15.13', '172.20.15.14', '172.20.15.16']
//var pkg = 'jp.co.cyberagent.stf'
var pkg = 'com.boyaa.stf.pt'

installAPK()

function installAPK() {
    hosts.forEach(function (host) {
        //var adb
        console.log('start install apk')
        var adb = adbkit.createClient({host:host, port:'5037'})
        adb.listDevices()
            .then(function (devices) {
                return Promise.map(devices, function (device) {
                    return install(adb, device.id, apkP,host)  
                })
            })
    })

function pushUiautomator(adb,serial){
  var uiautomatorPath = '/tmp/UiAutomator.jar'
  var phoneTmp = '/data/local/tmp/UiAutomator.jar'
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



    function install(adb, serial, apkPath, host){
        console.log('start downloadtest serial:', serial)
        return adb.shell(serial, 'pm clear com.example.unlock')
            .then(function () {
                return adb.shell(serial, 'am start -n com.example.unlock/.Unlock')
            })
            // .then(function () {
            //     return adb.shell(serial, 'uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall')
            // })
            // .then(function(){
            //     console.log('installing',serial)
            //     return adb.install(serial, apkPath)
            // })
            // .then(function(){
            //     console.log("push UiAutomator",serial)
            //    return pushUiautomator(adb,serial)
            // })
	       .then(function(){
            console.log("start tudou",serial)
		      return adb.shell(serial,'am start -n com.tudou.android/com.tudou.ui.activity.HomePageActivity')
		    })
            .then(function () {
                console.log("start uiautomator",serial)
                return adb.shell(serial, 'uiautomator runtest UiAutomator.jar')
            })
	   
          /* .then(function () {
	        if(pkg){
                   return adb.uninstall(serial, pkg)
                }
            })

            .then(function () {
                return adb.install(serial, apkPath)
            })
            .then(function () {
                console.log('install apk finish. '+serial+' '+host)
            })*/
            .catch(function (err) {
                console.log(serial, host, err)
            })
    }
}

/*
dbapi.loadFreeDevices()
.then(function (cursor) {
    console.log('load devcies finish')
    return Promise.promisify(cursor.toArray, cursor)()
})
.then(function (serials) {

    var serialsInterval = setInterval(function () {
        var serial = serials.pop()
        installAPK(serial, apkP)
        if(serials.length==0){
            console.log('finshi')
            clearInterval(serialsInterval)
        }
    }, 1000*20)
})

function installAPK(serial, apkPath) {
    var adb
    console.log('start install apk')
    dbapi.loadDevice(serial)
        .then(function (device) {
            return adb = adbkit.createClient({host:device.provider.name, port:'5037'})
        })
        .then(function () {

            return adb.shell(serial, 'pm clear com.example.unlock')
        })
        .then(function () {
            return adb.shell(serial, 'am start -n com.example.unlock/.Unlock')
        })
        .then(function () {
            return adb.shell(serial, 'uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall')
        })
        .then(function () {
            return adb.install(serial, apkPath)
        })
        .then(function () {
            console.log('install apk finish. '+serial)
        })
        .catch(function (err) {
            console.log(err)
        })
}*/
