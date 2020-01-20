const express = require('express');
const app = express();

// body-parser
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));

app.get('/welcome', function(req,res){
    res.send('Welcome Admin');
});

app.get('/login/:username/:password', function(req,res){
    const username = req.params.username;
    const password = req.params.password;
    if (username == 'admin' && password == '123') {
        res.send('Welcome Admin');
    } else {
        res.send('Sai username hoac password');
    };
});

app.post('/login', function(req,res){
    const username = req.body.username;
    const password = req.body.password;
    if (username == 'admin' && password == '123') {
        res.json({result:true,message:'Welcome Admin'});
    } else {
        res.json({result:false,message:'Sai username hoac password'});
    };
});

app.listen(3000);