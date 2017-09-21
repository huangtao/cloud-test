/**
 * Created by GuixiangGui on 2017/5/17.
 */

var cp = require('child_process')

start('./testSubProcess.js', [{taskid:'taskid', serial:'serial'}])

function start(file, args) {
    console.log(arguments)
    var child = cp.fork.apply(cp, arguments)
    child.on('message', function (m) {
        console.log('receive child process message ', m)
    })

    child.send({aa:'aaa', bb:'bbb'})
}

/*var fork = require('child_process').fork
/!*var sp = require('./testSubProcess')
console.log(fork)
sp(__filename, ['aaa', 'bbb','ccc'])*!/
var option = {data:'!!!!!!!!!!!!!!!'}
var child = fork('./testSubProcess.js', ['--data','aaaaaa'])

child.on('message', function (m) {
    console.log('receive child process message ', m)
})

child.send({aa:'aaa', bb:'bbb'})*/
