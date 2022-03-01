import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';
import '../../styles/font_styles.dart';

class WrapChipWidget extends StatelessWidget {
  const WrapChipWidget({
    Key? key,
    required this.items,
    required this.selectedItems,
    required this.onSelected,
  }) : super(key: key);

  final List<String> items;
  final List<String> selectedItems;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 25,
      children: List.generate(
        items.length,
        (index) => Padding(
          padding: EdgeInsets.all(6.r),
          child: FilterChip(
            label: Text(
              items[index],
              style: AppTextStyles.thirdTextStyle()
                  .copyWith(color: Colors.black54),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.grey),
            ),
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            selectedColor: AppColors.primaryColor,
            selected: selectedItems.contains(items[index]),
            onSelected: (selected) {
                if (selected) {
                  selectedItems.add(items[index]);
                } else {
                  selectedItems
                      .removeWhere((element) => element == items[index]);
                }
            },
          ),
        ),
      ),
    );
  }
}
