part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSignInSuccess extends AuthState {}

class AuthSignInFailure extends AuthState {
  final String error;

  AuthSignInFailure({@required this.error});

  @override
  List<Object> get props => [error];
}

class AuthSignOutSuccess extends AuthState {}

class AuthSignOutFailure extends AuthState {
  final String error;

  AuthSignOutFailure({@required this.error});

  @override
  List<Object> get props => [error];
}

class AuthCheckSuccess extends AuthState {
  final User user;

  AuthCheckSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthCheckFailure extends AuthState {
  final String error;

  AuthCheckFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
