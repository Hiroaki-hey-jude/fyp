// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      posterId: json['posterId'] as String? ?? '',
      picsOfCrops: (json['picsOfCrops'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sentenceOfPost: json['sentenceOfPost'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'posterId': instance.posterId,
      'picsOfCrops': instance.picsOfCrops,
      'sentenceOfPost': instance.sentenceOfPost,
      'postId': instance.postId,
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
    };
