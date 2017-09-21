module.exports = function TaskCtrl(
  $http
,  $scope
, TaskService) {
	$scope.test_type_select = '请选择任务类型'
	$scope.test_type_list = [
      {id : 0, name : '请选择任务类型'},
      {id : 1, name : '兼容性测试'}
	]

	$scope.test_status_select = '请选择任务状态'
	$scope.test_status_list = [
       {id : 0, name : '请选择任务状态'},
       {id : 1, name : '已完成'},
       {id : 2, name : '运行中'},
       {id : 3, name : '等待中'},
       {id : 4, name : '已取消'}
 	]

  $scope.columns = [
     '任务ID', '安装包','提交时间', '状态','测试结果','通过率','下载日志','查看详细'
  ]
  $scope.failcols = [
     '任务ID', '测试结果','终端' ]

  $scope.reports = TaskService.reports

  $scope.getResult = function (taskid) {
    $http.get('/app/api/v1/download/'+taskid)
  }  

  $scope.snum = function(taskid){
    var report = TaskService.reports
    var Sdevice = 0
    for (var i = 0; i < report.length; i++) {
        if(report[i].taskid == taskid){
          var detail = report[i].detail
          for (var j = 0; j < detail.length; j++) {
           if (detail[j].result=='success') {
              Sdevice += 1
           }
          }
        }       
    }
   return Sdevice
  }
  
 $scope.lookAll = function(taskid){
    var report = TaskService.reports
    var temp=new Array()
    var overview= new Array()
    for (var i = 0; i < report.length; i++) {
        if(report[i].taskid == taskid){
          var detail = report[i].detail
          for (var j = 0; j < detail.length; j++) {
           temp={"model":detail[j].model,"result":detail[j].result,"serial":detail[j].serial,
           "taskid":taskid,"appLaunchTime":detail[j].appLaunchTime,"cpu":detail[j].cpu,
           "memory":detail[j].memory,"dataflow":detail[j].dataflow,"FPS":detail[j].FPS}
           overview.push(temp)
          }
        }  
    } 
    $scope.overview=overview
    $scope.devicecols = ['终端', '测试结果','下载日志']
    $scope.performance = ['终端','启动时间','CPU使用率','内存占用','消耗流量']
  }

  console.log(TaskService.reports)

  $scope.DateFormat = function(committime) {
    var committimestr = committime.toString()
    
    var year = parseInt(committimestr.substring(0,4))
    
    var month =parseInt(committimestr.substring(5,7))
    var hours =null
    var day =null

    var dayValus =parseInt(committimestr.substring(8,10))
    var hoursValus= parseInt(committimestr.substring(11,13))+8

    if (hoursValus < 10) {
    hours = "0" + hoursValus
    day = dayValus
    }  
    if (hoursValus >= 24 ) {
      hours = "0" + (hoursValus-24)
      day = dayValus+1
    } 
    else{
      hours =hoursValus
      day = dayValus
    }
    var minutes = parseInt(committimestr.substring(14,16)) <10 ? "0"+parseInt(committimestr.substring(14,16)) : parseInt(committimestr.substring(14,16))
    var seconds = parseInt(committimestr.substring(17,19)) <10 ? "0"+parseInt(committimestr.substring(17,19)) : parseInt(committimestr.substring(17,19))
    var date = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds
    console.log(date)
    return date
  }
  $scope.$watch($scope.reports)

//2016-09-19T02:05:21.612Z



}
