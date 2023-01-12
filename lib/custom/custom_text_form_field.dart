import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final Key? formFieldKey;
  final TextStyle? labelTextStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int maxLines;
  final String labelText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final String? hintText;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool enableInteractiveSelection;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField({
    required this.labelText,
    this.labelTextStyle,
    this.formFieldKey,
    this.controller,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.showCursor,
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
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.contentPadding,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.enabled = true,
    this.enableInteractiveSelection = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).inputDecorationTheme.labelStyle,
        ),
        SizedBox(height: 8.h),
        TextFormField(
          key: formFieldKey,
          autocorrect: autocorrect,
          autofillHints: autofillHints,
          autofocus: autofocus,
          autovalidateMode: autovalidateMode,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            enabled: enabled ?? true,
            contentPadding: contentPadding,
          ),
          enableInteractiveSelection: enableInteractiveSelection,
          enableSuggestions: enableSuggestions,
          enabled: enabled,
          focusNode: focusNode,
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
          readOnly: readOnly,
          scrollController: scrollController,
          showCursor: showCursor,
          style: Theme.of(context).inputDecorationTheme.labelStyle,
          textAlign: textAlign,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          validator: validator,
        ),
      ],
    );
  }
}
