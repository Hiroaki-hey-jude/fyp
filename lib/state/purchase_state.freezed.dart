// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchaseState {
  bool get isLoading => throw _privateConstructorUsedError;
  CropModel? get cropModel => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseStateCopyWith<PurchaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseStateCopyWith<$Res> {
  factory $PurchaseStateCopyWith(
          PurchaseState value, $Res Function(PurchaseState) then) =
      _$PurchaseStateCopyWithImpl<$Res, PurchaseState>;
  @useResult
  $Res call({bool isLoading, CropModel? cropModel, UserModel? userModel});

  $CropModelCopyWith<$Res>? get cropModel;
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class _$PurchaseStateCopyWithImpl<$Res, $Val extends PurchaseState>
    implements $PurchaseStateCopyWith<$Res> {
  _$PurchaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cropModel = freezed,
    Object? userModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cropModel: freezed == cropModel
          ? _value.cropModel
          : cropModel // ignore: cast_nullable_to_non_nullable
              as CropModel?,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CropModelCopyWith<$Res>? get cropModel {
    if (_value.cropModel == null) {
      return null;
    }

    return $CropModelCopyWith<$Res>(_value.cropModel!, (value) {
      return _then(_value.copyWith(cropModel: value) as $Val);
    });
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
abstract class _$$_PurchasetateCopyWith<$Res>
    implements $PurchaseStateCopyWith<$Res> {
  factory _$$_PurchasetateCopyWith(
          _$_Purchasetate value, $Res Function(_$_Purchasetate) then) =
      __$$_PurchasetateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, CropModel? cropModel, UserModel? userModel});

  @override
  $CropModelCopyWith<$Res>? get cropModel;
  @override
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class __$$_PurchasetateCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$_Purchasetate>
    implements _$$_PurchasetateCopyWith<$Res> {
  __$$_PurchasetateCopyWithImpl(
      _$_Purchasetate _value, $Res Function(_$_Purchasetate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cropModel = freezed,
    Object? userModel = freezed,
  }) {
    return _then(_$_Purchasetate(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cropModel: freezed == cropModel
          ? _value.cropModel
          : cropModel // ignore: cast_nullable_to_non_nullable
              as CropModel?,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$_Purchasetate implements _Purchasetate {
  const _$_Purchasetate(
      {this.isLoading = false, this.cropModel = null, this.userModel = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final CropModel? cropModel;
  @override
  @JsonKey()
  final UserModel? userModel;

  @override
  String toString() {
    return 'PurchaseState(isLoading: $isLoading, cropModel: $cropModel, userModel: $userModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Purchasetate &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.cropModel, cropModel) ||
                other.cropModel == cropModel) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, cropModel, userModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchasetateCopyWith<_$_Purchasetate> get copyWith =>
      __$$_PurchasetateCopyWithImpl<_$_Purchasetate>(this, _$identity);
}

abstract class _Purchasetate implements PurchaseState {
  const factory _Purchasetate(
      {final bool isLoading,
      final CropModel? cropModel,
      final UserModel? userModel}) = _$_Purchasetate;

  @override
  bool get isLoading;
  @override
  CropModel? get cropModel;
  @override
  UserModel? get userModel;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasetateCopyWith<_$_Purchasetate> get copyWith =>
      throw _privateConstructorUsedError;
}
