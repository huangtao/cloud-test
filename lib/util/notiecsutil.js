/**
 * Created by GuixiangGui on 2016/10/13.
 */


var request = require('request')
var util = require('util')
var rawurlencode = require('locutus/php/url/rawurlencode')
var urlencode = require('locutus/php/url/urlencode')
var array_map = require('locutus/php/array/array_map')
var is_scalar = require('locutus/php/var/is_scalar')
var is_array = require('locutus/php/var/is_array')
var str_replace = require('locutus/php/strings/str_replace')
var md5 = require('locutus/php/strings/md5')
var rtrim = require('locutus/php/strings/rtrim')
var isset = require('locutus/php/var/isset')

var logger = require('./logger')


module.exports = function (notiecsData, callback) {
  var log = logger.createLogger('notiecsutil')

  var securit_key = 'a2d4e316aceb94455cc2b1127db561e9'
  var from = 100017  //appid
  var masterUrl = 'http://notice.oa.com/index.php'

  var to = notiecsData.sendTo
  var msg = notiecsData.body
  var type = notiecsData.type
  var setting = notiecsData.setting
  var title = notiecsData.title

  function get_sig(from, msg, to) {
    var query_path = util.format('from=%s&msg=%s&to=%s'
      ,url_encode_rfc3986(from)
      ,url_encode_rfc3986(msg)
      ,url_encode_rfc3986(to)
    )
    return md5(query_path + securit_key)
  }

  function url_encode_rfc3986(input) {
    if(is_array(input)){
      array_map(url_encode_rfc3986, input)
    }else if(is_scalar(input)){
      return str_replace( '+' , ' ' , str_replace( '%7E' , '~' , rawurlencode( input)))
    }else{
      return ''
    }
  }

  var sig = get_sig(from, msg, to)
  msg = urlencode(msg)
  if(title){
    title = urlencode(title)
  }else{
    title = urlencode('')
  }

  var typeStr = ''
  var group = ''
  var user = ''
  var rtx_type=''
  if(type.sms){
    typeStr += 'sms,'
  }
  if(type.rtx){
    typeStr += 'rtx,'
  }
  if(type.mail){
    typeStr += 'mail,'
  }
  typeStr = rtrim(typeStr, ',')

  if(isset(to.group)){
    group = to.group
  }
  if(isset(to.user)){
    user = to.user
  }

  if(type.rtx  && isset(setting.rtx_type)){
    rtx_type = setting.rtx_type
  }

  var url = masterUrl + util.format(
      '/notice_send/sdk?&from=%s&msg=%s&sig=%s&key=%s&type=%s&title=%s&group=%s&user=%s&rtx_type=%s'
    ,from ,msg ,sig ,securit_key ,typeStr ,title ,group ,user ,rtx_type)

  request(url, callback)
}
