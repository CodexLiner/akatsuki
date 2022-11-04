// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'general_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeneralCollection _$GeneralCollectionFromJson(Map<String, dynamic> json) {
  return _GeneralCollection.fromJson(json);
}

/// @nodoc
mixin _$GeneralCollection {
  String get title => throw _privateConstructorUsedError;
  List<DescriptionModel> get descriptionModel =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralCollectionCopyWith<GeneralCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralCollectionCopyWith<$Res> {
  factory $GeneralCollectionCopyWith(
          GeneralCollection value, $Res Function(GeneralCollection) then) =
      _$GeneralCollectionCopyWithImpl<$Res, GeneralCollection>;
  @useResult
  $Res call({String title, List<DescriptionModel> descriptionModel});
}

/// @nodoc
class _$GeneralCollectionCopyWithImpl<$Res, $Val extends GeneralCollection>
    implements $GeneralCollectionCopyWith<$Res> {
  _$GeneralCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? descriptionModel = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionModel: null == descriptionModel
          ? _value.descriptionModel
          : descriptionModel // ignore: cast_nullable_to_non_nullable
              as List<DescriptionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeneralCollectionCopyWith<$Res>
    implements $GeneralCollectionCopyWith<$Res> {
  factory _$$_GeneralCollectionCopyWith(_$_GeneralCollection value,
          $Res Function(_$_GeneralCollection) then) =
      __$$_GeneralCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<DescriptionModel> descriptionModel});
}

/// @nodoc
class __$$_GeneralCollectionCopyWithImpl<$Res>
    extends _$GeneralCollectionCopyWithImpl<$Res, _$_GeneralCollection>
    implements _$$_GeneralCollectionCopyWith<$Res> {
  __$$_GeneralCollectionCopyWithImpl(
      _$_GeneralCollection _value, $Res Function(_$_GeneralCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? descriptionModel = null,
  }) {
    return _then(_$_GeneralCollection(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionModel: null == descriptionModel
          ? _value._descriptionModel
          : descriptionModel // ignore: cast_nullable_to_non_nullable
              as List<DescriptionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeneralCollection implements _GeneralCollection {
  const _$_GeneralCollection(
      {required this.title,
      required final List<DescriptionModel> descriptionModel})
      : _descriptionModel = descriptionModel;

  factory _$_GeneralCollection.fromJson(Map<String, dynamic> json) =>
      _$$_GeneralCollectionFromJson(json);

  @override
  final String title;
  final List<DescriptionModel> _descriptionModel;
  @override
  List<DescriptionModel> get descriptionModel {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptionModel);
  }

  @override
  String toString() {
    return 'GeneralCollection(title: $title, descriptionModel: $descriptionModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralCollection &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._descriptionModel, _descriptionModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title,
      const DeepCollectionEquality().hash(_descriptionModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneralCollectionCopyWith<_$_GeneralCollection> get copyWith =>
      __$$_GeneralCollectionCopyWithImpl<_$_GeneralCollection>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeneralCollectionToJson(
      this,
    );
  }
}

abstract class _GeneralCollection implements GeneralCollection {
  const factory _GeneralCollection(
          {required final String title,
          required final List<DescriptionModel> descriptionModel}) =
      _$_GeneralCollection;

  factory _GeneralCollection.fromJson(Map<String, dynamic> json) =
      _$_GeneralCollection.fromJson;

  @override
  String get title;
  @override
  List<DescriptionModel> get descriptionModel;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralCollectionCopyWith<_$_GeneralCollection> get copyWith =>
      throw _privateConstructorUsedError;
}
