import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/models/sources_response_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  SourcesResponseModel? sourcesResponse;
  NewsResponseModel? newsResponse;
  int selectedIndex = 0;

  void changeSelectedTab({required int index})async{
    selectedIndex = index;
    await getNews();
    emit(ChangeSelectedTabState());
  }

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
      await getNews();
    } catch (e) {
      emit(GetSourcesErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getNews()async{
    try{
      emit(GetNewsLoadingState());
      Uri url = Uri.https("newsapi.org","/v2/everything",{
        "apiKey" : "125b3eb6cee749ebb0c4534321ded29d",
        "sources" : sourcesResponse?.sources?[selectedIndex].id ?? "",
      });
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      newsResponse = NewsResponseModel.fromJson(json);
      emit(GetNewsSuccessState());
    }catch(e){
      emit(GetNewsErrorState(errorMessage: e.toString()));
    }
  }

}
