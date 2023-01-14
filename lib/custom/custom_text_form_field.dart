import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextStyle? labelTextStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final String? initialValue;
  final String obscuringCharacter;
  final bool obscureText;
  final String? hintText;
  final int? minLines;
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;

  const CustomTextFormField({
    this.labelText,
    this.labelTextStyle,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.maxLengthEnforcement,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.hintText,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.contentPadding,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.obscuringCharacter = '•',
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              labelText!,
              style: Theme.of(context).inputDecorationTheme.labelStyle,
            ),
          ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            contentPadding: contentPadding,
          ),
          initialValue: initialValue,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          onTap: onTap,
          style: Theme.of(context).inputDecorationTheme.labelStyle,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          validator: validator,
        ),
      ],
    );
  }
}
