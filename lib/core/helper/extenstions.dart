import 'package:flutter/material.dart';

  ///use this extension to navigate between screens
extension Navigation on BuildContext {
  //context.pushNamed('routeName');
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required routePredicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, routePredicate,
        arguments: arguments);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
