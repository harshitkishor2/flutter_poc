import 'package:flutter/material.dart';
import 'package:flutter_poc/constants/assets_const.dart';
import 'package:flutter_poc/widgets/widgets.dart';
import 'package:flutter_poc/helpers/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // on login tap
  onLoginTap() {
    printError('Google Login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: rpHeight(10, context),
          ),
          Center(
            child: Image.asset(ImageConst.appIcon),
          ),
          const Spacer(),
          SubmitButton(
            onTap: onLoginTap,
            label: 'Sign in with Google',
            buttonIcon: Image.asset(
              ImageConst.appIcon,
              height: 40,
            ),
          ),
          const Spacer(),
          _richTextView()
        ],
      ),
    );
  }

  _richTextView() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By continuing, you agree to the ',
        style: const TextStyle(color: Colors.black), // Customize as needed
        children: [
          _widgetSpanwithUnderline(text: 'Terms and Conditions', onTap: () {}),
          const TextSpan(text: ' & '),
          _widgetSpanwithUnderline(text: 'Privacy Policy', onTap: () {})
        ],
      ),
    );
  }

  _widgetSpanwithUnderline({
    required String text,
    required VoidCallback onTap,
  }) {
    return WidgetSpan(
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.blue, // Example color
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
          ),
        ),
      ),
    );
  }

  // End of sccreen
}
