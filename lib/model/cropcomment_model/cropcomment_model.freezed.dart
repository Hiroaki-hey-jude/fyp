// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cropcomment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CropcommentModel _$CropcommentModelFromJson(Map<String, dynamic> json) {
  return _CropcommentModel.fromJson(json);
}

/// @nodoc
mixin _$CropcommentModel {
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get messageText => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get sendTime => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CropcommentModelCopyWith<CropcommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropcommentModelCopyWith<$Res> {
  factory $CropcommentModelCopyWith(
          CropcommentModel value, $Res Function(CropcommentModel) then) =
      _$CropcommentModelCopyWithImpl<$Res, CropcommentModel>;
  @useResult
  $Res call(
      {String? id,
      String userId,
      String userName,
      String? messageText,
      @TimestampDateTimeConverter() DateTime? sendTime,
      @TimestampDateTimeConverter() DateTime? createdAt});
}

/// @nodoc
class _$CropcommentModelCopyWithImpl<$Res, $Val extends CropcommentModel>
    implements $CropcommentModelCopyWith<$Res> {
  _$CropcommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? userName = null,
    Object? messageText = freezed,
    Object? sendTime = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String?,
      sendTime: freezed == sendTime
          ? _value.sendTime
          : sendTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CropcommentModelCopyWith<$Res>
    implements $CropcommentModelCopyWith<$Res> {
  factory _$$_CropcommentModelCopyWith(
          _$_CropcommentModel value, $Res Function(_$_CropcommentModel) then) =
      __$$_CropcommentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String userId,
      String userName,
      String? messageText,
      @TimestampDateTimeConverter() DateTime? sendTime,
      @TimestampDateTimeConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_CropcommentModelCopyWithImpl<$Res>
    extends _$CropcommentModelCopyWithImpl<$Res, _$_CropcommentModel>
    implements _$$_CropcommentModelCopyWith<$Res> {
  __$$_CropcommentModelCopyWithImpl(
      _$_CropcommentModel _value, $Res Function(_$_CropcommentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? userName = null,
    Object? messageText = freezed,
    Object? sendTime = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_CropcommentModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String?,
      sendTime: freezed == sendTime
          ? _value.sendTime
          : sendTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CropcommentModel implements _CropcommentModel {
  const _$_CropcommentModel(
      {this.id,
      required this.userId,
      required this.userName,
      this.messageText,
      @TimestampDateTimeConverter() this.sendTime,
      @TimestampDateTimeConverter() this.createdAt});

  factory _$_CropcommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_CropcommentModelFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String? messageText;
  @override
  @TimestampDateTimeConverter()
  final DateTime? sendTime;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CropcommentModel(id: $id, userId: $userId, userName: $userName, messageText: $messageText, sendTime: $sendTime, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CropcommentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(other.sendTime, sendTime) ||
                other.sendTime == sendTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, userName, messageText, sendTime, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CropcommentModelCopyWith<_$_CropcommentModel> get copyWith =>
      __$$_CropcommentModelCopyWithImpl<_$_CropcommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CropcommentModelToJson(
      this,
    );
  }
}

abstract class _CropcommentModel implements CropcommentModel {
  const factory _CropcommentModel(
          {final String? id,
          required final String userId,
          required final String userName,
          final String? messageText,
          @TimestampDateTimeConverter() final DateTime? sendTime,
          @TimestampDateTimeConverter() final DateTime? createdAt}) =
      _$_CropcommentModel;

  factory _CropcommentModel.fromJson(Map<String, dynamic> json) =
      _$_CropcommentModel.fromJson;

  @override
  String? get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String? get messageText;
  @override
  @TimestampDateTimeConverter()
  DateTime? get sendTime;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CropcommentModelCopyWith<_$_CropcommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
