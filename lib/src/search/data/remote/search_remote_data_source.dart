import 'package:getx_spacex/src/search/domain/model/search_launches_request_model.dart';
import 'package:getx_spacex/src/search/domain/model/search_launches_response_model.dart';

abstract class SearchRemoteDataSource {
  Future<SearchLaunchesResponseModel> searchLaunches(
      SearchLaunchesRequestModel requestModel);
}
