import 'package:hive/hive.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/repository/news/data_source/news_offline_data_source.dart';

class NewsOfflineDataSourceImpl implements NewsOfflineDataSource {
  @override
  Future<NewsResponseModel> getNews({required String sourceId, required String categoryName}) async{
    var box = await Hive.openBox('News');
    var newsResponse = box.get('$categoryName$sourceId');
    if(newsResponse != null){
      return newsResponse;
    }
    return NewsResponseModel(
      status: 'error',
      message: 'No Internet And No News Cached Data',
    );
  }

  @override
  void saveNews({
    required String categoryName,
    required String sourceId,
    required NewsResponseModel newsResponse,
  }) async {
    var box = await Hive.openBox('News');
    await box.put('$categoryName$sourceId', newsResponse);
    await box.close();
  }
}
