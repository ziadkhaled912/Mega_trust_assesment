import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/components/ui_components/custom_text_icon.dart';
import '../../../../shared/components/ui_components/default_app_card.dart';
import '../../../../shared/components/ui_components/default_cached_image.dart';
import '../../../../shared/styles/app_colors.dart';
import '../../../../shared/styles/font_styles.dart';

class LaunchCard extends StatelessWidget {
  const LaunchCard({
    Key? key,
    required this.image,
    required this.name,
    this.details,
    required this.date,
    required this.onTap,
    this.status,
  }) : super(key: key);

  final String image;
  final String name;
  final String? details;
  final String date;
  final Function() onTap;
  final bool? status;

  @override
  Widget build(BuildContext context) {
    return DefaultAppCard(
      margin: const EdgeInsets.all(0),
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 160.h,
                child: DefaultCachedNetworkImage(
                  imageUrl: image,
                ),
              ),
              SizedBox(height: 15.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.thirdTextStyle()
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10.h),
                  if(details != null)
                  Text(
                    details!,
                    style: AppTextStyles.subTextStyle()
                        .copyWith(color: Colors.blueGrey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextIcon(
                    icon: Icons.calendar_today,
                    text: date,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextIcon(
                    icon: status != null
                        ? status! ? Icons.done : Icons.close
                        : Icons.rocket_launch,
                    text: status != null
                        ? status! ? 'Success' : 'Fail'
                        : 'Wait launching',
                    iconColor: status != null
                        ? status! ? AppColors.successColor : AppColors.errorColor
                        : Colors.blueGrey ,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
