import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

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
