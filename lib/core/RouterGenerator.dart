import 'package:flutter/material.dart';
import 'package:onboarding_login_register_app_ui/windows/LoginScreen.dart';
import 'package:onboarding_login_register_app_ui/windows/RegisterScreen.dart';

import '../windows/ForgotPasswordScreen.dart';
import '../windows/SplashScreen.dart';
import '../windows/welcome_screen.dart';

class RouterGenerator {
  static const splashRoute = "/";
  static const introRoute = "/intro";
  static const loginRoute = "/login";
  static const registerRoute = "/register";
  static const indexRoute = "/index";

  static const forgotPasswordRoute = "/forgot-password";
  static const forgotPasswordCodeRoute = "/forgot-password-code";
  static const forgotPasswordCodeValidatedRoute =
      "/forgot-password-code-validated";

  static const resetPasswordSuccessRoute = "/reset-password-success";

  static Route<dynamic> navigate(RouteSettings setting) {
    debugPrint("$setting");

    switch (setting.name) {
      case RouterGenerator.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case RouterGenerator.introRoute:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case RouterGenerator.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case RouterGenerator.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case RouterGenerator.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
