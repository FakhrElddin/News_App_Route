import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/models/sources_response_model.dart';

abstract class HomeRepo {
  Future<SourcesResponseModel> getSources({required String categoryName});
  Future<NewsResponseModel> getNews({required String sourceId});
}