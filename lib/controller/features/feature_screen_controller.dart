import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/models/features/screen_data.dart';
import 'package:mozilit/network/requests.dart';

final getFeatureScreenData = FutureProvider.family((ref, String url) {
  return FeatureScreenController().getData(url);
});

class FeatureScreenController {
  Future<FeatureScreenModel?> getData(String url) async {
    final data = await GetRequest().getJsonData(url);

    if (data != null) return featureScreenModelFromJson(data);
    return null;
  }
}
