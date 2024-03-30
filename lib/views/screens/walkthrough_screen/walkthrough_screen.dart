import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter_poc/constants/assets_const.dart';
import 'package:flutter_poc/helpers/shared_pref.dart';
import 'package:flutter_poc/routes/route_config.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  //  On action button click
  onNextOrSkipClick() {
    SharedPref.setIsWalkthroughEnable(false);
    Navigator.pushReplacementNamed(context, RouteConfig.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(0),
        child: OverBoard(
          pages: pages,
          allowScroll: true,
          showBullets: true,
          activeBulletColor: Colors.orange,
          inactiveBulletColor: Colors.orange.shade200,
          buttonColor: Colors.orange,
          skipText: "Skip",
          nextText: "Next",
          finishText: "Done",
          finishCallback: onNextOrSkipClick,
          skipCallback: onNextOrSkipClick,
        ),
      ),
    );
  }

//  All pages
  final pages = [
    PageModel.withChild(
      child: Image.asset(
        ImageConst.appIcon,
        fit: BoxFit.fitHeight,
        // width: deviceWidth,
      ),
      doAnimateChild: false,
      color: Colors.transparent,
    ),
    PageModel.withChild(
      child: Image.asset(
        ImageConst.appIcon,
        fit: BoxFit.fitHeight,
        //width: deviceWidth,
      ),
      doAnimateChild: false,
      color: Colors.transparent,
    ),
    PageModel.withChild(
      child: Image.asset(
        ImageConst.appIcon,
        fit: BoxFit.fitHeight,
        //width: deviceWidth,
      ),
      doAnimateChild: false,
      color: Colors.transparent,
    ),
  ];
}
