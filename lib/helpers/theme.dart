import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  /* Start of MyTheme class */

  //* Light theme setup */
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(background: Colors.white),
        textTheme: const TextTheme(
          displaySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          displayMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        )),
        /* 
        Create custom SafeArea with top:false property and replace all SafeArea (Future refrence)
         */
      );

  //* Dark theme setup */
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
      );

  /* End of MyTheme class */
}
