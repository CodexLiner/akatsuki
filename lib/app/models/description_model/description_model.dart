import 'package:freezed_annotation/freezed_annotation.dart';

part 'description_model.freezed.dart';
part 'description_model.g.dart';

@freezed
class DescriptionModel with _$DescriptionModel{
  const factory DescriptionModel({
    required DateTime dateTime,
    required String username,
    required String description
  }) = _DescriptionModel;

  factory DescriptionModel.fromJson(Map<String, Object?> json) => _$DescriptionModelFromJson(json);
}