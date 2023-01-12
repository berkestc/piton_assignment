import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SvgIcon extends StatelessWidget {
  final String name;
  final bool overrideTheme;
  final Color? color;
  final Size? size;

  const SvgIcon({
    required this.name,
    this.size,
    this.overrideTheme = true,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      Svg(
        "assets/icons/$name.svg",
        color: overrideTheme ? color : null,
        size: size,
      ),
      size: size != null ? min(size!.height, size!.width) : null,
      color: overrideTheme ? color : null,
    );
  }
}
