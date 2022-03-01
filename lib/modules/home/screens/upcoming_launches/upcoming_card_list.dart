import 'package:flutter/material.dart';
import 'package:mega_trust_task/models/launches/launch_data_model.dart';
import 'package:mega_trust_task/modules/home/screens/upcoming_launches/upcoming_launch_build_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_trust_task/modules/launch/launch_details_screen.dart';
import 'package:mega_trust_task/shared/components/services/app_services.dart';
import 'package:mega_trust_task/shared/components/services/shared_methods.dart';

class UpcomingCardList extends StatelessWidget {
  const UpcomingCardList({Key? key, required this.launches}) : super(key: key);

  final List<LaunchModel> launches;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          launches.length,
          (index) => UpcomingLaunchBuildItem(
            image: "${launches[index].links?.patch?.small}",
            name: "${launches[index].name}",
            date: SharedMethods.formatDate('${launches[index].dateLocal}'),
            percentage: SharedMethods.timeLeftPercentage('${launches[index].dateLocal}'),
            timeLeft: SharedMethods.timeLeft('${launches[index].dateLocal}'),
            onTap: () => AppServices.navigateTo(
                context,
                LaunchDetailsScreen(
                  model: launches[index],
                )),
          ),
        ),
      ),
    );
  }
}
