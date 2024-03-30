part of 'app_settings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();

  @override
  List<Object> get props => [];
}

/* Set Initial Event */
class AppSettingsInitialEvent extends AppSettingsEvent {}

// Set Theme Event
class ChangeThemeEvent extends AppSettingsEvent {
  final String themeName;

  const ChangeThemeEvent({required this.themeName});

  @override
  List<Object> get props => [themeName];
}

// Set Language Event
class ChangeLangaugeEvent extends AppSettingsEvent {
  final String language;

  const ChangeLangaugeEvent({required this.language});

  @override
  List<Object> get props => [language];
}

// Set Internet Status Event
class ChangeInternetStatusEvent extends AppSettingsEvent {
  final bool isConnect;

  const ChangeInternetStatusEvent({required this.isConnect});

  @override
  List<Object> get props => [isConnect];
}
