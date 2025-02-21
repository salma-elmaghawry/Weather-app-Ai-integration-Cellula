import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/colors_class.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/features/Auth/presentation/screens/login_screen.dart';
import 'package:weather_app/features/Auth/presentation/screens/onboarding_screen.dart';
import 'package:weather_app/features/Auth/presentation/screens/register_screen.dart';
import 'package:weather_app/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: MyColors().bgColor,
      ),
      routes: {
        onboardingScreen: (context) => const OnboardingScreen(),
        loginScreen: (context) => LoginScreen(),
        registerscreen: (context) => RegisterScreen(),
        homeScreen:(context)=>HomeScreen(),
      },
      initialRoute: 'onboarding_screen',
    );
  }
}
