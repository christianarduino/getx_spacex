import 'package:graphql/client.dart';
import 'package:getx_spacex/src/search/data/dtx/network_search_launches_response_model_ext.dart';
import 'package:getx_spacex/src/search/data/model/network_search_launches_request_model.dart';
import 'package:getx_spacex/src/search/data/model/network_search_launches_response_model.dart';
import 'package:getx_spacex/src/search/data/remote/query/launches.dart';
import 'package:getx_spacex/src/search/data/remote/search_remote_data_source.dart';
import 'package:getx_spacex/src/search/domain/model/search_launches_request_model.dart';
import 'package:getx_spacex/src/search/domain/model/search_launches_response_model.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final GraphQLClient _client;

  SearchRemoteDataSourceImpl(this._client);

  final String _searchTerm = "searchTerm";
  final String _launches = "launches";

  @override
  Future<SearchLaunchesResponseModel> searchLaunches(
      SearchLaunchesRequestModel requestModel) async {
    try {
      final NetworkSearchLaunchesRequestModel networkRequestModel =
          NetworkSearchLaunchesRequestModel(requestModel.filter);
      final QueryOptions options = QueryOptions(
        document: gql(searchLaunchesQuery),
        variables: <String, dynamic>{
          _searchTerm: networkRequestModel.searchTerm,
        },
      );
      final QueryResult result = await _client.query(options);
      final List<dynamic> list = result.data?[_launches];
      return NetworkSearchLaunchesResponseModel.fromJson(list).toDomain;
    } catch (err) {
      throw Error();
    }
  }
}
