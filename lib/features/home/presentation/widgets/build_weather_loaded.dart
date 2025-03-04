import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/custom_evaluated_button.dart';
import 'package:weather_app/features/home/data/weather_model.dart';
import 'package:weather_app/features/home/presentation/widgets/build_weeky_forecast.dart';
import 'package:weather_app/features/home/presentation/widgets/show_prediction_dialog.dart';

Widget buildWeatherLoaded(
    BuildContext context, WeatherModel weather, int prediction) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            weather.cityName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          Text(
            '${weather.temp}°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          Text(
            weather.weatherCondition,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 7),
          CustomEvaluatedButton(
            width: 130,
            fontsize: 20,
            horizontalval: 10,
            title: "Go out ?",
            onTap: () {
              showPredictionDialog(context, prediction);
            },
          ),
          const SizedBox(height: 380),
          buildWeeklyForecast(weather.forecast),
        ],
      ),
    ),
  );
}
