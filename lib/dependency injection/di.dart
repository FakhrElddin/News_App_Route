import 'package:news_app/repository/news/data_source/news_offline_data_source.dart';
import 'package:news_app/repository/news/data_source/news_offline_data_source_impl.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';
import 'package:news_app/repository/source/data_sources/source_offline_data_source.dart';
import 'package:news_app/repository/source/data_sources/source_offline_data_source_impl.dart';
import 'package:news_app/repository/source/data_sources/source_remote_data_source.dart';
import 'package:news_app/repository/source/data_sources/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';

SourceRepository injectSourceRepository(){
  return SourceRepositoryImpl(
    remoteDataSource: injectSourceRemoteDataSource(),
    offlineDataSource: injectSourceOfflineDataSource(),
  );
}

SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl();
}

SourceOfflineDataSource injectSourceOfflineDataSource(){
  return SourceOfflineDataSourceImpl();
}

NewsRepository injectNewsRepository(){
  return NewsRepositoryImpl(
    remoteDataSource: injectNewsRemoteDataSource(),
    offlineDataSource: injectNewsOfflineDataSource(),
  );
}

NewsOfflineDataSource injectNewsOfflineDataSource(){
  return NewsOfflineDataSourceImpl();
}

NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl();
}