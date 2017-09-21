var node_ssh = require('node-ssh')

var ssh = new node_ssh()
ssh.connect({username:'root', host:'172.20.15.13', password:'boyaa!@#456'})
.then(function(){
var cmd = 'node /var/stf/vendor/appium -p 4726 -U FDGNW17213030421 -bp 4727 -tp 4728 --app-pkg com.boyaa.enginedlqp.maindevelop --app-activity com.boyaa.enginedlqp.maindevelop.Game'
cmd = 'java -version'
  ssh.execCmdStream(cmd)
            .then(function (startAppiumStream) {
startAppiumStream.on('data', function(data){
console.log(data.toString())
})
startAppiumStream.stderr.on('data', function(data){console.log('stderr+++++', data.toString())})
})
})

/*var sshExec = require('ssh-exec')
var Promise = require('bluebird')
sshExec('adb -s F3D7N15B04010834 forward tcp:4724 tcp:4724', {user:'root', host:'127.0.0.1', password:'boyaa!@#456'}, function(err, stdout, stderr){
  sshExec('adb -s F3D7N15B04010834 forward --no-rebind tcp:4724 tcp:4725', {user:'root', host:'127.0.0.1', password:'boyaa!@#456'}, function(err, stdout, stderr){
    console.log(err, stdout, stderr)
  })

})*/
/*var stream = sshExec('node /var/stf/vendor/appium/appium_hybrid_support -p 4723 ', {user:'root', host:'172.20.104.35', password:'boyaa!@#456'})
stream.setEncoding('utf-8')
stream.on('data', function(data){console.log('stdout:',data)})
stream.on('error', function(err){console.log('err:', err)})
stream.on('warn', function(data){console.log('stderr:', data)})
*/
/*
setTimeout(function(){
exec('netstat -anp|grep :4723', {user:'root', host:'127.0.0.1', password:'boyaa!@#456'}, function(err,stdout,stderr){

console.log(err, stdout, stderr)
if(stdout){
var strs = stdout.toString().trim().split(/\s+/)
console.log(strs)
pid = strs[strs.length-1].split('/')[0]
console.log(pid)
exec('kill -9 '+pid, {user:'root', host:'172.20.104.35', password:'boyaa!@#456'})

}
})
}, 90000)
*/

/*startAppium('/var/stf/vendor/appium/appium_hybrid_support', 4723)
.then(function(){
return new Promise(function(resolve, reject){
setTimeout(function(){resolve('')},30000 )
})
})
.then(function(){
closeAppium(4723)
})*/

/*  function startAppium(appiumPath, port) {

    return new Promise(function (resolve, reject) {
      function start(port) {
        sshExec('netstat -anp|grep :'+port, {user:'root', host:'127.0.0.1', password:'boyaa!@#456'}, function (err, stdout, stderr) {
          console.log('ssh output:',err, stdout, stderr)
          if(stdout){
            start(port+2)
          }else{
            console.log('appium port : ', port)
            var cmd = 'node ' + appiumPath + ' -p ' + port
            var startAppiumStream = sshExec(cmd, {user:'root', host:'127.0.0.1', password:'boyaa!@#456'})
            startAppiumStream.setEncoding('utf-8')
            startAppiumStream.on('data', function (data) {
              console.log(data)
            })
            startAppiumStream.on('error', function (err) {
              console.log(err) 
            })
            startAppiumStream.on('warn', function (data) {
              console.log(data) 
            })
            resolve(port)
          }
        })
      }

      start(port)

    })
  }

function closeAppium(port){
var cmd = 'ps -ef |grep appium |grep '+port
sshExec(cmd, {user:'root', host:'127.0.0.1', password:'boyaa!@#456'}, function(err,stdout,stderr){

console.log(err, stdout, stderr)
var strs = stdout.split('\n')
        strs.forEach(function (str) {
          if((/node.*-p/).test(str)){
            var pid = str.split(/\s+/)[1]
            console.log('pid:', pid)
          }
        })
})
}*/
/*exec('node /var/stf/vendor/appium/appium_hybrid_support -p 4723 >/var/stf/test/ap.log', {user:'root', host:'172.20.104.35', password:'boyaa!@#456'},function (err, stdout, stderr) {
  console.log(err, stdout, stderr)})
*/
