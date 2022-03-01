import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_trust_task/modules/home/cubit/home_cubit.dart';
import 'package:mega_trust_task/modules/home/screens/launches/all_launches_list.dart';
import 'package:mega_trust_task/modules/home/screens/upcoming_launches/upcoming_card_list.dart';
import 'package:mega_trust_task/shared/components/ui_components/custom_title_widget.dart';
import 'package:mega_trust_task/shared/responsive/responsive_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getUpcomingLaunches()
        ..getPastLaunches(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return responsiveWidget(
            responsive: (_, deviceInfo) => SingleChildScrollView(
              child: Column(
                children: [
                  CustomTitleWidget(
                    title: 'Upcoming launches',
                    hasButton: true,
                    onPressed: () {},
                  ),
                  Conditional.single(
                    context: context,
                    conditionBuilder: (context) =>
                        cubit.isUpcomingLaunchLoading == false,
                    fallbackBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    widgetBuilder: (context) => UpcomingCardList(launches: cubit.upcomingLaunchModel),
                  ),
                  SizedBox(height: 15.h),
                  const CustomTitleWidget(
                    title: 'Launches',
                    hasButton: false,
                  ),
                  Conditional.single(
                    context: context,
                    conditionBuilder: (context) =>
                        cubit.isPastLaunchLoading == false,
                    fallbackBuilder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                    widgetBuilder: (context) =>
                        AllLaunchesList(deviceInfo: deviceInfo, launches: cubit.pastLaunchModel),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
