import 'package:flutter/material.dart';
import 'package:elite_edge_labs/Views/login_screen.dart';
import 'package:elite_edge_labs/Views/splash_screen.dart';
import 'package:elite_edge_labs/Routes/screen_navigation_name.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenNavigationName.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return null;
    }
  }
}
