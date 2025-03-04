import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/extenstions.dart';
import 'package:weather_app/core/routing/routes.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/widgets/custom_evaluated_button.dart';
import 'package:weather_app/features/onboarding/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: const [
                  OnboardingPage(
                    title: 'Smart Weather Decisions',
                    description:
                        'Get AI-driven recommendations on whether to go out or stay home based on real-time weather conditions',
                    imageUrl: 'assets/images/onboarding3.svg',
                  ),
                  OnboardingPage(
                    title: 'Stay Ahead of the Weather',
                    description:
                        'Check live weather forecasts with accurate data, including temperature and condition.',
                    imageUrl: 'assets/images/onboarding2.svg',
                  ),
                  OnboardingPage(
                    title: 'Simple & Intuitive Experience',
                    description:
                        'Enjoy a sleek, easy-to-use interface designed for quick and hassle-free weather insights',
                    imageUrl: 'assets/images/onboarding1.svg',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: CustomIndicator(isActive: _currentIndex == index),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Color.fromARGB(255, 199, 198, 198),
                          fontSize: 18),
                    ),
                  ),
                  CustomEvaluatedButton(
                      width: 120,
                      height: 55,
                      fontsize: 18,
                      horizontalval: 10,
                      onTap: () {
                        if (_currentIndex < 2) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          context.pushNamedAndRemoveUntil(Routes.registerScreen,
                              routePredicate: (route) => false);
                        }
                      },
                      title: _currentIndex == 2 ? "Done" : "Next")
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final bool isActive;

  const CustomIndicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 30 : 10,
      decoration: BoxDecoration(
        color: isActive ? MyColors.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
