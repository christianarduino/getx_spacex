import 'package:getx_spacex/src/search/domain/model/search_launches_response_model.dart';

abstract class SearchRepository {
  Future<SearchLaunchesResponseModel> searchLaunches(String filter);
}