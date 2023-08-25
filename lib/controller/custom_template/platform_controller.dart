import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/models/custom_template/platform_data.dart';
import 'package:mozilit/network/requests.dart';

final getPlatformData = FutureProvider.family((ref, String url) {
  return PlatformDataController().getData(url);
});

class PlatformDataController {
  Future<PlatformDataModel?> getData(String url) async {
    final data = await ApiRequests().getRequest(url);

    if (data != null) return platformDataModelFromJson(data);
    return null;
  }
}
