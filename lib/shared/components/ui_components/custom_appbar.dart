import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.elevation,
    this.borderRadius = 10,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final double borderRadius;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(borderRadius),
        ),
      ),
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 27,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      leading: leading,
      actions: actions,
      bottom: bottom,
      elevation: elevation,
    );
  }
}
