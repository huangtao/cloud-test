'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _child_process = require('child_process');

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _events = require('events');

var _events2 = _interopRequireDefault(_events);

var _net = require('net');

var _net2 = _interopRequireDefault(_net);

var _bluebird = require('bluebird');

var _bluebird2 = _interopRequireDefault(_bluebird);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var COMMAND_TYPES = {
    ACTION: 'action',
    SHUTDOWN: 'shutdown'
};

var Test2 = function () {
    function Test2() {
        _classCallCheck(this, Test2);
    }

    _createClass(Test2, [{
        key: 'start',
        value: function start() {
            var _this = this;

            return new _bluebird2.default(function (resolve, reject) {
                try {
                    /*                var socket1=new net.Socket({
                                        readable:true,
                                        writable:true,
                                        allowHalfOpen:true
                                    })
                    
                                    socket1.connect({
                                        host:"localhost",
                                        port:4724
                                    },function(){
                                        console.log(" server connected")
                                        resolve(socket1)
                                    });*/

                    _this.socketClient = _net2.default.connect(4724);
                    // Windows: the socket errors out when ADB restarts. Let's catch it to avoid crashing.
                    _this.socketClient.on('error', function (err) {
                        console.log(err);
                    });
                    _this.socketClient.once('connect', function () {
                        console.log("Android testbundle socket is now connected");
                        resolve(_this.socketClient);
                    });

                    _this.socketClient.on('data', function (data) {
                        console.log(data.toString());
                        //client.end();
                    });
                } catch (err) {
                    reject(err);
                }
            });
        }
    }]);

    return Test2;
}();

var t = new Test2();
t.start().then(function (client) {
    if (!client) {
        console.log('empty');
    } else {
        console.log('not empty');
        var cmd = { "cmd": "action", "action": "find", "params": { "strategy": "name", "selector": "buSignupBtn", "context": "", "multiple": false } };
        var cmd2 = {"cmd":"action","action":"element:click","params":{"elementId":"1"}}
        var cmd3 = {"cmd":"shutdown","action":"element:click","params":{"elementId":"1"}}
        var cmdJson = JSON.stringify(cmd) + '\n';
        var cmdJson2 = JSON.stringify(cmd2) + '\n';
        var cmdJson3 = JSON.stringify(cmd3) + '\n';
        client.write(cmdJson);
    }
});
