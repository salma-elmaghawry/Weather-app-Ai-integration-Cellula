import 'package:weather_app/features/home/data/weather_model.dart';

abstract class WeatherRepositoryInterface {
  Future<WeatherModel> fetchWeather(String cityName);
}