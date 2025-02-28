import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/features/home/data/prediction_repo.dart';
import 'package:weather_app/features/home/data/weather_model.dart';
import 'package:weather_app/features/home/data/weather_repo.dart';
import 'package:weather_app/features/home/presentation/cubits/weather/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/widgets/build_weeky_forecast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.cityName});
  final String cityName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        WeatherRepository(),
        PredictionService(),
      )..getWeather(widget.cityName),
      child: Scaffold(
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
            child: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherLoaded) {
                  return _buildWeatherLoaded(
                      context, state.weather, state.prediction);
                } else if (state is WeatherError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return const Center(
                      child: Text('Please access your location first '));
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherLoaded(
      BuildContext context, WeatherModel weather, int prediction) {
    return Padding(
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
          Text(
            prediction == 1 ? 'You can go out' : 'Stay at home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 420),
          buildWeeklyForecast(weather.forecast),
        ],
      ),
    );
  }
}
