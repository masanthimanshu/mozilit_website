import 'package:flutter/material.dart';
import 'package:mozilit/screens/features/features_screen.dart';
import 'package:mozilit/screens/screens.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (e) => const BaseScreen(),
  '/feature': (e) => const FeaturesScreen(),
};
