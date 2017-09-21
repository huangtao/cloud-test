var _ = require('lodash')

var s = []

var tt = [{tag: '1', ww: 'ww'}, {tag: '34'}]


var b = _.filter(tt, function(o) {

  return _.includes(s, o.tag)
})

console.log(b)
