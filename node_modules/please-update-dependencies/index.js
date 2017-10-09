var fs = require('fs')
var path = require('path')
var url = require('url')
var util = require('util')
var chalk = require('chalk')

var semver = require('semver')

var ERROR = chalk.red('ERROR:')
var HINT = chalk.yellow('HINT:')
var BYPASS = 'ALLOW_OUTDATED_DEPENDENCIES'

function verify (mod) {
  var ctx = path.parse(mod.filename)
  var pkg = null

  // The calling module might not be in the root folder of the package. Go
  // through its parent folders until it's found.
  do {
    try {
      pkg = mod.require(path.resolve(ctx.dir, './package.json'))
      break
    } catch (err) {
      if (err.code !== 'MODULE_NOT_FOUND') {
        throw err
      }
      ctx = path.parse(ctx.dir)
      continue
    }
  } while (ctx.root !== ctx.dir)

  // Or did we not find it at all? That's bad.
  if (pkg === null) {
    console.error(ERROR, util.format(
      'No %s in any parent folder of %s',
      chalk.cyan('package.json'),
      chalk.inverse(mod.filename)
    ))
    return false
  }

  function validateDeps (deps, type) {
    return Object.keys(deps).reduce(function (state, name) {
      var wanted = deps[name]
      var depPkg = null

      // Is it a full URL? Can't handle those.
      var wantedUrl = url.parse(wanted)
      if (wantedUrl.protocol) {
        return state
      }

      // Or if it's a shorthand GitHub URL, we can't handle those either.
      if (/[^@].*\//.test(wanted)) {
        return state
      }

      try {
        depPkg = mod.require(path.join(name, './package'))
      } catch (err) {
        console.error(ERROR, type, util.format(
          '%s is not installed',
          chalk.cyan(name)
        ))
        return false
      }

      if (!semver.satisfies(depPkg.version, wanted)) {
        console.error(ERROR, type, util.format(
          '%s is currently %s but needs to be %s',
          chalk.cyan(name),
          chalk.red(depPkg.version),
          chalk.green(wanted)
        ))
        return false
      }

      return state
    }, true)
  }

  if (!validateDeps(pkg.dependencies || {}, 'dependency')) {
    try {
      fs.statSync(path.resolve(ctx.dir, 'yarn.lock'))
      console.error(HINT,
        'Please run `yarn`, `npm install` or equivalent before continuing.')
    } catch (err) {
      console.error(HINT,
        'Please run `npm install` or equivalent before continuing.')
    }
    return false
  }

  return true
}

module.exports.verify = verify

module.exports = function (mod) {
  if (process.env[BYPASS] === '1') {
    return
  }

  if (!verify(mod)) {
    console.error(HINT, util.format(
      'You can also export %s=1 to bypass verification.',
      BYPASS
    ))
    process.exit(1)
  }
}
