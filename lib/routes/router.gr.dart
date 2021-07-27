// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:onboardingapp/screens/welcome_screen.dart';
import 'package:onboardingapp/screens/registration_screen.dart';
import 'package:onboardingapp/screens/verification_screen.dart';
import 'package:onboardingapp/screens/fingerprint_screen.dart';
import 'package:onboardingapp/screens/identity_screen.dart';
import 'package:onboardingapp/screens/onboarding_complete_screen.dart';

abstract class Routes {
  static const welcomeScreen = '/';
  static const registerScreen = '/register-screen';
  static const verificationScreen = '/verification-screen';
  static const fingerprintScreen = '/fingerprint-screen';
  static const identityScreen = '/identity-screen';
  static const onBoardingCompleteScreen = '/on-boarding-complete-screen';
}

class AppRouter extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<AppRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => WelcomeScreen(),
          settings: settings,
        );
      case Routes.registerScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => RegistrationScreen(),
          settings: settings,
        );
      case Routes.verificationScreen:
        if (hasInvalidArgs<VerificationScreenArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<VerificationScreenArguments>(args);
        }
        final typedArgs = args as VerificationScreenArguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) =>
              VerificationScreen(phoneNumber: typedArgs.phoneNumber),
          settings: settings,
        );
      case Routes.fingerprintScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => FingerprintScreen(),
          settings: settings,
        );
      case Routes.identityScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => IdentityScreen(),
          settings: settings,
        );
      case Routes.onBoardingCompleteScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => OnBoardingCompleteScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//VerificationScreen arguments holder class
class VerificationScreenArguments {
  final String phoneNumber;
  VerificationScreenArguments({@required this.phoneNumber});
}
