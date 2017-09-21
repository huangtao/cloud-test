var chokidar = require('chokidar');
var watcher = chokidar.watch('/var/stf/test');
var exec = require('child_process').exec
var log = console.log.bind(console);

ready = false

function addFileListener(path) {
    if(ready) {
        log('File', path, 'has been added')
    }
}
function addDirecotryListener(path) {
    if(ready) {
        log('Directory', path, 'has been added')
    }
}
function fileChangeListener(path) {
    	log('File', path, 'has been changed')
	 var command = 'python /var/stf/vendor/scancase/main.py ' + path
	 exec(command, function (err, stdout, stderr) {
        	var data = JSON.parse(stdout)
		log(data)
         })
}

function fileRemovedListener(path) {
    log('File', path, 'has been removed')
}
function directoryRemovedListener(path) {
    log('Directory', path, 'has been removed')
}

watcher
    .on('add', addFileListener)
    .on('addDir', addDirecotryListener)
    .on('change', fileChangeListener)
    .on('unlink', fileRemovedListener)
    .on('unlinkDir', directoryRemovedListener)
    .on('error', function(error) { log('Error happened', error); })
    .on('ready', function() { log('Initial scan complete. Ready for changes.'); ready = true })

