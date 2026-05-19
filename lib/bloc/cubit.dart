import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/repository/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(HomeInitState());
  SourcesResponseModel? sourcesResponse;
  NewsResponseModel? newsResponse;
  int selectedIndex = 0;
  HomeRepo homeRepo;

  void changeSelectedTab({required int index})async{
    selectedIndex = index;
    await getNews();
    emit(ChangeSelectedTabState());
  }

  void getSources({required String categoryName}) async {
    try {
      emit(GetSourcesLoadingState());
      sourcesResponse = await homeRepo.getSources(categoryName: categoryName);
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
      newsResponse = await homeRepo.getNews(sourceId: sourcesResponse?.sources?[selectedIndex].id ?? '');
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
