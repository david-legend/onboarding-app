// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../screens/fingerprint_screen.dart' as _i4;
import '../screens/identity_screen.dart' as _i5;
import '../screens/onboarding_complete_screen.dart' as _i6;
import '../screens/registration_screen.dart' as _i2;
import '../screens/verification_screen.dart' as _i3;
import '../screens/welcome_screen.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    WelcomeScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.WelcomeScreen());
    },
    RegistrationScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.RegistrationScreen());
    },
    VerificationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationScreenRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.VerificationScreen(phoneNumber: args.phoneNumber));
    },
    FingerprintScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.FingerprintScreen());
    },
    IdentityScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.IdentityScreen());
    },
    OnBoardingCompleteScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.OnBoardingCompleteScreen());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(WelcomeScreenRoute.name, path: '/'),
        _i7.RouteConfig(RegistrationScreenRoute.name,
            path: '/registration-screen'),
        _i7.RouteConfig(VerificationScreenRoute.name,
            path: '/verification-screen'),
        _i7.RouteConfig(FingerprintScreenRoute.name,
            path: '/fingerprint-screen'),
        _i7.RouteConfig(IdentityScreenRoute.name, path: '/identity-screen'),
        _i7.RouteConfig(OnBoardingCompleteScreenRoute.name,
            path: '/on-boarding-complete-screen')
      ];
}

/// generated route for
/// [_i1.WelcomeScreen]
class WelcomeScreenRoute extends _i7.PageRouteInfo<void> {
  const WelcomeScreenRoute() : super(WelcomeScreenRoute.name, path: '/');

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationScreenRoute extends _i7.PageRouteInfo<void> {
  const RegistrationScreenRoute()
      : super(RegistrationScreenRoute.name, path: '/registration-screen');

  static const String name = 'RegistrationScreenRoute';
}

/// generated route for
/// [_i3.VerificationScreen]
class VerificationScreenRoute
    extends _i7.PageRouteInfo<VerificationScreenRouteArgs> {
  VerificationScreenRoute({required String phoneNumber})
      : super(VerificationScreenRoute.name,
            path: '/verification-screen',
            args: VerificationScreenRouteArgs(phoneNumber: phoneNumber));

  static const String name = 'VerificationScreenRoute';
}

class VerificationScreenRouteArgs {
  const VerificationScreenRouteArgs({required this.phoneNumber});

  final String phoneNumber;

  @override
  String toString() {
    return 'VerificationScreenRouteArgs{phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i4.FingerprintScreen]
class FingerprintScreenRoute extends _i7.PageRouteInfo<void> {
  const FingerprintScreenRoute()
      : super(FingerprintScreenRoute.name, path: '/fingerprint-screen');

  static const String name = 'FingerprintScreenRoute';
}

/// generated route for
/// [_i5.IdentityScreen]
class IdentityScreenRoute extends _i7.PageRouteInfo<void> {
  const IdentityScreenRoute()
      : super(IdentityScreenRoute.name, path: '/identity-screen');

  static const String name = 'IdentityScreenRoute';
}

/// generated route for
/// [_i6.OnBoardingCompleteScreen]
class OnBoardingCompleteScreenRoute extends _i7.PageRouteInfo<void> {
  const OnBoardingCompleteScreenRoute()
      : super(OnBoardingCompleteScreenRoute.name,
            path: '/on-boarding-complete-screen');

  static const String name = 'OnBoardingCompleteScreenRoute';
}
