// express
const express = require('express');
const app = express();
// socket.io
const server = require('http').Server(app);
const io = require('socket.io')(server);

io.on('connection', function(socket){
    console.log(socket.id + ' connected');
    // server se lang nghe (on) - data
    socket.on('chat', function(data){
        console.log(data)
        // gui cho tat ca tru nguoi gui
        socket.broadcast.emit('nguoinhan', data);
        // gui cho chinh minh
            // socket.emit
    }); 
});

server.listen(3000);