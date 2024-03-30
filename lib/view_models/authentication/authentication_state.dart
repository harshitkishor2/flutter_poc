// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

class AuthenticationState {
  final EventStatus loginStatus;
  final dynamic user;
  final EventStatus logoutStatus;
  final bool isAuthenticated;

  const AuthenticationState({
    this.loginStatus = const EventNotLoaded(),
    this.user,
    this.logoutStatus = const EventNotLoaded(),
    this.isAuthenticated = false,
  });

  AuthenticationState get initialState => const AuthenticationState();

  AuthenticationState copyWith({
    EventStatus? loginStatus,
    dynamic user,
    EventStatus? logoutStatus,
    bool? isAuthenticated,
  }) {
    return AuthenticationState(
      loginStatus: loginStatus ?? this.loginStatus,
      user: user ?? this.user,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  String toString() {
    return 'AuthenticationState(loginStatus: $loginStatus, user: $user, logoutStatus: $logoutStatus, isAuthenticated: $isAuthenticated)';
  }
}
