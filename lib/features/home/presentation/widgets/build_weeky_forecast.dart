import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/home/data/weather_model.dart';

Widget buildWeeklyForecast(List<ForecastDay> forecast) {
  return SizedBox(
    height: 150,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: forecast.length,
      itemBuilder: (context, index) {
        final day = forecast[index];
        final date = DateFormat('yyyy-MM-dd').parse(day.date);
        final dayOfWeek = DateFormat('EEE').format(date);
        String iconPath;
        if (day.maxTemp > 25) {
          iconPath = sun; // Path to sunny icon
        } else {
          iconPath = moon; // Path to cloudy icon
        }

        return Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: Container(
            width: 60,
            height: 150,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [MyColors.primaryColor, MyColors.componentsColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayOfWeek,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(iconPath),
                // SvgPicture.asset(
                //   iconPath,
                //   height: 40,
                //   width: 40,
                // ),
                const SizedBox(height: 10),
                Text(
                  '${day.maxTemp}°',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
