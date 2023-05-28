// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pass_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PassModel _$$_PassModelFromJson(Map<String, dynamic> json) => _$_PassModel(
      consumerUid: json['consumerUid'] as String? ?? '',
      farmerUid: json['farmerUid'] as String? ?? '',
      expirationDate: const TimestampDateTimeConverter()
          .fromJson(json['expirationDate'] as Timestamp?),
    );

Map<String, dynamic> _$$_PassModelToJson(_$_PassModel instance) =>
    <String, dynamic>{
      'consumerUid': instance.consumerUid,
      'farmerUid': instance.farmerUid,
      'expirationDate':
          const TimestampDateTimeConverter().toJson(instance.expirationDate),
    };
