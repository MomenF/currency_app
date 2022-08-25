import 'package:currency_app/features/auth/ui/login/login.dart';
import 'package:currency_app/features/auth/ui/sign_up/sign_up.dart';
import 'package:currency_app/features/auth/ui/sign_up/verification.dart';
import 'package:currency_app/theme/paths/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'features/auth/ui/auth.dart';
import 'features/home_layout/ui/layout_page.dart';
import 'features/onboarding/ui/on_boarding.dart';

class RouteGenerator {

  
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final Object? params = settings!.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context)=> OnBoarding(),
            settings: RouteSettings(name: Routes.onBoarding) );
      case   Routes.layout:
        return MaterialPageRoute(
            builder: (context)=> LayoutPage(),
            settings: RouteSettings(name: Routes.layout) );
      case   Routes.authPage:
        return MaterialPageRoute(
            builder: (context)=> AuthPage(),
            settings: RouteSettings(name: Routes.authPage) );
      case   Routes.login:
        return MaterialPageRoute(
            builder: (context)=> LoginPage(),
            settings: RouteSettings(name: Routes.login) );
      case   Routes.sign_up:
        return MaterialPageRoute(
            builder: (context)=> SignUpPage(),
            settings: RouteSettings(name: Routes.sign_up) );
      case   Routes.verificationPage:
        return MaterialPageRoute(
            builder: (context)=> VerificationPage(),
            settings: RouteSettings(name: Routes.verificationPage) );
    }
  }
}