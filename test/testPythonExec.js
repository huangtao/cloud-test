var spawn = require('child_process').spawn

var stdio = spawn('python', ['./pythonTest.py'])
stdio.stdout.on('data', function(data){
	console.log(data.toString())
})
