import 'package:flutter/material.dart';

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
        Text(title,
            style: TextStyle(
                color: Colors.white, fontSize: 15)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionName,
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
