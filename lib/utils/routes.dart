import 'package:flutter/material.dart';
import 'package:mozilit/screens/auth/login_screen.dart';
import 'package:mozilit/screens/auth/signup_screen.dart';
import 'package:mozilit/screens/base/base_screen.dart';
import 'package:mozilit/screens/delivery/delivery_screen.dart';
import 'package:mozilit/screens/features/features_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (e) => const BaseScreen(),
  '/login': (e) => const LoginScreen(),
  '/signup': (e) => const SignupScreen(),
  '/feature': (e) => const FeaturesScreen(),
  '/delivery': (e) => const DeliveryScreen(),
};
