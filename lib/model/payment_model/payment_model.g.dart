// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentModel _$$_PaymentModelFromJson(Map<String, dynamic> json) =>
    _$_PaymentModel(
      uid: json['uid'] as String? ?? '',
      price: json['price'] as String? ?? '',
      paymentId: json['paymentId'] as String? ?? '',
      paidAt: const TimestampDateTimeConverter()
          .fromJson(json['paidAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_PaymentModelToJson(_$_PaymentModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'price': instance.price,
      'paymentId': instance.paymentId,
      'paidAt': const TimestampDateTimeConverter().toJson(instance.paidAt),
    };
