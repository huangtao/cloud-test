/*
    created 2017/3/24
 */

var http = require('http')
var Promise = require('bluebird')

module.exports.get = function (options) {
    return new Promise(function (resolve, reject) {
        var req = http.request(options, function (res) {
            res.setEncoding('utf8')
            var data = ''
            res.on('data', function (chunk) {
                data = data + chunk
            })
            res.on('end', function () {
                resolve(data)
            })
        })
        req.on('error', function (e) {
            resolve(null)
        })
        req.end()
    })
}
