import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_spacex/src/search/domain/model/search_launch_response_model.dart';
import 'package:getx_spacex/src/search/domain/model/search_launches_response_model.dart';
import 'package:getx_spacex/src/search/domain/search_repository.dart';
import 'package:getx_spacex/src/search/ui/model/search_launches_status_enum.dart';

class SearchViewModel extends GetxController {
  final SearchRepository _repository;

  final TextEditingController searchController = TextEditingController();

  SearchViewModel(this._repository);

  final int _startLengthSearch = 3;
  final int _timeTimerDebounce = 500;

  Rx<SearchRequestStatus> searchLaunchesStatus = SearchRequestStatus.Idle.obs;
  RxList<SearchLaunchResponseModel> launches =
      <SearchLaunchResponseModel>[].obs;
  Timer? _debounce;

  void onSearchFieldChange(String text) {
    if (text.length > _startLengthSearch) {
      cancelDebounceTimer();
      _debounce = Timer(Duration(milliseconds: _timeTimerDebounce), () async {
        await searchLaunch(text);
        _debounce!.cancel();
      });
    } else {
      cancelDebounceTimer();
      changeRequestStatus(SearchRequestStatus.Idle);
    }
  }

  Future<void> searchLaunch(String textFieldTerm) async {
    try {
      changeRequestStatus(SearchRequestStatus.Loading);
      final SearchLaunchesResponseModel response =
          await _repository.searchLaunches(
        textFieldTerm,
      );
      changeRequestStatus(SearchRequestStatus.Success);
      launches.assignAll(response.launches);
    } catch (err) {
      changeRequestStatus(SearchRequestStatus.Fail);
    }
  }

  void cancelDebounceTimer() {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
  }

  void changeRequestStatus(SearchRequestStatus status) =>
      searchLaunchesStatus.value = status;

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
