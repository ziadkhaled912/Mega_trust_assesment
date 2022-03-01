import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_trust_task/layout/home/cubit/home_layout_cubit.dart';

import '../../../shared/styles/app_colors.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({Key? key, required this.cubit}) : super(key: key);

  final HomeLayoutCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.appBarBackgroundDarkColor,
      selectedItemColor: AppColors.primaryColor,
      currentIndex: cubit.currentIndex,
      onTap: (index) {
        cubit.changeBottomNav(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: 'Search',
        ),
      ],
    );
  }
}
