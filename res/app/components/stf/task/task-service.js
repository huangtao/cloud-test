var _ = require('lodash')
var oboe = require('oboe')

module.exports = function TaskServiceFactory($http, socket) {
  var TaskService = {}
  TaskService.reports = new Array()
  TaskService.date= new Array()  
   oboe('/app/api/v1/tasklist')
   .node('reports.*',function(reports){
    	TaskService.reports.push(reports)})
  return TaskService
}
