import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/models/sources_response_model.dart';

class ApiManager {
  static Future<SourcesResponseModel> getSources({required String categoryName}) async{
    Uri url = Uri.https("newsapi.org","/v2/top-headlines/sources",{
      "apiKey" : "125b3eb6cee749ebb0c4534321ded29d",
      "category" : categoryName,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesResponseModel sourcesResponse = SourcesResponseModel.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponseModel> getNews({required String sourceId}) async{
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