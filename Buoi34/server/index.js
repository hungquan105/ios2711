// express
const express = require('express');
const app = express();

// socket.io
const server = require('http').Server(app);
const io = require('socket.io')(server);

io.on('connection', function(socket){
    console.log(socket.id + ' connected');
    socket.on('move-picture', function(data){
        console.log(data);
        io.emit('server-send', data);
    });
});

server.listen(3002);