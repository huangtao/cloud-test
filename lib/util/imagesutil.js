/**
 * Created by GuixiangGui on 2016/12/22.
 */
var fs = require('fs')

module.exports.resImage = function (res, imagePath) {
  fs.stat(imagePath, function (err, stat) {
    if(stat && stat.isFile()){
      fs.readFile(imagePath, 'binary', function (err, data) {
        if(err){
          res.writeHead(500,{'Content-Type':'text/plain'})
          res.write(err + '\n')
          res.end()
        }else{
          res.writeHead(200, {'Content-Type':'image/png'})
          res.write(data, 'binary')
          res.end()
        }
      })
//            log.debug('appiconpath find')
//            res.set('Content-Disposition',
//              'attachment; filename="' + path.basename(appiconpath) + '"')

//            res.set('Content-Type', 'image/png')
//            res.sendFile(appiconpath)
    }else {
      res.sendStatus(404)
      res.end()
    }
  })
}
