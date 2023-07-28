import 'package:flutter/material.dart';
import 'package:mozilit/screens/base/base_screen.dart';
import 'package:mozilit/screens/delivery/delivery_screen.dart';
import 'package:mozilit/screens/features/features_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (e) => const BaseScreen(),
  '/feature': (e) => const FeaturesScreen(),
  '/delivery': (e) => const DeliveryScreen(),
};
