import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/colors_class.dart';

Widget buildHourlyForecast() {
  return SizedBox(
    height: 150,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: 60,
          height: 150,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            //color: MyColors().componentsColor,
            gradient: LinearGradient(
              colors: [MyColors().primaryColor, MyColors().componentsColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '12 AM',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Icon(Icons.person, color: Colors.white, size: 24),
              SizedBox(height: 10),
              Text(
                '19°',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        );
      },
    ),
  );
}
