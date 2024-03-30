import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//! Other util functions

// For print logs
void printLog(String text) {
  debugPrint('\x1B[33m$text\x1B[0m');
}

//  for print errors
void printError(String text) {
  debugPrint('\x1B[31m$text\x1B[0m');
}

//For Close the keyboard
void closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

// Responsive height, width
double rpWidth(double width, BuildContext context) {
  return MediaQuery.of(context).size.width * (width / 100);
}

double rpHeight(double height, BuildContext context) {
  return MediaQuery.of(context).size.height * (height / 100);
}
