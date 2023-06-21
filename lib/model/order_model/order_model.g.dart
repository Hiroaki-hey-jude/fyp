// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      consumerUid: json['consumerUid'] as String? ?? '',
      farmerUid: json['farmerUid'] as String? ?? '',
      orderAt: const TimestampDateTimeConverter()
          .fromJson(json['orderAt'] as Timestamp?),
      status: json['status'] as String? ?? '',
      cropId: json['cropId'] as String? ?? '',
      orderId: json['orderId'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'consumerUid': instance.consumerUid,
      'farmerUid': instance.farmerUid,
      'orderAt': const TimestampDateTimeConverter().toJson(instance.orderAt),
      'status': instance.status,
      'cropId': instance.cropId,
      'orderId': instance.orderId,
    };
