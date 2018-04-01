const express = require('express');
const path = require('path');
const multer = require('multer');
var moment = require('moment');
moment.locale('zh-cn');
const upload = multer({
    dest: './public/tmp'
});
const fs = require('fs');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(express.static('./public'));
var async = require('async');
var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'sqld.duapp.com',
    user: 'c0569786395f4bf7925ee337ae2a32fe',
    password: '0b59eab2097b450ba7c003bdbc52a64f',
    database: 'eDBlOMlDPCNIAMFjOOSB',
    port: 4050,
});
app.get('/', (req, res) => {
    res.sendFile(path.resolve('./views/index.html'))
});
app.get('/api/demos', function (req, res) {
    let sql = `select * from demos group by times desc`;
    connection.query(sql, (err, r) => {
        res.json(r)
    })
});
app.get('/api/demos_liu', function (req, res) {
    let ids = req.query.ids;
    let pa = parseInt(req.query.pa) + 1;
    let sql2 = `UPDATE demos SET pages = ? WHERE id = ?`;
    let sql = `select * from demos group by times desc`;
    connection.query(sql2, [pa, ids], (err, s) => {
        connection.query(sql, (err, r) => {
            res.json(r)
        })
    })
});
app.get('/api/notes', function (req, res) {
    let sql = `select * from notes group by times desc`;
    connection.query(sql, (err, r) => {
        r.forEach((v, i) => {
            v.nub = i + 1
            v.times = moment(v.times).format("YYYY年 MMM Do,dddd,a h:mm:ss");;
        });
        res.json(r)
    })
});
app.get('/api/notes_liu', function (req, res) {
    let ids = req.query.ids;
    let pa = parseInt(req.query.pa) + 1;
    let sql2 = `UPDATE notes SET pages = ? WHERE id = ?`;
    let sql = `select * from notes group by times desc`;
    connection.query(sql2, [pa, ids], (err, s) => {
        connection.query(sql, (err, r) => {
            r.forEach((v, i) => {
                v.nub = i + 1
                v.times = moment(v.times).format("YYYY年 MMM Do,dddd,a h:mm:ss");;
            });
            res.json(r)
        })
    })
});
app.get('/api/notes2', function (req, res) {
    let sql = `select * from notes group by times desc`;
    connection.query(sql, (err, r) => {
        r.forEach((v, i) => {
            v.nub = i + 1
            v.times = moment(v.times).format("YYYY年 MMM Do");;
        });
        res.json(r)
    })
});
app.get('/api/notes_sou', function (req, res) {
    let sou = req.query.sou;

    connection.query(`select * from notes where name like '%${sou}%' or card like '%${sou}%'  group by times desc`, (err, r) => {
        r.forEach((v, i) => {
            v.nub = i + 1
            v.times = moment(v.times).format("YYYY年 MMM Do");;
        });
        res.json(r)
    })
});
app.post('/api/login', function (req, res) {
    let { user, password } = req.body;
    let sql = `select * from user where zhanghao = ? and pass = ?`;
    connection.query(sql, [user, password], (err, r) => {
        if (r.length) {
            res.json({ state: 200 })
        } else {
            res.json({ state: 400 })
        }
    })
})
app.post('/api/zpxz', function (req, res) {
    let name = req.body.name;
    let contnet = req.body.desc;
    let card = req.body.gjz;
    let calss = req.body.clas;
    let url = req.body.urls;
    let date = req.body.date.slice(0, 10);
    let time = req.body.time;
    let times = date + ' ' + time;
    let imgs = req.body.imgs;

    let sql = `INSERT INTO demos (name,content,card,imgs,class,url,times) VALUES ('${name}','${contnet}','${card}','${imgs}','${calss}','${url}','${times}')`;

    connection.query(sql, (err, r) => {
        if (err) {
            res.json({ state: 400 })
        } else {
            res.json({ state: 200 })
        }
    })
})
app.post('/img/upload', upload.single('f'), (req, res) => {
    let name = new Date().valueOf();
    let ext = path.extname(req.file.originalname);
    let oldPath = path.join('./public/tmp', req.file.filename);
    let newPath = path.join('./public/img', name + ext);
    fs.rename(
        oldPath,
        newPath,
        () => res.json('/img/' + name + ext)
    )
})
app.post('/api/bjxz', function (req, res) {
    let name = req.body.name;
    let content = req.body.desc;
    let card = req.body.gjz;
    let date = req.body.date.slice(0, 10);
    let time = req.body.time;
    let times = date + ' ' + time;

    let sql = `INSERT INTO notes (name,content,card,times) VALUES ('${name}','${content}','${card}','${times}')`;

    connection.query(sql, (err, r) => {
        if (err) {
            res.json({ state: 400 })
        } else {
            res.json({ state: 200 })
        }
    })
});
app.get('/api/notes_del', (req, res) => {
    let id = req.query.id;
    let sql = `DELETE FROM notes WHERE id = ?`;
    let sql2 = `select * from notes group by times desc`;
    connection.query(sql, [id], (err, r) => {
        connection.query(sql2, (err, r) => res.json(r))
    })
})
app.get('/api/demos_del', (req, res) => {
    let id = req.query.id;
    let sql = `DELETE FROM demos WHERE id = ?`;
    let sql2 = `select * from demos group by times desc`;
    connection.query(sql, [id], (err, r) => {
        connection.query(sql2, (err, r) => res.json(r))
    })
})
app.post('/api/zlgx', function (req, res) {
    let webs = req.body.name;
    let zym = req.body.desc;
    let name = req.body.gjz;
    let jie = req.body.clas;
    let fot = req.body.urls;
    let date = req.body.date.slice(0, 10);
    let time = req.body.time;
    let times = date + ' ' + time;
    let imgs = req.body.imgs;

    let sql = `UPDATE grzl SET 
    webs = ?,zym = ?, name = ?, jie = ?, fot = ?, times = ?, imgs = ?
    WHERE id = 1`;
    connection.query(sql, [webs, zym, name, jie, fot, times, imgs], (err, r) => {
        if (err) {
            res.json({ state: 400 })
        } else {
            res.json({ state: 200 })
        }
    })
})
app.get('/api/wzzl', function (req, res) {
    let sql = `select * from grzl`;
    connection.query(sql, (err, r) => {
        r.forEach((v) => {
            v.times = moment(v.times).format("YYYY年MMMDo");;
        });
        res.json(r)
    })
});
/*app.post('/api/login',function (req,res) {
    let {user,password} = req.body;
    let sql = `select * from user where email = ? and pass = ?`;
    connection.query(sql,[user,password],(err,r)=>{
            if (r.length){
                res.json({state:200})
            }else {
                res.json({state:400})
            }

    })


})
app.get('/api/keceng_list',(req,res)=>{
    let sql = `
    SELECT
  course.*,dir.name AS d_name,typ.name as t_name,cul.name as c_name
FROM
  course,dir,typ,cul
WHERE
  \`dir_id\` = dir.id
AND
  \`typ_id\` = typ.id
AND
  \`cul_id\` = cul.id`;
    connection.query(sql,(err,r)=>res.json(r))
});
app.get('/api/keceng_del',(req,res)=>{
    let id = req.query.id;
    let sql =`DELETE FROM course WHERE id = ?`;
    let sql2 = `
    SELECT
  course.*,dir.name AS d_name,typ.name as t_name,cul.name as c_name
FROM
  course,dir,typ,cul
WHERE
  \`dir_id\` = dir.id
AND
  \`typ_id\` = typ.id
AND
  \`cul_id\` = cul.id`;
    connection.query(sql,[id],(err,r)=>{
        connection.query(sql2,(err,r)=>res.json(r))
    })
})*/
app.listen(18080);