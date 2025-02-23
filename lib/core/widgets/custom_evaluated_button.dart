import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

class CustomEvaluatedButton extends StatelessWidget {
  void Function()? onTap;
  String title;
  CustomEvaluatedButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.secondaryColor,
              MyColors.primaryColor, // Add another color for the gradient
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(25), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5), // Shadow position
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
