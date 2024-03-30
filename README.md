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
