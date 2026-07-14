import 'package:flutter/material.dart';
import 'package:contracts_simplified/screens/onboarding/introscreen.dart';
import 'package:contracts_simplified/screens/home.dart';
import 'package:contracts_simplified/screens/auth/login.dart';
import 'package:contracts_simplified/screens/auth/register.dart';
import 'package:contracts_simplified/screens/auth/kyc.dart';
import 'package:contracts_simplified/screens/auth/verifyotp.dart';
import 'package:contracts_simplified/screens/mydocs.dart';
import 'package:contracts_simplified/screens/scanresults.dart';
import 'package:contracts_simplified/screens/settings.dart';
import 'package:contracts_simplified/screens/profile.dart';
import 'package:contracts_simplified/screens/pro-upgrade/paywall.dart';
import 'package:contracts_simplified/screens/onboarding/splashscreen.dart';


// import other screens here

class AppRoutes {
  // Route names
  static const String splash = '/';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String home = '/home';
  static const String helpAndFeedback = '/helpAndFeedback';
  static const String termsOfUse = '/termsOfUse';
  static const String privacyPolicy = '/privacyPolicy';
  static const String myUploads = '/myUploads';
  static const String upgradePro = '/upgradePro';
  static const String languages = '/languages';

  // Centralized route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
       case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case login:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Login Screen Placeholder')),
          ),
        );
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
