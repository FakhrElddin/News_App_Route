import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/sources_response_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  SourcesResponseModel? sourcesResponse;

  void getSources({required String categoryName}) async {
    try {
      emit(GetSourcesLoadingState());
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
        "apiKey": "125b3eb6cee749ebb0c4534321ded29d",
        "category": categoryName,
      });
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      sourcesResponse = SourcesResponseModel.fromJson(json);
      emit(GetSourcesSuccessState());
    } catch (e) {
      emit(GetSourcesErrorState(errorMessage: e.toString()));
    }
  }
}
