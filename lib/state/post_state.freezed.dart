// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostState {
  bool get isLoading => throw _privateConstructorUsedError; // File? imageFile,
  UserModel? get userModel => throw _privateConstructorUsedError;
  PostModel? get postModel => throw _privateConstructorUsedError;
  int get numberOfPictures => throw _privateConstructorUsedError;
  List<File>? get imagefiles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostStateCopyWith<PostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
  @useResult
  $Res call(
      {bool isLoading,
      UserModel? userModel,
      PostModel? postModel,
      int numberOfPictures,
      List<File>? imagefiles});

  $UserModelCopyWith<$Res>? get userModel;
  $PostModelCopyWith<$Res>? get postModel;
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userModel = freezed,
    Object? postModel = freezed,
    Object? numberOfPictures = null,
    Object? imagefiles = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      postModel: freezed == postModel
          ? _value.postModel
          : postModel // ignore: cast_nullable_to_non_nullable
              as PostModel?,
      numberOfPictures: null == numberOfPictures
          ? _value.numberOfPictures
          : numberOfPictures // ignore: cast_nullable_to_non_nullable
              as int,
      imagefiles: freezed == imagefiles
          ? _value.imagefiles
          : imagefiles // ignore: cast_nullable_to_non_nullable
              as List<File>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userModel {
    if (_value.userModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userModel!, (value) {
      return _then(_value.copyWith(userModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PostModelCopyWith<$Res>? get postModel {
    if (_value.postModel == null) {
      return null;
    }

    return $PostModelCopyWith<$Res>(_value.postModel!, (value) {
      return _then(_value.copyWith(postModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$$_PostStateCopyWith(
          _$_PostState value, $Res Function(_$_PostState) then) =
      __$$_PostStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      UserModel? userModel,
      PostModel? postModel,
      int numberOfPictures,
      List<File>? imagefiles});

  @override
  $UserModelCopyWith<$Res>? get userModel;
  @override
  $PostModelCopyWith<$Res>? get postModel;
}

/// @nodoc
class __$$_PostStateCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_PostState>
    implements _$$_PostStateCopyWith<$Res> {
  __$$_PostStateCopyWithImpl(
      _$_PostState _value, $Res Function(_$_PostState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userModel = freezed,
    Object? postModel = freezed,
    Object? numberOfPictures = null,
    Object? imagefiles = freezed,
  }) {
    return _then(_$_PostState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      postModel: freezed == postModel
          ? _value.postModel
          : postModel // ignore: cast_nullable_to_non_nullable
              as PostModel?,
      numberOfPictures: null == numberOfPictures
          ? _value.numberOfPictures
          : numberOfPictures // ignore: cast_nullable_to_non_nullable
              as int,
      imagefiles: freezed == imagefiles
          ? _value._imagefiles
          : imagefiles // ignore: cast_nullable_to_non_nullable
              as List<File>?,
    ));
  }
}

/// @nodoc

class _$_PostState implements _PostState {
  const _$_PostState(
      {this.isLoading = false,
      this.userModel = null,
      this.postModel = null,
      this.numberOfPictures = 1,
      final List<File>? imagefiles})
      : _imagefiles = imagefiles;

  @override
  @JsonKey()
  final bool isLoading;
// File? imageFile,
  @override
  @JsonKey()
  final UserModel? userModel;
  @override
  @JsonKey()
  final PostModel? postModel;
  @override
  @JsonKey()
  final int numberOfPictures;
  final List<File>? _imagefiles;
  @override
  List<File>? get imagefiles {
    final value = _imagefiles;
    if (value == null) return null;
    if (_imagefiles is EqualUnmodifiableListView) return _imagefiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PostState(isLoading: $isLoading, userModel: $userModel, postModel: $postModel, numberOfPictures: $numberOfPictures, imagefiles: $imagefiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.postModel, postModel) ||
                other.postModel == postModel) &&
            (identical(other.numberOfPictures, numberOfPictures) ||
                other.numberOfPictures == numberOfPictures) &&
            const DeepCollectionEquality()
                .equals(other._imagefiles, _imagefiles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userModel, postModel,
      numberOfPictures, const DeepCollectionEquality().hash(_imagefiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostStateCopyWith<_$_PostState> get copyWith =>
      __$$_PostStateCopyWithImpl<_$_PostState>(this, _$identity);
}

abstract class _PostState implements PostState {
  const factory _PostState(
      {final bool isLoading,
      final UserModel? userModel,
      final PostModel? postModel,
      final int numberOfPictures,
      final List<File>? imagefiles}) = _$_PostState;

  @override
  bool get isLoading;
  @override // File? imageFile,
  UserModel? get userModel;
  @override
  PostModel? get postModel;
  @override
  int get numberOfPictures;
  @override
  List<File>? get imagefiles;
  @override
  @JsonKey(ignore: true)
  _$$_PostStateCopyWith<_$_PostState> get copyWith =>
      throw _privateConstructorUsedError;
}
