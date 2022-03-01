import 'package:flutter/material.dart';

import '../../styles/font_styles.dart';
import 'custom_circle_icon_button.dart';

class CustomCircleIconButtonWithLabel extends StatelessWidget {
  const CustomCircleIconButtonWithLabel({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.radius,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final Widget icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final double radius;
  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCircleIconButton(
          icon: icon,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          radius: radius,
          onPressed: onPressed,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: AppTextStyles.subTextStyle().copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
