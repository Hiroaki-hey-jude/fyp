import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/model/address_model/address_model.dart';

import '../json_converter.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @Default(null) AddressModel? address,
    @Default('') String consumerUid,
    @Default('') String farmerUid,
    @TimestampDateTimeConverter() DateTime? orderAt,
    @Default('') String status,
    @Default('') String cropId,
    @Default('') String orderId,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  factory OrderModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) =>
      OrderModel.fromJson(snapshot.data()!);
}
