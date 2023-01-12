import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piton_assignment/constants/colors.dart';
import 'package:piton_assignment/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashScreenBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
        child: Column(
          children: const [
            Spacer(),
            _AppIcon(),
            Spacer(),
            _Buttons(),
          ],
        ),
      ),
    );
  }
}

class _AppIcon extends StatelessWidget {
  const _AppIcon();

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/icons/app_icon.png");
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.logIn),
          child: const Text("Login"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.register),
          child: const Text("Skip"),
        ),
      ],
    );
  }
}
