import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<NewsResponseModel> getNews({required String sourceId}) async{
    NewsResponseModel newsResponse = await remoteDataSource.getNews(sourceId: sourceId);
    return newsResponse;
  }
}