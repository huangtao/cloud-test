# please-update-dependencies

[![npm](https://img.shields.io/npm/v/please-update-dependencies.svg)](https://www.npmjs.com/package/please-update-dependencies)

**please-update-dependencies** is a useful addition to [Node.js](https://nodejs.org/) CLI applications. It checks that currently installed dependencies satisfy the requirements set in your `package.json`, and won't let the user continue till they've updated the dependencies.

![Example](example.png?raw=true)

## Benefits/philosophy

### Pros

* Easy to understand error messages.
* Encourages users to solve issues by themselves rather than overloading the maintainer with questions or issues.
* No output when nothing's wrong.

### Cons

* If you release a botched update and forget to release a dependency that you've bumped up, users can't run your app.
* Only [semver](http://semver.org/) compatible dependencies are checked.
  - If you use URLs as dependencies, they will simply be ignored.
* Slight but mostly unnoticeable overhead.

## Installation

Using [yarn](https://yarnpkg.com/):

```sh
yarn add please-update-dependencies
```

Using [npm](https://www.npmjs.com/):

```sh
npm install --save please-update-dependencies
```

Now, in your main file, before anything else, insert the following line:

```js
require('please-update-dependencies')(module)
```


If you're using [Babel](https://babeljs.io/) or similar, you probably have an existing entry point. You should put the line there before activating babel or anything else.

If you don't put the line as the first thing in your file, you risk running into incompatibilities before any checks even run.

The dependency check will run every time the binary is invoked, unless you've exported `ALLOW_OUTDATED_DEPENDENCIES=1`. It'll find the nearest `package.json` (either in the same folder or a parent folder) and check things from there.

## License

See [LICENSE](LICENSE).
