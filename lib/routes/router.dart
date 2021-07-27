import 'package:auto_route/auto_route_annotations.dart';
import 'package:onboardingapp/screens/fingerprint_screen.dart';
import 'package:onboardingapp/screens/identity_screen.dart';
import 'package:onboardingapp/screens/onboarding_complete_screen.dart';
import 'package:onboardingapp/screens/registration_screen.dart';
import 'package:onboardingapp/screens/verification_screen.dart';
import 'package:onboardingapp/screens/welcome_screen.dart';

@MaterialAutoRouter()
class $AppRouter {
  @initial
  WelcomeScreen welcomeScreen;

  RegistrationScreen registerScreen;
  VerificationScreen verificationScreen;
  FingerprintScreen fingerprintScreen;
  IdentityScreen identityScreen;
  OnBoardingCompleteScreen onBoardingCompleteScreen;
}
