var exec = require('child_process').exec
var spawn = require('child_process').spawn

 var pat = 'python /var/stf/vendor/scancase/main.py'
      var scan = spawn('python', ['/var/stf/vendor/scancase/main.py'])
	var chunk = ''
      scan.stdout.on('data', function(data) {
	chunk = chunk + data

 	})
      scan.stdout.on('end', function (data) {
	try {
	var tt = JSON.parse(chunk)
	console.log(tt)
	}catch(err) {
	console.log(err)
	}
	
      })
