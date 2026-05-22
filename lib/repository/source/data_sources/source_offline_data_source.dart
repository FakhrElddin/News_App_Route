import 'package:news_app/models/sources_response_model.dart';

abstract class SourceOfflineDataSource {
  Future<SourcesResponseModel> getSources({required String categoryName});
  void saveSources({required SourcesResponseModel sourcesResponse, required String categoryName});
}