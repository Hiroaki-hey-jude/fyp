import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

//objectives
//User-friendly

//problems
//dose it really solve problem

//need to give them instrction first

//have you successfully bought crops



@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    @Default('') String city,
    @Default('') String number,
    @Default('') String prefecture,
    @Default('') String zipCode,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  factory AddressModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) =>
      AddressModel.fromJson(snapshot.data()!);
}
