import 'package:flutter/material.dart';

class CustomCircleIconButton extends StatelessWidget {
  const CustomCircleIconButton({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.radius,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final double radius;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      child: FittedBox(
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
