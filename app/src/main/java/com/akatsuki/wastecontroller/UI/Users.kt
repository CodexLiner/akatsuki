package com.akatsuki.wastecontroller.UI

data class Users (
    var user_email: String = "",
    var user_password: String = "",
    var uid: String = "",
    var username: String = ""
)

@freezed
class GoogleMarkerSchema with _$GoogleMarkerSchema{
    const factory GoogleMarkerSchema({
        required LocationData markers,
    }) = _GoogleMarkerSchema;

    factory GoogleMarkerSchema.fromJson(Map<String, Object?> json) => _GoogleMarkerSchemaFromJson(json);
}

@freezed
class LocationData with _$LocationData{
    const factory LocationData({
        required LatLong lat,
        required LatLong long,
        required UserId uid,
        required TimeData time
    }) = _GoogleMarkerSchema;

    factory LocationData.fromJson(Map<String, Object?> json) => _LocationDataFromJson(json);
}

@freezed
class LatLong with _$LatLong{
    const factory LatLong({
        required Point type,
        required Boolean required,
    }) = _LatLong;

    factory LatLong.fromJson(Map<String, Object?> json) => _$LatLongFromJson(json);
}


@freezed
class UserId with _$UserId{
    const factory Longitude({
        required String type,
        required Boolean required,
    }) = _UserId;

    factory UserId.fromJson(Map<String, Object?> json) => _$UserIdFromJson(json);
}
