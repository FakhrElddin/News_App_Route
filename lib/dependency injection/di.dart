import 'package:news_app/repository/news/data_source/news_remote_data_source.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/respository/news_repository.dart';
import 'package:news_app/repository/news/respository/news_repository_impl.dart';
import 'package:news_app/repository/source/data_sources/source_remote_data_source.dart';
import 'package:news_app/repository/source/data_sources/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';

SourceRepository injectSourceRepository(){
  return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource());
}

SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl();
}

NewsRepository injectNewsRepository(){
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}

NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl();
}