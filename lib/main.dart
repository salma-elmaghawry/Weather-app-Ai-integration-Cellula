import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/colors_class.dart';
import 'package:weather_app/features/Auth/presentation/screens/onboarding_screen.dart';

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
      home:const  OnboardingScreen(),
    );
  }
}
