import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/models/base/sidebar_data.dart';
import 'package:mozilit/network/requests.dart';

final getBaseSidebarData = FutureProvider.family((ref, String url) {
  return BaseSidebarController().getData(url);
});

class BaseSidebarController {
  Future<BaseSidebarModel?> getData(String url) async {
    final data = await GetRequest().getJsonData(url);

    if (data != null) return baseSidebarModelFromJson(data);
    return null;
  }
}
