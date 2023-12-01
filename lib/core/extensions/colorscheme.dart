import 'package:flutter/material.dart';

extension ColorSheme on BuildContext {
  ColorScheme get colorSheme => Theme.of(this).colorScheme;
}
