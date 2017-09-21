/**
 * Created by GuixiangGui on 2017/6/2.
 */
var monitor = require('./testMonitorBase')
// var serials = ['MIAGLMC710309937', 'S89HNVTW6TZTZSSC', '268daa9c']
var serials = ['26c75108']
var pkg = 'com.example.fetal11'

serials.forEach(function (serial) {
    var amMonitor = new monitor(serial, pkg)

    amMonitor.start()

    setTimeout(function () {
        amMonitor.emit('end')
    }, Math.ceil(Math.random()*10)*3000)
})
