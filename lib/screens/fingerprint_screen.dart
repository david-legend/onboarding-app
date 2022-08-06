import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:onboardingapp/routes/router.gr.dart';
import 'package:onboardingapp/values/values.dart';
import 'package:onboardingapp/widgets/custom_button.dart';
import 'package:onboardingapp/widgets/spaces.dart';

class FingerprintScreen extends StatefulWidget {
  @override
  _FingerprintScreenState createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
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
                child: _buildFingerPrintVerification(),
              ),
              Container(
                height: heightOfScreen * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset(ImagePath.FINGERPRINT),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: Sizes.MARGIN_48,
                      ),
                      child: CustomButton(
                        title: StringConst.CONTINUE,
                        textStyle: textTheme.bodySmall,
                        onPressed: () => AutoRouter.of(context).push(
                          IdentityScreenRoute(),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: Sizes.MARGIN_12),
                      child: InkWell(
                        onTap: () =>
                            AutoRouter.of(context).push(IdentityScreenRoute()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              StringConst.SKIP_TEXT,
                              style: textTheme.titleSmall?.copyWith(
                                color: AppColors.violetShade1,
                              ),
                            ),
                            SpaceW8(),
                            Image.asset(ImagePath.ARROW_FORWARD)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFingerPrintVerification() {
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
                  ImagePath.FINGERPRINT_SHIELD,
                  width: widthOfScreen,
                  height: heightOfScreen * 0.4,
                ),
                SpaceH8(),
                ListBody(
                  mainAxis: Axis.vertical,
                  children: <Widget>[
                    Text(
                      StringConst.FINGERPRINT,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineMedium,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.REST_FINGER,
                      textAlign: TextAlign.center,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.CAPTURE_FINGERPRINT,
                      textAlign: TextAlign.center,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.OPTIONAL,
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
