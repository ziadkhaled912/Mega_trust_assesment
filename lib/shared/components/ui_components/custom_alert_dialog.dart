import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';
import '../../styles/font_styles.dart';
import 'custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    this.textSpans,
    this.titleTextColor = AppColors.errorColor,
    required this.confirmButtonText,
    required this.confirmButtonAction,
    required this.rejectButtonText,
    required this.rejectButtonAction,
  }) : super(key: key);

  final String title;
  final String content;
  final List<TextSpan>? textSpans;
  final Color titleTextColor;
  final String confirmButtonText;
  final Function() confirmButtonAction;
  final String rejectButtonText;
  final Function() rejectButtonAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      title: Text(
        title,
        style: TextStyle(color: titleTextColor),
      ),
      content: RichText(
        text: TextSpan(
          text: content,
          style: AppTextStyles.thirdTextStyle().copyWith(height: 1.5),
          children: textSpans,
        ),
      ),
      actions: [
        CustomButton(
          text: confirmButtonText,
          width: 120.w,
          textColor: Colors.white,
          onPressed: confirmButtonAction,
        ),
        CustomButton(
          text: rejectButtonText,
          width: 120.w,
          textColor: Colors.white,
          backgroundColor: AppColors.errorColor,
          onPressed: rejectButtonAction,
        ),
      ],
    );
  }
}
