// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_marker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoogleMarkerModel _$$_GoogleMarkerModelFromJson(Map<String, dynamic> json) =>
    _$_GoogleMarkerModel(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_GoogleMarkerModelToJson(
        _$_GoogleMarkerModel instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'uid': instance.uid,
    };
