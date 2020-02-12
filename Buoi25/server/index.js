// express
const express = require('express');
const app = express();
// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));
// pg
const { Pool } = require('pg');
var pool = null;
function connectPool(){
    pool = new Pool({
        user: 'postgres',
        host: 'localhost',
        database: 'Accounts',
        password: '123',
        port: 5432,
    })
};
// jwt
const jwt = require('jsonwebtoken');
const secret = 'khoapham.vn';

app.post('/login', function(req,res){
    var token = jwt.sign({
        username:'admin',
        name:'Quan Nguyen'
    },secret,{expiresIn:60});
    res.json({token:token});
});

app.post('/check', function(req,res){
    const token = req.body.token;
    if (token) {
        jwt.verify(token, secret, function(err, decoded){
            if (err) {
                console.log(err)
                return res.json({
                    result : false,
                    message : 'chua xac thuc',
                    data : {username:'abc',
                name:'bac'}
                });
            } else {
                req.decoded = decoded;
                return res.json({
                    result : true,
                    message : 'xac thuc',
                    data : {
                        username:decoded.username,
                        name:decoded.name
                    }
                });
            };
        });
    } else {
        res.json({
            result : false,
            message : 'chua xac thuc',
            data : {username:'abc',
            name:'bac'}
        })
    }
}); 

app.get('/', function(req, res){
    connectPool();
    const qr = `select * from "Users"`
    pool.query(qr, (err, result) => {
        console.log(err, result);
        res.json(result.rows);
        pool.end();
    });
});

app.listen(3000);