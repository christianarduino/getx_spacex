import 'package:get/instance_manager.dart';
import 'package:graphql/client.dart';
import 'package:getx_spacex/src/search/data/remote/search_remote_data_source.dart';
import 'package:getx_spacex/src/search/data/remote/search_remote_data_source_impl.dart';
import 'package:getx_spacex/src/search/data/search_repository_impl.dart';
import 'package:getx_spacex/src/search/domain/search_repository.dart';
import 'package:getx_spacex/src/search/ui/viewmodel/search_viewmodel.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    final GraphQLClient _client = Get.find();
    final SearchRemoteDataSource _remoteDataSource =
        SearchRemoteDataSourceImpl(_client);
    final SearchRepository _repository =
        SearchRepositoryImpl(_remoteDataSource);
    final SearchViewModel _viewModel = SearchViewModel(_repository);
    Get.lazyPut(() => _viewModel);
  }
}
