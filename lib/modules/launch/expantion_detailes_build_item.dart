import 'package:flutter/material.dart';

import '../../shared/components/ui_components/default_app_card.dart';
import '../../shared/styles/app_theme.dart';
import '../../shared/styles/font_styles.dart';

class ExpantionDetailsBuildItem extends StatelessWidget {
  const ExpantionDetailsBuildItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final List<String> value;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.darkTheme.copyWith(
        dividerColor: Colors.transparent,
      ),
      child: DefaultAppCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: ExpansionTile(
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          title: Text(title, style: AppTextStyles.thirdTextStyle()),
          children: List.generate(
            value.length,
            (index) => ListTile(
              title: Text(value[index], style: AppTextStyles.subTextStyle()),
            ),
          ),
        ),
      ),
    );
  }
}
