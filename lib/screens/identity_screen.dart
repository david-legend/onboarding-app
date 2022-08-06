import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:onboardingapp/routes/router.gr.dart';
import 'package:onboardingapp/values/values.dart';
import 'package:onboardingapp/widgets/custom_button.dart';
import 'package:onboardingapp/widgets/identity_card.dart';
import 'package:onboardingapp/widgets/spaces.dart';

class IdentityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var textTheme = Theme.of(context).textTheme;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: heightOfScreen * 0.6,
                child: _buildIdentity(context),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_16),
                child: Column(
                  children: <Widget>[
                    IdentityCard(
                      number: 1,
                      title: "National",
                      body: "Id Or Driver's license For Citizens",
                      hasRecommended: true,
                    ),
                    SpaceH16(),
                    IdentityCard(
                      number: 2,
                      title: "Passport",
                      body: "Required Passport For Non Citizens",
                    ),
                  ],
                ),
              ),
              SpaceH16(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_48),
                child: CustomButton(
                  title: StringConst.DONE,
                  textStyle: textTheme.bodySmall,
                  onPressed: () => AutoRouter.of(context).push(
                    OnBoardingCompleteScreenRoute(),
                  ),
                ),
              ),
              SpaceH16(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIdentity(BuildContext context) {
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
                  ImagePath.IDENTITY,
                  width: widthOfScreen,
                  height: heightOfScreen * 0.4,
                ),
                SpaceH8(),
                ListBody(
                  mainAxis: Axis.vertical,
                  children: <Widget>[
                    Text(
                      StringConst.IDENTITY,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineMedium,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.VERIFY_IDENTITY,
                      textAlign: TextAlign.center,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.REQUIRED,
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
