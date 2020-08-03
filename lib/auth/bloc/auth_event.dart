part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthSignedIn extends AuthEvent {
  final AuthModal body;

  AuthSignedIn({@required this.body});

  @override
  List<Object> get props => [body];
}

class AuthSignedOut extends AuthEvent {}

class AuthChecked extends AuthEvent {}
