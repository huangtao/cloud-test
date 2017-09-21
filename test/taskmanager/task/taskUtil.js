/**
 * Created by YorickYe on 2017/3/3.
 */
var dbapi = require('/var/stf/lib/db/api');
var Promise = require('bluebird');
var logger = require('/var/stf/lib/util/logger');
var monkeyTest = require('/var/stf/lib/units/monkey/test')
var Promise = require('bluebird')
var util = require('util');
var log = logger.createLogger('taskUtil');
var activityTest = require('/var/stf/lib/units/activity/test');
var taskutil = module.exports = Object.create(null);


taskutil.plan= function() {
  dbapi.loadFreeDevices()
    .then(function(cursor) {
      return Promise.promisify(cursor.toArray, cursor)()
        .then(function(list) {
          var freeSerials=[];
          list.forEach(function(serial) {
            freeSerials.push(serial)
          });
          return freeSerials
        })
        .then(function (freeSerials) {
          dbapi.loaddevicetaskstatus()
            .then(function (cursor) {
              return Promise.promisify(cursor.toArray, cursor)()
                .then(function (tasks) {
                  if(tasks){
                    freeSerials.forEach(function (serial) {
                      for(var i=0;i<tasks.length;i++) {
                        if(tasks[i].serials.indexOf(serial)!=-1){
                          test(tasks[i], serial);
                          break
                        }
                      }
                    })
                  }
                })
                .then(function () {
                  isPlanRunning = false
                })
            })
        })
    })
    .catch(function(err) {
      isPlanRunning = false;
      log.error('Failed to load device list: ', err.stack)
    })
};

taskutil.cleanplan= function() {
    if(cleanArr.length > 0){
      var taskid = cleanArr[0].taskid;
      var serial = cleanArr[0].serial;
      return dbapi.loaddevicetaskserial(taskid)
        .then(function (serials) {
          if(serials && serials.length > 0){
            serials.splice(serials.indexOf(serial),1);

            if(serials.length>0){
              var data = {serials:serials};
              dbapi.updatedevicetaskStatus(taskid,data)
                .then(function(){
                  log.debug('Release %s:%s', taskid,serial);
                  dbapi.unsetDeviceOwner(serial)
                    .then(clearArray)
                })
            }
            else{
              dbapi.removedevicetask(taskid)
                .then(function () {
                  return dbapi.updateTaskReport(taskid,{allstatus:'finish'})
                    .then(function () {
                      log.debug('Release %s:%s', taskid,serial);
                      dbapi.unsetDeviceOwner(serial)
                        .then(clearArray)
                    })
                });


              report(taskid, null, dbapi, function () {
                log.info('%s pack finish', taskid)
              });
              emailNotices(taskid)
            }
          }


        })

        .catch(function (err) {
          log.debug('loaddevicetaskserial err :', err);
          if(/non-object non-sequence.*null/.test(err)){
            dbapi.unsetDeviceOwner(serial)
              .then(clearArray);
            log.debug('loaddevicetaskserial null clear task serial :', taskid,serial)
          }
        })
    }else{
      isCleanPlanRunning = false;
      /*clearInterval(cleanInterval)
       cleanInterval = null*/
    }

    function clearArray(){
      log.debug('clear %s %s', cleanArr[0]);
      cleanArr.splice(0,1);
      cleanplan()
    }

  };

taskutil.test=function(task, serial) {
  var testType = 'monkey'
  if(task.testType){
    testType = task.testType
  }
  dbapi.setDeviceOwner(serial,{name: testType})
    .then(function(){
      return dbapi.loadDevice(serial)
    })
    .then(function (device) {
      var data = task.options
      data.deviceInfo = util.format('%s , %s , %s',device.manufacturer,device.model,device.version)
      data.model = device.model
      data.manufacturer = device.manufacturer
      data.serial = device.serial

      switch (testType){
        case 'monkey':
          log.debug('task.taskid', task.taskid)
          monkeyTest(data, task.taskid, dbapi, testFinish)
          break;
        case 'activityTest':
          log.debug('activityTest');
          activityTest(data, task.taskid, dbapi, testFinish)
          break
      }

    })
    .catch(function (err) {
      log.debug('setDeviceOwner err:',err.stack)
      dbapi.unsetDeviceOwner(serial)
    })
};

taskutil.testFinish=function(taskid, finishserial) {
  log.debug('test finish start')
  cleanArr.push({taskid:taskid, serial:finishserial})
  if(!isCleanPlanRunning){
    cleanplan()
  }
};















