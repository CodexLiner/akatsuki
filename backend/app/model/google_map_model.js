
const mongoose = require('mongoose');

const GoogleMarkerSchema = mongoose.Schema(
    {
        markers: [
            {
                lat: {
                    type: Location().lat,
                    required: true
                },
                long: {
                    type: Location().long,
                    required: true
                },
                uid:{
                    type: String,
                    required: true,
                },
                time:{
                    type: Date,
                    required: true
                }

            }
        ]
    }
);

module.exports = mongoose.model('Google_Marker_Schema', GoogleMarkerSchema);
