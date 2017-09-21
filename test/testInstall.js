/**
 * Created by GuixiangGui on 2017/4/24.
 */

var dbapi = require('../lib/db/api')
var Promise = require('bluebird')
var adbkit = require('adbkit')
//var apkP = '/tmp/tudou_87.apk'
var apkP = '/var/stf/vendor/performanc/pmonitor.apk'
//var hosts = ['172.20.101.11', '172.20.101.130', '172.20.101.12']
var hosts = ['172.20.101.11', '172.20.101.130']
//var pkg = 'jp.co.cyberagent.stf'
//var hosts = ['172.20.101.12']
var pkg = 'com.boyaa.stf.pmonitor'

installAPK()

function installAPK() {
    hosts.forEach(function (host) {
        var adb
        console.log('start install apk')
        adb = adbkit.createClient({host:host, port:'5037'})
        adb.listDevices()
            .then(function (devices) {
                
				return install(adb, devices, apkP,host)
                
            })

    })


    function install(adb, devices, apkPath, host){
        var device = devices.shift()
        var serial = device.id
        console.log('start install apk serial:', serial)
        return adb.shell(serial, 'pm clear com.example.unlock')
            .then(function () {
                return adb.shell(serial, 'am start -n com.example.unlock/.Unlock')
            })
            .then(function () {
                return adb.shell(serial, 'uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall')
            })
           .then(function () {
	        if(pkg){
                   return adb.uninstall(serial, pkg)
                }
            })

            .then(function () {
                return adb.install(serial, apkPath)
            })
            .then(function () {
                console.log('install apk finish. '+serial+' '+host)
            })
            .catch(function (err) {
                console.log(serial, host, err)
            })
            .finally(function(){
                if(devices.length>0){
                    install(adb, devices, apkPath, host)
                }
                
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
