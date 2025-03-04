import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/features/home/data/datasources/prediction_remote_data_source.dart';
import 'package:weather_app/features/home/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/home/data/repositories/prediction_repo_impl.dart';
import 'package:weather_app/features/home/data/repositories/weather_repo_impl.dart';
import 'package:weather_app/features/home/data/weather_model.dart';
import 'package:weather_app/features/home/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/features/home/presentation/cubits/weather/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/widgets/build_weather_loaded.dart';
import 'package:http/http.dart' as http;

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
        GetWeatherUseCase(
          WeatherRepositoryImpl(
              WeatherRemoteDataSource(http.Client()) as http.Client),
          PredictionRepositoryImpl(PredictionRemoteDataSource()),
        ),
      )..getWeather(widget.cityName),
      child: Scaffold(
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
                  return buildWeatherLoaded(
                      context, state.weather as WeatherModel, state.prediction);
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
}
