// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'google_marker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoogleMarkerModel _$GoogleMarkerModelFromJson(Map<String, dynamic> json) {
  return _GoogleMarkerModel.fromJson(json);
}

/// @nodoc
mixin _$GoogleMarkerModel {
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoogleMarkerModelCopyWith<GoogleMarkerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleMarkerModelCopyWith<$Res> {
  factory $GoogleMarkerModelCopyWith(
          GoogleMarkerModel value, $Res Function(GoogleMarkerModel) then) =
      _$GoogleMarkerModelCopyWithImpl<$Res, GoogleMarkerModel>;
  @useResult
  $Res call({double longitude, double latitude, DateTime dateTime, String uid});
}

/// @nodoc
class _$GoogleMarkerModelCopyWithImpl<$Res, $Val extends GoogleMarkerModel>
    implements $GoogleMarkerModelCopyWith<$Res> {
  _$GoogleMarkerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = null,
    Object? latitude = null,
    Object? dateTime = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleMarkerModelCopyWith<$Res>
    implements $GoogleMarkerModelCopyWith<$Res> {
  factory _$$_GoogleMarkerModelCopyWith(_$_GoogleMarkerModel value,
          $Res Function(_$_GoogleMarkerModel) then) =
      __$$_GoogleMarkerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double longitude, double latitude, DateTime dateTime, String uid});
}

/// @nodoc
class __$$_GoogleMarkerModelCopyWithImpl<$Res>
    extends _$GoogleMarkerModelCopyWithImpl<$Res, _$_GoogleMarkerModel>
    implements _$$_GoogleMarkerModelCopyWith<$Res> {
  __$$_GoogleMarkerModelCopyWithImpl(
      _$_GoogleMarkerModel _value, $Res Function(_$_GoogleMarkerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = null,
    Object? latitude = null,
    Object? dateTime = null,
    Object? uid = null,
  }) {
    return _then(_$_GoogleMarkerModel(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GoogleMarkerModel implements _GoogleMarkerModel {
  const _$_GoogleMarkerModel(
      {required this.longitude,
      required this.latitude,
      required this.dateTime,
      required this.uid});

  factory _$_GoogleMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$$_GoogleMarkerModelFromJson(json);

  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final DateTime dateTime;
  @override
  final String uid;

  @override
  String toString() {
    return 'GoogleMarkerModel(longitude: $longitude, latitude: $latitude, dateTime: $dateTime, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleMarkerModel &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, longitude, latitude, dateTime, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleMarkerModelCopyWith<_$_GoogleMarkerModel> get copyWith =>
      __$$_GoogleMarkerModelCopyWithImpl<_$_GoogleMarkerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoogleMarkerModelToJson(
      this,
    );
  }
}

abstract class _GoogleMarkerModel implements GoogleMarkerModel {
  const factory _GoogleMarkerModel(
      {required final double longitude,
      required final double latitude,
      required final DateTime dateTime,
      required final String uid}) = _$_GoogleMarkerModel;

  factory _GoogleMarkerModel.fromJson(Map<String, dynamic> json) =
      _$_GoogleMarkerModel.fromJson;

  @override
  double get longitude;
  @override
  double get latitude;
  @override
  DateTime get dateTime;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleMarkerModelCopyWith<_$_GoogleMarkerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
