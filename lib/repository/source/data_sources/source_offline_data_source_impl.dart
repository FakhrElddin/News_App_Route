import 'package:hive/hive.dart';
import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/repository/source/data_sources/source_offline_data_source.dart';

class SourceOfflineDataSourceImpl implements SourceOfflineDataSource{
  @override
  Future<SourcesResponseModel> getSources({required String categoryName}) async{
    var box = await Hive.openBox('SourcesTab');
    var data = box.get(categoryName);
    if(data != null){
      var sources = SourcesResponseModel.fromJson(data);
      return sources;
    }
    return SourcesResponseModel(
      status: 'error',
      message: 'No Internet And No Cached Data',
    );
  }

  @override
  void saveSources({required SourcesResponseModel sourcesResponse, required String categoryName}) async{
    var box = await Hive.openBox('SourcesTab');
    await box.put(categoryName, sourcesResponse.toJson());
    await box.close();
  }
}