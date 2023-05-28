// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pass_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PassModel _$PassModelFromJson(Map<String, dynamic> json) {
  return _PassModel.fromJson(json);
}

/// @nodoc
mixin _$PassModel {
  String get consumerUid => throw _privateConstructorUsedError;
  String get farmerUid => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get expirationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassModelCopyWith<PassModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassModelCopyWith<$Res> {
  factory $PassModelCopyWith(PassModel value, $Res Function(PassModel) then) =
      _$PassModelCopyWithImpl<$Res, PassModel>;
  @useResult
  $Res call(
      {String consumerUid,
      String farmerUid,
      @TimestampDateTimeConverter() DateTime? expirationDate});
}

/// @nodoc
class _$PassModelCopyWithImpl<$Res, $Val extends PassModel>
    implements $PassModelCopyWith<$Res> {
  _$PassModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consumerUid = null,
    Object? farmerUid = null,
    Object? expirationDate = freezed,
  }) {
    return _then(_value.copyWith(
      consumerUid: null == consumerUid
          ? _value.consumerUid
          : consumerUid // ignore: cast_nullable_to_non_nullable
              as String,
      farmerUid: null == farmerUid
          ? _value.farmerUid
          : farmerUid // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassModelCopyWith<$Res> implements $PassModelCopyWith<$Res> {
  factory _$$_PassModelCopyWith(
          _$_PassModel value, $Res Function(_$_PassModel) then) =
      __$$_PassModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String consumerUid,
      String farmerUid,
      @TimestampDateTimeConverter() DateTime? expirationDate});
}

/// @nodoc
class __$$_PassModelCopyWithImpl<$Res>
    extends _$PassModelCopyWithImpl<$Res, _$_PassModel>
    implements _$$_PassModelCopyWith<$Res> {
  __$$_PassModelCopyWithImpl(
      _$_PassModel _value, $Res Function(_$_PassModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consumerUid = null,
    Object? farmerUid = null,
    Object? expirationDate = freezed,
  }) {
    return _then(_$_PassModel(
      consumerUid: null == consumerUid
          ? _value.consumerUid
          : consumerUid // ignore: cast_nullable_to_non_nullable
              as String,
      farmerUid: null == farmerUid
          ? _value.farmerUid
          : farmerUid // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PassModel implements _PassModel {
  const _$_PassModel(
      {this.consumerUid = '',
      this.farmerUid = '',
      @TimestampDateTimeConverter() this.expirationDate});

  factory _$_PassModel.fromJson(Map<String, dynamic> json) =>
      _$$_PassModelFromJson(json);

  @override
  @JsonKey()
  final String consumerUid;
  @override
  @JsonKey()
  final String farmerUid;
  @override
  @TimestampDateTimeConverter()
  final DateTime? expirationDate;

  @override
  String toString() {
    return 'PassModel(consumerUid: $consumerUid, farmerUid: $farmerUid, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PassModel &&
            (identical(other.consumerUid, consumerUid) ||
                other.consumerUid == consumerUid) &&
            (identical(other.farmerUid, farmerUid) ||
                other.farmerUid == farmerUid) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, consumerUid, farmerUid, expirationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassModelCopyWith<_$_PassModel> get copyWith =>
      __$$_PassModelCopyWithImpl<_$_PassModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PassModelToJson(
      this,
    );
  }
}

abstract class _PassModel implements PassModel {
  const factory _PassModel(
          {final String consumerUid,
          final String farmerUid,
          @TimestampDateTimeConverter() final DateTime? expirationDate}) =
      _$_PassModel;

  factory _PassModel.fromJson(Map<String, dynamic> json) =
      _$_PassModel.fromJson;

  @override
  String get consumerUid;
  @override
  String get farmerUid;
  @override
  @TimestampDateTimeConverter()
  DateTime? get expirationDate;
  @override
  @JsonKey(ignore: true)
  _$$_PassModelCopyWith<_$_PassModel> get copyWith =>
      throw _privateConstructorUsedError;
}
