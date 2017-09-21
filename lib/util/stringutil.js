/*
  2017/3/22
*/

module.exports.format = function (raw, placeHolder, width) {
    var raw = raw + ''
    var placeHolder = placeHolder + ''
    if(raw.length >= width) {
        return raw
    }
    var rawlength = raw.length
    for(var i = 0; i < width - rawlength; i++) {
        raw = placeHolder + raw
    }
    return raw
}
