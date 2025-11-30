import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_response_dto.freezed.dart';
part 'message_response_dto.g.dart';

@freezed
abstract class MessageResponseDto with _$MessageResponseDto {
  const factory MessageResponseDto({
    required List<dynamic> message,
    required String filename,
    @JsonKey(name: 'file_path') required String filePath,
  }) = _MessageResponseDto;

  factory MessageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseDtoFromJson(json);
}