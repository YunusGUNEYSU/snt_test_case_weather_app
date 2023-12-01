import 'package:flutter/material.dart';

import '../../core/constants/border_radius.dart';
import '../../core/extensions/colorscheme.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.child,
      required this.onTap,
      required this.height,
      required this.width});
  final Widget child;
  final VoidCallback onTap;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 5, spreadRadius: 5, color: Colors.black12)],
            borderRadius: AppRadius.circular(),
            color: context.colorSheme.primary),
        child: child,
      ),
    );
  }
}
