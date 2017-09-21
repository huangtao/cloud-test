var dbapi = require('/var/stf/lib/db/api')
var Promise = require('bluebird')
//var schedule= require('node-schedule')
var exec = require('child_process').exec
/*var rule = new schedule.RecurrenceRule()
rule.dayOfWeek = [0, new schedule.Range(1, 6)]
rule.hour = 17
rule.minute = 1
var j = schedule.scheduleJob(rule, function(){
 console.log("执行任务");
})*/
var cmdreboot = function(serail){
return new Promise(function(resolve, reject){
exec(cmd,function (err, stdout, stderr) {
  	if(err){
 	// callback(err)
	return resolve(err)
    	}
    	else
    	{
    	 //callback(stdout)
         return resolve(stdout)
    	}
    })
})
}
var getFreeSerial = function(){
return new Promise(function(resolve, reject){
   dbapi.loadFreeDevices()
   .then(function(cursor) {
        return Promise.promisify(cursor.toArray, cursor)()
         .then(function(list) {
          //console.log(list)
         return resolve(list)
	 })
      .catch(function(err) {
         consle.log('Failed to load device list: ', err.stack)
         return resolve(err.stack)
        })
      })
 })
}


getFreeSerial()
.then(function(serials){
 var cmd = null
 var serial=null
 for (var i=0;i < serials.length;i++){
	serail=serial[i]
	cmd= 'adb -s '+ serial[i]+' shell ls'
        console.log(cmd)
 	/*cmdreboot()
	.then(function(std){
	console.log('stdddddddd',std)
	})*/
 }
})


