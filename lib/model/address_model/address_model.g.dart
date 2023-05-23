// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      city: json['city'] as String? ?? '',
      number: json['number'] as String? ?? '',
      prefecture: json['prefecture'] as String? ?? '',
      zipCode: json['zipCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'number': instance.number,
      'prefecture': instance.prefecture,
      'zipCode': instance.zipCode,
    };
