// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeneralCollection _$$_GeneralCollectionFromJson(Map<String, dynamic> json) =>
    _$_GeneralCollection(
      title: json['title'] as String,
      descriptionModel: (json['descriptionModel'] as List<dynamic>)
          .map((e) => DescriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GeneralCollectionToJson(
        _$_GeneralCollection instance) =>
    <String, dynamic>{
      'title': instance.title,
      'descriptionModel': instance.descriptionModel,
    };
