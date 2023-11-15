import 'package:flutter/material.dart';

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
      /*
      case RouterGenerator.commentUserPostScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const CommentUserPostScreen(),
        );*/
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
