import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "appBarTitle": "SpaceX GraphQL",
          'searchIdle': 'The search will start after the first 3 characters.\nDiscover the SpaceX missions!',
          'noMissionDetail': 'No details have been provided for this mission',
          'genericError': 'An unexpected error has occurred. Try again.',
          'searchFieldPlaceholder': 'Look for a SpaceX mission',
        },
      };
}