import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/routing/app_router.dart';
import 'package:weather_app/firebase_options.dart';

import 'package:weather_app/weather_app.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GeolocatorPlatform.instance;
  runApp( WeatherApp(appRouter:AppRouter() ));
}
