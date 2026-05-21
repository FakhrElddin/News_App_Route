import 'package:news_app/models/sources_response_model.dart';

abstract class SourceRepository {
  Future<SourcesResponseModel> getSources({required String categoryName});
}