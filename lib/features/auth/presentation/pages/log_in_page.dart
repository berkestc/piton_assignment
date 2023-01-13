import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/constants/colors.dart';
import 'package:piton_assignment/custom/custom_text_form_field.dart';
import 'package:piton_assignment/features/auth/presentation/providers/log_in_provider.dart';
import 'package:piton_assignment/routes/routes.dart';
import 'package:piton_assignment/utils/button_text.dart';
import 'package:piton_assignment/utils/svg_icon.dart';

final _formKeyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

class LogInPage extends ConsumerWidget {
  const LogInPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validationErrorVisibility = ref.watch(logInProvider.select((value) => value.validationErrorVisibility));
    final isLoading = ref.watch(logInProvider.select((value) => value.isLoading));

    return IgnorePointer(
      ignoring: isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: ScreenUtil().screenHeight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, (60 - ScreenUtil().statusBarHeight).h, 20.w, 40.h),
              child: Form(
                key: ref.watch(_formKeyProvider),
                autovalidateMode: validationErrorVisibility.when(
                  hide: () => AutovalidateMode.disabled,
                  show: () => AutovalidateMode.onUserInteraction,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _AppIcon(),
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
            ),
          ),
        ),
      ),
    );
  }
}

class _AppIcon extends StatelessWidget {
  const _AppIcon();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgIcon(
        name: "app_icon",
        size: Size(100.w, 65.h),
        color: primaryColor,
      ),
    );
  }
}

class _Email extends ConsumerWidget {
  const _Email();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logInNotifier = ref.watch(logInProvider.notifier);

    return CustomTextFormField(
      labelText: "E-mail",
      hintText: "john@mail.com",
      onChanged: logInNotifier.onEmailChanged,
      onSaved: logInNotifier.onEmailChanged,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      validator: (_) => ref.read(logInProvider).emailFailure.fold(
            () => null,
            (failure) => failure.when(
              emptyField: () => "Email cannot be left blank",
              invalidValue: () => "Invalid email",
            ),
          ),
    );
  }
}

class _Password extends ConsumerWidget {
  const _Password();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logInNotifier = ref.watch(logInProvider.notifier);

    return CustomTextFormField(
      labelText: "Password",
      obscureText: true,
      hintText: "••••••••",
      onChanged: logInNotifier.onPasswordChanged,
      onSaved: logInNotifier.onPasswordChanged,
      keyboardType: TextInputType.visiblePassword,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      validator: (_) => ref.read(logInProvider).passwordFailure.fold(
            () => null,
            (failure) => failure.whenOrNull(emptyField: () => "Password cannot be left blank"),
          ),
    );
  }
}

class _Actions extends ConsumerWidget {
  const _Actions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logInNotifier = ref.watch(logInProvider.notifier);
    final logInState = ref.watch(logInProvider);

    return Row(
      children: [
        LimitedBox(
          maxHeight: 20,
          maxWidth: 20,
          child: Checkbox(
            value: logInState.rememberMe,
            onChanged: (_) => logInNotifier.toggleRememberMe(),
          ),
        ),
        SizedBox(width: 6.5.w),
        Text(
          "Remember Me",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.register),
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

class _LogInButton extends ConsumerWidget {
  const _LogInButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(logInProvider.select((value) => value.isLoading));

    return ElevatedButton(
      onPressed: () => onPressed(context, ref),
      child: ButtonText(text: "Login", isLoading: isLoading),
    );
  }

  Future<void> onPressed(BuildContext context, WidgetRef ref) async {
    final formKey = ref.read(_formKeyProvider);

    formKey.currentState!.save();
    final isFormValid = formKey.currentState?.validate();

    if (isFormValid!) {
      FocusScope.of(context).unfocus();
    }

    await ref.read(logInProvider.notifier).logInWithEmailAndPassword();

    ref.read(logInProvider).failure.fold(
          () => null,
          (a) => a.fold(
            (l) => null, //TODO display error state
            (r) => Navigator.of(context).pushReplacementNamed(Routes.home),
          ),
        );
  }
}
