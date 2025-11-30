// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../data/remote_data_source/sorting_remote_data_source.dart' as _i372;
import '../data/repository/sorting_repository.dart' as _i448;
import '../data/repository_impl/sorting_repository_impl.dart' as _i720;
import 'locator.dart' as _i775;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final dioModule = _$DioModule();
    gh.lazySingleton<_i974.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.singleton<_i372.SortingRemoteDataSource>(
      () => _i372.SortingRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.singleton<_i448.SortingRepository>(
      () => _i720.SortingRepositoryImpl(gh<_i372.SortingRemoteDataSource>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i775.RegisterModule {}

class _$DioModule extends _i775.DioModule {}
