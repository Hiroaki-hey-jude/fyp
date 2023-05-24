import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crop_model.freezed.dart';
part 'crop_model.g.dart';

@freezed
class CropModel with _$CropModel {
  const factory CropModel({
    @Default('') String cropId,
    @Default(null) List<String>? picsOfCrops,
    @Default('') String name,
    @Default('') String category,
    @Default('') String description,
    @Default('') String address,
    @Default('') String price,
    @Default('') String sellerId,
    @Default(false) bool hasUnread,
    @Default(false) bool isbought,
  }) = _CropModel;

  factory CropModel.fromJson(Map<String, dynamic> json) =>
      _$CropModelFromJson(json);

  factory CropModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) =>
      CropModel.fromJson(snapshot.data()!);
}
