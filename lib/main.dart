import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/routes/routes.dart';
import 'package:piton_assignment/theme/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

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
        debugShowCheckedModeBanner: false,
        title: "Piton Assignment",
        theme: theme,
        initialRoute: Routes.landing,
        onGenerateRoute: Routes().onGenerateRoute,
      ),
    );
  }
}
