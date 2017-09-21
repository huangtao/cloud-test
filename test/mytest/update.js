var exec = require('child_process').exec 

exec('svn update', {cwd: '/var/stf/testproject2'}, function (err, stdout, stderr) {
	console.log(stdout)

})
