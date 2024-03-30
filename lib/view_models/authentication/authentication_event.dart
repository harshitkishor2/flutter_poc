part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/* Set Initial Event */
class AuthenticationInitialEvent extends AuthenticationEvent {}

/* Set Initial Event */
class CheckAuthenticationStatusEvent extends AuthenticationEvent {}
