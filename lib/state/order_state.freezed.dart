// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<OrderModel> get orders => throw _privateConstructorUsedError;
  List<OrderModel> get dealings => throw _privateConstructorUsedError;
  List<CropModel> get orderedCrops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<OrderModel> orders,
      List<OrderModel> dealings,
      List<CropModel> orderedCrops});
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orders = null,
    Object? dealings = null,
    Object? orderedCrops = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      dealings: null == dealings
          ? _value.dealings
          : dealings // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      orderedCrops: null == orderedCrops
          ? _value.orderedCrops
          : orderedCrops // ignore: cast_nullable_to_non_nullable
              as List<CropModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderStateCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$_OrderStateCopyWith(
          _$_OrderState value, $Res Function(_$_OrderState) then) =
      __$$_OrderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<OrderModel> orders,
      List<OrderModel> dealings,
      List<CropModel> orderedCrops});
}

/// @nodoc
class __$$_OrderStateCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$_OrderState>
    implements _$$_OrderStateCopyWith<$Res> {
  __$$_OrderStateCopyWithImpl(
      _$_OrderState _value, $Res Function(_$_OrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orders = null,
    Object? dealings = null,
    Object? orderedCrops = null,
  }) {
    return _then(_$_OrderState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      dealings: null == dealings
          ? _value._dealings
          : dealings // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      orderedCrops: null == orderedCrops
          ? _value._orderedCrops
          : orderedCrops // ignore: cast_nullable_to_non_nullable
              as List<CropModel>,
    ));
  }
}

/// @nodoc

class _$_OrderState implements _OrderState {
  const _$_OrderState(
      {this.isLoading = false,
      final List<OrderModel> orders = const [],
      final List<OrderModel> dealings = const [],
      final List<CropModel> orderedCrops = const []})
      : _orders = orders,
        _dealings = dealings,
        _orderedCrops = orderedCrops;

  @override
  @JsonKey()
  final bool isLoading;
  final List<OrderModel> _orders;
  @override
  @JsonKey()
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<OrderModel> _dealings;
  @override
  @JsonKey()
  List<OrderModel> get dealings {
    if (_dealings is EqualUnmodifiableListView) return _dealings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dealings);
  }

  final List<CropModel> _orderedCrops;
  @override
  @JsonKey()
  List<CropModel> get orderedCrops {
    if (_orderedCrops is EqualUnmodifiableListView) return _orderedCrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderedCrops);
  }

  @override
  String toString() {
    return 'OrderState(isLoading: $isLoading, orders: $orders, dealings: $dealings, orderedCrops: $orderedCrops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality().equals(other._dealings, _dealings) &&
            const DeepCollectionEquality()
                .equals(other._orderedCrops, _orderedCrops));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_dealings),
      const DeepCollectionEquality().hash(_orderedCrops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderStateCopyWith<_$_OrderState> get copyWith =>
      __$$_OrderStateCopyWithImpl<_$_OrderState>(this, _$identity);
}

abstract class _OrderState implements OrderState {
  const factory _OrderState(
      {final bool isLoading,
      final List<OrderModel> orders,
      final List<OrderModel> dealings,
      final List<CropModel> orderedCrops}) = _$_OrderState;

  @override
  bool get isLoading;
  @override
  List<OrderModel> get orders;
  @override
  List<OrderModel> get dealings;
  @override
  List<CropModel> get orderedCrops;
  @override
  @JsonKey(ignore: true)
  _$$_OrderStateCopyWith<_$_OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
