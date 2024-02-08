import 'package:flutter/material.dart';
import 'package:shop_app/core/colors.dart';
import 'package:shop_app/data/local_data_source/cache_helper.dart';
import 'package:shop_app/presentation/view/screens/login-screen.dart';
import 'package:shop_app/presentation/view/widgets/onBoarding/on_boarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/components.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> boarding = [
    const OnBoardingModel(
        image: 'assets/images/onboarding.png',
        screenTitle: 'screen 1 Title',
        screenBody: 'screen 1 Body'),
    const OnBoardingModel(
        image: 'assets/images/onboarding.png',
        screenTitle: 'screen 2 Title',
        screenBody: 'screen 2 Body'),
    const OnBoardingModel(
        image: 'assets/images/onboarding.png',
        screenTitle: 'screen 3 Title',
        screenBody: 'screen 3 Body'),
  ];
  PageController boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
            function: () {
              submit(context);
            },
            text: 'skip',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    // setState(() {
                    //   isLast = true;
                    // });
                    debugPrint('last');
                  } else {
                    // setState(() {
                    //   isLast = false;
                    // });
                    debugPrint('not last ');
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => OnBoardingItem(
                  boarding: boarding[index],
                ),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit(context);
                    } else {
                      boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.ease);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void submit(context) {
  CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
    navigateAndFinish(
      context,
      LoginScreen(),
    );
  });
}


class OnBoardingModel {
  final String image;
  final String screenTitle;
  final String screenBody;

  const OnBoardingModel({
    required this.image,
    required this.screenTitle,
    required this.screenBody,
  });
}
