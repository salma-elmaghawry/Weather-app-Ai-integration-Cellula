import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/constant.dart';

class CustomBackground extends StatelessWidget {
  Widget? child;
  CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bg),
            fit: BoxFit.cover,
          ),
        ),
        child: child);
  }
}
