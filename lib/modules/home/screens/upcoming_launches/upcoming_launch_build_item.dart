import 'package:flutter/material.dart';
import 'package:mega_trust_task/shared/components/ui_components/custom_text_icon.dart';
import '../../../../shared/components/ui_components/default_cached_image.dart';
import '../../../../shared/styles/app_colors.dart';
import '../../../../shared/styles/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingLaunchBuildItem extends StatelessWidget {
  const UpcomingLaunchBuildItem({
    Key? key,
    required this.image,
    required this.name,
    required this.date,
    required this.percentage,
    required this.timeLeft,
    required this.onTap,
  }) : super(key: key);

  final String image;
  final String name;
  final String date;
  final double percentage;
  final int timeLeft;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: AppColors.appBarBackgroundDarkColor,
          margin: EdgeInsetsDirectional.only(end: 10.w),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            isThreeLine: true,
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              name,
              style: AppTextStyles.thirdTextStyle().copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            leading: Container(
              width: 50.w,
              height: 50.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: DefaultCachedNetworkImage(
                imageUrl: image,
              ),
            ),
            subtitle: Column(
              children: [
                CustomTextIcon(
                  icon: Icons.rocket_launch,
                  text: date,
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: LinearProgressIndicator(
                          value: percentage,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primaryColor),
                          backgroundColor: Colors.grey[300],
                          minHeight: 8,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text('($timeLeft day)', style: AppTextStyles.subTextStyle()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
