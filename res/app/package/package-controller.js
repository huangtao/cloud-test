module.exports = function PackageCtrl(
  $scope
, PackageService) {
	$scope.titles = PackageService.titles
	$scope.apkinfos = PackageService.apkinfo
 // $scope.columns = ['应用名称','包名', 'version', '大小', '上传时间', '操作']
  //$scope.apkinfos = [{name:'中国象棋',apkname:'boyaa1',version:'1.1.0',size:'30M',uploadday:2016-07-26,activity:1,url:'http://jd.oa.com/apk/2016/07/chess-2.4.0-preview-preview-oppo-1013-20160727.apk'},
 	//	 		   			{name:'中国象棋',apkname:'boyaa1',version:'1.1.0',size:'30M',uploadday:2016-07-26,activity:1,url:'http://jd.oa.com/apk/2016/07/chess-2.4.0-preview-preview-oppo-1013-20160727.apk'},
  	//						{name:'四川麻将',apkname:'boyaa1',version:'1.1.0',size:'30M',uploadday:2016-07-26,activity:1,url:'http://jd.oa.com/apk/2016/07/chess-2.4.0-preview-preview-oppo-1013-20160727.apk'},
   	//						{name:'四川麻将',apkname:'boyaa1',version:'1.1.0',size:'30M',uploadday:2016-07-26,activity:2,url:'http://jd.oa.com/apk/2016/07/chess-2.4.0-preview-preview-oppo-1013-20160727.apk'},
   	//						{name:'德州扑克',apkname:'boyaa1',version:'1.1.0',size:'30M',uploadday:2016-07-26,activity:2,url:'http://jd.oa.com/apk/2016/07/chess-2.4.0-preview-preview-oppo-1013-20160727.apk'}]
}

