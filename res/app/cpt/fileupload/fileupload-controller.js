module.exports = function fileuploadCtrl(
  $scope
, InstallService
) {
  $scope.accordionOpen = true
  $scope.installation = null

  $scope.clear = function() {
    $scope.installation = null
    $scope.accordionOpen = false
  }

  $scope.$on('installation', function(e, installation) {
    $scope.installation = installation.apply($scope)
  })

  $scope.installUrl = function(url) {
    return InstallService.installUrl($scope.control, url)
  }

  $scope.uploadlFile = function($files) {
    var apkinfo = {}
    if ($files.length) {
      InstallService.uploadFile($scope.control, $files)
        .then(function (fileinfo) {
          apkinfo.href = fileinfo.href
          apkinfo.id = fileinfo.id
          $scope.$emit('apkinfo', apkinfo)
        })
    }
  }
}
