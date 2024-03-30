import 'package:equatable/equatable.dart';

import '../blocs.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<AuthenticationInitialEvent>(_authenticationInitialEvent);
    on<CheckAuthenticationStatusEvent>(_checkAuthenticationStatusEvent);
  }

//  Implementation
  _authenticationInitialEvent(
      AuthenticationInitialEvent event, Emitter<AuthenticationState> emit) {
    emit(state.initialState);
  }

  _checkAuthenticationStatusEvent(
      CheckAuthenticationStatusEvent event, Emitter<AuthenticationState> emit) {
    try {
      emit(state.copyWith(user: 'user'));
    } catch (e) {
      emit(state.copyWith(user: ''));
    }
  }
}
