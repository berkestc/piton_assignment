import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piton_assignment/routes/routes.dart';
import 'package:piton_assignment/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => GestureDetector(
        onTap: () {
          // To close the keyboard when another element on the screen is tapped.
          final currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: child,
      ),
      child: MaterialApp(
        title: "Piton Assignment",
        theme: theme,
        initialRoute: Routes.splash,
        onGenerateRoute: Routes().onGenerateRoute,
      ),
    );
  }
}
