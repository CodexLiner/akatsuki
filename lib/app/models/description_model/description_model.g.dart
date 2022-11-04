// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'description_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DescriptionModel _$$_DescriptionModelFromJson(Map<String, dynamic> json) =>
    _$_DescriptionModel(
      dateTime: DateTime.parse(json['dateTime'] as String),
      username: json['username'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_DescriptionModelToJson(_$_DescriptionModel instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'username': instance.username,
      'description': instance.description,
    };
