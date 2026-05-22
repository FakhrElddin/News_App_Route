import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/repository/news/data_source/news_offline_data_source.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsOfflineDataSource offlineDataSource;
  NewsRepositoryImpl({required this.remoteDataSource, required this.offlineDataSource});
  @override
  Future<NewsResponseModel> getNews({required String sourceId, required String categoryName}) async{
    List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)){
      NewsResponseModel newsResponse = await remoteDataSource.getNews(sourceId: sourceId);
      offlineDataSource.saveNews(categoryName: categoryName, sourceId: sourceId, newsResponse: newsResponse,);
      return newsResponse;
    }else{
      return offlineDataSource.getNews(sourceId: sourceId, categoryName: categoryName);
    }
  }
}