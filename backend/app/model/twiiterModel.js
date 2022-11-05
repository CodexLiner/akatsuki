const mongoose = require("mongoose");

const twitter_model = mongoose.Schema({
    path : { type: String, required: true },
    name : { type: String, required: true },
    lat : { type: String, required: true },
    long : { type: String, required: true },
})

module.exports = mongoose.model("twiiter_model" , twitter_model)