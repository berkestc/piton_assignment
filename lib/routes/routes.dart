import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piton_assignment/features/auth/presentation/pages/log_in_page.dart';
import 'package:piton_assignment/features/auth/presentation/pages/register_page.dart';
import 'package:piton_assignment/features/books/presentation/pages/book_details_page.dart';
import 'package:piton_assignment/features/books/presentation/pages/category_page.dart';
import 'package:piton_assignment/features/books/presentation/pages/home_page.dart';
import 'package:piton_assignment/splash_screen.dart';

class Routes {
  static const _instance = Routes._();

  factory Routes() => _instance;

  const Routes._();

  static const splash = "/splash";
  static const logIn = "/log-in";
  static const register = "/register";
  static const home = "/home";
  static const category = "/category";
  static const bookDetails = "/book-details";

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => const SplashScreen(),
                settings: settings,
              )
            : MaterialPageRoute(
                builder: (context) => const SplashScreen(),
                settings: settings,
              );
      case logIn:
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => const LogInPage(),
                settings: settings,
              )
            : MaterialPageRoute(
                builder: (context) => const LogInPage(),
                settings: settings,
              );
      case register:
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => const RegisterPage(),
                settings: settings,
              )
            : MaterialPageRoute(
                builder: (context) => const RegisterPage(),
                settings: settings,
              );
      case home:
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => const HomePage(),
                settings: settings,
              )
            : MaterialPageRoute(
                builder: (context) => const HomePage(),
                settings: settings,
              );
      case category:
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => const CategoryPage(),
                settings: settings,
              )
            : MaterialPageRoute(
                builder: (context) => const CategoryPage(),
                settings: settings,
              );
      case bookDetails:
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => const BookDetails(),
                settings: settings,
              )
            : MaterialPageRoute(
                builder: (context) => const BookDetails(),
                settings: settings,
              );
      default:
        return null;
    }
  }
}
