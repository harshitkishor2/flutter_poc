import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';

class CustomWidgets {
  // ---> Start class <---

  //!=========================== Custom TextField With Label =====================================
  static Widget textFieldWithLabel({
    Key? key,
    required String label,
    required String hintText,
    String? initialValue,
    void Function(String)? onChanged,
    FormFieldValidator<String>? validator,
    TextEditingController? textController,
    bool isPassword = false,
    bool isNumber = false,
    bool enabled = true,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            key: key,
            initialValue: initialValue,
            onChanged: onChanged,
            validator: validator,
            enabled: enabled,
            controller: textController,
            obscureText: isPassword,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  //!=========================== Custom TextField  =====================================
  static Widget textField({
    Key? key,
    required String label,
    required String hintText,
    String? initialValue,
    void Function(String)? onChanged,
    FormFieldValidator<String>? validator,
    TextEditingController? textController,
    bool isPassword = false,
    bool isNumber = false,
    bool enabled = true,
    Widget? suffixIcon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: TextFormField(
        key: key,
        initialValue: initialValue,
        onChanged: onChanged,
        validator: validator,
        enabled: enabled,
        controller: textController,
        obscureText: isPassword,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black45),
          //fillColor: Colors.white,
          //filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffix: suffixIcon,
        ),
      ),
    );
  }

  //!=========================== Custom Text  =====================================
  static Widget text(
    String label, {
    double fontSize = 15,
    String? fontFamily,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    Color color = Colors.black,
    double? wordSpacing,
    VoidCallback? onClick,
    TextAlign? textAlign,
  }) {
    return Container(
      child: onClick == null
          ? Text(
              label,
              textAlign: textAlign,
              style: TextStyle(
                fontStyle: fontStyle,
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: color,
                wordSpacing: wordSpacing,
                decoration: decoration,
              ),
            )
          : TextButton(
              onPressed: () {
                onClick.call();
              },
              child: Text(
                label,
                style: TextStyle(
                  fontStyle: fontStyle,
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: color,
                  wordSpacing: wordSpacing,
                ),
              ),
            ),
    );
  }

  static Widget selectableText(
    String label, {
    double fontSize = 15,
    String? fontFamily,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    Color color = Colors.black,
    double? wordSpacing,
    TextAlign? textAlign,
  }) {
    return SelectableText(
      label,
      textAlign: textAlign,
      style: TextStyle(
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }

//!=========================== Sized Text  =====================================
  static sizedBox({
    double height = 10,
  }) {
    return SizedBox(
      height: height,
    );
  }

//!=========================== Cached Image  =====================================
  static networkImage({
    required String image,
    required Widget onError,
    double height = 50,
    double width = 50,
  }) {
    try {
      Widget succes = CachedNetworkImage(
        width: width,
        height: height,
        fit: BoxFit.fill,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
        ),
        errorWidget: (context, url, error) {
          return onError;
        },
      );
      return succes;
    } catch (e) {
      return onError;
    }
  }

// For real size images
  static networkfullImage({
    required String image,
    required Widget onError,
  }) {
    try {
      Widget succes = CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
        ),
        errorWidget: (context, url, error) {
          return onError;
        },
      );
      return succes;
    } catch (e) {
      return onError;
    }
  }

  //!=========================== LinkWell Text  =====================================
  static Widget linkText(
    String label, {
    double fontSize = 15,
    String? fontFamily,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    double? wordSpacing,
    VoidCallback? onClick,
    TextAlign textAlign = TextAlign.start,
  }) {
    return LinkWell(
      label,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        wordSpacing: wordSpacing,
      ),
      linkStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          wordSpacing: wordSpacing,
          color: Colors.white,
          decoration: TextDecoration.underline),
    );
  }

  // ---> End class <---
}
