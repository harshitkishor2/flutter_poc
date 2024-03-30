# flutter_poc

## 1. Project Setup

#####1. Create project with proper folder structure-

- **constants**
  - ApiConst - contain all api path
  - AssetConst - contain all assets
  - StringConst - contain all strings
  - FontConst - contain all fonts
- **di**- for dependency injection
- **helpers**- for all common functions
- **models**- all request and response models
- **routes**- for all routes configuration
- **services**- call http apis and other async functions(Repo and their implementations)
- **view_models**- all blocs(buisiness logic) and responsible for state changes
- **views**- All screens and common widgets
- **widgets**- All custom widgets

#####2. update **pubspec.yaml** file for custom image and fonts.

## 2. Change Laucher Icons and add Required Dependencies

1. add devDepenedency- flutter_launcher_icons
2. create` flutter_launcher_icons.yaml` file and update file as docs
3. run command `flutter pub run flutter_launcher_icons`

##### Add these Required Dependency

`cached_network_image` - for network image
`dio` - for api handling
`equatable`, `flutter_bloc` - for bloc
`fluttertoast` - for toast messages
`get_it` - for dependency injection
`flutter_svg` - For SVG
`lottie` - For Lottie
`shared_preferences` - for shared prefrences

## 3. Add firebase support

[Firebase Setup Instructions](https://firebase.google.com/docs/flutter/setup?platform=android "Firebase Setup Instructions")

1. Create project on firebase console
2. If you have not already, install the Firebase CLI.
   `npm install -g firebase-tools`
3. Log into Firebase using your Google account by running the following command:
   `firebase login`
4. Install the FlutterFire CLI by running the following command from any directory:
   `dart pub global activate flutterfire_cli`
5. From your Flutter project directory, run the following command to install the core plugin and run pod:
   `flutter pub add firebase_core`
6. From your Flutter project directory, run the following command to ensure that your Flutter app's Firebase configuration is up-to-date:
   `flutterfire configure`
7. In your **lib/main.dart** file, initialize Firebase using the DefaultFirebaseOptions object exported by the configuration file:

```dart
await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform,
);
```
