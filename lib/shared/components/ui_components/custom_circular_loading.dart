import 'package:flutter/material.dart';
import '../../styles/app_colors.dart';

class CustomCircularLoading extends StatelessWidget {
  const CustomCircularLoading({
    Key? key,
    this.width = 25,
    this.height = 25,
    this.color = AppColors.primaryColor,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
