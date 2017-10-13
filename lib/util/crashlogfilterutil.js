/**
 * Created by GuixiangGui on 2016/11/8.
 */
var logger = require('./logger')
var log = logger.createLogger('crashlogfilterutil')
var crashlogfilterutil = module.exports = Object.create(null)

crashlogfilterutil.logcatentrieslogfilter = function (entries, pidArr, pkg, callback) {

  var fatalError = new RegExp('Fatal signal')
  var fatalName = new RegExp('pid.*tid.*name.*' + pkg)
  var anrError = new RegExp('ANR in ' + pkg)
  var nostatediedError = new RegExp(pkg + '.*died without state saved')
  var diedError = new RegExp(pkg + '.*died')
  var runtimeexecptionError = new RegExp('Exception')
  var androidRuntime = 'AndroidRuntime'
  var fatalException = new RegExp('FATAL EXCEPTION:')
  var forceStop = new RegExp('Force stopping.*' + pkg)
  var execptionError = new RegExp('Exception[\s\S]*'+pkg)

  var result = {}
  var fatalArray = new Array()

  for(var i = 0; i<entries.length; i++){
    var entry = entries[i]

    //过滤android应用运行时崩溃异常
    if(pidArr.indexOf(entry.pid) != -1){
      if(entry.priority == 6 && entry.tag == androidRuntime && fatalException.test(entry.message)){
        var messages = entry.message.split('\n')
        if(messages.length>1){
          for(var j = 1; j<messages.length; j++){
            if(runtimeexecptionError.test(messages[j])){
              result = {errorType : 'crash', reson : messages[j]}
              return callback(result)

            }
          }
        }
      }
    }

    //过滤anr日志
    if(anrError.test(entry)){
      result = {errorType : 'anr', reson : entry.message.split('\n')[0]}
      return callback(result)
    }

    //过滤native crash时的fatal崩溃
    if(fatalError.test(entry.message)){
      fatalArray.push(entry.message)
    }

    if(fatalName.test(entry.message)){
      var name = entry.message.match(/name:.*/)[0].split('>')[0].split(':')[1].trim()
      var nameRegExp = new RegExp(name)
      for(var k = 0; k<fatalArray.length; k++){
        if(nameRegExp.test(fatalArray[k])){
          result = {errorType : 'crash', reson : fatalArray[k]}
          return callback(result)
        }
      }
    }

    //过滤without state saved 异常
    if(nostatediedError.test(entry.message)){
      result = {errorType : 'crash', reson : entry.message}
      return callback(result)
    }

    //还不知道原因的崩溃异常，日志中有应用died的日志，但是不是上面异常情况的日志收集，后续继续优化
    if(diedError.test(entry.message)){
      result = {errorType : 'crash', reson : entry.message}
      return callback(result)
    }

    if(forceStop.test(entry.message)){
      result = {errorType : 'crash', reson : entry.message}
    }

  }

  log.debug('result : ',result)
  return callback(result)

}

crashlogfilterutil.monkeylogfilter = function (outputStr, callback) {
  var anrRegExp = new RegExp('ANR in')
  var longMsgRegExp = new RegExp('.*Long Msg:')
  var nativecrashRegExp = new RegExp('Native crash')
  var nativeMsgRegExp = new RegExp('pid.*tid.*name.*')
  var exceptionRegExp = new RegExp('.*Exception from.*')
  var anrtraceRegExp = new RegExp('.*anr traces.*')
  var monkeyAbortedRegExp = new RegExp('monkey aborted', 'i')

  var result
  var outputStrArr = outputStr.split('\n')

  for(var i = 0; i<outputStrArr.length; i++){
    //判断是crash还是anr
    if(longMsgRegExp.test(outputStrArr[i])){
      //如果是native crash时 Long Msg对应的可能不是真正的crash原因
      if(nativecrashRegExp.test(outputStrArr[i])){//如果是native crash时 Long Msg对应的可能不是真正的crash原因
        for(var j = i; j<outputStrArr.length; j++){
          if(nativeMsgRegExp.test(outputStrArr[j])){
            result = {errorType : 'crash', reson : outputStrArr[j+1].split('//')[1].trim()}
            log.debug('result : ',result)
            return callback(result)
          }
        }
      }
      result = {errorType : 'crash', reson : outputStrArr[i].replace(longMsgRegExp, '')}
      log.debug('result : ',result)
      return callback(result)
    }else if(anrRegExp.test(outputStrArr[i])){
      result = {errorType : 'anr', reson : outputStrArr[i]}
      log.debug('result : ',result)
      return callback(result)
    }else if(exceptionRegExp.test(outputStrArr[i])){
      result = {errorType : 'anr', reson : outputStrArr[i+1]}
      return callback(result)
    }else if(anrtraceRegExp.test(outputStrArr[i])){
      result = {errorType : 'anr', reson : outputStrArr[i]}
      return callback(result)
    }else if(monkeyAbortedRegExp.test(outputStrArr[i])){
      result = {errotType : 'crash', reson : outputStrArr[i]}
    }
  }

  log.debug('result : ',result)
  return callback(result)
}
