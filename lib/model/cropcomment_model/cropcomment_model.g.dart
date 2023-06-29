// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cropcomment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CropcommentModel _$$_CropcommentModelFromJson(Map<String, dynamic> json) =>
    _$_CropcommentModel(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      messageText: json['messageText'] as String?,
      sendTime: const TimestampDateTimeConverter()
          .fromJson(json['sendTime'] as Timestamp?),
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_CropcommentModelToJson(_$_CropcommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'messageText': instance.messageText,
      'sendTime': const TimestampDateTimeConverter().toJson(instance.sendTime),
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
    };
