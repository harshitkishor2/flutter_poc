// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_settings_bloc.dart';

class AppSettingsState {
  final bool isDarkTheme;
  final String language;
  final bool isInternetConnected;

  const AppSettingsState({
    this.isDarkTheme = false,
    this.language = 'en',
    this.isInternetConnected = true,
  });

  AppSettingsState get initialState => const AppSettingsState();

  AppSettingsState copyWith({
    bool? isDarkTheme,
    String? language,
    bool? isInternetConnected,
  }) {
    return AppSettingsState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      language: language ?? this.language,
      isInternetConnected: isInternetConnected ?? this.isInternetConnected,
    );
  }

  @override
  String toString() =>
      'AppSettingsState(isDarkTheme: $isDarkTheme, language: $language, isInternetConnected: $isInternetConnected)';
}
