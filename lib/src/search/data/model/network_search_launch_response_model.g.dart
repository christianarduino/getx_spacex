// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_search_launch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkSearchLaunchResponseModel _$NetworkSearchLaunchResponseModelFromJson(
    Map<String, dynamic> json) {
  return NetworkSearchLaunchResponseModel(
    json['__typename'] as String,
    json['mission_name'] as String,
    json['details'] as String?,
  );
}

Map<String, dynamic> _$NetworkSearchLaunchResponseModelToJson(
        NetworkSearchLaunchResponseModel instance) =>
    <String, dynamic>{
      '__typename': instance.typename,
      'mission_name': instance.missionName,
      'details': instance.details,
    };
