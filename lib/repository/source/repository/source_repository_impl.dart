import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/repository/source/data_sources/source_remote_data_source.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';


class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourcesResponseModel> getSources({required String categoryName}) async{

    SourcesResponseModel sourcesResponse = await remoteDataSource.getSources(categoryName: categoryName);
    return sourcesResponse;
  }
}