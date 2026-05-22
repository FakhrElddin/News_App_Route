import 'package:news_app/models/news_response_model.dart';

abstract class NewsRepository {
  Future<NewsResponseModel> getNews({required String sourceId, required String categoryName});
}