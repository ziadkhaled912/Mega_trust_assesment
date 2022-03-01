import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';
import '../../styles/font_styles.dart';
import 'custom_circular_loading.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color? textColor;
  final Color borderColor;
  final double radius;
  final double padding;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final bool hasBorder;
  final bool isLoading;

  const CustomButton({
    Key? key,
    this.onPressed,
    this.text = 'write text',
    this.textColor,
    this.backgroundColor = AppColors.primaryColor,
    this.borderColor = AppColors.primaryColor,
    this.radius = 10.0,
    this.padding = 5.0,
    this.width = double.infinity,
    this.height = 50,
    this.textStyle,
    this.hasBorder = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: MaterialButton(
        color: backgroundColor,
        padding: EdgeInsets.all(padding),
        onPressed: isLoading ? null : onPressed,
        elevation: 0,
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
          side: hasBorder
              ? BorderSide(
                  width: 1.5,
                  color: onPressed != null ? borderColor : Colors.grey)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: isLoading
            ? const Center(child: CustomCircularLoading(color: Colors.white))
            : Text(
          text,
          style: textStyle ??
              AppTextStyles.thirdTextStyle().copyWith(
                color: textColor,
                fontWeight: FontWeight.w400
              ),
        ),
      ),
    );
  }
}
