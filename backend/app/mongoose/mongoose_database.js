const mongoose = require('mongoose');
const config = require("../config/config");
const UserModel = require('../model/user_model');
const GarbageCollectionModel = require('../model/garbage_collection');
const GoogleMarker = require('../model/google_map_model');

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
        const item = new UserModel({
            username: data.username,
            user_email: data.user_email,
            user_password: data.user_password,
            uid: data.uid
        });
        return await item.save();
    }

    async insertGarbageCollection(data) {
            const item = GarbageCollectionModel({
                title: data.title,
                descriptionModel: data.descriptionModel
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

    async getAllGarbageCollection() {
        return GarbageCollectionModel.find({});
    }

    async getAllGoogleMarker() {
        return GoogleMarker.find({});
    }
     async insertGoogleMarker(data) {
     console.log(data)
                const item = new GoogleMarker({
                    markers: data.markers
                });
                return await item.save();
            }
}

module.exports = MongooseBackend;