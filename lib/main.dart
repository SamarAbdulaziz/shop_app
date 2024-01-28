import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/themes/themes.dart';
import 'package:shop_app/data/dio_helper/dio_helper.dart';

import 'presentation/manager/login_cubit/my_bloc_observer.dart';
import 'presentation/screens/onBoarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: lightTheme,
      home: const OnBoardingScreen(),
    );
  }
}
