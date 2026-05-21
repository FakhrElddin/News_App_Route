import 'package:news_app/models/news_response_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponseModel> getNews({required String sourceId});
}