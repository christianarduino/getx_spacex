import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_spacex/src/base/di/initial_binding.dart';
import 'package:getx_spacex/src/base/translations/translation.dart';
import 'package:getx_spacex/src/search/di/search_binding.dart';
import 'package:getx_spacex/src/search/ui/search_page.dart';

void mainCommon(String host) {
  final InitialBinding initialBinding = InitialBinding(host);
  runApp(PatchAITest(
    initialBinding: initialBinding,
  ));
}

class PatchAITest extends StatelessWidget {
  final InitialBinding initialBinding;

  const PatchAITest({
    required this.initialBinding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: initialBinding,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      translations: Translation(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale("en", "US"),
      initialRoute: "/search",
      getPages: [
        GetPage(
          name: "/search",
          page: () => SearchPage(),
          binding: SearchBinding(),
        ),
      ],
    );
  }
}
