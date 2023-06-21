// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeliveryState {
  bool get isLoading => throw _privateConstructorUsedError;
  OrderModel? get orderModel => throw _privateConstructorUsedError;
  UserModel? get farmerUserModel => throw _privateConstructorUsedError;
  String get currentUid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliveryStateCopyWith<DeliveryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryStateCopyWith<$Res> {
  factory $DeliveryStateCopyWith(
          DeliveryState value, $Res Function(DeliveryState) then) =
      _$DeliveryStateCopyWithImpl<$Res, DeliveryState>;
  @useResult
  $Res call(
      {bool isLoading,
      OrderModel? orderModel,
      UserModel? farmerUserModel,
      String currentUid});

  $OrderModelCopyWith<$Res>? get orderModel;
  $UserModelCopyWith<$Res>? get farmerUserModel;
}

/// @nodoc
class _$DeliveryStateCopyWithImpl<$Res, $Val extends DeliveryState>
    implements $DeliveryStateCopyWith<$Res> {
  _$DeliveryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orderModel = freezed,
    Object? farmerUserModel = freezed,
    Object? currentUid = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orderModel: freezed == orderModel
          ? _value.orderModel
          : orderModel // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      farmerUserModel: freezed == farmerUserModel
          ? _value.farmerUserModel
          : farmerUserModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      currentUid: null == currentUid
          ? _value.currentUid
          : currentUid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res>? get orderModel {
    if (_value.orderModel == null) {
      return null;
    }

    return $OrderModelCopyWith<$Res>(_value.orderModel!, (value) {
      return _then(_value.copyWith(orderModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get farmerUserModel {
    if (_value.farmerUserModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.farmerUserModel!, (value) {
      return _then(_value.copyWith(farmerUserModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeliveryStateCopyWith<$Res>
    implements $DeliveryStateCopyWith<$Res> {
  factory _$$_DeliveryStateCopyWith(
          _$_DeliveryState value, $Res Function(_$_DeliveryState) then) =
      __$$_DeliveryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      OrderModel? orderModel,
      UserModel? farmerUserModel,
      String currentUid});

  @override
  $OrderModelCopyWith<$Res>? get orderModel;
  @override
  $UserModelCopyWith<$Res>? get farmerUserModel;
}

/// @nodoc
class __$$_DeliveryStateCopyWithImpl<$Res>
    extends _$DeliveryStateCopyWithImpl<$Res, _$_DeliveryState>
    implements _$$_DeliveryStateCopyWith<$Res> {
  __$$_DeliveryStateCopyWithImpl(
      _$_DeliveryState _value, $Res Function(_$_DeliveryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orderModel = freezed,
    Object? farmerUserModel = freezed,
    Object? currentUid = null,
  }) {
    return _then(_$_DeliveryState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orderModel: freezed == orderModel
          ? _value.orderModel
          : orderModel // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      farmerUserModel: freezed == farmerUserModel
          ? _value.farmerUserModel
          : farmerUserModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      currentUid: null == currentUid
          ? _value.currentUid
          : currentUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeliveryState implements _DeliveryState {
  const _$_DeliveryState(
      {this.isLoading = false,
      this.orderModel = null,
      this.farmerUserModel = null,
      this.currentUid = ''});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final OrderModel? orderModel;
  @override
  @JsonKey()
  final UserModel? farmerUserModel;
  @override
  @JsonKey()
  final String currentUid;

  @override
  String toString() {
    return 'DeliveryState(isLoading: $isLoading, orderModel: $orderModel, farmerUserModel: $farmerUserModel, currentUid: $currentUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.orderModel, orderModel) ||
                other.orderModel == orderModel) &&
            (identical(other.farmerUserModel, farmerUserModel) ||
                other.farmerUserModel == farmerUserModel) &&
            (identical(other.currentUid, currentUid) ||
                other.currentUid == currentUid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, orderModel, farmerUserModel, currentUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryStateCopyWith<_$_DeliveryState> get copyWith =>
      __$$_DeliveryStateCopyWithImpl<_$_DeliveryState>(this, _$identity);
}

abstract class _DeliveryState implements DeliveryState {
  const factory _DeliveryState(
      {final bool isLoading,
      final OrderModel? orderModel,
      final UserModel? farmerUserModel,
      final String currentUid}) = _$_DeliveryState;

  @override
  bool get isLoading;
  @override
  OrderModel? get orderModel;
  @override
  UserModel? get farmerUserModel;
  @override
  String get currentUid;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryStateCopyWith<_$_DeliveryState> get copyWith =>
      throw _privateConstructorUsedError;
}
