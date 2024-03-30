import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//! Device properties
class DeviceInfo {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => isAndroid || isIOS;
  static bool get isWeb => kIsWeb;

  static bool get isWindows => Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isFuchsia => Platform.isFuchsia;
  static bool get isIOS => Platform.isIOS;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  // Screen Size
  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double diagonal(BuildContext context) {
    Size s = size(context);
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  // Screen Orientation ()
  static Orientation orientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  static EdgeInsets viewPadding(BuildContext context) {
    return MediaQuery.of(context).viewPadding;
  }

  // Height and Width
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double heightWithoutSafeArea(BuildContext context) {
    return height(context) -
        viewPadding(context).top -
        viewPadding(context).bottom;
  }

  static double heightWithoutStatusBar(BuildContext context) {
    return height(context) - viewPadding(context).top;
  }
}
