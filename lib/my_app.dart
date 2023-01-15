import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'routes/routes.dart';

import 'theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            // To close the keyboard when another element on the screen is tapped.
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: child,
      ),
      child: MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: "Piton Assignment",
        theme: theme,
        initialRoute: Routes.landing,
        onGenerateRoute: Routes().onGenerateRoute,
      ),
    );
  }
}
