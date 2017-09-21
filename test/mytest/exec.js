var exec = require('child_process').exec

var path = 'python /var/stf/vendor/scancase/main.py /var/stf/testproject/TestHoldemSina/testcases/hall/login.py'

exec(path, function (err, stdout, stderr) {
	var data = JSON.parse(stdout)
	console.log(data)
          global.is_operating_db = false
        })
