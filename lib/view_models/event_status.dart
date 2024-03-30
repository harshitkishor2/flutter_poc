import 'package:equatable/equatable.dart';

abstract class EventStatus extends Equatable {
  const EventStatus();
  @override
  List<Object> get props => [];
}

class EventNotLoaded extends EventStatus {
  const EventNotLoaded();
}

class EventLoading extends EventStatus {}

class EventLoaded extends EventStatus {
  final String successMessage;

  const EventLoaded({required this.successMessage});
  @override
  List<Object> get props => [successMessage];
}

class EventFailed extends EventStatus {
  final String errorMessage;

  const EventFailed({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
