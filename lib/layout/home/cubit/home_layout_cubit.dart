import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/modules/home/screens/home_screen.dart';
import 'package:mega_trust_task/modules/search/search_screen.dart';
part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  // Current nav index
  int currentIndex = 0;

  // List of nav screens
  List<Widget> selectedScreens = const [
    HomeScreen(),
    SearchScreen(),
  ];

  String selectedTitle() {
    final String title;
    switch (currentIndex) {
      case 0:
        title = 'SpaceX';
        break;
      default:
        title = 'Search';
        break;
    }
    return title;
  }

  // Change nav function
  void changeBottomNav(int index) {
    if(currentIndex != index) {
      currentIndex = index;
      emit(ChangeAppBottomNavState());
    }
  }
}
