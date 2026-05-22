import 'package:news_app/models/news_response_model.dart';

abstract class NewsOfflineDataSource {
  Future<NewsResponseModel> getNews({
    required String sourceId,
    required String categoryName,
  });

  void saveNews({
    required String categoryName,
    required String sourceId,
    required NewsResponseModel newsResponse,
  });
}
