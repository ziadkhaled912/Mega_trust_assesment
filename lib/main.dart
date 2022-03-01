import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mega_trust_task/layout/home/screens/home_layout.dart';
import 'package:mega_trust_task/modules/home/cubit/home_cubit.dart';
import 'package:mega_trust_task/shared/cubit/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:mega_trust_task/shared/styles/app_theme.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await BlocOverrides.runZoned(
    () async {
      setUp();
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: OrientationBuilder(
        builder: (context, orientation) => ScreenUtilInit(
          designSize: orientation == Orientation.portrait
              ? const Size(375, 812)
              : const Size(812, 375),
          builder: () => MaterialApp(
            title: 'SpaceX',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            home: const HomeLayout(),
          ),
        ),
      ),
    );
  }
}

void setUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init(); // Dio Initialize
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const MyApp());
}
