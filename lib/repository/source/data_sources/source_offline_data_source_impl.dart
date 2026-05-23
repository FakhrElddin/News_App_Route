import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/repository/source/data_sources/source_offline_data_source.dart';

@Injectable(as: SourceOfflineDataSource)
class SourceOfflineDataSourceImpl implements SourceOfflineDataSource{
  @override
  Future<SourcesResponseModel> getSources({required String categoryName}) async{
    var box = await Hive.openBox('SourcesTab');
    var sources = box.get(categoryName);
    if(sources != null){
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
    await box.put(categoryName, sourcesResponse);
    await box.close();
  }
}