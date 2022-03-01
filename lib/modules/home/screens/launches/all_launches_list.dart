import 'package:flutter/material.dart';
import 'package:mega_trust_task/modules/home/screens/launches/launche_card.dart';
import 'package:mega_trust_task/modules/launch/launch_details_screen.dart';
import 'package:mega_trust_task/shared/components/services/app_services.dart';
import 'package:mega_trust_task/shared/responsive/device_information.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../models/launches/launch_data_model.dart';
import '../../../../shared/responsive/device_type_enum.dart';

class AllLaunchesList extends StatelessWidget {
  const AllLaunchesList(
      {Key? key, required this.deviceInfo, required this.launches})
      : super(key: key);

  final DeviceInformation deviceInfo;
  final List<LaunchModel> launches;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      primary: false,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: deviceInfo.deviceType != DeviceType.mobile ? 3 : 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 15.h,
        childAspectRatio: 0.5,
      ),
      itemBuilder: (context, index) {
        var launch = launches[index];
        return LaunchCard(
          image: "${launch.links?.patch?.small}",
          name: "${launch.name}",
          details: launch.details,
          date: DateFormat.yMMMMd().format(DateTime.parse('${launch.dateLocal}')),
          status: launch.success,
          onTap: () => AppServices.navigateTo(
            context,
            LaunchDetailsScreen(model: launch),
          ),
        );
      },
    );
  }
}
