import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/routing/app_router.dart';

import 'package:weather_app/weather_app.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  GeolocatorPlatform.instance;
  runApp( WeatherApp(appRouter:AppRouter() ));
}
