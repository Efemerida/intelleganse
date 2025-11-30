import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sorting_garbage/config/locator.dart';
import 'package:sorting_garbage/data/dto/message_response_dto.dart';
import 'package:sorting_garbage/data/remote_data_source/sorting_remote_data_source.dart';

import '../repository/sorting_repository.dart';

@Singleton(as: SortingRepository)
class SortingRepositoryImpl implements SortingRepository{
  final SortingRemoteDataSource _sortingRemoteDataSource;

  SortingRepositoryImpl(this._sortingRemoteDataSource);

  Future<MessageResponseDto> upload(File file) async {
    locator<Logger>().w("message");
    final multipart = await MultipartFile.fromFile(
      file.path,
      filename: file.path.split('/').last,
    );

    return _sortingRemoteDataSource.sort(multipart);
  }
}