//! All routes are generated here

import 'package:flutter/material.dart';
import 'package:flutter_poc/views/screens/screens.dart';

import '../helpers/utils.dart';

class RouteConfig {
  // Routes Name
  static const splash = '/splash';
  static const walkthrough = '/walkthrough';
  static const login = '/login';

  // All Router
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<dynamic, dynamic>? params =
        settings.arguments == null ? null : settings.arguments as Map;
    printLog("Route Name=>> ${settings.name}, params===> $params");
    switch (settings.name) {
      //! Splash Route
      case splash:
        return GeneratePageRoute(
          widget: const SplashScreen(),
          routeName: settings.name,
        );
      //! Walkthrough Route
      case walkthrough:
        return GeneratePageRoute(
          widget: const WalkthroughScreen(),
          routeName: settings.name,
        );
      //! Login Route
      case login:
        return GeneratePageRoute(
          widget: const LoginScreen(),
          routeName: settings.name,
        );
      //! Default route (Invalid Url)
      default:
        return GeneratePageRoute(
          widget: Scaffold(
            body: Container(
              margin: const EdgeInsets.only(top: 10, left: 10),
              width: 500,
              child: const Center(
                child: Text(
                  "Invalid url",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          routeName: '/error',
        );
    }
  }
}

//!  Use for slide animation on page routing
class GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String? routeName;
  final bool isAction;
  GeneratePageRoute({
    required this.widget,
    required this.routeName,
    this.isAction = false,
  }) : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            Animation<Offset> offset = isAction
                ? Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).animate(animation)
                : Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation);
            return SlideTransition(
              textDirection: TextDirection.ltr,
              position: offset,
              child: child,
            );
          },
        );
}
