import 'package:weather_app/features/home/domain/entities/weather.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repo.dart';
import 'package:weather_app/features/home/domain/repositories/prediction_repo.dart';

class GetWeatherUseCase {
  final WeatherRepository weatherRepository;
  final PredictionRepository predictionRepository;

  GetWeatherUseCase(this.weatherRepository, this.predictionRepository);

  Future<WeatherPrediction> execute(String cityName) async {
    final weather = await weatherRepository.fetchWeather(cityName);

    final features = [
      weather.weatherCondition == 'Partly cloudy' ? 1 : 0,
      0,
      weather.temp > 30 ? 1 : 0,
      weather.temp > 20 && weather.temp <= 30 ? 1 : 0,
      weather.humidity < 60 ? 1 : 0,
    ];

    final prediction = await predictionRepository.getPrediction(features);

    return WeatherPrediction(weather, prediction);
  }
}