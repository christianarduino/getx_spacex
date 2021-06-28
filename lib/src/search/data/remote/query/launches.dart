final String searchLaunchesQuery = '''
  query SearchLaunches(\$searchTerm: String) {
    launches(find: {mission_name: \$searchTerm}) {
      mission_name
      details
    }
  }
''';
