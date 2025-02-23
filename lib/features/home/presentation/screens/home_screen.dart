import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/core/widgets/custom_background.dart';
import 'package:weather_app/features/home/presentation/widgets/build_weeky_forecast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bg_onboarding),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Montreal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                Text(
                  '19°',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                Text(
                  'Mostly Clear',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 19,
                  ),
                ),
                Text(
                  'L:19°   H:20°',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                Text(
                  'Prediction is .....',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 390),
                buildWeeklyForecast(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

