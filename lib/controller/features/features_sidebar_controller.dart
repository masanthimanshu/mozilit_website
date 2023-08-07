import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/models/features/sidebar_data.dart';
import 'package:mozilit/network/requests.dart';

final getFeatureSidebarData = FutureProvider.family((ref, String url) {
  return FeatureSidebarController().getData(url);
});

class FeatureSidebarController {
  Future<FeatureSidebarModel?> getData(String url) async {
    final data = await GetRequest().getJsonData(url);

    if (data != null) return featureSidebarModelFromJson(data);
    return null;
  }
}
