import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/models/base/screen_model.dart';
import 'package:mozilit/network/requests.dart';

final getAllTabsData = FutureProvider.family((ref, String url) {
  return AllTabsController().getData(url);
});

class AllTabsController {
  Future<BaseScreenModel?> getData(String url) async {
    final data = await ApiRequests().getRequest(url);

    if (data != null) return baseScreenModelFromJson(data);
    return null;
  }
}
