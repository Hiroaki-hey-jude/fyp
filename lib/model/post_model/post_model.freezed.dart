// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  String get posterId => throw _privateConstructorUsedError;
  List<String> get picsOfCrops => throw _privateConstructorUsedError;
  String get sentenceOfPost => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call(
      {String posterId,
      List<String> picsOfCrops,
      String sentenceOfPost,
      String postId,
      @TimestampDateTimeConverter() DateTime? createdAt});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterId = null,
    Object? picsOfCrops = null,
    Object? sentenceOfPost = null,
    Object? postId = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      picsOfCrops: null == picsOfCrops
          ? _value.picsOfCrops
          : picsOfCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentenceOfPost: null == sentenceOfPost
          ? _value.sentenceOfPost
          : sentenceOfPost // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$$_PostModelCopyWith(
          _$_PostModel value, $Res Function(_$_PostModel) then) =
      __$$_PostModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String posterId,
      List<String> picsOfCrops,
      String sentenceOfPost,
      String postId,
      @TimestampDateTimeConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_PostModelCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$_PostModel>
    implements _$$_PostModelCopyWith<$Res> {
  __$$_PostModelCopyWithImpl(
      _$_PostModel _value, $Res Function(_$_PostModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterId = null,
    Object? picsOfCrops = null,
    Object? sentenceOfPost = null,
    Object? postId = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_PostModel(
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      picsOfCrops: null == picsOfCrops
          ? _value._picsOfCrops
          : picsOfCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentenceOfPost: null == sentenceOfPost
          ? _value.sentenceOfPost
          : sentenceOfPost // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostModel implements _PostModel {
  const _$_PostModel(
      {this.posterId = '',
      final List<String> picsOfCrops = const [],
      this.sentenceOfPost = '',
      this.postId = '',
      @TimestampDateTimeConverter() this.createdAt})
      : _picsOfCrops = picsOfCrops;

  factory _$_PostModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostModelFromJson(json);

  @override
  @JsonKey()
  final String posterId;
  final List<String> _picsOfCrops;
  @override
  @JsonKey()
  List<String> get picsOfCrops {
    if (_picsOfCrops is EqualUnmodifiableListView) return _picsOfCrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_picsOfCrops);
  }

  @override
  @JsonKey()
  final String sentenceOfPost;
  @override
  @JsonKey()
  final String postId;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PostModel(posterId: $posterId, picsOfCrops: $picsOfCrops, sentenceOfPost: $sentenceOfPost, postId: $postId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostModel &&
            (identical(other.posterId, posterId) ||
                other.posterId == posterId) &&
            const DeepCollectionEquality()
                .equals(other._picsOfCrops, _picsOfCrops) &&
            (identical(other.sentenceOfPost, sentenceOfPost) ||
                other.sentenceOfPost == sentenceOfPost) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      posterId,
      const DeepCollectionEquality().hash(_picsOfCrops),
      sentenceOfPost,
      postId,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      __$$_PostModelCopyWithImpl<_$_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostModelToJson(
      this,
    );
  }
}

abstract class _PostModel implements PostModel {
  const factory _PostModel(
      {final String posterId,
      final List<String> picsOfCrops,
      final String sentenceOfPost,
      final String postId,
      @TimestampDateTimeConverter() final DateTime? createdAt}) = _$_PostModel;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$_PostModel.fromJson;

  @override
  String get posterId;
  @override
  List<String> get picsOfCrops;
  @override
  String get sentenceOfPost;
  @override
  String get postId;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
