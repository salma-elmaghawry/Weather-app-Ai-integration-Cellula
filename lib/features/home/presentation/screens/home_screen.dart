import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/custom_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
          child: ListView(
        children: const [
          SizedBox(
            height: 100,
          ),
          Center(
              child: Text(
            "Welcome to home",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ))
        ],
      )),
    );
  }
}
