import 'package:auto_route/auto_route_annotations.dart';
import 'package:onboardingapp/screens/registration_screen.dart';
import 'package:onboardingapp/screens/welcome_screen.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  WelcomeScreen welcomeScreen;

  RegistrationScreen registerScreen;
}
