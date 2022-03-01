import 'package:flutter/material.dart';
import 'package:mega_trust_task/shared/styles/app_colors.dart';

import '../../styles/font_styles.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({
    Key? key,
    required this.title,
    required this.hasButton,
    this.onPressed,
    this.textColor,
  }) : super(key: key);

  final String title;
  final bool hasButton;
  final Function()? onPressed;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.secondaryTextStyle()
            .copyWith(fontWeight: FontWeight.w700),
      ),
      trailing: hasButton
          ? TextButton(
              onPressed: hasButton ? onPressed : () {},
              child: Text(
                'See All',
                style: AppTextStyles.subTextStyle()
                    .copyWith(color: AppColors.primaryColor),
              ),
            )
          : null,
    );
  }
}
