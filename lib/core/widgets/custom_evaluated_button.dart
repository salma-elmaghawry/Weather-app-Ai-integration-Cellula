import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

class CustomEvaluatedButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final double? width;
  final double? height;
  final double? fontsize;
  final double? horizontalval;
  final double? verticalval;

  CustomEvaluatedButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width,
    this.fontsize,
    this.height,
    this.horizontalval,
    this.verticalval,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 200, // Default width
        height: height ?? 60, // Default height
        padding: EdgeInsets.symmetric(
            horizontal: horizontalval ?? 50, vertical: verticalval ?? 15),
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
            style: TextStyle(
              color: Colors.white,
              fontSize: fontsize ?? 18,
            ),
          ),
        ),
      ),
    );
  }
}
