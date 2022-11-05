const express = require('express');
const MongooseDatabase = require('../mongoose/mongoose_database');
const app = express();
const userModel = require('../model/user_model')
const mongooseDatabase = new MongooseDatabase();

app.use(express.json());

app.use(
    express.urlencoded(
        {
            extended: true,
        })
);

// routes import
const twiiter_route = require("../routes/twitter")


//twiiter route
app.use("/twitter" , twiiter_route)


// registration route
app.post("/user/register", async (req, res)=> {

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
// login route
app.post("/user/login", async (req, res) => {
    const { uid } = req.body;
    console.log(uid)
    const user = await userModel.findOne({uid: uid});
    if(user){
        res.send(user)
    } else {
        res.send({ status: 'error', error: 'User doesnt exist'})
    }
});

// starting server
mongooseDatabase.launch().then(()=>{
    app.listen(5000, (req,res) => {
        console.log("Server started at port 5000");
    });
});
