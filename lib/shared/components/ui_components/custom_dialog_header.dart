import 'package:flutter/material.dart';

class CustomDialogHeader extends StatelessWidget {
  const CustomDialogHeader({
    Key? key,
    required this.title,
    this.titleStyle,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: titleStyle,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
