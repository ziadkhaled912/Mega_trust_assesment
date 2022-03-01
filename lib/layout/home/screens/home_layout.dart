import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_trust_task/layout/home/cubit/home_layout_cubit.dart';
import 'package:mega_trust_task/layout/home/screens/home_bottom_navigation_bar.dart';
import 'package:mega_trust_task/modules/home/screens/home_screen.dart';
import 'package:mega_trust_task/shared/styles/app_colors.dart';
import 'package:mega_trust_task/shared/styles/font_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.selectedTitle(), style: AppTextStyles.headersTextStyle()),
              leading: Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.archive),
                ),
              ],
            ),
            body: cubit.selectedScreens[cubit.currentIndex],
            bottomNavigationBar: HomeBottomNavigationBar(cubit: cubit),
          );
        },
      ),
    );
  }
}
