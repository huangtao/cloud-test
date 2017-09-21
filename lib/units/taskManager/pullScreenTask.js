/**
 * Created by GuixiangGui on 2017/5/8.
 */

var adbkit = require('adbkit')
var fs = require('fs')
var logger = require('../../util/logger')


var _this
function pullScreenTask() {
  this.pullTaskObj = {}
  this.log = logger.createLogger('pullScreenTask')
  _this = this
}

pullScreenTask.prototype.pushTask = function (host, option, cb) {
  this.log.debug('push pull screen task')
  var taskInfo = {option: option, cb: cb}
  if (!this.pullTaskObj[host]) {
    this.pullTaskObj[host] = {taskRun: false, taskArr: [taskInfo]}
  } else {
    this.pullTaskObj[host].taskArr.push(taskInfo)
  }

  if (!this.pullTaskObj[host].taskRun) {
    runTask(host)
  }

  function runTask(host) {
    if (_this.pullTaskObj[host].taskArr.length > 0) {
      pullFiles(_this.pullTaskObj[host].taskArr.shift())
    } else {
      _this.pullTaskObj[host].taskRun = false
    }

    function pullFiles(taskInfo) {
      if (taskInfo.option.fileNames && taskInfo.option.fileNames.length > 0) {
        var adb = taskInfo.option.adb
        var fileName = taskInfo.option.fileNames.shift()
        var fileOnPhonePath = taskInfo.option.fileOnPhonePath
        var fileOnPcPath = taskInfo.option.fileOnPcPath
        var serial = taskInfo.option.serial

        adb.pull(serial, fileOnPhonePath + fileName)
          .then(function (transfer) {
            transfer.on('end', function () {
              pullFiles(taskInfo)
            })

            transfer.pipe(fs.createWriteStream(fileOnPcPath + fileName))
          })
      } else {
        var cb = taskInfo.cb
        cb()
        runTask(host)
      }


    }
  }

}

module.exports = new pullScreenTask()
