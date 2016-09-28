"use strict"

var http = require('http');
var Redis = require('ioredis');
var Server = require('rebound-server');


require('dotenv').config({
    path: '.env'
});

var env = process.env;



var nodeServer = http.Server(function (req, res) {
    res.writeHead(404);
    res.end();
}).listen(env.NODE_SERVER_PORT, function () { //port can be anything you want
    console.log('server started!');
});

var redis = new Redis(); //redis config must match laravel redis config to use the same db

var cache = new Redis(); //redis config must match etc... this will cache channel auth lookups as rebound:$channel_name:$user_id


var srv = new Server(nodeServer, redis, cache, env.NODE_REDIS_CACHE_EXPIRES); //last argument sets the expiry of channel auths - default = 86400 (1 day)
