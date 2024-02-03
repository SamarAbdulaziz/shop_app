import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/constatnt.dart';
import 'package:shop_app/core/themes/themes.dart';
import 'package:shop_app/data/local_data_source/cache_helper.dart';
import 'package:shop_app/data/remote_data_source/dio_helper.dart';
import 'package:shop_app/presentation/view/screens/home_screen.dart';
import 'package:shop_app/presentation/view/screens/login-screen.dart';
import 'package:shop_app/presentation/view/screens/onBoarding_screen.dart';

import 'presentation/manager/login_cubit/my_bloc_observer.dart';
import 'presentation/manager/shop_cubit/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  Widget startWidget;

  if (onBoarding != null) {
    if (token != null) {
      startWidget = const HomeScreen();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget = const OnBoardingScreen();
  }

  runApp(
    MyApp(
      startWidget: startWidget,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.startWidget,
  });

  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData()..getCatData()..getHomeFavorite(),
      child: MaterialApp(
        themeMode: ThemeMode.light,
        theme: lightTheme,
        home: startWidget, //OnBoardingScreen(),
      ),
    );
  }
}
