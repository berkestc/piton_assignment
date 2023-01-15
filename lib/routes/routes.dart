import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/pages/log_in_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/books/presentation/pages/book_details_page.dart';
import '../features/books/presentation/pages/category_page.dart';
import '../features/books/presentation/pages/home_page.dart';
import '../landing_page.dart';
import '../splash_screen.dart';

class Routes {
  static const _instance = Routes._();

  factory Routes() => _instance;

  const Routes._();

  static const landing = "/landing";
  static const splash = "/splash";
  static const logIn = "/log-in";
  static const register = "/register";
  static const home = "/home";
  static const category = "/category";
  static const bookDetails = "/book-details";

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landing:
        return createRoute(settings: settings, page: const LandingPage());
      case splash:
        return createRoute(settings: settings, page: const SplashScreen());
      case logIn:
        return createRoute(settings: settings, page: const LogInPage());
      case register:
        return createRoute(settings: settings, page: const RegisterPage());
      case home:
        return createRoute(settings: settings, page: const HomePage());
      case category:
        return createRoute(settings: settings, page: const CategoryPage());
      case bookDetails:
        return createRoute(settings: settings, page: const BookDetails());
      default:
        return null;
    }
  }

  PageRoute createRoute({
    required RouteSettings settings,
    required Widget page,
  }) =>
      Platform.isIOS
          ? CupertinoPageRoute(
              builder: (context) => page,
              settings: settings,
            )
          : MaterialPageRoute(
              builder: (context) => page,
              settings: settings,
            );
}
