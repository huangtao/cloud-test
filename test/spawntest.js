var spawn = require('child_process').spawn
var exec = require('child_process').exec

/*var p = spawn('python', ['performCaseFile.py', 'cases.ha11.hall:HallSetting,cases.ha11.hall:HallSign'], {cwd: '/var/stf/testproject/BPT产品/src/'})

p.on('error', function(err){console.log('err:', err)})
p.stdout.setEncoding('utf8')
p.stdout.on('data', function(data){console.log('stdout  ==============', data)})
p.stderr.setEncoding('utf8')
p.stderr.on('data', function(data){console.log('stderr @@@@@@@@@@@@@@@', data)})
*/

exec('python performCaseFile.py cases.ha11.hall:HallSetting,cases.ha11.hall:HallSign',{cwd: '/var/stf/testproject/BPT产品/src/'}, function(err, stdout, stderr){
console.log('err!!!!!!!!!!!!!!!!!!!!!!!:', err)
console.log('stdout--------------------:', stdout)
console.log('stderr&&&&&&&&&&&&&&&&&&&&:', stderr)
})
