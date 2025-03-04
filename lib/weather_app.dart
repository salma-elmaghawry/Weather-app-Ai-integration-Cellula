import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/routing/app_router.dart';
import 'package:weather_app/core/routing/routes.dart';
import 'package:weather_app/core/theming/app_colors.dart';

class WeatherApp extends StatelessWidget {
  final AppRouter appRouter;
  const WeatherApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Nunito'),
            bodyMedium: TextStyle(fontFamily: 'Nunito'),
            titleLarge: TextStyle(fontFamily: 'Nunito'),
            titleMedium: TextStyle(fontFamily: 'Nunito'),
            bodySmall: TextStyle(fontFamily: 'Nunito'),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 116, 120, 151),
        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onboardingScreen,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyColors {}
