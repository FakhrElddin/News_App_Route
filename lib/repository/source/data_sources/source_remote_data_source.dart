import 'package:news_app/models/sources_response_model.dart';

abstract class SourceRemoteDataSource {
  Future<SourcesResponseModel> getSources({required String categoryName});
}