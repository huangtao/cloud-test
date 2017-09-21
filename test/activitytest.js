/**
 * Created by GuixiangGui on 2016/12/19.
 */
var activityTest = require('../lib/units/activity/test')
var testutil = require('../lib/util/testutil')
var log = require('../lib/util/logger').createLogger('activitytest')
var options = {
  // serial: '4d00fd1502ba307b'
  serial: 'IN89MNGI99999999'
  , screenpath: '/var/stf/file/activityscreen/test/'
  // , url:  'http://mvspbt01.ifere.com/?m=activities&p=index&appid=9300&api={"mid":"8000005","sid":0,"version":"5","sig":"","api":273694761}&#act/8832'
  , activityUrl: 'http://192.168.204.68/operating/web/index.php?m=activities&p=index&appid=9009&api={"mid":"121","clientid":"1","sid":"101","version":"5","versions":"5","appid":"207","sitemid":"123456"}&#act/8140'
  , screenOrientation: 'PORTRAIT'
}

var taskid = 'test'

activityTest(options, taskid, '', function () {
  console.log('finish')
})
