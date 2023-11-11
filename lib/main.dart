import 'package:flutter/material.dart';
import 'package:shop_app/core/themes/themes.dart';

import 'presentation/screens/onBoarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: lightTheme,
      home: const OnBoardingScreen(),
    );
  }
}
