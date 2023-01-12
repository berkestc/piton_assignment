import 'package:flutter/material.dart';
import 'package:piton_assignment/routes/routes.dart';
import 'package:piton_assignment/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Piton Assignment",
      theme: theme,
      initialRoute: Routes.splash,
      onGenerateRoute: Routes().onGenerateRoute,
    );
  }
}
