import 'package:flutter/material.dart';
import 'package:onboardingapp/routes/router.gr.dart';
import 'package:onboardingapp/values/values.dart';
import 'package:onboardingapp/widgets/custom_button.dart';
import 'package:onboardingapp/widgets/spaces.dart';
import 'package:dots_indicator/dots_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double currentIndexPage;
  int pageLength;

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 3;
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: heightOfScreen * 0.6,
                child: PageView(
                  children: <Widget>[
                    _buildWalkThrough(imageUrl: ImagePath.ASTRONAUT),
                    _buildWalkThrough(imageUrl: ImagePath.ASTRONAUT),
                    _buildWalkThrough(imageUrl: ImagePath.ASTRONAUT),
                  ],
                  onPageChanged: (value) {
                    setState(() => currentIndexPage = value.toDouble());
                  },
                ),
              ),
              Container(
                height: heightOfScreen * 0.1,
                child: DotsIndicator(
                  dotsCount: pageLength,
                  position: currentIndexPage,
                  decorator: DotsDecorator(
                    color: AppColors.grey,
                    activeColor: AppColors.violetShade1,
                  ),
                ),
              ),
              Container(
                height: heightOfScreen * 0.3,
                child: _buildButtons(context: context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalkThrough({@required String imageUrl}) {
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
                  imageUrl,
                  width: widthOfScreen,
                  height: heightOfScreen * 0.4,
                ),
                SpaceH8(),
                ListBody(
                  mainAxis: Axis.vertical,
                  children: <Widget>[
                    Text(
                      StringConst.STARTED,
                      textAlign: TextAlign.center,
                      style: textTheme.headline,
                    ),
                    SpaceH8(),
                    Text(
                      StringConst.JOIN,
                      textAlign: TextAlign.center,
                    ),
                    SpaceH8(),
                    Text(
                      StringConst.FREE_SHIPPING,
                      textAlign: TextAlign.center,
                    ),
                    SpaceH8(),
                    Text(
                      StringConst.INSTANTLY,
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

  Widget _buildButtons({@required BuildContext context}) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_48),
      child: Column(
        children: <Widget>[
          CustomButton(
            title: StringConst.CREATE_ACCOUNT,
            onPressed: () => AppRouter.navigator.pushNamed(Routes.registerScreen),
            textStyle: textTheme.button,
          ),
          SpaceH30(),
          CustomButton(
            title: StringConst.LOGIN,
            textStyle: textTheme.button.copyWith(color: AppColors.violetShade1),
            color: AppColors.white,
            borderSide: Borders.primaryBorder,
            onPressed: () => AppRouter.navigator.pushNamed(Routes.registerScreen),
          ),
        ],
      ),
    );
  }
}
