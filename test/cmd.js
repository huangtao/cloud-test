var spawn = require('child_process').spawn
var exec = require('child_process').exec
var execSync = require('child_process').execSync
var arr=new Array()
exec('ls  /var/stf/file/cptlog/1493772632755_YorickYe/screencap/',function(err, out, code){
      var aaa=out.split('\n')
       arr=aaa
     console.log(aaa)
})

