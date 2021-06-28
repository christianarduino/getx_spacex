import 'package:getx_spacex/src/search/domain/model/search_launch_response_model.dart';

class SearchLaunchesResponseModel {
  final List<SearchLaunchResponseModel> launches;

  SearchLaunchesResponseModel({
    required this.launches,
  });
}
