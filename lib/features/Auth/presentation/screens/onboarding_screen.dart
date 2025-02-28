import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/core/helper/extenstions.dart';
import 'package:weather_app/core/routing/routes.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 680),
            const Text(
              'Get real-time weather updates and forecasts\n for your location.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomEvaluatedButton(
                title: "Get Started",
                onTap: () {
                  context.pushNamedAndRemoveUntil(Routes.registerScreen,
                      routePredicate: (route) => false);
                }),
          ],
        ),
      ),
    ));
  }
}
