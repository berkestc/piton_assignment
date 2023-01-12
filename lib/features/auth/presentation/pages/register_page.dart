import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piton_assignment/constants/colors.dart';
import 'package:piton_assignment/custom/custom_text_form_field.dart';
import 'package:piton_assignment/routes/routes.dart';
import 'package:piton_assignment/utils/svg_icon.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.w, (60 - ScreenUtil().statusBarHeight).h, 20.w, 40.h),
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
                "Welcome",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10.h),
              Text(
                "Register an account",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 75.h),
              const _Name(),
              SizedBox(height: 25.h),
              const _Email(),
              SizedBox(height: 24.h),
              const _Password(),
              SizedBox(height: 10.h),
              const _Actions(),
              SizedBox(height: 55.h),
              const _RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: "Name",
      hintText: "John Doe",
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
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
          onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.logIn),
          style: TextButton.styleFrom(
            minimumSize: const Size(50, 16),
            textStyle:
                Theme.of(context).textTheme.bodyText1?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
          ),
          child: const Text("Login"),
        ),
      ],
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pushNamed(Routes.home),
      child: const Text("Register"),
    );
  }
}
