import 'package:freezed_annotation/freezed_annotation.dart';
part 'google_marker_model.freezed.dart';
part 'google_marker_model.g.dart';

@freezed
class GoogleMarkerModel with _$GoogleMarkerModel {
  const factory GoogleMarkerModel({
    required double longitude,
    required double latitude,
    required String uid
  }) = _GoogleMarkerModel;

  factory GoogleMarkerModel.fromJson(Map<String, Object?> json) => _$GoogleMarkerModelFromJson(json);
}