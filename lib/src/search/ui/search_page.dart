import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:getx_spacex/resources/res.dart';
import 'package:getx_spacex/src/search/domain/model/search_launch_response_model.dart';
import 'package:getx_spacex/src/search/ui/model/search_launches_status_enum.dart';
import 'package:getx_spacex/src/search/ui/viewmodel/search_viewmodel.dart';

class SearchPage extends GetView<SearchViewModel> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appBarTitle".tr),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.padding),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "searchFieldPlaceholder".tr,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Dimensions.borderRadiusSearchField,
                    ),
                  ),
                ),
                controller: controller.searchController,
                onChanged: controller.onSearchFieldChange,
              ),
            ),
            Expanded(
              child: ObxValue(
                (Rx<SearchRequestStatus> statusRx) {
                  final status = statusRx.value;

                  switch (status) {
                    case SearchRequestStatus.Idle:
                      return Center(
                        child: SelectableText(
                          "searchIdle".tr,
                          textAlign: TextAlign.center,
                        ),
                      );
                    case SearchRequestStatus.Loading:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case SearchRequestStatus.Success:
                      return ListView.builder(
                        itemCount: controller.launches.length,
                        itemBuilder: (_, int i) {
                          final SearchLaunchResponseModel item =
                              controller.launches[i];
                          return ListTile(
                            title: SelectableText(item.missionName),
                            subtitle: SelectableText(
                              item.details ?? "noMissionDetail".tr,
                            ),
                          );
                        },
                      );
                    case SearchRequestStatus.Fail:
                      return Center(
                        child: SelectableText(
                          "genericError".tr,
                          textAlign: TextAlign.center,
                        ),
                      );
                  }
                },
                controller.searchLaunchesStatus,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
