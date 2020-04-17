import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboardingapp/routes/router.gr.dart';
import 'package:onboardingapp/values/values.dart';
import 'package:onboardingapp/widgets/custom_button.dart';
import 'package:onboardingapp/widgets/custom_text_form_field.dart';
import 'package:onboardingapp/widgets/spaces.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool hasSuffixIcon = false;

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: heightOfScreen * 0.6,
                child: _buildRegistration(),
              ),
              Container(
                height: heightOfScreen * 0.3,
                child: _buildCodeCard(),
              ),
              SizedBox(height: heightOfScreen * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegistration() {
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
                  ImagePath.REGISTER,
                  width: widthOfScreen,
                  height: heightOfScreen * 0.4,
                ),
                SpaceH8(),
                ListBody(
                  mainAxis: Axis.vertical,
                  children: <Widget>[
                    Text(
                      StringConst.REGISTRATION,
                      textAlign: TextAlign.center,
                      style: textTheme.headline,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.ENTER_MOBILE,
                      textAlign: TextAlign.center,
                    ),
                    SpaceH12(),
                    Text(
                      StringConst.RECEIVE_VERIFICATION,
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
    final _UsNumberTextInputFormatter _phoneNumberFormatter =
    _UsNumberTextInputFormatter();
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
              CustomTextFormField(
                borderWidth: Sizes.WIDTH_1,
                borderStyle: BorderStyle.solid,
                hasPrefixIcon: true,
                hasSuffixIcon: hasSuffixIcon,
                textInputType: TextInputType.phone,
                hintText: StringConst.PHONE_NUMBER_HINT_TEXT,
                filled: true,
                validator: _validatePhoneNumber,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                  // Fit the validating format.
                  _phoneNumberFormatter,
                ],
                prefixIcon: Image.asset(ImagePath.UNITED_STATES_FLAG),
                suffixIcon: Image.asset(ImagePath.CORRECT),
                onChanged: onChanged,
              ),
              CustomButton(
                title: StringConst.GET_CODE,
                onPressed: () =>
                    Router.navigator.pushNamed(Routes.registerScreen),
                textStyle: textTheme.button,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onChanged(String value) {
    if (value.length == 14) {
      setState(() {
        hasSuffixIcon = true;
      });
    } else {
      setState(() {
        hasSuffixIcon = false;
      });
    }
  }

  String _validatePhoneNumber(String value) {
    final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value)) {
      return StringConst.VALID_PHONE_NUMBER;
    }
    return null;
  }

}


/// Format incoming numeric text to fit the format of (###) ###-#### ##
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}