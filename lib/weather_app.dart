import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/routing/app_router.dart';
import 'package:weather_app/core/routing/routes.dart';

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
        theme: ThemeData(),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onboardingScreen,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
