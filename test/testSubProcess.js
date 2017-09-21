/**
 * Created by GuixiangGui on 2017/5/17.
 */

// module.exports = function (options) {
//     console.log(options.data)

console.log(process.argv[2].taskid)
console.log(process.arguments)
    process.on('message', function (m) {
        console.log('process receive message ', m.aa)
    })

    setTimeout(function () {
        arguments
        process.send('sub process finish '+ process.pid)
        process.exit(0)
    }, Math.ceil(Math.random()*20)*1000)

// }
