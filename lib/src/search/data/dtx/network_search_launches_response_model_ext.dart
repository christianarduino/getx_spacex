import 'package:getx_spacex/src/search/data/model/network_search_launch_response_model.dart';
import 'package:getx_spacex/src/search/data/model/network_search_launches_response_model.dart';
import 'package:getx_spacex/src/search/domain/model/search_launch_response_model.dart';
import 'package:getx_spacex/src/search/domain/model/search_launches_response_model.dart';

extension NetworkSearchLaunchResponseModelExt
    on NetworkSearchLaunchResponseModel {
  SearchLaunchResponseModel get toDomain => SearchLaunchResponseModel(
        details: details,
        missionName: missionName,
      );
}

extension NetworkSearchLaunchesResponseModelExt
    on NetworkSearchLaunchesResponseModel {
  SearchLaunchesResponseModel get toDomain => SearchLaunchesResponseModel(
        launches: launches
            .map<SearchLaunchResponseModel>(
                (NetworkSearchLaunchResponseModel item) => item.toDomain)
            .toList(),
      );
}
