//@dart = 2.8

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:mockito/mockito.dart';
import 'package:getx_spacex/src/search/data/remote/search_remote_data_source.dart';
import 'package:getx_spacex/src/search/data/remote/search_remote_data_source_impl.dart';
import 'package:getx_spacex/src/search/domain/model/search_launches_request_model.dart';
import 'package:getx_spacex/src/search/domain/model/search_launches_response_model.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

void main() {
  final MockWebServer server = MockWebServer();
  GraphQLClient client;
  SearchRemoteDataSource _remoteDataSource;
  Map<String, dynamic> queryResult;

  setUp(() async {
    await server.start();
    client = GraphQLClientMock();
    _remoteDataSource = SearchRemoteDataSourceImpl(client);
    queryResult = {
      "__typename": "Query",
      "launches": [
        {"__typename": "Launch", "mission_name": "AsiaSat 6", "details": null},
        {"__typename": "Launch", "mission_name": "AsiaSat 8", "details": null}
      ]
    };
  });

  test("should return a list of two items", () async {
    when(client.query(any)).thenAnswer(
      (_) async => QueryResult(
        source: QueryResultSource.cache,
        data: queryResult,
      ),
    );

    final SearchLaunchesRequestModel requestModel =
        SearchLaunchesRequestModel("AsiaSat");
    final SearchLaunchesResponseModel response =
        await _remoteDataSource.searchLaunches(requestModel);

    expect(response.launches.length, 2);
    expect(response.launches.first.missionName, "AsiaSat 6");
    expect(response.launches.first.details, null);
  });
}
