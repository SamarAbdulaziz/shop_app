import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/constant.dart';
import 'package:shop_app/core/themes/themes.dart';
import 'package:shop_app/presentation/view/screens/home_screen.dart';
import 'package:shop_app/presentation/view/screens/login-screen.dart';
import 'package:shop_app/presentation/view/screens/onBoarding_screen.dart';
import 'data/data_source/local_data_source/cache_helper.dart';
import 'data/data_source/remote_data_source/api_service.dart';
import 'data/data_source/remote_data_source/dio_helper.dart';
import 'presentation/manager/login_cubit/my_bloc_observer.dart';
import 'presentation/manager/shop_cubit/cubit/shop_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  ApiService.init();
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
      create: (context) => ShopCubit()
        ..getHomeData()
        ..getCatData()
        ..getHomeFavorite()
        ..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: lightTheme,
        home: startWidget, //OnBoardingScreen(),
      ),
    );
  }
}
