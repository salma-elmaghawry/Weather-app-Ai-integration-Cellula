import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

void showPredictionDialog(BuildContext context, int prediction) {
  AwesomeDialog(
    titleTextStyle: const TextStyle(
        color: MyColors.primaryColor, fontWeight: FontWeight.bold),
    context: context,
    dialogType: prediction == 1 ? DialogType.success : DialogType.warning,
    animType: AnimType.bottomSlide,
    title: 'Prediction',
    desc: prediction == 1
        ? '☁ Weather is Good, \n You can Go out.'
        : '☁ Weather is Bad, \n Stay at home.',
    btnOkOnPress: () {},
    btnOkColor: MyColors.primaryColor,
  ).show();
}
