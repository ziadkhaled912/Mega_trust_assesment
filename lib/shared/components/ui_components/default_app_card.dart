import 'package:flutter/material.dart';
import 'package:mega_trust_task/shared/styles/app_colors.dart';

class DefaultAppCard extends StatelessWidget {
  const DefaultAppCard({
    Key? key,
    required this.child,
    this.elevation = 4,
    this.margin = const EdgeInsets.all(16),
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  final Widget child;
  final double elevation;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: elevation,
      shadowColor: Colors.black54,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: AppColors.appBarBackgroundDarkColor,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
