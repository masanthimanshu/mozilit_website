import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabIndexProvider = StateProvider.autoDispose<int>((ref) => 0);