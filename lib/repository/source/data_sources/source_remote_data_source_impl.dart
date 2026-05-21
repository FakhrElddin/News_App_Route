import 'dart:convert';

import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/repository/source/data_sources/source_remote_data_source.dart';
import 'package:http/http.dart' as http;


class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  @override
  Future<SourcesResponseModel> getSources({required String categoryName}) async{
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "125b3eb6cee749ebb0c4534321ded29d",
      "category": categoryName,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesResponseModel sourcesResponse = SourcesResponseModel.fromJson(json);
    return sourcesResponse;
  }
}