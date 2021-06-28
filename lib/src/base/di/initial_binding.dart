import 'package:get/instance_manager.dart';
import 'package:graphql/client.dart';
import 'package:getx_spacex/src/base/network/provide_graphql.dart';

class InitialBinding extends Bindings {
  final String host;

  InitialBinding(this.host);

  @override
  void dependencies() async {
    final GraphQLClient client = provideGraphql(host);
    Get.lazyPut(() => client);
  }
}
