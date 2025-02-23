import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

class CustomTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  Widget? suffixIcon;
  Widget? prefixIcon;
  CustomTextformfield(
      {super.key,
      required this.controller,
      required this.label,
      this.validator,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: MyColors.primaryColor,
      //decoration
      decoration: InputDecoration(
        
          filled: true,
          fillColor: MyColors.c2,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: MyColors.primaryColor,
              width: 2.0,
            ),
          )),

      obscureText: obscureText,
      validator: validator,
    );
  }
}
