import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  Object get arguments => ModalRoute.of(this)!.settings.arguments!;
}
