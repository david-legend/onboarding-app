import 'package:flutter/material.dart';
import 'package:onboardingapp/values/values.dart';
import 'package:onboardingapp/widgets/custom_button.dart';
import 'package:onboardingapp/widgets/spaces.dart';

class OnBoardingCompleteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var heightOfScreen = MediaQuery.of(context).size.height - 24;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildWelcome(context),
              Spacer(flex: 1),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_48),
                child: CustomButton(
                  title: StringConst.HOORAY,
                  onPressed: () {},
                  textStyle: textTheme.button,
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcome(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height - 24;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: Sizes.MARGIN_16),
      child: Stack(
        children: <Widget>[
          Image.asset(
            ImagePath.TWINKLE,
            width: widthOfScreen,
            height: heightOfScreen * 0.4,
          ),
          Container(
            height: heightOfScreen * 0.6,
            child: Column(
              children: <Widget>[
                Image.asset(
                  ImagePath.SMILING_ATTENDANT,
                  width: widthOfScreen,
                  height: heightOfScreen * 0.4,
                ),
                SpaceH8(),
                ListBody(
                  mainAxis: Axis.vertical,
                  children: <Widget>[
                    Text(
                      StringConst.WELCOME,
                      textAlign: TextAlign.center,
                      style: textTheme.headline,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.WELCOME_MSG_1,
                      textAlign: TextAlign.center,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.WELCOME_MSG_2,
                      textAlign: TextAlign.center,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.LOREM_IPSUM,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
