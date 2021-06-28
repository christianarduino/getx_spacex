import 'package:getx_spacex/src/search/data/model/network_search_launch_response_model.dart';

class NetworkSearchLaunchesResponseModel {
  final List<NetworkSearchLaunchResponseModel> launches;

  NetworkSearchLaunchesResponseModel(this.launches);

  NetworkSearchLaunchesResponseModel.fromJson(List<dynamic> json)
      : launches = json
            .map<NetworkSearchLaunchResponseModel>(
              (dynamic item) => NetworkSearchLaunchResponseModel.fromJson(item),
            )
            .toList();
}
