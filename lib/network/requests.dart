import 'package:http/http.dart' as http;

class GetRequest {
  Future<String?> getJsonData(String url) async {
    final uri = Uri.parse(url);
    final res = await http.get(uri);

    if (res.statusCode >= 200 && res.statusCode <= 208) {
      final json = res.body;
      return json;
    }

    return null;
  }
}
