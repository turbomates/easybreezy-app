import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:easybreezy_app/auth/modals/modals.dart';
import 'package:easybreezy_app/auth/repositories/auth_repositories.dart';
import 'package:easybreezy_app/modals/modals.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositories authRepositories;

  AuthBloc({@required this.authRepositories}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthSignedIn) {
      final response = await authRepositories.signIn(event.body);

      if (response is Success) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("USER_TOKEN", response.data);
        yield AuthSignInSuccess();
      } else if (response is Failure) {
        yield AuthSignInFailure(error: response.error);
      }
    }

    if (event is AuthSignedOut) {
      final response = await authRepositories.signOut();

      if (response is Success) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove("USER_TOKEN");
        yield AuthSignOutSuccess();
      } else if (response is Failure) {
        yield AuthSignOutFailure();
      }
    }

    if (event is AuthChecked) {
      final response = await authRepositories.check();

      if (response is Success) {
        yield AuthCheckSuccess(user: User.fromJson(response.data));
      } else if (response is Failure) {
        yield AuthCheckFailure();
      }
    }
  }
}
