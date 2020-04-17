import 'package:auto_route/auto_route_annotations.dart';
import 'package:onboardingapp/screens/fingerprint_screen.dart';
import 'package:onboardingapp/screens/registration_screen.dart';
import 'package:onboardingapp/screens/verification_screen.dart';
import 'package:onboardingapp/screens/welcome_screen.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  WelcomeScreen welcomeScreen;

  RegistrationScreen registerScreen;
  VerificationScreen verificationScreen;
  FingerprintScreen fingerprintScreen;
}
