import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/colors_class.dart';
import 'package:weather_app/core/widgets/custom_background.dart';
import 'package:weather_app/features/home/presentation/widgets/build_hourly_forecast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple,
      body: CustomBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Montreal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '19° | Mostly Clear',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                buildHourlyForecast(),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: [
                      buildInfoCard(
                          'Air Quality', '3-Low Health Risk', Icons.air),
                      buildInfoCard('UV Index', '4 Moderate', Icons.wb_sunny),
                      buildInfoCard('Sunrise', '5:28 AM', Icons.wb_twilight),
                      buildInfoCard(
                          'Rainfall', '1.8 mm in last hour', Icons.water_drop),
                    ],
                  ),
                )
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
