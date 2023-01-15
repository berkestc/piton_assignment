import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_text_form_field.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/button_text.dart';
import '../../../../utils/svg_icon.dart';
import '../providers/register_provider.dart';

final _formKeyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

class RegisterPage extends ConsumerWidget {
  const RegisterPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validationErrorVisibility = ref.watch(registerProvider.select((value) => value.validationErrorVisibility));
    final isLoading = ref.watch(registerProvider.select((value) => value.isLoading));

    return IgnorePointer(
      ignoring: isLoading,
      child: ColoredBox(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
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
                    const _LoginButton(),
                    SizedBox(height: 55.h),
                    const _RegisterButton(),
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

class _Name extends ConsumerWidget {
  const _Name();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerNotifier = ref.watch(registerProvider.notifier);

    return CustomTextFormField(
      labelText: "Name",
      hintText: "John Doe",
      textInputAction: TextInputAction.next,
      onChanged: registerNotifier.onNameChanged,
      onSaved: registerNotifier.onNameChanged,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      validator: (_) => ref.read(registerProvider).nameFailure.fold(
            () => null,
            (failure) => failure.when(
              emptyField: () => "Name cannot be left blank",
              invalidValue: () => "Invalid name",
            ),
          ),
    );
  }
}

class _Email extends ConsumerWidget {
  const _Email();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerNotifier = ref.watch(registerProvider.notifier);

    return CustomTextFormField(
      labelText: "E-mail",
      hintText: "john@mail.com",
      onChanged: registerNotifier.onEmailChanged,
      onSaved: registerNotifier.onEmailChanged,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      validator: (_) => ref.read(registerProvider).emailFailure.fold(
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
    final registerNotifier = ref.watch(registerProvider.notifier);

    return CustomTextFormField(
      labelText: "Password",
      obscureText: true,
      hintText: "••••••••",
      onChanged: registerNotifier.onPasswordChanged,
      onSaved: registerNotifier.onPasswordChanged,
      keyboardType: TextInputType.visiblePassword,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      validator: (_) => ref.read(registerProvider).passwordFailure.fold(
            () => null,
            (failure) => failure.whenOrNull(emptyField: () => "Password cannot be left blank"),
          ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.logIn),
        style: TextButton.styleFrom(
          minimumSize: const Size(50, 16),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        child: const Text("Login"),
      ),
    );
  }
}

class _RegisterButton extends ConsumerWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(registerProvider.select((value) => value.isLoading));

    return ElevatedButton(
      onPressed: () => onPressed(context, ref),
      child: ButtonText(text: "Register", isLoading: isLoading),
    );
  }

  Future<void> onPressed(BuildContext context, WidgetRef ref) async {
    final formKey = ref.read(_formKeyProvider);

    formKey.currentState!.save();
    final isFormValid = formKey.currentState?.validate();

    if (isFormValid!) {
      FocusScope.of(context).unfocus();
    }

    await ref.read(registerProvider.notifier).registerWithEmailAndPassword();

    ref.read(registerProvider).failure.fold(
          () => null,
          (a) => a.fold(
            (l) => null, //TODO display error state
            (r) => Navigator.of(context).pushReplacementNamed(Routes.home),
          ),
        );
  }
}
