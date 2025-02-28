class WeatherModel {
  final double temp;
  final double feelsLike;
  final String weatherCondition;
  final String cityName;
  final double windSpeed;
  final int humidity;
  final double uvIndex;
  final List<ForecastDay> forecast;

  WeatherModel({
    required this.temp,
    required this.feelsLike,
    required this.weatherCondition,
    required this.cityName,
    required this.windSpeed,
    required this.humidity,
    required this.uvIndex,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> jsonData) {
    var forecastList = jsonData['forecast']['forecastday'] as List;
    List<ForecastDay> forecast = forecastList.map((i) => ForecastDay.fromJson(i)).toList();

    return WeatherModel(
      temp: jsonData['current']['temp_c'],
      feelsLike: jsonData['current']['feelslike_c'],
      weatherCondition: jsonData['current']['condition']['text'],
      cityName: jsonData['location']['name'],
      windSpeed: jsonData['current']['wind_kph'],
      humidity: jsonData['current']['humidity'],
      uvIndex: jsonData['current']['uv'],
      forecast: forecast,
    );
  }
}

class ForecastDay {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String icon;

  ForecastDay({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.icon,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> jsonData) {
    return ForecastDay(
      date: jsonData['date'],
      maxTemp: jsonData['day']['maxtemp_c'],
      minTemp: jsonData['day']['mintemp_c'],
      condition: jsonData['day']['condition']['text'],
      icon: jsonData['day']['condition']['icon'],
    );
  }
}