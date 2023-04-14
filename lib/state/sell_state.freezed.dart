// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SellState {
  String get selectedCategory => throw _privateConstructorUsedError;
  String get selectedCity => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellStateCopyWith<SellState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellStateCopyWith<$Res> {
  factory $SellStateCopyWith(SellState value, $Res Function(SellState) then) =
      _$SellStateCopyWithImpl<$Res, SellState>;
  @useResult
  $Res call({String selectedCategory, String selectedCity, bool isLoading});
}

/// @nodoc
class _$SellStateCopyWithImpl<$Res, $Val extends SellState>
    implements $SellStateCopyWith<$Res> {
  _$SellStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = null,
    Object? selectedCity = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCity: null == selectedCity
          ? _value.selectedCity
          : selectedCity // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SellStateCopyWith<$Res> implements $SellStateCopyWith<$Res> {
  factory _$$_SellStateCopyWith(
          _$_SellState value, $Res Function(_$_SellState) then) =
      __$$_SellStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String selectedCategory, String selectedCity, bool isLoading});
}

/// @nodoc
class __$$_SellStateCopyWithImpl<$Res>
    extends _$SellStateCopyWithImpl<$Res, _$_SellState>
    implements _$$_SellStateCopyWith<$Res> {
  __$$_SellStateCopyWithImpl(
      _$_SellState _value, $Res Function(_$_SellState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = null,
    Object? selectedCity = null,
    Object? isLoading = null,
  }) {
    return _then(_$_SellState(
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCity: null == selectedCity
          ? _value.selectedCity
          : selectedCity // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SellState implements _SellState {
  const _$_SellState(
      {this.selectedCategory = 'potato',
      this.selectedCity = '北海道',
      this.isLoading = false});

  @override
  @JsonKey()
  final String selectedCategory;
  @override
  @JsonKey()
  final String selectedCity;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'SellState(selectedCategory: $selectedCategory, selectedCity: $selectedCity, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SellState &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedCity, selectedCity) ||
                other.selectedCity == selectedCity) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedCategory, selectedCity, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SellStateCopyWith<_$_SellState> get copyWith =>
      __$$_SellStateCopyWithImpl<_$_SellState>(this, _$identity);
}

abstract class _SellState implements SellState {
  const factory _SellState(
      {final String selectedCategory,
      final String selectedCity,
      final bool isLoading}) = _$_SellState;

  @override
  String get selectedCategory;
  @override
  String get selectedCity;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_SellStateCopyWith<_$_SellState> get copyWith =>
      throw _privateConstructorUsedError;
}
