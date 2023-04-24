// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CropState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  int get selectedIndexForOutlineButton => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  List<CropModel> get selectedCategoryCrops =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CropStateCopyWith<CropState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropStateCopyWith<$Res> {
  factory $CropStateCopyWith(CropState value, $Res Function(CropState) then) =
      _$CropStateCopyWithImpl<$Res, CropState>;
  @useResult
  $Res call(
      {bool isLoading,
      int selectedIndex,
      int selectedIndexForOutlineButton,
      String selectedCategory,
      List<CropModel> selectedCategoryCrops});
}

/// @nodoc
class _$CropStateCopyWithImpl<$Res, $Val extends CropState>
    implements $CropStateCopyWith<$Res> {
  _$CropStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedIndex = null,
    Object? selectedIndexForOutlineButton = null,
    Object? selectedCategory = null,
    Object? selectedCategoryCrops = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedIndexForOutlineButton: null == selectedIndexForOutlineButton
          ? _value.selectedIndexForOutlineButton
          : selectedIndexForOutlineButton // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCategoryCrops: null == selectedCategoryCrops
          ? _value.selectedCategoryCrops
          : selectedCategoryCrops // ignore: cast_nullable_to_non_nullable
              as List<CropModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CropStateCopyWith<$Res> implements $CropStateCopyWith<$Res> {
  factory _$$_CropStateCopyWith(
          _$_CropState value, $Res Function(_$_CropState) then) =
      __$$_CropStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int selectedIndex,
      int selectedIndexForOutlineButton,
      String selectedCategory,
      List<CropModel> selectedCategoryCrops});
}

/// @nodoc
class __$$_CropStateCopyWithImpl<$Res>
    extends _$CropStateCopyWithImpl<$Res, _$_CropState>
    implements _$$_CropStateCopyWith<$Res> {
  __$$_CropStateCopyWithImpl(
      _$_CropState _value, $Res Function(_$_CropState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedIndex = null,
    Object? selectedIndexForOutlineButton = null,
    Object? selectedCategory = null,
    Object? selectedCategoryCrops = null,
  }) {
    return _then(_$_CropState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedIndexForOutlineButton: null == selectedIndexForOutlineButton
          ? _value.selectedIndexForOutlineButton
          : selectedIndexForOutlineButton // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCategoryCrops: null == selectedCategoryCrops
          ? _value._selectedCategoryCrops
          : selectedCategoryCrops // ignore: cast_nullable_to_non_nullable
              as List<CropModel>,
    ));
  }
}

/// @nodoc

class _$_CropState implements _CropState {
  const _$_CropState(
      {this.isLoading = false,
      this.selectedIndex = 0,
      this.selectedIndexForOutlineButton = 0,
      this.selectedCategory = 'potato',
      final List<CropModel> selectedCategoryCrops = const []})
      : _selectedCategoryCrops = selectedCategoryCrops;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final int selectedIndexForOutlineButton;
  @override
  @JsonKey()
  final String selectedCategory;
  final List<CropModel> _selectedCategoryCrops;
  @override
  @JsonKey()
  List<CropModel> get selectedCategoryCrops {
    if (_selectedCategoryCrops is EqualUnmodifiableListView)
      return _selectedCategoryCrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategoryCrops);
  }

  @override
  String toString() {
    return 'CropState(isLoading: $isLoading, selectedIndex: $selectedIndex, selectedIndexForOutlineButton: $selectedIndexForOutlineButton, selectedCategory: $selectedCategory, selectedCategoryCrops: $selectedCategoryCrops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CropState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.selectedIndexForOutlineButton,
                    selectedIndexForOutlineButton) ||
                other.selectedIndexForOutlineButton ==
                    selectedIndexForOutlineButton) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality()
                .equals(other._selectedCategoryCrops, _selectedCategoryCrops));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      selectedIndex,
      selectedIndexForOutlineButton,
      selectedCategory,
      const DeepCollectionEquality().hash(_selectedCategoryCrops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CropStateCopyWith<_$_CropState> get copyWith =>
      __$$_CropStateCopyWithImpl<_$_CropState>(this, _$identity);
}

abstract class _CropState implements CropState {
  const factory _CropState(
      {final bool isLoading,
      final int selectedIndex,
      final int selectedIndexForOutlineButton,
      final String selectedCategory,
      final List<CropModel> selectedCategoryCrops}) = _$_CropState;

  @override
  bool get isLoading;
  @override
  int get selectedIndex;
  @override
  int get selectedIndexForOutlineButton;
  @override
  String get selectedCategory;
  @override
  List<CropModel> get selectedCategoryCrops;
  @override
  @JsonKey(ignore: true)
  _$$_CropStateCopyWith<_$_CropState> get copyWith =>
      throw _privateConstructorUsedError;
}
