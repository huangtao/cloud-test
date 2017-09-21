/**
 * Created by GuixiangGui on 2016/9/8.
 */

var dbapi = require('/var/stf/lib/db/api')
//var monkeyTest = require('../monkey/test')
//var Promise = require('bluebird')
var logger = require('/var/stf/lib//util/logger')
var util = require('util')
var emailNotices = require('/var/stf/lib/units/emailNotiecs')
var report = require('/var/stf/lib/units/report')
//var activityTest = require('../activity/test')
var taskUtil=require('./task/taskUtil');


module.exports = function () {
  var log = logger.createLogger('taskManager');
  var cleanArr = new Array();
  var cleanInterval;
  var isPlanRunning = false;
  var isCleanPlanRunning = false;
  
  taskUtil.plan();
  setInterval(function () {
    if(!isPlanRunning){
      isPlanRunning = true
      plan()
    }
  },1000*60*2);
  taskUtil.cleanplan();
  taskutil.test();
  taskutil.testFinish();



}
