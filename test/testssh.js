/**
 * Created by GuixiangGui on 2017/4/1.
 */
var Promise = require('bluebird')
var sshExec = require('ssh-exec')
var sshOptions = {user:'root', host:'127.0.0.1', password:'boyaa!@#456'}
var aPath = '/var/stf/vendor/appium/appium_for_bebe'
var pkg = 'com.boyaa.enginedlqp.maindevelop'
var activity = 'com.boyaa.enginedlqp.maindevelop.Game'
var serial = '0123456789ABCDEF'
var p1
var bp1

var test = module.exports = Object.create(null)

test.starttest=function () {

    startappium()
        .then(function (p) {
            p1 = p.port
            bp1 = p.bport
            console.log('port:'+p1+' bpport:'+bp1)
        })
        .then(function () {

            setTimeout(function () {
                console.log('start close appium')
                closeAppiumServer(p1,function () {
                    releaseForwardPort(bp1)
                })

            }, 180000)
        })
}

function startappium() {
    return new Promise(function (resolve, reject) {
        start(aPath, 4723, function (aport, bport) {
            resolve({port:aport, bport: bport})
        })
    })
}

function start(appiumPath, port,cb) {
    console.log('start==========='+port)
    var aPort
    getAvailablePort(port)
        .then(function (port) {
            aPort = port
            return new Promise(function (resolve, reject) {
                forwardPort(aPort + 1, function (fPort) {
                    resolve(fPort)
                })
            })
        })
        .then(function (port) {
            var cmd = 'node ' + appiumPath + ' -p ' + aPort + ' -U ' + serial + ' -bp ' + port
            if(pkg){
                cmd = cmd + ' --app-pkg ' + pkg + ' --app-activity ' + activity
            }

            var startAppiumStream = sshExec(cmd, sshOptions)
            startAppiumStream.setEncoding('utf-8')
            startAppiumStream.on('data', function (data) {
                // console.log('start appium data:'+data +' '+port)
                cb(aPort, port)
            })
            startAppiumStream.on('error', function (err) {
                // console.log('start appium error:'+error +' '+port)
            })
            startAppiumStream.on('warn', function (data) {
                console.log('start warn ======'+ data)
                if(/Couldn.*start Appium.*port is already in use/i.test(data)){
                    releaseForwardPort(port, function () {
                        start(appiumPath, aPort+4, cb)
                    })
                }else{
                    cb(aPort, port)
                }
            })

        })


}

function releaseForwardPort(port, cb) {
    console.log('release adb forward port. port:' + port)
    var cmd = 'adb -s '+ serial + ' forward --remove tcp:' + port
    sshExec(cmd, sshOptions, function (err, stdout, stderr) {
        // console.log('release adb forward port error. err:' + err)
        // console.log('release adb forward port error. stdout:' + stdout)
        // console.log('release adb forward port error. stderr:' + stderr)
        if(typeof cb == 'function'){
            cb(null)
        }
    })
}

function forwardPort(port, cb) {
    getAvailablePort(port)
        .then(function (availablePort) {
            var cmd = 'adb -s ' + serial + ' forward --no-rebind tcp:' + availablePort + ' tcp:4724'
            sshExec(cmd, sshOptions, function (err, stdout, stderr) {
                // console.log('forward port err:'+err)
                // console.log('forward port stdout:'+stdout)
                // console.log('forward port stderr:'+stderr)
                if(/cannot rebind existing socket/i.test(stderr)){
                    forwardPort(availablePort+4, cb)
                }else{
                    if(typeof cb == 'function'){
                        cb(availablePort)
                    }
                }
            })
        })
}

function getAvailablePort(port) {

    return new Promise(function(resolve, reject){
        function start(port) {
            console.log('get port++++++++++++'+port)
            sshExec('netstat -anp|grep :'+port, sshOptions, function (err, stdout, stderr) {
                // log.debug('ssh output:',err, stdout, stderr)
                if(stdout){
                    start(port+4)
                }else{
                    resolve(port)
                }
            })
        }

        start(port)
    })

}

function closeAppiumServer(port, cb, tryA) {
    console.log('close appium. port:', port)
    var tryAgain = tryA==null ? tryA : true
    var cmd = 'ps -ef |grep appium |grep '+port
    sshExec(cmd, sshOptions, function (err, stdout, stderr) {
        // console.log('ps -ef |grep appium  err:'+err)
        // console.log('ps -ef |grep appium  stdout:'+stdout)
        // console.log('ps -ef |grep appium  stderr:'+stderr)
        if(stdout){
            // log.debug('close appium ', stdout.toString().trim())
            var strs = stdout.split('\n')
            strs.forEach(function (str) {
                if((/node.*-p/).test(str)){
                    var pid = str.split(/\s+/)[1]
                    sshExec('kill -9 ' + pid, sshOptions, function (err, stdout, stderr) {
                        console.log('kill -9 err:'+err)
                        console.log('kill -9 stdout:'+stdout)
                        console.log('kill -9 stderr:'+stderr)
                        if(typeof cb == 'function'){
                            cb(null)
                        }
                    })
                }
            })
        }else if(!stderr&&tryAgain){
            setTimeout(function () {
                closeAppiumServer(port,cb,false)
            }, 30000)

        }

        cb(null)
    })
}
