import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/font_styles.dart';

class CustomTextIcon extends StatelessWidget {
  const CustomTextIcon({
    Key? key,
    required this.icon,
    this.iconColor = AppColors.primaryColor,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(width: 7.w),
        Expanded(
            child: Text(
          text,
          style: textStyle ?? AppTextStyles.subTextStyle(),
              maxLines: 1,
        )),
      ],
    );
  }
}
