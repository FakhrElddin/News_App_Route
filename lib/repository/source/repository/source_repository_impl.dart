import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/repository/source/data_sources/source_offline_data_source.dart';
import 'package:news_app/repository/source/data_sources/source_remote_data_source.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource remoteDataSource;
  SourceOfflineDataSource offlineDataSource;
  SourceRepositoryImpl({required this.remoteDataSource, required this.offlineDataSource});

  @override
  Future<SourcesResponseModel> getSources({required String categoryName}) async{
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)){
      SourcesResponseModel sourcesResponse = await remoteDataSource.getSources(categoryName: categoryName);
      offlineDataSource.saveSources(sourcesResponse: sourcesResponse,categoryName: categoryName,);
      return sourcesResponse;
    } else{
      SourcesResponseModel sourcesResponse = await offlineDataSource.getSources(categoryName: categoryName);
      return sourcesResponse;
    }
  }
}