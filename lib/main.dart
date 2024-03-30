import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_poc/constants/string_const.dart';
import 'package:flutter_poc/firebase_options.dart';
import 'package:flutter_poc/helpers/shared_pref.dart';
import 'package:flutter_poc/di/service_locator.dart' as service_locator;
import 'package:flutter_poc/helpers/theme.dart';
import 'package:flutter_poc/routes/route_config.dart';
import 'package:flutter_poc/view_models/blocs.dart';
import 'package:flutter_poc/views/screens/screens.dart';

/// [globalInitializer()]
/// Function to initialise all the pre-app things
globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize shared prefrence
  await SharedPref.init();
  //  Initialize service locator
  await service_locator.init();
  //  Initialize bloc observer
  Bloc.observer = SimpleBlocObserver();

  // Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set device orientation
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
}

Future<void> main() async {
  await globalInitializer();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return AllBlocProviders(
      child: SafeArea(
        child: MaterialApp(
          title: StringConst.appName,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteConfig.generateRoute,
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context), // for global theme
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
