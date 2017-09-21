module.exports = function CptCtrl(
  $scope
, $http
, $window
, CptService
, DeviceService) {
  var formData = {}

  $scope.dpis = CptService.dpis
  $scope.os_versions = CptService.os_versions
  $scope.manufacturers = CptService.manufacturers

  var unbind = $scope.$on('apkinfo', function (event, data) {
      formData.href = data.href
      // formData.manifest = data.manifest
      formData.id = data.id
  })

  $scope.$on('$destroy', unbind)

  $scope.dpisSelection = []
  $scope.os_versionsSelection = []
  $scope.manufacturersSelection = []

  $scope.toggleSelection = function toggleSelection(selectionName,listSelection){
    var idx = listSelection.indexOf(selectionName)

    if(idx > -1){
      listSelection.splice(idx, 1)
    }
    else{
      listSelection.push(selectionName)
    }
  }

  $scope.commit = function () {
    formData.projectName = $scope.appName
    formData.dpis = $scope.dpisSelection
    formData.os_versions = $scope.os_versionsSelection
    formData.manufacturers = $scope.manufacturersSelection

    CptService.commitMonkeyTest(formData)
      .success(function (data) {
        $http({
          url:'/app/api/v1/notifiedusers'
          ,method:'post'
          ,data: {taskid:data.taskid, sendusers:'guixianggui@boyaa.com, yorickye', id:formData.id}
        })
        $window.alert('提交成功，请稍后查看结果')
        console.log('')
      })
  }


  // $scope.dpis =  [
  //   'aaa', 'bbb', 'ccc', 'ddd'
  // ]
  // $scope.tracker = DeviceService.trackAll($scope)
  // devices = $scope.tracker.devices
  // dpis = []
  // for (var i in devices) {
  //   var device = devices[i]
  //   var display = device.display
  //   var dpi = display.width + '*' + display.height
  //   dpis.push(dpi)
  // }
  // $scope.dpis = dpis
}

