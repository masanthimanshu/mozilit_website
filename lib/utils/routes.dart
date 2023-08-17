import 'package:flutter/material.dart';
import 'package:mozilit/screens/auth/login_screen.dart';
import 'package:mozilit/screens/auth/otp_screen.dart';
import 'package:mozilit/screens/auth/signup_screen.dart';
import 'package:mozilit/screens/base/base_screen.dart';
import 'package:mozilit/screens/billing/billing_screen.dart';
import 'package:mozilit/screens/buildcard/buildcard_screen.dart';
import 'package:mozilit/screens/custom_template/custom_template.dart';
import 'package:mozilit/screens/delivery/delivery_screen.dart';
import 'package:mozilit/screens/features/features_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (e) => const BaseScreen(),
  '/otp': (e) => const OTPScreen(),
  '/login': (e) => const LoginScreen(),
  '/signup': (e) => const SignupScreen(),
  '/feature': (e) => const FeaturesScreen(),
  '/template': (e) => const CustomTemplate(),
  '/delivery': (e) => const DeliveryScreen(),
  '/build-card': (e) => const BuildCardScreen(),
  '/billing': (e) => const BillingDetailsScreen(),
};
