var crypto = require('crypto');
var fs = require('fs');

var rs = fs.createReadStream('test.apk');

var hash = crypto.createHash('md5');

rs.on('data', hash.update.bind(hash));

rs.on('end', function () {
    console.log(hash.digest('hex'));
});
