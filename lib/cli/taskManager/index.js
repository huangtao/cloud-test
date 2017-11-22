module.exports.command = 'taskManager'

module.exports.describe = 'start taskManager.'

module.exports.builder = function(yargs) {
  return yargs
}

module.exports.handler = function() {
  var taskManager = require('../../units/taskManager')
  taskManager()
}
