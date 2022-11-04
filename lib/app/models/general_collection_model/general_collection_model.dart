import 'package:freezed_annotation/freezed_annotation.dart';

import '../description_model/description_model.dart';

part 'general_collection_model.freezed.dart';
part 'general_collection_model.g.dart';

@freezed
class GeneralCollection with _$GeneralCollection{
  const factory GeneralCollection({
    required String title,
    required List<DescriptionModel> descriptionModel
  }) = _GeneralCollection;

  factory GeneralCollection.fromJson(Map<String, Object?> json) => _$GeneralCollectionFromJson(json);
}
