// express
const express = require('express');
const app = express();
// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.get('/load', function(req,res){
    res.json(
        {
            result:true,
            data:{
                name:'Quan Nguyen',
                phone:'123456789'
            },
            message:'load success'
        }
    );
});

app.post('/login', function(req,res){
    const {username, password} = req.body;
    if (username == 'admin' && password == '123') {
        res.json(
            {
                result:true,
                message:'login success',
                data:{
                    name:'Quan Nguyen',
                    phone:'99999999'
                }
            }
        )
    } else {
        res.json(
            {
                result:false,
                message:'login failure',
                data:{}
            }
        )
    };
});

app.listen(3000);