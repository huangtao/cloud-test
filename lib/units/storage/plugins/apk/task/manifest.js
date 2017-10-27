var Promise = require('bluebird')
var ApkReader = require('adbkit-apkreader')

module.exports = function(file) {
  var resolver = Promise.defer()

  process.nextTick(function() {
/*    try {
      var reader = ApkReader.readFile(file.path)
      var manifest = reader.readManifestSync()
      resolver.resolve(manifest)
    }
    catch (err) {
      resolver.reject(err)
    }*/
    ApkReader.open(file.path)
      .then(function(reader){
        return reader.readManifest()
      })
      .then(function(manifest){
        resolver.resolve(manifest)
      })
      .catch(function(err){
        resolver.reject(err)
      })

  })

  return resolver.promise
}
