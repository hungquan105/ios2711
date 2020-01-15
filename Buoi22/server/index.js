const express = require('express');
const app = express();

// route
app.get('/iOS', function(req,res){
    res.send({content:'kien thuc iOS'});
});

app.get('/PHP', function(req,res){
    res.send({content:'kien thuc PHP'});
});

app.get('/login/:username/:password', function(req,res){
    var username = req.params.username;
    var password = req.params.password;
    if (username == 'admin' && password == '123') {
        res.send('Welcome admin!');
    } else {
        res.send('Sai ten truy cap hoac mat ma');
    }
});

app.get('/phepcong/:so1/:so2', function(req,res){
    var so1 = parseInt(req.params.so1);
    var so2 = parseInt(req.params.so2);
    res.send('Tong hai so la: ' + (so1 + so2));
});

app.listen(3000);