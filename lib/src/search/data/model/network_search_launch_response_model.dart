import 'package:json_annotation/json_annotation.dart';

part 'network_search_launch_response_model.g.dart';

@JsonSerializable()
class NetworkSearchLaunchResponseModel {
  @JsonKey(name: "__typename")
  final String typename;
  @JsonKey(name: "mission_name")
  final String missionName;
  final String? details;

  NetworkSearchLaunchResponseModel(this.typename, this.missionName, this.details);

  factory NetworkSearchLaunchResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$NetworkSearchLaunchResponseModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$NetworkSearchLaunchResponseModelToJson(this);
}
