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
import 'package:routemaster/routemaster.dart';

final appRoutes = RouteMap(
  routes: {
    '/': (e) => const MaterialPage(child: BaseScreen()),
    '/otp': (e) => const MaterialPage(child: OTPScreen()),
    '/login': (e) => const MaterialPage(child: LoginScreen()),
    '/signup': (e) => const MaterialPage(child: SignupScreen()),
    '/template': (e) => const MaterialPage(child: CustomTemplate()),
    '/build-card': (e) => const MaterialPage(child: BuildCardScreen()),
    '/billing': (e) => const MaterialPage(child: BillingDetailsScreen()),
    '/feature/:name': (e) => MaterialPage(
          child: FeaturesScreen(name: e.pathParameters["name"]!),
        ),
    '/delivery/:name': (e) => MaterialPage(
          child: DeliveryScreen(name: e.pathParameters["name"]!),
        ),
  },
);
