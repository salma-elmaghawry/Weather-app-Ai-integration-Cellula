import 'package:http/http.dart' as http;
import 'package:weather_app/core/helper/constant.dart';
import 'dart:convert';

import 'package:weather_app/features/home/data/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel> fetchWeather(String cityName) async {
    try {
      final response = await http.get(
        Uri.parse('${weatherUrl}forecast.json?key=$apiKey&hour=24&q=$cityName&days=3'),
        headers: {'accept': 'application/json'},
      );
      print('City name: $cityName');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return WeatherModel.fromJson(jsonData);
      } else {
        print('Failed to load weather data: ${response.reasonPhrase}');
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load weather data');
    }
  }
}
