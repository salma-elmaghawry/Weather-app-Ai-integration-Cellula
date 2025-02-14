import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/colors_class.dart';

class customEvaluatedButton extends StatelessWidget {
  const customEvaluatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the next screen
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors().secondaryColor,
              MyColors()
                  .primaryColor, // Add another color for the gradient
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(25), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5), // Shadow position
            ),
          ],
        ),
        child: Text(
          'Get Started',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
