var notiecs = require('./notiecsutil')
var logger = require('./logger')
var alarm= module.exports=Object.create(null)

var log = logger.createLogger('alarmEmail')

alarm.Disconnect = function(id){
     var notiecsData = {}
     var type = {mail : 1}
     notiecsData.type = type
     var sendTo='yorickye@boyaa.com'
      notiecsData.sendTo = {user: sendTo}
        notiecsData.setting = ''
      
      var title = '9楼测试服提醒，设备('+ id +')断开连接，请到机房核实情况'
            notiecsData.title = title
            var body = '9楼测试服提醒，设备('+ id +')断开连接，请到机房核实情况'
            notiecsData.body = body
            notiecs(notiecsData, function (err, response, resbody) {
              if(!err){
                log.info(resbody)
              }else{
               log.info(err)
              }
	    })  
}

