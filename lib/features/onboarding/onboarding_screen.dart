import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/helper/extenstions.dart';
import 'package:weather_app/core/routing/routes.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/widgets/custom_background.dart';
import 'package:weather_app/features/onboarding/cutom_clipper.dart';
import 'package:weather_app/features/onboarding/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<OnboardingData> onboardingPages = [
    OnboardingData(
      image: 'assets/images/onboarding1.svg',
      title: "Support Local Brands",
      description:
          "Shop from your favorite local brands and explore unique styles crafted just for you.",
    ),
    OnboardingData(
      image: 'assets/images/onboarding2.svg',
      title: "Curated Collections for You",
      description:
          "Get personalized fashion recommendations based on your style and preferences.",
    ),
    OnboardingData(
      image: 'assets/images/onboarding3.svg',
      title: "Shop Smart, Stay Trendy",
      description:
          "Exclusive deals, new arrivals, and the best\n of local fashion—all in one place!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: CustomBackground(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: onboardingPages[index].title,
                  description: onboardingPages[index].description,
                  imageUrl: onboardingPages[index].image,
                );
              },
            ),
            customIndicators(),
            Positioned(
              bottom: 40,
              left: 24,
              right: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentPage != 2)
                    GestureDetector(
                        onTap: () {
                          context.pushNamedAndRemoveUntil(Routes.registerScreen,
                              routePredicate: (route) => false);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  const Spacer(),
                  if (currentPage < onboardingPages.length - 1)
                    IconButton(
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    )
                  else
                    routetocutomerorbrand(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned customIndicators() {
    return Positioned(
      bottom: 120,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingPages.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: currentPage == index ? 29 : 8,
            decoration: BoxDecoration(
              color: currentPage == index ? MyColors.primaryColor : Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton routetocutomerorbrand(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.pushNamedAndRemoveUntil(Routes.registerScreen,
            routePredicate: (route) => false);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 12,
        ),
      ),
      child: const Text(
        "Get Started",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
