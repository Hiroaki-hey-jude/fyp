// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CropModel _$$_CropModelFromJson(Map<String, dynamic> json) => _$_CropModel(
      cropId: json['cropId'] as String? ?? '',
      picsOfCrops: (json['picsOfCrops'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          null,
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
      price: json['price'] as String? ?? '',
      sellerId: json['sellerId'] as String? ?? '',
      hasUnread: json['hasUnread'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CropModelToJson(_$_CropModel instance) =>
    <String, dynamic>{
      'cropId': instance.cropId,
      'picsOfCrops': instance.picsOfCrops,
      'name': instance.name,
      'category': instance.category,
      'description': instance.description,
      'address': instance.address,
      'price': instance.price,
      'sellerId': instance.sellerId,
      'hasUnread': instance.hasUnread,
    };
