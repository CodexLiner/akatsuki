
const mongoose = require('mongoose');

const GoogleMarkerSchema = mongoose.Schema(
    {
        markers: [
            {
                lat: {
                    type: mongoose.Decimal128,
                    required: true
                },
                long: {
                    type: mongoose.Decimal128,
                    required: true
                },
                uid:{
                    type: String,
                    required: true,
                },
                dateTime:{
                    type: Date,
                    default: Date.now
                }

            }
        ]
    }
);

module.exports = mongoose.model('Google_Marker_Schema', GoogleMarkerSchema);
