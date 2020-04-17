import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onboardingapp/routes/router.gr.dart';
import 'package:onboardingapp/values/values.dart';
import 'package:onboardingapp/widgets/custom_button.dart';
import 'package:onboardingapp/widgets/pin_entry_text_field.dart';
import 'package:onboardingapp/widgets/spaces.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({@required this.phoneNumber});

  final String phoneNumber;

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  Timer _timer;
  int _start = 59;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

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
                child: _buildVerification(),
              ),
              Container(
                height: heightOfScreen * 0.3,
                child: _buildCodeCard(),
              ),
              Center(
                child: Text(
                  "${StringConst.RESEND_CODE}$_start",
                  style: textTheme.subtitle.copyWith(
                    color: AppColors.violetShade1,
                  ),
                ),
              ),
              SizedBox(height: heightOfScreen * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerification() {
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
                  ImagePath.VERIFICATION,
                  width: widthOfScreen,
                  height: heightOfScreen * 0.4,
                ),
                SpaceH8(),
                ListBody(
                  mainAxis: Axis.vertical,
                  children: <Widget>[
                    Text(
                      StringConst.VERIFICATION,
                      textAlign: TextAlign.center,
                      style: textTheme.headline,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.ENTER_CODE,
                      textAlign: TextAlign.center,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.RECEIVED_CODE + "${widget.phoneNumber}",
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

  Widget _buildCodeCard() {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.MARGIN_16,
        vertical: Sizes.MARGIN_16,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: Sizes.MARGIN_20,
            vertical: Sizes.MARGIN_20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              PinEntryTextField(
                textStyle: textTheme.title.copyWith(
                  color: AppColors.blackShade1,
                  fontSize: Sizes.TEXT_SIZE_20,
                ), // end onSubmit
              ),
              CustomButton(
                title: StringConst.VERIFY,
                onPressed: () => Router.navigator.pushNamed(
                  Routes.fingerprintScreen,
                ),
                textStyle: textTheme.button,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _start = 59;
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
}
