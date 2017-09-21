var r = require('rethinkdb');
var fs = require('fs');
var readline = require('readline');
var Promise = require("bluebird");

var names = [];

var rl = readline.createInterface({
    input: fs.createReadStream("markName.txt", {
        encoding: 'utf8'
    }),
    output: null
});

// 对每行进行处理
rl.on('line', function (line) {
    if (line) {
        var serial = line.split(',')[0];
        var name = line.split(',')[1];
        // 存在则更新，不存在则新增
        // productName: xxx
        names.push({productName: name, serial: serial});
    }
});

//module.exports = function () {
    r.connect({host: 'localhost', port: 28015}, function (err, conn) {
        if (err) throw  err;
        console.log('success');
        (function next(i, len) {
            if (i < len) {
                r.db('stf').table('devices').filter(r.row("serial").eq(names[i].serial)).update({markName: names[i].productName}).run(conn, function (err, result) {
                    if (err) {
                        console.log(err);
                    } else {
                        console.log('update succ');
                    }
                    next(i + 1, len);
                });
            }
            else {
                conn.close();
            }
        }(0, names.length));
    });
//}

