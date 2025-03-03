import 'package:flutter/material.dart';

//3
class SymmetricalCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8); // Start at 80% height on the left

    // Adjust the control points for a more balanced curve
    path.quadraticBezierTo(
        size.width / 2,
        size.height * 1.0, // Control point at the center
        size.width,
        size.height * 0.8); // End at 80% height on the right

    path.lineTo(size.width, 0); // Close the path at the top-right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class AsymmetricalCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7); 

    // Asymmetrical curve peaking more on the right
    path.quadraticBezierTo(
        size.width * 0.7,
        size.height * 1.2, 
        size.width,
        size.height * 0.8); 

    path.lineTo(size.width, 0); 
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WaveCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8); //  80% height on the left

    // First control point
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.6, 
        size.width * 0.5, size.height * 0.8); 

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 1.0, 
        size.width, size.height * 0.8);

    path.lineTo(size.width, 0); // Close the path at the top-right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}