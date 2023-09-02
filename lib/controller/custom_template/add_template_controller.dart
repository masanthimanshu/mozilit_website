import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/network/requests.dart';

final addCustomTemplate = FutureProvider.family((ref, String url) {
  return AddCustomTemplateController().postData(url);
});

class AddCustomTemplateController {
  Future<String?> postData(dynamic body) async {
    final data = await ApiRequests().postRequest(
      url: "endpoints.postRequest",
      payload: body,
    );

    return data;
  }
}
