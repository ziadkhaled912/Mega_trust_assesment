import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_trust_task/models/launches/launch_data_model.dart';
import 'package:mega_trust_task/modules/home/cubit/home_cubit.dart';
import 'package:mega_trust_task/modules/launch/expantion_detailes_build_item.dart';
import 'package:mega_trust_task/modules/launch/launch_video_screen.dart';
import 'package:mega_trust_task/shared/components/services/app_services.dart';
import 'package:mega_trust_task/shared/components/ui_components/custom_text_icon.dart';
import 'package:mega_trust_task/shared/styles/font_styles.dart';
import '../../shared/components/services/shared_methods.dart';
import '../../shared/components/ui_components/default_cached_image.dart';
import '../../shared/responsive/responsive_widget.dart';
import '../../shared/styles/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class LaunchDetailsScreen extends StatefulWidget {
  const LaunchDetailsScreen({Key? key, required this.model}) : super(key: key);

  final LaunchModel model;

  @override
  State<LaunchDetailsScreen> createState() => _LaunchDetailsScreenState();
}

class _LaunchDetailsScreenState extends State<LaunchDetailsScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getLaunchPad(widget.model.launchpad ?? '');
    HomeCubit.get(context).getRocketById(widget.model.rocket ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return responsiveWidget(
          responsive: (_, deviceInfo) => Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Conditional.single(
              context: context,
              conditionBuilder: (context) =>
                  cubit.isLaunchPadModelLoading == false,
              fallbackBuilder: (context) =>
                  const Center(child: CircularProgressIndicator()),
              widgetBuilder: (context) => CustomScrollView(
                slivers: [
                  SliverAppBar(
                    flexibleSpace: FlexibleSpaceBar(
                      background: DefaultCachedNetworkImage(
                        imageUrl: "${widget.model.links?.patch?.large}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    pinned: true,
                    expandedHeight: deviceInfo.screenHeight * 0.5,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          foregroundColor: AppColors.primaryColor,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.ondemand_video_outlined),
                            onPressed: () async {
                              if(widget.model.links?.youtubeId != null) {
                                AppServices.navigateTo(
                                  context,
                                  LaunchVideoScreen(
                                    videoId: widget.model.links!.youtubeId!,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                    systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarBrightness: Brightness.light,
                      statusBarIconBrightness: Brightness.light,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Text('${widget.model.name}',
                              style: AppTextStyles.headersTextStyle()),
                          const SizedBox(height: 20),
                          CustomTextIcon(
                            icon: Icons.rocket_launch,
                            text: "Launch pad: ${cubit.launchPadModel.name}",
                            textStyle: AppTextStyles.thirdTextStyle(),
                          ),
                          const SizedBox(height: 15),
                          CustomTextIcon(
                            icon: Icons.calendar_today,
                            text: SharedMethods.formatDate(
                                '${widget.model.dateLocal}'),
                            textStyle: AppTextStyles.thirdTextStyle(),
                          ),
                          const SizedBox(height: 20),
                          ExpantionDetailsBuildItem(
                            title: 'Rocket',
                            value: [
                              "name: ${cubit.rocketDataModel.name}",
                              "height: ${cubit.rocketDataModel.height?.meters} m",
                              "type: ${cubit.rocketDataModel.type}",
                            ],
                          ),
                          SizedBox(height: 20.h),
                          ExpantionDetailsBuildItem(
                            title: 'Launch pad',
                            value: [
                              "name: ${cubit.launchPadModel.name}",
                              "details: ${cubit.launchPadModel.details}",
                              "status: ${cubit.launchPadModel.status}",
                              "region: ${cubit.launchPadModel.region}",
                            ],
                          ),
                          SizedBox(height: 20.h),
                          ExpantionDetailsBuildItem(
                            title: 'Launch',
                            value: [
                              "name: ${widget.model.name}",
                              "details: ${widget.model.details}",
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
