import 'package:flutter/material.dart';
import 'package:elite_edge_labs/main.dart';

class ScreenNavigation {
  static goback({Object? payload}) {
    return Navigator.pop(
      MyApp.navigatorKey.currentContext!,
      payload,
    );
  }

  static gopush({required String screenName, Object? arguments}) {
    return Navigator.pushNamed(
      MyApp.navigatorKey.currentContext!,
      screenName,
      arguments: arguments,
    );
  }
}
