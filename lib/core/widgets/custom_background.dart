import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/colors_class.dart';

class CustomBackground extends StatelessWidget {
  Widget? child;
  CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors().secondaryColor,
              MyColors().c22, // Add another color for the gradient
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.9),
              blurRadius: 10,
              offset:const  Offset(0, 5), // Shadow position
            ),
          ],
        ),
        child: child);
  }
}
