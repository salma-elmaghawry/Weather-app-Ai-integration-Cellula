import 'package:flutter/material.dart';
import 'package:weather_app/core/routing/routes.dart';
import 'package:weather_app/features/Auth/presentation/screens/login_screen.dart';
import 'package:weather_app/features/Auth/presentation/screens/onboarding_screen.dart';
import 'package:weather_app/features/Auth/presentation/screens/register_screen.dart';
import 'package:weather_app/features/home/presentation/screens/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text("No route defined for ${settings.name}")),
                ));
    }
  }
}
