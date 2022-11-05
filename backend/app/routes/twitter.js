const express = require("express");
const router = express.Router();
const multer = require('multer');
const fs = require('fs')
const twiiter_model = require('../model/twiiterModel')

//storage setup
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        if(!file){
            cb.sendStatus(404)
        }
        fs.mkdir('./uploads/',(err)=>{
            cb(null, './uploads/');
         });
    //    cb(null, 'uploads/');
    },
    filename: function (req, file, cb) {
       cb(null, Date.now() + '-' + file.originalname);
    }
 });
 // multer
 var upload = multer({ storage: storage });

router.post('/' , upload.single('image') , async (request , response)=>{
    console.log(request.body)

    if(true){
        const model = new twiiter_model({
            path : "uploads" ,
            name : request.body.name,
            lat : "102022",
            long : "202202"
        })
        const result = await model.save()
        response.send({"success" : result})
    }
    

})


// export
module.exports = router