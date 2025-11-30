import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sorting_garbage/data/dto/message_response_dto.dart';

part 'sorting_remote_data_source.g.dart';


@singleton
@RestApi()
abstract class SortingRemoteDataSource{

  @factoryMethod
  factory SortingRemoteDataSource(
      Dio dio) = _SortingRemoteDataSource;

  @MultiPart()
  @POST('/upload')
  Future<MessageResponseDto> sort(
      @Part(name: 'photo') MultipartFile photo,
      );

}