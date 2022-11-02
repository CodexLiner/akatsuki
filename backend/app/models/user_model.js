const mongoose = require('mongoose');

UserSchema = mongoose.Schema(
    {
        username: {
            type: String,
            trim: true,
            required: true
        },
        email: {
            type: String,
            unique: true,
            lowercase: true,
            trim: true,
            required: true
        },
        password: {
            type: String
        },
        created: {
            type: Date,
            default: Date.now
        }
    }
);

module.exports = mongoose.model('user_model', UserSchema);
