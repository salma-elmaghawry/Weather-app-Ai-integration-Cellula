import 'package:flutter/material.dart';
import 'package:weather_app/core/helper/colors_class.dart';

class LineWithAction extends StatelessWidget {
  String title;
  String actionName;
  void Function()? onTap;

  LineWithAction({
    required this.actionName,
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionName,
            style: TextStyle(
                color: MyColors().primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
