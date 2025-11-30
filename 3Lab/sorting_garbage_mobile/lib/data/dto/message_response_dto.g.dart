// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageResponseDto _$MessageResponseDtoFromJson(Map<String, dynamic> json) =>
    _MessageResponseDto(
      message: json['message'] as List<dynamic>,
      filename: json['filename'] as String,
      filePath: json['file_path'] as String,
    );

Map<String, dynamic> _$MessageResponseDtoToJson(_MessageResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'filename': instance.filename,
      'file_path': instance.filePath,
    };
