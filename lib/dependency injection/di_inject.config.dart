// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../bloc/cubit.dart' as _i615;
import '../repository/news/data_source/news_offline_data_source.dart' as _i938;
import '../repository/news/data_source/news_offline_data_source_impl.dart'
    as _i977;
import '../repository/news/data_source/news_remote_data_source.dart' as _i344;
import '../repository/news/data_source/news_remote_data_source_impl.dart'
    as _i1045;
import '../repository/news/repository/news_repository.dart' as _i251;
import '../repository/news/repository/news_repository_impl.dart' as _i941;
import '../repository/source/data_sources/source_offline_data_source.dart'
    as _i276;
import '../repository/source/data_sources/source_offline_data_source_impl.dart'
    as _i267;
import '../repository/source/data_sources/source_remote_data_source.dart'
    as _i659;
import '../repository/source/data_sources/source_remote_data_source_impl.dart'
    as _i920;
import '../repository/source/repository/source_repository.dart' as _i1033;
import '../repository/source/repository/source_repository_impl.dart' as _i975;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i659.SourceRemoteDataSource>(
        () => _i920.SourceRemoteDataSourceImpl());
    gh.factory<_i344.NewsRemoteDataSource>(
        () => _i1045.NewsRemoteDataSourceImpl());
    gh.factory<_i276.SourceOfflineDataSource>(
        () => _i267.SourceOfflineDataSourceImpl());
    gh.factory<_i938.NewsOfflineDataSource>(
        () => _i977.NewsOfflineDataSourceImpl());
    gh.factory<_i1033.SourceRepository>(() => _i975.SourceRepositoryImpl(
          remoteDataSource: gh<_i659.SourceRemoteDataSource>(),
          offlineDataSource: gh<_i276.SourceOfflineDataSource>(),
        ));
    gh.factory<_i251.NewsRepository>(() => _i941.NewsRepositoryImpl(
          remoteDataSource: gh<_i344.NewsRemoteDataSource>(),
          offlineDataSource: gh<_i938.NewsOfflineDataSource>(),
        ));
    gh.factory<_i615.HomeCubit>(() => _i615.HomeCubit(
          sourceRepository: gh<_i1033.SourceRepository>(),
          newsRepository: gh<_i251.NewsRepository>(),
        ));
    return this;
  }
}
