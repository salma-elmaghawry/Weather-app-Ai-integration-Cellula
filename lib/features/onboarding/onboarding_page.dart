import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Curved Image

        const SizedBox(height: 10),

        // Title
        Text(title),

        const SizedBox(height: 10),

        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

// Custom Clipper for Curved Image
class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8); // Start at 80% height on the left

    // Adjust the control points for a more balanced curve
    path.quadraticBezierTo(
        size.width / 2, size.height * 1.0, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Model for Onboarding Data
class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}
