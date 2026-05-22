import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({required this.sourceRepository, required this.newsRepository}) : super(HomeInitState());
  SourcesResponseModel? sourcesResponse;
  NewsResponseModel? newsResponse;
  int selectedIndex = 0;
  late SourceRepository sourceRepository;
  late NewsRepository newsRepository;
  late String category;

  void changeSelectedTab({required int index})async{
    selectedIndex = index;
    await getNews();
    emit(ChangeSelectedTabState());
  }

  void getSources({required String categoryName}) async {
    try {
      emit(GetSourcesLoadingState());
      category = categoryName;
      sourcesResponse = await sourceRepository.getSources(categoryName: categoryName);
      if(sourcesResponse!.status == 'ok'){
        emit(GetSourcesSuccessState());
        await getNews();
      } else{
        emit(GetSourcesErrorState(errorMessage: sourcesResponse?.message ?? 'Something Went Wrong, Try Again Later'));
      }
    } catch (e) {
      emit(GetSourcesErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getNews()async{
    try{
      emit(GetNewsLoadingState());
      newsResponse = await newsRepository.getNews(
        sourceId: sourcesResponse?.sources?[selectedIndex].id ?? '',
        categoryName: category,
      );
      if(newsResponse!.status == 'ok'){
        emit(GetNewsSuccessState());
      } else{
        emit(GetNewsErrorState(errorMessage: newsResponse?.message ?? 'Something Went Wrong, Try Again Later'));
      }
    }catch(e){
      emit(GetNewsErrorState(errorMessage: e.toString()));
    }
  }

}
