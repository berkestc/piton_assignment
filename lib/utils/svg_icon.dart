import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SvgIcon extends StatelessWidget {
  final String name;
  final Color? color;
  final Size? size;

  const SvgIcon({
    required this.name,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      Svg(
        "assets/icons/$name.svg",
        color: color,
        size: size,
      ),
      size: size != null ? max(size!.height, size!.width) : null,
      color: color,
    );
  }
}
