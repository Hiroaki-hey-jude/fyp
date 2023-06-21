// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  AddressModel? get address => throw _privateConstructorUsedError;
  String get consumerUid => throw _privateConstructorUsedError;
  String get farmerUid => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get orderAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get cropId => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {AddressModel? address,
      String consumerUid,
      String farmerUid,
      @TimestampDateTimeConverter() DateTime? orderAt,
      String status,
      String cropId,
      String orderId});

  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? consumerUid = null,
    Object? farmerUid = null,
    Object? orderAt = freezed,
    Object? status = null,
    Object? cropId = null,
    Object? orderId = null,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      consumerUid: null == consumerUid
          ? _value.consumerUid
          : consumerUid // ignore: cast_nullable_to_non_nullable
              as String,
      farmerUid: null == farmerUid
          ? _value.farmerUid
          : farmerUid // ignore: cast_nullable_to_non_nullable
              as String,
      orderAt: freezed == orderAt
          ? _value.orderAt
          : orderAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      cropId: null == cropId
          ? _value.cropId
          : cropId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$_OrderModelCopyWith(
          _$_OrderModel value, $Res Function(_$_OrderModel) then) =
      __$$_OrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddressModel? address,
      String consumerUid,
      String farmerUid,
      @TimestampDateTimeConverter() DateTime? orderAt,
      String status,
      String cropId,
      String orderId});

  @override
  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_OrderModelCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$_OrderModel>
    implements _$$_OrderModelCopyWith<$Res> {
  __$$_OrderModelCopyWithImpl(
      _$_OrderModel _value, $Res Function(_$_OrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? consumerUid = null,
    Object? farmerUid = null,
    Object? orderAt = freezed,
    Object? status = null,
    Object? cropId = null,
    Object? orderId = null,
  }) {
    return _then(_$_OrderModel(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      consumerUid: null == consumerUid
          ? _value.consumerUid
          : consumerUid // ignore: cast_nullable_to_non_nullable
              as String,
      farmerUid: null == farmerUid
          ? _value.farmerUid
          : farmerUid // ignore: cast_nullable_to_non_nullable
              as String,
      orderAt: freezed == orderAt
          ? _value.orderAt
          : orderAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      cropId: null == cropId
          ? _value.cropId
          : cropId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel implements _OrderModel {
  const _$_OrderModel(
      {this.address = null,
      this.consumerUid = '',
      this.farmerUid = '',
      @TimestampDateTimeConverter() this.orderAt,
      this.status = '',
      this.cropId = '',
      this.orderId = ''});

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  @JsonKey()
  final AddressModel? address;
  @override
  @JsonKey()
  final String consumerUid;
  @override
  @JsonKey()
  final String farmerUid;
  @override
  @TimestampDateTimeConverter()
  final DateTime? orderAt;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String cropId;
  @override
  @JsonKey()
  final String orderId;

  @override
  String toString() {
    return 'OrderModel(address: $address, consumerUid: $consumerUid, farmerUid: $farmerUid, orderAt: $orderAt, status: $status, cropId: $cropId, orderId: $orderId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderModel &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.consumerUid, consumerUid) ||
                other.consumerUid == consumerUid) &&
            (identical(other.farmerUid, farmerUid) ||
                other.farmerUid == farmerUid) &&
            (identical(other.orderAt, orderAt) || other.orderAt == orderAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cropId, cropId) || other.cropId == cropId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, consumerUid, farmerUid,
      orderAt, status, cropId, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      __$$_OrderModelCopyWithImpl<_$_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {final AddressModel? address,
      final String consumerUid,
      final String farmerUid,
      @TimestampDateTimeConverter() final DateTime? orderAt,
      final String status,
      final String cropId,
      final String orderId}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  AddressModel? get address;
  @override
  String get consumerUid;
  @override
  String get farmerUid;
  @override
  @TimestampDateTimeConverter()
  DateTime? get orderAt;
  @override
  String get status;
  @override
  String get cropId;
  @override
  String get orderId;
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
