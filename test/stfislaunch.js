var adbkit = require('adbkit')
var Promise = require('bluebird')
var adb = adbkit.createClient()


var serials = ['HC496MY00456','2113ca22','F3D7N15B04010834','IN89MNGI99999999','0216026890651005','N7BAO7TC7DB6WWHM','ca8a7642','14255e08','F4AZFG02A261']

//while(true){
  serials.forEach(function(serial){
    return adb.shell(serial, 'ps')
    .then(adbkit.util.readAll)
    .then(function(output){
      var outputStr = output.toString().trim()
      outputStr.split('\n').forEach(function(str){
        if(/boyaa/.test(str)){
          console.log(serial, str)
        }
      })
    })
  })
//}
