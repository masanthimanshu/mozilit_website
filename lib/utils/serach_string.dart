List<Map<String, dynamic>> searchWord({
  required String letters,
  required List<Map<String, dynamic>> array,
}) {
  List<Map<String, dynamic>> res = [];
  final String word = letters.toLowerCase();

  for (int i = 0; i < array.length; i++) {
    if (array[i]["name"].toLowerCase().startsWith(word)) {
      res.add(array[i]);
    }
  }

  return res;
}
