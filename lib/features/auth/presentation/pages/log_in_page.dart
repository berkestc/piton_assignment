import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piton_assignment/constants/colors.dart';
import 'package:piton_assignment/custom/custom_text_form_field.dart';
import 'package:piton_assignment/utils/svg_icon.dart';

class LogInPage extends StatelessWidget {
  const LogInPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgIcon(
                name: "app_icon",
                size: Size(100.w, 65.h),
                color: primaryColor,
              ),
            ),
            SizedBox(height: 115.h),
            Text(
              "Welcome back!",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10.h),
            Text(
              "Login to your account",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 80.h),
            const _Email(),
            SizedBox(height: 24.h),
            const _Password(),
            SizedBox(height: 10.h),
            const _Actions(),
            const Spacer(),
            const _LogInButton(),
          ],
        ),
      ),
    );
  }
}

class _Email extends StatelessWidget {
  const _Email();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: "E-mail",
      hintText: "john@mail.com",
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
    );
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: "Password",
      obscureText: true,
      hintText: "••••••••",
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LimitedBox(
          maxHeight: 20,
          maxWidth: 20,
          child: Checkbox(
            value: false,
            onChanged: (_) {},
          ),
        ),
        SizedBox(width: 6.5.w),
        Text(
          "Remember Me",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            minimumSize: const Size(50, 16),
            textStyle:
                Theme.of(context).textTheme.bodyText1?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
          ),
          child: const Text("Register"),
        ),
      ],
    );
  }
}

class _LogInButton extends StatelessWidget {
  const _LogInButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: const Text("Login"));
  }
}
