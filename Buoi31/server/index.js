// express
const express = require('express');
const app = express();

// socket.io
const server = require('http').Server(app);
const io = require('socket.io')(server);

io.on('connection', (socket) => {
    console.log(socket.id + ' ket noi');

    socket.emit('welcome', 'Xin Chao');
});
// noi - emit
// nghe - on

server.listen(3000);