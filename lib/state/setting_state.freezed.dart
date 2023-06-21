// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingState {
  bool get isLoading => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  String get originalImgURL => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;
  List<PassModel> get listOfSubscribedFarmers =>
      throw _privateConstructorUsedError;
  List<PassModel> get listOfSubscribers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res, SettingState>;
  @useResult
  $Res call(
      {bool isLoading,
      UserModel? userModel,
      String originalImgURL,
      File? imageFile,
      List<PassModel> listOfSubscribedFarmers,
      List<PassModel> listOfSubscribers});

  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res, $Val extends SettingState>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userModel = freezed,
    Object? originalImgURL = null,
    Object? imageFile = freezed,
    Object? listOfSubscribedFarmers = null,
    Object? listOfSubscribers = null,
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
      originalImgURL: null == originalImgURL
          ? _value.originalImgURL
          : originalImgURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      listOfSubscribedFarmers: null == listOfSubscribedFarmers
          ? _value.listOfSubscribedFarmers
          : listOfSubscribedFarmers // ignore: cast_nullable_to_non_nullable
              as List<PassModel>,
      listOfSubscribers: null == listOfSubscribers
          ? _value.listOfSubscribers
          : listOfSubscribers // ignore: cast_nullable_to_non_nullable
              as List<PassModel>,
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
}

/// @nodoc
abstract class _$$_SettingStateCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$$_SettingStateCopyWith(
          _$_SettingState value, $Res Function(_$_SettingState) then) =
      __$$_SettingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      UserModel? userModel,
      String originalImgURL,
      File? imageFile,
      List<PassModel> listOfSubscribedFarmers,
      List<PassModel> listOfSubscribers});

  @override
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class __$$_SettingStateCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res, _$_SettingState>
    implements _$$_SettingStateCopyWith<$Res> {
  __$$_SettingStateCopyWithImpl(
      _$_SettingState _value, $Res Function(_$_SettingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userModel = freezed,
    Object? originalImgURL = null,
    Object? imageFile = freezed,
    Object? listOfSubscribedFarmers = null,
    Object? listOfSubscribers = null,
  }) {
    return _then(_$_SettingState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      originalImgURL: null == originalImgURL
          ? _value.originalImgURL
          : originalImgURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      listOfSubscribedFarmers: null == listOfSubscribedFarmers
          ? _value._listOfSubscribedFarmers
          : listOfSubscribedFarmers // ignore: cast_nullable_to_non_nullable
              as List<PassModel>,
      listOfSubscribers: null == listOfSubscribers
          ? _value._listOfSubscribers
          : listOfSubscribers // ignore: cast_nullable_to_non_nullable
              as List<PassModel>,
    ));
  }
}

/// @nodoc

class _$_SettingState implements _SettingState {
  const _$_SettingState(
      {this.isLoading = false,
      this.userModel = null,
      this.originalImgURL = '',
      this.imageFile = null,
      final List<PassModel> listOfSubscribedFarmers = const [],
      final List<PassModel> listOfSubscribers = const []})
      : _listOfSubscribedFarmers = listOfSubscribedFarmers,
        _listOfSubscribers = listOfSubscribers;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final UserModel? userModel;
  @override
  @JsonKey()
  final String originalImgURL;
  @override
  @JsonKey()
  final File? imageFile;
  final List<PassModel> _listOfSubscribedFarmers;
  @override
  @JsonKey()
  List<PassModel> get listOfSubscribedFarmers {
    if (_listOfSubscribedFarmers is EqualUnmodifiableListView)
      return _listOfSubscribedFarmers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfSubscribedFarmers);
  }

  final List<PassModel> _listOfSubscribers;
  @override
  @JsonKey()
  List<PassModel> get listOfSubscribers {
    if (_listOfSubscribers is EqualUnmodifiableListView)
      return _listOfSubscribers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfSubscribers);
  }

  @override
  String toString() {
    return 'SettingState(isLoading: $isLoading, userModel: $userModel, originalImgURL: $originalImgURL, imageFile: $imageFile, listOfSubscribedFarmers: $listOfSubscribedFarmers, listOfSubscribers: $listOfSubscribers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.originalImgURL, originalImgURL) ||
                other.originalImgURL == originalImgURL) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality().equals(
                other._listOfSubscribedFarmers, _listOfSubscribedFarmers) &&
            const DeepCollectionEquality()
                .equals(other._listOfSubscribers, _listOfSubscribers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      userModel,
      originalImgURL,
      imageFile,
      const DeepCollectionEquality().hash(_listOfSubscribedFarmers),
      const DeepCollectionEquality().hash(_listOfSubscribers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      __$$_SettingStateCopyWithImpl<_$_SettingState>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState(
      {final bool isLoading,
      final UserModel? userModel,
      final String originalImgURL,
      final File? imageFile,
      final List<PassModel> listOfSubscribedFarmers,
      final List<PassModel> listOfSubscribers}) = _$_SettingState;

  @override
  bool get isLoading;
  @override
  UserModel? get userModel;
  @override
  String get originalImgURL;
  @override
  File? get imageFile;
  @override
  List<PassModel> get listOfSubscribedFarmers;
  @override
  List<PassModel> get listOfSubscribers;
  @override
  @JsonKey(ignore: true)
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
