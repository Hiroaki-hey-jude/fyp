import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../json_converter.dart';

part 'pass_model.freezed.dart';
part 'pass_model.g.dart';

@freezed
class PassModel with _$PassModel {
  const factory PassModel({
    @Default('') String consumerUid,
    @Default('') String farmerUid,
    @TimestampDateTimeConverter() DateTime? expirationDate,
  }) = _PassModel;

  factory PassModel.fromJson(Map<String, dynamic> json) =>
      _$PassModelFromJson(json);

  factory PassModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) =>
      PassModel.fromJson(snapshot.data()!);
}
