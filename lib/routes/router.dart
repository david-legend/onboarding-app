import 'package:auto_route/auto_route.dart';
import 'package:onboardingapp/screens/fingerprint_screen.dart';
import 'package:onboardingapp/screens/identity_screen.dart';
import 'package:onboardingapp/screens/onboarding_complete_screen.dart';
import 'package:onboardingapp/screens/registration_screen.dart';
import 'package:onboardingapp/screens/verification_screen.dart';
import 'package:onboardingapp/screens/welcome_screen.dart';


@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: WelcomeScreen, initial: true),

    MaterialRoute(page: RegistrationScreen),
    MaterialRoute(page: VerificationScreen),
    MaterialRoute(page: FingerprintScreen),
    MaterialRoute(page: IdentityScreen),
    MaterialRoute(page: OnBoardingCompleteScreen),
  ],
)
class $AppRouter {}