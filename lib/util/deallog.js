var Promise =require('bluebird')
var logger = require('./logger')
var deallog = module.exports = Object.create(null)
var exec = require('child_process').exec
var dbapi = require('../db/api')
var log = logger.createLogger('util:deallog')

deallog.getLogdata=function(taskid,serial,loglevel,firstnum,lastnum){
  //  var taskid='1478246748589_274053040'
  //  var serial='7N2RDQ1484001994'
	var cmdAllLine=null
	var cmdLine=null
	var cmdDateTime=null
	var cmdLevel=null
	var cmdPid=null
	var cmdTag=null
	var cmdLogcat=null
	if (!firstnum || !lastnum) {
		var firstnum=1
		var lastnum=1000
	}

	console.log('params',taskid,serial,loglevel,firstnum,lastnum)

	var getFilePath = function(){
		return new Promise(function(resolve, reject) {
	dbapi.Loadlogcat(taskid,serial)
	    .then(function(curson){
		FilePath=curson[0]
		//log.info('pathhhhhhhhhhhh',FilePath)
		switch(loglevel){
		case 'Debug':
			cmdAllLine ='cat '+FilePath+'|grep \'\\[D\\]/\'|wc -l'
			cmdLine = 'cat -n '+FilePath+'|grep \'\\[D\\]/\'|awk \'{print $1}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdDateTime ='cat '+FilePath+'|grep \'\\[D\\]/\'|awk \'{print $1,$2}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdLevel='cat '+FilePath+'|grep \'\\[D\\]/\'|awk \'{print $3}\'|cut -d / -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdPid='cat '+FilePath+'|grep \'\\[D\\]/\'|cut -d "(" -f 2|cut -d ")" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdTag='cat '+ FilePath+'|grep \'\\[D\\]/\'|cut -d / -f 2|cut -d "(" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdLogcat='cat '+ FilePath+'|grep \'\\[D\\]/\'|awk -F "\\):" \'{print $2}\'|sed -n '+ firstnum+','+lastnum+'p'
			resolve()
			break
		case 'Error' :
			cmdAllLine ='cat '+FilePath+'|grep \'\\[E\\]/\'|wc -l'
			cmdLine = 'cat -n '+FilePath+'|grep \'\\[E\\]/\'|awk \'{print $1}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdDateTime ='cat '+FilePath+'|grep \'\\[E\\]/\'|awk \'{print $1,$2}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdLevel='cat '+FilePath+'|grep \'\\[E\\]/\'|awk \'{print $3}\'|cut -d / -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdPid='cat '+FilePath+'|grep \'\\[E\\]/\'|cut -d "(" -f 2|cut -d ")" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdTag='cat '+ FilePath+'|grep \'\\[E\\]/\'|cut -d / -f 2|cut -d "(" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdLogcat='cat '+ FilePath+'|grep \'\\[E\\]/\'|awk -F "\\):" \'{print $2}\'|sed -n '+ firstnum+','+lastnum+'p'
			resolve()
			break
		case 'Info' :
			cmdAllLine ='cat '+FilePath+'|grep \'\\[I\\]/\'|wc -l'
			cmdLine = 'cat -n '+FilePath+'|grep \'\\[I\\]/\'|awk \'{print $1}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdDateTime ='cat '+FilePath+'|grep \'\\[I\\]/\'|awk \'{print $1,$2}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdLevel='cat '+FilePath+'|grep \'\\[I\\]/\'|awk \'{print $3}\'|cut -d / -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdPid='cat '+FilePath+'|grep \'\\[I\\]/\'|cut -d "(" -f 2|cut -d ")" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdTag='cat '+ FilePath+'|grep \'\\[I\\]/\'|cut -d / -f 2|cut -d "(" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdLogcat='cat '+ FilePath+'|grep \'\\[I\\]/\'|awk -F "\\):" \'{print $2}\'|sed -n '+ firstnum+','+lastnum+'p'
			resolve()
			break
		case 'Warn' :
			cmdAllLine ='cat '+FilePath+'|grep \'\\[W\\]/\'|wc -l'
			cmdLine = 'cat -n '+FilePath+'|grep \'\\[W\\]/\'|awk \'{print $1}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdDateTime ='cat '+FilePath+'|grep \'\\[W\\]/\'|awk \'{print $1,$2}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdLevel='cat '+FilePath+'|grep \'\\[W\\]/\'|awk \'{print $3}\'|cut -d / -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdPid='cat '+FilePath+'|grep \'\\[W\\]/\'|cut -d "(" -f 2|cut -d ")" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdTag='cat '+ FilePath+'|grep \'\\[W\\]/\'|cut -d / -f 2|cut -d "(" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdLogcat='cat '+ FilePath+'|grep \'\\[W\\]/\'|awk -F "\\):" \'{print $2}\'|sed -n '+ firstnum+','+lastnum+'p'
			resolve()
			break
		case 'All' :
			cmdAllLine ='cat '+FilePath+'|wc -l'
			cmdLine = 'cat -n '+FilePath+'|awk \'{print $1}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdDateTime ='cat '+FilePath+'|awk \'{print $1,$2}\'|sed -n '+ firstnum+','+lastnum+'p'
			cmdLevel='cat '+FilePath+'|awk \'{print $3}\'|cut -d / -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdPid='cat '+FilePath+'|cut -d "(" -f 2|cut -d ")" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdTag='cat '+ FilePath+'|cut -d / -f 2|cut -d "(" -f 1|sed -n '+ firstnum+','+lastnum+'p'
			cmdLogcat='cat '+ FilePath+'|awk -F "\\):" \'{print $2}\'|sed -n '+ firstnum+','+lastnum+'p'
			resolve()
			break
		default :
			 throw new Error('input correct log level.Level type : All,Debug,Warn,Info,Error')
		}
		})
	   })		
	}

	var getcmdoutput = function(cmd,callback){
	//	file,Fline,Lline,
		exec(cmd,function (err, stdout, stderr) {
	    	if(err){
	    		callback(err)
	    	}
	    	else
	    	{
	    	 callback(stdout)
	    	}
	    })
	}

	var obj={}
	var logcat=[]
	var All={}

	var getAllLine = function(){
	    return new Promise(function(resolve, reject) {
	    	getcmdoutput(cmdAllLine,function(AllLine){
	    	All.AllLine=AllLine
	    	resolve()
	    })
	   })
	}
	var getLine = function(){
	    return new Promise(function(resolve, reject) {
	    	getcmdoutput(cmdLine,function(Line){
	    		obj.Line = Line.split('\n')
	    		resolve()
	    })
	   })
	}


	var getDateTime = function(){
	    return new Promise(function(resolve, reject) {
	    	getcmdoutput(cmdDateTime,function(DateTime){
	    	obj.DateTime=DateTime.split('\n')
	    	resolve()
	    })
	   })
	}
	var getLevel = function(){
	    return new Promise(function(resolve, reject) {
	    	getcmdoutput(cmdLevel,function(Level){
	    		obj.Level=Level.split('\n')
	    		resolve()
	    })
	   })
	}

	var getTag = function(){
	    return new Promise(function(resolve, reject) {
	    	getcmdoutput(cmdTag,function(Tag){
	    		obj.Tag=Tag.split('\n')
	    		resolve()
	    })
	   })
	}

	var getPid = function(){
	    return new Promise(function(resolve, reject) {
	    	getcmdoutput(cmdPid,function(Pid){
	    		obj.Pid=Pid.split('\n')
	    		resolve()
	    })
	   })
	}


	var getText = function(){
	    return new Promise(function(resolve, reject) {
	    	getcmdoutput(cmdLogcat,function(textdata){
	    		obj.textdata=textdata.split('\r\n')
	    		resolve()
	    })
	   })
	}

	return getFilePath()
	.then(getAllLine)
	.then(getLine)
	.then(getDateTime)
	.then(getLevel)
	.then(getTag)
	.then(getPid)
	.then(getText)
	.then(function(){
		if (FilePath == undefined) {
			All.logcat="Install fail or start fail"
			return All
		}
		else{
		for (var i = 0; i < obj.Line.length-1; i++) {

			var data= {
			Line:obj.Line[i]
			,DateTime:obj.DateTime[i]
			,Level:obj.Level[i]
			,Pid:obj.Pid[i]
			,Tag:obj.Tag[i]
			,textdata:obj.textdata[i]
		}
		logcat.push(data)
		}
		All.logcat=logcat
		return All 
		}
	})
}

// deallog.getLogdata().then(function(str){
// 	console.log(str)
// })

