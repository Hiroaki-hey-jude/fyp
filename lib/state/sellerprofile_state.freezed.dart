// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sellerprofile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SellerprofileState {
  bool get isLoading => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  String get originalImgURL => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  List<CropModel> get sellingCrops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellerprofileStateCopyWith<SellerprofileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerprofileStateCopyWith<$Res> {
  factory $SellerprofileStateCopyWith(
          SellerprofileState value, $Res Function(SellerprofileState) then) =
      _$SellerprofileStateCopyWithImpl<$Res, SellerprofileState>;
  @useResult
  $Res call(
      {bool isLoading,
      UserModel? userModel,
      String originalImgURL,
      String userName,
      List<CropModel> sellingCrops});

  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class _$SellerprofileStateCopyWithImpl<$Res, $Val extends SellerprofileState>
    implements $SellerprofileStateCopyWith<$Res> {
  _$SellerprofileStateCopyWithImpl(this._value, this._then);

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
    Object? userName = null,
    Object? sellingCrops = null,
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
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      sellingCrops: null == sellingCrops
          ? _value.sellingCrops
          : sellingCrops // ignore: cast_nullable_to_non_nullable
              as List<CropModel>,
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
abstract class _$$_SellerprofileStateCopyWith<$Res>
    implements $SellerprofileStateCopyWith<$Res> {
  factory _$$_SellerprofileStateCopyWith(_$_SellerprofileState value,
          $Res Function(_$_SellerprofileState) then) =
      __$$_SellerprofileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      UserModel? userModel,
      String originalImgURL,
      String userName,
      List<CropModel> sellingCrops});

  @override
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class __$$_SellerprofileStateCopyWithImpl<$Res>
    extends _$SellerprofileStateCopyWithImpl<$Res, _$_SellerprofileState>
    implements _$$_SellerprofileStateCopyWith<$Res> {
  __$$_SellerprofileStateCopyWithImpl(
      _$_SellerprofileState _value, $Res Function(_$_SellerprofileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userModel = freezed,
    Object? originalImgURL = null,
    Object? userName = null,
    Object? sellingCrops = null,
  }) {
    return _then(_$_SellerprofileState(
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
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      sellingCrops: null == sellingCrops
          ? _value._sellingCrops
          : sellingCrops // ignore: cast_nullable_to_non_nullable
              as List<CropModel>,
    ));
  }
}

/// @nodoc

class _$_SellerprofileState implements _SellerprofileState {
  const _$_SellerprofileState(
      {this.isLoading = false,
      this.userModel = null,
      this.originalImgURL = '',
      this.userName = '',
      final List<CropModel> sellingCrops = const []})
      : _sellingCrops = sellingCrops;

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
  final String userName;
  final List<CropModel> _sellingCrops;
  @override
  @JsonKey()
  List<CropModel> get sellingCrops {
    if (_sellingCrops is EqualUnmodifiableListView) return _sellingCrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sellingCrops);
  }

  @override
  String toString() {
    return 'SellerprofileState(isLoading: $isLoading, userModel: $userModel, originalImgURL: $originalImgURL, userName: $userName, sellingCrops: $sellingCrops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SellerprofileState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.originalImgURL, originalImgURL) ||
                other.originalImgURL == originalImgURL) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            const DeepCollectionEquality()
                .equals(other._sellingCrops, _sellingCrops));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      userModel,
      originalImgURL,
      userName,
      const DeepCollectionEquality().hash(_sellingCrops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SellerprofileStateCopyWith<_$_SellerprofileState> get copyWith =>
      __$$_SellerprofileStateCopyWithImpl<_$_SellerprofileState>(
          this, _$identity);
}

abstract class _SellerprofileState implements SellerprofileState {
  const factory _SellerprofileState(
      {final bool isLoading,
      final UserModel? userModel,
      final String originalImgURL,
      final String userName,
      final List<CropModel> sellingCrops}) = _$_SellerprofileState;

  @override
  bool get isLoading;
  @override
  UserModel? get userModel;
  @override
  String get originalImgURL;
  @override
  String get userName;
  @override
  List<CropModel> get sellingCrops;
  @override
  @JsonKey(ignore: true)
  _$$_SellerprofileStateCopyWith<_$_SellerprofileState> get copyWith =>
      throw _privateConstructorUsedError;
}
