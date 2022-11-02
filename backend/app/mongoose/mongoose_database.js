const config = require("../config/config");
const mongoose = require("mongoose");
const userModel = require('../models/user_model');

class Mongoose_database {
    constructor() {
        this.mongoUrl = config.mongoUrl.url
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

    async registerUser(data){
        const user = userModel({
            username: data.username,
            email: data.email,
            password: data.password
        });
        return await user.save();
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

module.exports = Mongoose_database;