import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/features/home/domain/entities/weather.dart';

class WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSource(this.client);

  Future<WeatherModel> fetchWeather(String cityName) async {
    final response = await client.get(
      Uri.parse('${weatherUrl}forecast.json?key=$apiKey&hour=24&q=$cityName&days=3'),
      headers: {'accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}