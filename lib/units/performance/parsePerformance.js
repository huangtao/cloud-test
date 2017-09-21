var fs = require('fs')
var Promise = require('bluebird')


module.exports = function(filePath, rpldata){
    
    rpldata.performanceScenes = []
    rpldata.performanceDetail = {'tagTime':[]}
    return new Promise(function(resolve, reject){
        fs.readFile(filePath, function(err, data){
            if(err){
                return reject(err)
            }

            var lines = data.toString().trim().split(/\r\n|\r|\n/)
            for (var i=0; i<lines.length; i++){
                if(/tagName.*pss.*cpu/i.test(lines[i])){
                    lines = lines.slice(i+1)
                    break
                }
            }

            if((!lines) || lines.length == 0){
                return reject('Does not contain performance data')
            }
            var timeLine = []
            var mem = []
            var cpu = []
            var fps = []
            var netTotal = []
            var netIn = []
            var netOut = []
            var tag = []
            var screenName = []
            for(var i in lines){
                if(lines[i]){
                    var lineList = lines[i].trim().split(',')
                    timeLine.push(lineList[0].trim())
                    tag.push(lineList[1].trim())
                    screenName.push(lineList[8].trim())
                    if(lineList[2].trim()){
                        mem.push(Number(lineList[2].trim()))
                    }else{
                        mem.push(NaN)
                    }
                    
                    if(lineList[3].trim()){
                        cpu.push(Number(lineList[3].trim()))
                    }else{
                        cpu.push(NaN)
                    }

                    if(lineList[4].trim()){
                        fps.push(Number(lineList[4].trim()))
                    }else{
                        fps.push(NaN)
                    }
                    
                    if(lineList[5].trim()){
                        netTotal.push(Number(lineList[5].trim()))
                    }else{
                        netTotal.push(NaN)
                    }

                    if(lineList[6].trim()){
                        netIn.push(Number(lineList[6].trim()))
                    }else{
                        netIn.push(NaN)
                    }
                    
                    if(lineList[7].trim()){
                        netOut.push(Number(lineList[7].trim()))
                    }else{
                        netOut.push(NaN)
                    }
                    
                }
            }

            //查询出标签和时间的对应关系。格式：  tagName:[时间列表]
            var tagTime = {}
            for(var t in tag){
                if(tag[t]){
                    tagTime[tag[t]] ? tagTime[tag[t]].push(timeLine[t]) : tagTime[tag[t]]=[timeLine[t]]
                } 
            }

            rpldata.performance.mem = getValidData(mem)
            rpldata.performance.netTotal = sum(netTotal)
            rpldata.performance.netIn = sum(netIn)
            rpldata.performance.netOut = sum(netOut)
            rpldata.performance.cpu = average(cpu)
            rpldata.performance.fps = average(fps)

            for(var key in tagTime){
                var startTime = tagTime[key][0]
                var endTime = tagTime[key][tagTime[key].length - 1]
                var startIndex = timeLine.indexOf(startTime)
                var endIndex = timeLine.indexOf(endTime)+1
                rpldata.performanceScenes.push({
                    'tagName' : key,
                    'data' : {
                        'mem' : getValidData(mem.slice(startIndex, endIndex)),
                        'netTotal' : sum(netTotal.slice(startIndex, endIndex)),
                        'netIn' : sum(netIn.slice(startIndex, endIndex)),
                        'netOut' : sum(netOut.slice(startIndex, endIndex)),
                        'cpu' : average(cpu.slice(startIndex, endIndex)),
                        'fps' : average(fps.slice(startIndex, endIndex))
                    }
                })

                rpldata.performanceDetail.tagTime.push({
                    'tagName' : key,
                    'startTime' : startTime,
                    'endTime' : endTime
                })
            }

            rpldata.performanceDetail.categories = timeLine
            rpldata.performanceDetail.series = [{'name' : 'mem', 'data' : mem}, {'name' : 'cpu', 'data' : cpu}, {'name' : 'fps', 'data' : fps},
                {'name' : 'netTotal', 'data' : netTotal}, {'name' : 'netIn', 'data' : netIn}, {'name' : 'netOut', 'data' : netOut}]
            rpldata.performanceDetail.screen = screenName

            return resolve(rpldata)
            

            function average(valueList){
                var i = 0
                var sum = 0
                valueList.forEach(function(data) {
                    if(data >= 0){
                        sum += data
                        i +=1
                    }  
                })
                var result = Math.round((sum/i)*100)/100
                if(result){
                    return result
                }else{
                    return 'NaN'
                }
            }

            function getValidData(valueList, change){
                //内存，流量获取的是数组中第一个有效数据，排除非数字和等于0的数字，默认从最后向前查找
                //change 参数改变查询方向为从前向后查找
                var dataIndex = valueList.length-1
                if(change){
                    dataIndex = 0
                    while(dataIndex < valueList.length){
                        if(valueList[dataIndex] > 0){
                            break
                        }
                        dataIndex++
                    }
                }else{
                    dataIndex = valueList.length-1
                    while(dataIndex > 0){
                        if(valueList[dataIndex] > 0){
                         break
                        }
                        dataIndex--
                    }
                }
                
                if(valueList[dataIndex]){
                    return valueList[dataIndex]
                }else{
                    return 'NaN'
                }
                
            }

            function sum(valueList){
                var sum = 0
                valueList.forEach(function(data){
                    if(data > 0){
                        sum += data
                    }
                })
                return Math.round(sum*100)/100
            }

        })
    })
}