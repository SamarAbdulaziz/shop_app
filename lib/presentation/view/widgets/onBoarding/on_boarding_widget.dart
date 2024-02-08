import 'package:flutter/material.dart';
import 'package:shop_app/presentation/view/screens/onBoarding_screen.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.boarding,
  });

  final OnBoardingModel boarding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(
              boarding.image,
            ),
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          boarding.screenTitle,
          style: const TextStyle(fontSize: 24.0),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          boarding.screenBody,
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
