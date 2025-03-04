import 'package:weather_app/features/home/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeather(String cityName);
}