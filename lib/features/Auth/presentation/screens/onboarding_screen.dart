import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/helper/colors_class.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/core/widgets/custom_evaluated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bg_onboarding),
          fit: BoxFit.cover,
        ),
      ),
      child: const Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 680),
            Text(
              'Get real-time weather updates and forecasts\n for your location.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            customEvaluatedButton(),
          ],
        ),
      ),
    ));
  }
}
