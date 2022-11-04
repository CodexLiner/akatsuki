
const mongoose = require('mongoose');

const GeneralSchema = mongoose.Schema(
    {

        title :{
            type: String,
            required: true,
        },
        markers: [
            {
                username:{
                    type: String,
                    required: true,
                },
                description:{
                    type: String,
                    required: true
                },
                time:{
                    type: Date,
                    default: Date.now

                }
            }
        ]
    }
);

module.exports = mongoose.model('General_Schema', GeneralSchema);
