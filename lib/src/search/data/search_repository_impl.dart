import 'package:getx_spacex/src/search/data/remote/search_remote_data_source.dart';
import 'package:getx_spacex/src/search/domain/model/search_launches_request_model.dart';
import 'package:getx_spacex/src/search/domain/model/search_launches_response_model.dart';
import 'package:getx_spacex/src/search/domain/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource _remoteDataSource;

  SearchRepositoryImpl(this._remoteDataSource);

  @override
  Future<SearchLaunchesResponseModel> searchLaunches(String filter) {
    final SearchLaunchesRequestModel requestModel =
        SearchLaunchesRequestModel(filter);
    return _remoteDataSource.searchLaunches(requestModel);
  }
}
