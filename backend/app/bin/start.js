const express = require('express');
const MongooseDatabase = require('../mongoose/mongoose_database');
const bcrypt = require("bcrypt");
const UserModel = require('../models/user_model');
const jwt = require('jsonwebtoken');
const app = express();
const mongooseDatabase = new MongooseDatabase();

app.use(
    express.urlencoded(
        {extended: true}
    )
);
app.use(express.json());

mongooseDatabase.launch()
    .then(() => {
        app.listen(5000, () => {
            console.log("Server started at port 5000");
        });
    });

app.post('/user/register', async (req, res) => {
    const { email, password: plainTextPassword } = req.body;
    const password = await bcrypt.hash(plainTextPassword, 10);

    try {
        const response = await UserModel.create({
            email,
            password
        });
        await mongooseDatabase.registerUser({
            username: req.body.username,
            email: email,
            password: password
        }).then((res) => {
            return res.json(res);
        });
        console.log('User created successfully: ', response)
    } catch (error) {
        if (error.code === 11000) {
            // duplicate key
            return res.json({ status: 'error', error: 'Username already in use' })
        }
        throw error
    }

    res.json({ status: 'ok' })
});

app.post('/user/login', async (req, res) => {
    const { email, password } = req.body
    const user = await UserModel.findOne({ email }).lean()

    if (!user) {
        return res.json({ status: 'error', error: 'Invalid username/password' })
    }

    let jwtSecretKey = process.env.JWT_SECRET_KEY;
    let data = {
            id: user._id,
            email: user.email
        };
    if (await bcrypt.compare(password, user.password)) {

        const token = jwt.sign(data, jwtSecretKey)
        return res.json({ status: 'ok', data: token })
    }
    res.json({ status: 'error', error: 'Invalid username/password' })
});

app.get("/user/validateToken", (req, res) => {

    const tokenHeaderKey = process.env.TOKEN_HEADER_KEY;
    const jwtSecretKey = process.env.JWT_SECRET_KEY;

    try {
        const token = req.header(tokenHeaderKey);

        const verified = jwt.verify(token, jwtSecretKey);
        if(verified){
            return res.send("Successfully Verified");
        }else{
            return res.status(401).send(error);
        }
    } catch (error) {
        return res.status(401).send(error);
    }
});
