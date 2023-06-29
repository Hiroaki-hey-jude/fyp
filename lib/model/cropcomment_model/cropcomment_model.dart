import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../json_converter.dart';

part 'cropcomment_model.freezed.dart';
part 'cropcomment_model.g.dart';

@freezed
class CropcommentModel with _$CropcommentModel {
  const factory CropcommentModel({
    String? id,
    required String userId,
    required String userName,
    String? messageText,
    @TimestampDateTimeConverter() DateTime? sendTime,
    @TimestampDateTimeConverter() DateTime? createdAt,
  }) = _CropcommentModel;

  factory CropcommentModel.fromJson(Map<String, dynamic> json) =>
      _$CropcommentModelFromJson(json);

  factory CropcommentModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) =>
      CropcommentModel.fromJson(snapshot.data()!);
}
