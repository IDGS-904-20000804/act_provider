import 'package:act_provider/screen/screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext context)> routes = {};
  static String initialRoute = '/Home';
  static onGenerateRouter(settings) {
    return MaterialPageRoute(builder: (context) {
      return const ErrorScreen();
    });
  }
}
