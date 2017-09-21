var dbapi = require('../lib/db/api')
var Promise = require('bluebird')
var adbkit = require('adbkit')
var apkP = '/var/stf/vendor/performanc/pmonitor.apk'
//var host ='172.20.15.14'
//var host = '172.20.137.20'
//var host = '172.20.137.14'
//var host = '172.20.101.130'
var host = '172.20.101.130'
//var serial = 'BTF4C17323007988'
//var serial = '69D4C16B26002353'
//var serial  = 'MVPVAQQG8TI7MFWS'
var serial = '21feb4fb'
var pkg = 'com.boyaa.stf.pmonitor'

var adb
adb = adbkit.createClient({host:host, port:'5037'})
install(adb, serial, apkP, host)
function install(adb, serial, apkPath, host){
        console.log('start install apk serial:', serial)
        return adb.shell(serial, 'pm clear com.example.unlock')
            .then(function () {
                return adb.shell(serial, 'am start -n com.example.unlock/.Unlock')
            })
            .then(function () {
                return adb.shell(serial, 'uiautomator runtest autoinstall.jar -c com.boyaa.stf.uiautomator.AutoInstall')
            })
            .then(function () {
                return adb.uninstall(serial, pkg)
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
    }

