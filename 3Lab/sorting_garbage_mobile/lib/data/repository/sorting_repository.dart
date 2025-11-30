import 'dart:io';

import '../dto/message_response_dto.dart';

abstract interface class SortingRepository{
  Future<MessageResponseDto> upload(File file);
  }