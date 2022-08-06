import 'package:flutter/material.dart';
import 'package:onboardingapp/app_theme.dart';
import 'package:onboardingapp/routes/router.gr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: OnBoardingAppThemeData.lightThemeData,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
