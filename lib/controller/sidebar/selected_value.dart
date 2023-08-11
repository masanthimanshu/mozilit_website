import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedValueProvider = StateProvider.autoDispose<int>((ref) => 0);
