import 'package:blog_app/models/auth_model.dart';
import 'package:blog_app/pages/intro_page.dart';
import 'package:blog_app/pages/login_page.dart';
import 'package:blog_app/pages/main_app_page.dart';
import 'package:blog_app/pages/register_page.dart';
import 'package:blog_app/pages/splash_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => const SplashPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  IntroPage.routeName: (context) => const IntroPage(),
  RegisterPage.routeName: (context) => const RegisterPage(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case MainAppPage.routeName:
      return MaterialPageRoute(builder: (context) {
        final AuthModel authModel = settings.arguments as AuthModel;
        return MainAppPage(authModel: authModel);
      });
  }
}
