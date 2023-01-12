import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piton_assignment/splash_screen.dart';

class Routes {
  static const splash = "/splash";

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => const SplashScreen(),
                settings: settings,
              )
            : MaterialPageRoute(
                builder: (context) => const SplashScreen(),
                settings: settings,
              );
      default:
        return null;
    }
  }
}
