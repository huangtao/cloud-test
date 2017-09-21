/**
 * Created by GuixiangGui on 2017/6/2.
 */

var spawn = require('child_process').spawn
var events = require('events')
var fs = require('fs')

function monitor(serial, pkg, host, logPath, log) {
  this.serial = serial
  this.pkg = pkg
  this.logPath = logPath
  this.host = host
  this.log = log
  this.eventEmitter = new events.EventEmitter()
}

monitor.prototype.start = function () {
  var logPath = this.logPath
  var log = this.log
  var args = ['-H', this.host, '-s', this.serial, 'shell', 'am', 'monitor']

  var processRegExp = new RegExp('processName.*' + this.pkg, 'i')
  var processBoyaaRegExp = new RegExp('processName.*com\\.boyaa', 'i')
  // var processAnrRegExp = new RegExp('ERROR.*PROCESS.*NOT.*RESPONDING', 'i')
  // var processCrashRegExp = new RegExp('ERROR.*PROCESS.*CRASHED', 'i')
  var continueRegExp = new RegExp('\\(c\\)ontinue')
  var isRecord = false

  var amMonitor = spawn('adb', args)
  amMonitor.stdout.on('data', function (data) {
    var str = data.toString()
    log.debug('am monitor data:', str)
    if(processRegExp.test(str) || processBoyaaRegExp.test(str)){
      isRecord = true
    }
    if(isRecord){
      fs.appendFile(logPath, str)
    }
    if(continueRegExp.test(str)){
      isRecord = false
      log.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@')
      amMonitor.stdin.write('c\n')
      amMonitor.stdin.write('c\r')
      amMonitor.stdin.write('c\r\n')
    }
  })

  this.eventEmitter.on('end', function () {
    amMonitor.stdin.write('q\n')
    amMonitor.stdin.write('q\r')
    amMonitor.stdin.write('q\r\n')
  })
}

monitor.prototype.emit = function (eventType) {
  try{
    this.eventEmitter.emit(eventType)
  }catch (e){
    this.log.error('monitor emit error:', e)
  }

}


module.exports = monitor
