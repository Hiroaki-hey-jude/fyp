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
  bool get isLoading => throw _privateConstructorUsedError; // File? imageFile,
  CropModel? get cropModel => throw _privateConstructorUsedError;
  int get numberOfPictures => throw _privateConstructorUsedError;
  List<File>? get imagefiles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellStateCopyWith<SellState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellStateCopyWith<$Res> {
  factory $SellStateCopyWith(SellState value, $Res Function(SellState) then) =
      _$SellStateCopyWithImpl<$Res, SellState>;
  @useResult
  $Res call(
      {String selectedCategory,
      String selectedCity,
      bool isLoading,
      CropModel? cropModel,
      int numberOfPictures,
      List<File>? imagefiles});

  $CropModelCopyWith<$Res>? get cropModel;
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
    Object? cropModel = freezed,
    Object? numberOfPictures = null,
    Object? imagefiles = freezed,
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
      cropModel: freezed == cropModel
          ? _value.cropModel
          : cropModel // ignore: cast_nullable_to_non_nullable
              as CropModel?,
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
  $CropModelCopyWith<$Res>? get cropModel {
    if (_value.cropModel == null) {
      return null;
    }

    return $CropModelCopyWith<$Res>(_value.cropModel!, (value) {
      return _then(_value.copyWith(cropModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SellStateCopyWith<$Res> implements $SellStateCopyWith<$Res> {
  factory _$$_SellStateCopyWith(
          _$_SellState value, $Res Function(_$_SellState) then) =
      __$$_SellStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String selectedCategory,
      String selectedCity,
      bool isLoading,
      CropModel? cropModel,
      int numberOfPictures,
      List<File>? imagefiles});

  @override
  $CropModelCopyWith<$Res>? get cropModel;
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
    Object? cropModel = freezed,
    Object? numberOfPictures = null,
    Object? imagefiles = freezed,
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
      cropModel: freezed == cropModel
          ? _value.cropModel
          : cropModel // ignore: cast_nullable_to_non_nullable
              as CropModel?,
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

class _$_SellState implements _SellState {
  const _$_SellState(
      {this.selectedCategory = 'potato',
      this.selectedCity = '北海道',
      this.isLoading = false,
      this.cropModel = null,
      this.numberOfPictures = 1,
      final List<File>? imagefiles})
      : _imagefiles = imagefiles;

  @override
  @JsonKey()
  final String selectedCategory;
  @override
  @JsonKey()
  final String selectedCity;
  @override
  @JsonKey()
  final bool isLoading;
// File? imageFile,
  @override
  @JsonKey()
  final CropModel? cropModel;
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
    return 'SellState(selectedCategory: $selectedCategory, selectedCity: $selectedCity, isLoading: $isLoading, cropModel: $cropModel, numberOfPictures: $numberOfPictures, imagefiles: $imagefiles)';
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
                other.isLoading == isLoading) &&
            (identical(other.cropModel, cropModel) ||
                other.cropModel == cropModel) &&
            (identical(other.numberOfPictures, numberOfPictures) ||
                other.numberOfPictures == numberOfPictures) &&
            const DeepCollectionEquality()
                .equals(other._imagefiles, _imagefiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedCategory,
      selectedCity,
      isLoading,
      cropModel,
      numberOfPictures,
      const DeepCollectionEquality().hash(_imagefiles));

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
      final bool isLoading,
      final CropModel? cropModel,
      final int numberOfPictures,
      final List<File>? imagefiles}) = _$_SellState;

  @override
  String get selectedCategory;
  @override
  String get selectedCity;
  @override
  bool get isLoading;
  @override // File? imageFile,
  CropModel? get cropModel;
  @override
  int get numberOfPictures;
  @override
  List<File>? get imagefiles;
  @override
  @JsonKey(ignore: true)
  _$$_SellStateCopyWith<_$_SellState> get copyWith =>
      throw _privateConstructorUsedError;
}
