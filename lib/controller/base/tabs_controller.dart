import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/models/base/tabs/all_tabs_model.dart';
import 'package:mozilit/network/requests.dart';

final getAllTabsData = FutureProvider.family((ref, String url) {
  return AllTabsController().getData(url);
});

class AllTabsController {
  Future<AllTabsModel?> getData(String url) async {
    final data = await GetRequest().getJsonData(url);

    if (data != null) return allTabsModelFromJson(data);
    return null;
  }
}
