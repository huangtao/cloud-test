/**
 * Created by GuixiangGui on 2017/6/2.
 */

var spawn = require('child_process').spawn
var events = require('events')


function monitor(serial, pkg) {
    this.serial = serial
    this.pkg = pkg
    this.eventEmitter = new events.EventEmitter()
}

monitor.prototype.start = function () {
    var processRegExp = new RegExp('processName.*' + this.pkg, 'i')
    var processAnrRegExp = new RegExp('ERROR.*PROCESS.*NOT.*RESPONDING', 'i')
    var processCrashRegExp = new RegExp('ERROR.*PROCESS.*CRASHED', 'i')
    var continueRegExp = new RegExp('\\(c\\)ontinue')
    var quitRegExp = new RegExp('\\(q\\)uit')
    var serial = this.serial
    var amMonitor = spawn('adb', ['-H', '172.20.15.16', '-s', serial, 'shell', 'am', 'monitor'])
    amMonitor.stdout.on('data', function (data) {
        var str = data.toString()
        console.log(str, serial)
        if(continueRegExp.test(str)){
            console.log('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@')
            amMonitor.stdin.write('c\n')
        }
    })

    this.eventEmitter.on('end',function () {
        amMonitor.stdin.write('q\r\n')
    })
}

monitor.prototype.emit = function (eventType) {
    try{
        this.eventEmitter.emit(eventType)
    }
    catch (e){
        console.log(e)
    }

}

module.exports = monitor