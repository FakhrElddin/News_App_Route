import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/repository/home_repo.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/respository/news_repository.dart';
import 'package:news_app/repository/news/respository/news_repository_impl.dart';
import 'package:news_app/repository/source/data_sources/source_remote_data_source.dart';
import 'package:news_app/repository/source/data_sources/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';

class HomeCubit extends Cubit<HomeStates> {
  //HomeCubit(this.homeRepo) : super(HomeInitState());
  HomeCubit() : super(HomeInitState()){
    sourceRemoteDataSource = SourceRemoteDataSourceImpl();
    sourceRepository = SourceRepositoryImpl(remoteDataSource: sourceRemoteDataSource);
    newsRemoteDataSource = NewsRemoteDataSourceImpl();
    newsRepository = NewsRepositoryImpl(remoteDataSource: newsRemoteDataSource);
  }
  SourcesResponseModel? sourcesResponse;
  NewsResponseModel? newsResponse;
  int selectedIndex = 0;
  //HomeRepo homeRepo;
  late SourceRepository sourceRepository;
  late SourceRemoteDataSource sourceRemoteDataSource;
  late NewsRepository newsRepository;
  late NewsRemoteDataSource newsRemoteDataSource;

  void changeSelectedTab({required int index})async{
    selectedIndex = index;
    await getNews();
    emit(ChangeSelectedTabState());
  }

  void getSources({required String categoryName}) async {
    try {
      emit(GetSourcesLoadingState());
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
      newsResponse = await newsRepository.getNews(sourceId: sourcesResponse?.sources?[selectedIndex].id ?? '');
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
