part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSignInSuccess extends AuthState {}

class AuthSignInFailure extends AuthState {}

class AuthSignOutSuccess extends AuthState {}

class AuthSignOutFailure extends AuthState {}

class AuthCheckSuccess extends AuthState {
  final User user;

  AuthCheckSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthCheckFailure extends AuthState {}
