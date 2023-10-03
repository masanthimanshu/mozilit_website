List<String> searchWord({
  required String letters,
  required List<String> array,
}) {
  List<String> res = [];

  for (String word in array) {
    if (word.toLowerCase().startsWith(letters.toLowerCase())) {
      res.add(word);
    }
  }

  return res;
}
