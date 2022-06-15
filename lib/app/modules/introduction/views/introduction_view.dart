import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:trajan_market/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:trajan_market/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    Get.put(SignUpController());
    return Scaffold(
      body: IntroductionScreen(
        dotsDecorator: DotsDecorator(
          size: Size(
            Dimensions.w15,
            Dimensions.w15,
          ),
          activeSize: Size(
            Dimensions.w20 + Dimensions.w5,
            Dimensions.w15,
          ),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          activeColor: Color(0xff519def),
          color: darkHeader,
        ),
        isTopSafeArea: true,
        controlsPadding: EdgeInsets.symmetric(
          horizontal: Dimensions.w20,
          vertical: Dimensions.h20,
        ),
        globalBackgroundColor: Color(
          0xffdcecfb,
        ),
        onDone: () {
          Get.offNamedUntil(Routes.SIGN_IN, (route) => false);
        },
        showBackButton: true,
        showSkipButton: false,
        showDoneButton: true,
        back: const Icon(Icons.arrow_back),
        skip: Text(
          'Skip',
          style: titleStyle.copyWith(
            color: Color(0xff519def),
            fontWeight: FontWeight.w600,
          ),
        ),
        next: const Icon(Icons.arrow_forward),
        done: Text(
          'Done',
          style: titleStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: Color(0xff519def),
          ),
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        pages: [
          PageViewModel(
            titleWidget: Text(
              "Welcome!",
              style: headingStyle.copyWith(
                color: Colors.black,
              ),
            ),
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "A new era of being a fashion like a King and Queen",
                    textAlign: TextAlign.center,
                    style: titleStyle.copyWith(
                      color: darkGrey,
                    ),
                  ),
                ),
              ],
            ),
            reverse: true,
            decoration: PageDecoration(
              bodyFlex: 2,
              imageFlex: 5,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            image: Image.asset(
              'assets/onboarding5.png',
              width: Dimensions.w30 * 8,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              "Free Delivery!",
              style: headingStyle.copyWith(
                color: Colors.black,
              ),
            ),
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "By ordering any items, you can get free delivery cost",
                    textAlign: TextAlign.center,
                    style: titleStyle.copyWith(
                      color: darkGrey,
                    ),
                  ),
                ),
              ],
            ),
            reverse: true,
            decoration: PageDecoration(
              bodyFlex: 2,
              imageFlex: 5,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            image: Image.asset(
              'assets/onboarding4.png',
              width: Dimensions.w30 * 8,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              "Buy Now, Save More!",
              style: headingStyle.copyWith(
                color: Colors.black,
              ),
            ),
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Redeem your code referal and save more your money",
                    textAlign: TextAlign.center,
                    style: titleStyle.copyWith(
                      color: darkGrey,
                    ),
                  ),
                ),
              ],
            ),
            reverse: true,
            decoration: PageDecoration(
              bodyFlex: 2,
              imageFlex: 5,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            image: Image.asset(
              'assets/onboarding7.png',
              width: Dimensions.w30 * 8,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildIntroductionScreen extends StatelessWidget {
  const BuildIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
