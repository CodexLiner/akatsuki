
const mongoose = require('mongoose');

const UserSchema = mongoose.Schema(
    {
        uid: {
            type: String,
        },
        user_email: {
            type: String,
            required: true,
            unique: true,
            trim: true
        },
        user_password: {
            type: String,
            required: true,
            trim: true
        },
        username: {
            type: String,
            required: true,
            trim: true
        },
        createdAt: {
            type: Date,
            default: Date.now
        }
    }
);

module.exports = mongoose.model('User_Schema', UserSchema);
