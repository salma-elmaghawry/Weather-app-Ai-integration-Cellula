import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/data/prediction_repo.dart';
import 'package:weather_app/features/home/data/weather_model.dart';
import 'package:weather_app/features/home/data/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  final PredictionService predictionService;

  WeatherCubit(this.weatherRepository, this.predictionService)
      : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await weatherRepository.fetchWeather(cityName);

      final features = [
        weather.weatherCondition == 'Partly cloudy' ? 1 : 0,
        0,
        weather.temp > 30 ? 1 : 0,
        weather.temp > 20 && weather.temp <= 30 ? 1 : 0,
        weather.humidity < 60 ? 1 : 0,
      ];

      final prediction = await predictionService.getPrediction(features);

      emit(WeatherLoaded(weather, prediction));
    } catch (e) {
      print('Cubit Error: $e');
      emit(WeatherError(e.toString()));
    }
  }
}
