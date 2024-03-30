import 'package:equatable/equatable.dart';

import '../blocs.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc() : super(const AppSettingsState()) {
    on<AppSettingsInitialEvent>(_appSettingsInitialEvent);
    on<ChangeThemeEvent>(_changeThemeEvent);
    on<ChangeLangaugeEvent>(_changeLangaugeEvent);
    on<ChangeInternetStatusEvent>(_changeInternetStatusEvent);
  }

  //  Implementation
  _appSettingsInitialEvent(
      AppSettingsInitialEvent event, Emitter<AppSettingsState> emit) {
    emit(state.initialState);
  }

  _changeThemeEvent(ChangeThemeEvent event, Emitter<AppSettingsState> emit) {
    emit(state.copyWith(
      isDarkTheme: (event.themeName == 'dark' ? true : false),
    ));
  }

  _changeLangaugeEvent(
      ChangeLangaugeEvent event, Emitter<AppSettingsState> emit) {
    emit(state.copyWith(
      language: event.language,
    ));
  }

  _changeInternetStatusEvent(
      ChangeInternetStatusEvent event, Emitter<AppSettingsState> emit) {
    emit(state.copyWith(
      isInternetConnected: event.isConnect,
    ));
  }
}
