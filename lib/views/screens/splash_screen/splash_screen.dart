import 'package:flutter/material.dart';
import 'package:flutter_poc/constants/assets_const.dart';
import 'package:flutter_poc/helpers/shared_pref.dart';
import 'package:flutter_poc/routes/route_config.dart';
import 'package:flutter_poc/view_models/blocs.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthenticationBloc>().add(CheckAuthenticationStatusEvent());
    super.initState();
  }

  void _handleAuthenticationListener(
      BuildContext context, AuthenticationState authenticationState) {
    Future.delayed(const Duration(seconds: 2), () {
      if (authenticationState.isAuthenticated) {
        Navigator.pushReplacementNamed(context, RouteConfig.login);
      } else {
        if (SharedPref.isWalkthroughEnable) {
          Navigator.pushReplacementNamed(context, RouteConfig.walkthrough);
        } else {
          Navigator.pushReplacementNamed(context, RouteConfig.login);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: _handleAuthenticationListener,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(LottieConst.splashLottie),
          ],
        ),
      ),
    ));
  }
}
