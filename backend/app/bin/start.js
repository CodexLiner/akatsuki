const express = require('express');
const MongooseDatabase = require('../mongoose/mongoose_database');
const app = express();
const userModel = require('../model/user_model')
const GarbageCollector = require('../model/garbage_collection')
const mongooseDatabase = new MongooseDatabase();

app.use(express.json());

app.use(
    express.urlencoded(
        {
            extended: true,
        })
);

mongooseDatabase.launch().then(()=>{
    app.listen(5000, (req,res) => {
        console.log("Server started at port 5000");
    });
});

app.post("/user/register", async (req, res)=> {

    console.log(req.body);
    const { uid } = req.body;
    console.log(uid)
    const user = await userModel.findOne({uid: uid});
    console.log(user)
    if(user){
        res.send(JSON.stringify(user))
    } else {
        await mongooseDatabase.registerUser(req.body)
            .then((user) => {
                res.send(user)
            });
    }
})

app.post("/user/login", async (req, res) => {
    const { uid } = req.body;
    console.log(uid)
    const user = await userModel.findOne({uid: uid});
    if(user){
        res.json(user)
    } else {
        res.send({ status: 'error', error: 'User doesnt exist'})
    }
});

app.post("/api/addGeneralCollection", async (req, res) => {
    await mongooseDatabase.insertGarbageCollection(req.body)
        .then((data) => {
            res.send(data);
        })
});

app.post("/api/addGoogleMarker", async (req, res) => {
    await mongooseDatabase.insertGoogleMarker(req.body)
        .then((data) => {
            res.send(data);
        })
});

app.get("/api/googleMarker", async (req, res) => {
    await mongooseDatabase.getAllGoogleMarker()
        .then((data) => {
            res.status(400).send(data);
        })
});

app.get("/api/generalCollection", async (req, res) => {
    await mongooseDatabase.getAllGarbageCollection()
        .then((data) => {
            res.status(400).send(data);
        })
});



app.put("/api/updateGeneralCollection/:title", async (req, res) => {

    await GarbageCollector.findOneAndUpdate(
        {title: req.body.title},
        {
            $push: {
                descriptionModel: req.body.descriptionModel
            }
        })
    const garbageCollector = await GarbageCollector.findOne({title: req.body.title})
    console.log(garbageCollector)
    res.send(garbageCollector)
});