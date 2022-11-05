
const mongoose = require('mongoose');

const GarbageSchema = mongoose.Schema(
    {
        title: {
            type: String,
            required: true,
        },

        descriptionModel: [
            {
                username: {
                    type: String,
                    required: true,
                    trim: true
                },
                dateTime: {
                    type: Date,
                    default: Date.now
                },
                description: {
                    type: String,
                    required: true
                }
            }
        ]
    }
);

module.exports = mongoose.model('Garbage_Schema', GarbageSchema);
