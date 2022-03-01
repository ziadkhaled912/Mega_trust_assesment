import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../form_componants/custom_text_form_field.dart';
import '../icons/my_icons_icons.dart';

class DefaultAppSearchBar extends StatelessWidget {
  const DefaultAppSearchBar({
    Key? key,
    this.hint = 'ابحث عن المدرسين',
    required this.controller,
    required this.validation,
    required this.onPressed,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validation;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54.withOpacity(0.12),
                    spreadRadius: 0.5,
                    blurRadius: 15,
                    offset: const Offset(0, 5))
              ],
            ),
            child: CustomTextFormField(
              controller: controller,
              hint: hint,
              backgroundColor: AppColors.scaffoldBackgroundColor,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              hasBorder: false,
              validation: validation,
            ),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(MyIcons.filter),
        ),
      ],
    );
  }
}
