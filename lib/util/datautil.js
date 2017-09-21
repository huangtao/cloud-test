var deviceData = require('stf-device-db')
var browserData = require('stf-browser-db')
var logger = require('./logger')
var csv = require('node-csv').createParser()
var xlsx = require("node-xlsx")
var log = logger.createLogger('util:datautil')

var datautil = module.exports = Object.create(null)


datautil.applyData = function(device) {
  var match = deviceData.find({
    model: device.model
  , name: device.product
  })

  if (match) {
    device.name = match.name.id
    device.releasedAt = match.date
    device.image = match.image
    device.cpu = match.cpu
    device.memory = match.memory
    if (match.display && match.display.s) {
      device.display = device.display || {}
      device.display.inches = match.display.s
    }
  }

  return device
}

datautil.applyBrowsers = function(device) {
  if (device.browser) {
    device.browser.apps.forEach(function(app) {
      var data = browserData[app.type]
      if (data) {
        app.developer = data.developer
      }
    })
  }
  return device
}

datautil.applyOwner = function(device, user) {
  device.using = !!device.owner && device.owner.email === user.email
  return device
}

datautil.normalize = function(device, user) {
  datautil.applyData(device)
  datautil.applyBrowsers(device)
  datautil.applyOwner(device, user)
  if (!device.present) {
    device.owner = null
  }
}

datautil.unique =function(array){
  var cache={}
    for(var i=0;i<array.length;i++){
          cache[array[i]]=i
         // log.info('0x88 %s',array[i])
     } 
     var result=Object.keys(cache)
     for (var i = 0; i < result.length; i++) {
       //log.info('0x88 %s',result[i])
     }
     return Object.keys(cache)
}

datautil.dealPerformanceCsv = function(filepath,callback){
        csv.parseFile(filepath, function(err, data) {        
        var dlength = data.length - 9 
        var aumtotal=0
        var tnttotal=0
        var tuctotal=0
        if(data.length>8){

        for (var i = 0; i < data[8].length; i++) {
          if(data[8][i]=="App Used Memory PSS(MB)"){
            for (var j = 9; j < data.length; j++) {
              aumtotal+=Number(data[j][i])
            }
            break
          }
        }

       for (var i = 0; i < data[8].length; i++) {
          if(data[8][i]=="Total Net Traffic(KB)"){
            for (var j = 9; j < data.length; j++) {
              tnttotal=Number(data[j][i])
            }
            break
          }
      }

      for (var i = 0; i < data[8].length; i++) {
          if(data[8][i]=="Total Used CPU(%)"){
            for (var j = 9; j < data.length; j++) {
              tuctotal+=Number(data[j][i])
            }
            break
          }
        }
      var AUM = (aumtotal/dlength).toFixed(2)
      var TNT = tnttotal
      var TUC = (tuctotal/dlength).toFixed(2)
      log.info("AUM,TNT,TUC",AUM,TNT,TUC)
      callback(AUM,TNT,TUC)      
      } 
     }) 
}

datautil.dealPerformanceXls = function (filepath, callback) {
  var list = xlsx.parse(filepath)
  var pss_sum = 0.0
  var cpu_sum = 0.0
  var flow_sum = 0.0
  for(var i = 1; i < list[0].data.length; i++) {
    pss_sum += list[0].data[i][1]
    cpu_sum += list[0].data[i][2]
    flow_sum += list[0].data[i][3] + list[0].data[i][4]
  }
  var pss_average = (pss_sum/(list[0].data.length-1)).toFixed(2)
  var cpu_average = (cpu_sum/(list[0].data.length-1)).toFixed(2)
  var flow_average = (flow_sum/(list[0].data.length-1)).toFixed(2)
  callback(pss_average, flow_average, cpu_average)
}

datautil.AvgData=function(intdata){
  var sum=0 
  var j=0
  log.info('intdata',intdata)
  for (var i = 0; i < intdata.length; i++) {
    if(isNaN(intdata[i]))
        j++
      else
        sum +=intdata[i]
  }
 if (intdata.length - j > 0)
  return  (sum / (intdata.length-j)).toFixed(2)
 else{
  return 0
 }
}
