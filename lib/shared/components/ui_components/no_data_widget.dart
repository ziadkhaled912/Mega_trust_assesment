import 'package:flutter/material.dart';

import '../../styles/font_styles.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    Key? key,
    this.text,
    required this.onPressed,
  }) : super(key: key);

  final String? text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
   return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 45,
            color: Colors.grey,
          ),
          const SizedBox(height: 15),
          Text(
            text ?? "عذرا لا يوجد بيانات",
            style: AppTextStyles.thirdTextStyle().copyWith(),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text("حاول مجددا"),
          ),
        ],
      ),
    );
  }
}
