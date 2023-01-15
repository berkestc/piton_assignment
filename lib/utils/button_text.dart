import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final bool? isLoading;
  final TextStyle? style;
  final double? height;
  final double? width;

  const ButtonText({
    required this.text,
    this.isLoading,
    this.style,
    this.height = 24,
    this.width = 24,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading == null || isLoading == false) {
      return Text(text, style: style);
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: const CircularProgressIndicator.adaptive(backgroundColor: Colors.white),
      );
    }
  }
}
