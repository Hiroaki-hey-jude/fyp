// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<PaymentModel> get listOfPayment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionStateCopyWith<TransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
  @useResult
  $Res call({bool isLoading, List<PaymentModel> listOfPayment});
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? listOfPayment = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      listOfPayment: null == listOfPayment
          ? _value.listOfPayment
          : listOfPayment // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionStateCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory _$$_TransactionStateCopyWith(
          _$_TransactionState value, $Res Function(_$_TransactionState) then) =
      __$$_TransactionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<PaymentModel> listOfPayment});
}

/// @nodoc
class __$$_TransactionStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$_TransactionState>
    implements _$$_TransactionStateCopyWith<$Res> {
  __$$_TransactionStateCopyWithImpl(
      _$_TransactionState _value, $Res Function(_$_TransactionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? listOfPayment = null,
  }) {
    return _then(_$_TransactionState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      listOfPayment: null == listOfPayment
          ? _value._listOfPayment
          : listOfPayment // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>,
    ));
  }
}

/// @nodoc

class _$_TransactionState implements _TransactionState {
  const _$_TransactionState(
      {this.isLoading = false,
      final List<PaymentModel> listOfPayment = const []})
      : _listOfPayment = listOfPayment;

  @override
  @JsonKey()
  final bool isLoading;
  final List<PaymentModel> _listOfPayment;
  @override
  @JsonKey()
  List<PaymentModel> get listOfPayment {
    if (_listOfPayment is EqualUnmodifiableListView) return _listOfPayment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfPayment);
  }

  @override
  String toString() {
    return 'TransactionState(isLoading: $isLoading, listOfPayment: $listOfPayment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._listOfPayment, _listOfPayment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_listOfPayment));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionStateCopyWith<_$_TransactionState> get copyWith =>
      __$$_TransactionStateCopyWithImpl<_$_TransactionState>(this, _$identity);
}

abstract class _TransactionState implements TransactionState {
  const factory _TransactionState(
      {final bool isLoading,
      final List<PaymentModel> listOfPayment}) = _$_TransactionState;

  @override
  bool get isLoading;
  @override
  List<PaymentModel> get listOfPayment;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionStateCopyWith<_$_TransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}
