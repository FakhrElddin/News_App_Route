import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source.dart';
import 'package:http/http.dart' as http;

@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  @override
  Future<NewsResponseModel> getNews({required String sourceId}) async{
    Uri url = Uri.https("newsapi.org","/v2/everything",{
      "apiKey" : "125b3eb6cee749ebb0c4534321ded29d",
      "sources" : sourceId,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsResponseModel newsResponse = NewsResponseModel.fromJson(json);
    return newsResponse;
  }
}