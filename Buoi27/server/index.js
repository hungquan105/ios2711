// express
const express = require('express');
const app = express();
app.use(express.static('upload'));
// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());
// pg
const {Pool} = require('pg');
var pool = null;
function connectPool(){
    pool = new Pool({
        user: 'postgres',
        host: 'localhost',
        database: 'Accounts',
        password: '123',
        port: 5432,
    });
};
// multer
const multer = require('multer');
const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, 'upload/')
    },
    filename: function(req, file, cb){
        cb(null, file.originalname)
    }
});
function fileFilter(req, file, cb) {
    if (file.mimetype !== 'image/png') {
        req.fileValidationError = 'wrong mimeType';
        return cb(null, false);
    }
    cb(null, true);
}
const upload = multer({ storage: storage, fileFilter: fileFilter});

app.post('/profile', upload.single('avatar'), function (req, res, next) {
    // req.file is the `avatar` file
    // req.body will hold the text fields, if there were any
    if (req.fileValidationError) {
        return res.end(req.fileValidationError);
    }
    const avatar = req.file;
    console.log(avatar);
    res.json({avatar:avatar});
});

app.post('/photos/upload', upload.array('photos', 12), function (req, res, next) {
    // req.files is array of `photos` files
    // req.body will contain the text fields, if there were any
    
    const photos = req.files;
    
    photos.forEach(function (img) {
        connectPool();
        pool.query(`insert into "Photo" ("NAME") values ('${img.filename}')`, function (err, result) {
            console.log(result);
        });
        pool.end();
    });
    
    res.json({result:'OK'});
});

var cpUpload = upload.fields([{ name: 'avatar', maxCount: 1 }, { name: 'gallery', maxCount: 8 }])
app.post('/cool-profile', cpUpload, function (req, res, next) {
  // req.files is an object (String -> Array) where fieldname is the key, and the value is array of files
  //
  // e.g.
  //  req.files['avatar'][0] -> File
  //  req.files['gallery'] -> Array
  //
  // req.body will contain the text fields, if there were any
    const profile = req.files;
    res.json({profile:profile});
})

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