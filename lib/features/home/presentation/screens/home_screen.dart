import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/colors_class.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/core/widgets/custom_background.dart';
import 'package:weather_app/features/home/presentation/widgets/build_hourly_forecast.dart';

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
                  height: 50,
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
                const SizedBox(height: 400),
                buildHourlyForecast(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildInfoCard(String title, String value, IconData icon) {
  return Container(
    decoration: BoxDecoration(
      color: MyColors().componentsColor,
      gradient: LinearGradient(
        colors: [MyColors().primaryColor, MyColors().componentsColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.all(12),
    child: Row(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              value,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
