import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../models/enums/enums.dart';
import '../../styles/app_colors.dart';
import '../../styles/font_styles.dart';

class AppServices {
  static void navigateTo(context, widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  static void navigateToAndFinish(context, widget, {bool hasBack = false}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => hasBack ? route.isFirst : false,
      );

  static void futureNavigateToAndFinish(
    context,
    widget, {
    bool hasBack = false,
    Duration duration = const Duration(milliseconds: 900),
  }) {
    Future.delayed(duration, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => hasBack ? route.isFirst : false,
      );
    });
  }

  static void showDefaultModalSheet({
    required BuildContext context,
    required bool isDismissible,
    required bool isScrollable,
    required Widget child,
    bool expand = false,
  }) => showBarModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xffF1F1F1),
    barrierColor: Colors.black.withOpacity(0.5),
    enableDrag: isDismissible,
    isDismissible: isDismissible,
    expand: expand,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) => isScrollable ? SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: child,
    ) : child,
  );

  // Toast
  static void showToast({
    required String msg,
    required ToastStates state,
    ToastGravity position = ToastGravity.BOTTOM,
  }) =>
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: position,
        timeInSecForIosWeb: 5,
        backgroundColor: _chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0,
      );


  static Color _chooseToastColor(ToastStates state) {
    Color color;

    switch (state) {
      case ToastStates.success:
        color = AppColors.successColor;
        break;
      case ToastStates.error:
        color = AppColors.errorColor;
        break;
      case ToastStates.warning:
        color = AppColors.warningColor;
        break;
    }
    return color;
  }

  static void showSnackBar({
    required BuildContext context,
    required String text,
    SnackBarStates snackBarStates = SnackBarStates.idle,
  }) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: ListTile(
          title: Text(text, style: AppTextStyles.subTextStyle().copyWith(color: Colors.white)),
          leading: _generateSnackBarIcons(snackBarStates),
          horizontalTitleGap: 0,
        ),
        backgroundColor: _generateSnackBarColors(snackBarStates),
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.zero,
      ),
    );
  }
  static Color _generateSnackBarColors(SnackBarStates states) {
    Color color;
    switch (states) {
      case SnackBarStates.idle:
        color = AppColors.secondaryColor;
        break;
      case SnackBarStates.success:
        color = AppColors.successColor;
        break;
      case SnackBarStates.error:
        color = AppColors.errorColor;
        break;
      case SnackBarStates.warning:
        color = AppColors.warningColor;
        break;
    }
    return color;
  }
  static Icon? _generateSnackBarIcons(SnackBarStates states) {
    Icon? icon;
    switch (states) {
      case SnackBarStates.idle:
        icon = null;
        break;
      case SnackBarStates.success:
        icon = const Icon(Icons.check_circle_rounded, color: Colors.white);
        break;
      case SnackBarStates.error:
        icon = const Icon(Icons.cancel, color: Colors.white);
        break;
      case SnackBarStates.warning:
        icon = const Icon(Icons.warning, color: Colors.white);
        break;
    }
    return icon;
  }
}
