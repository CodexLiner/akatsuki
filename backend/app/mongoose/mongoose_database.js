const mongoose = require('mongoose');
const config = require("../config/config");
const UserModel = require('../model/user_model');
const userModel = require("../model/user_model");

class MongooseBackend{

    constructor() {
        this.mongoUrl = config.mongodb.url;
        this.client = null;
    }

    async connect() {

        mongoose.connect( this.mongoUrl, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        })
            .then((client) => {
                this.client = client;
                return this.client;
            });
    }

    async registerUser(data) {
        const item = UserModel({
            username: data.username,
            email: data.email,
            password: data.password,
            uid: data.uid
        });
        return await item.save();
    }

    async launch() {

        console.log("Connect to mongoose");
        console.log('mongoose-connect');

        await this.connect()
            .then(() => {
                console.log('Successfully connected to mongoose');
            }).catch((err) => {
                console.log( err + ' while connecting to mongoose');
            });
    }
}

module.exports = MongooseBackend;