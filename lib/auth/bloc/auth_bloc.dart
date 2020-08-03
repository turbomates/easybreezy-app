import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:easybreezy_app/auth/modals/modals.dart';
import 'package:easybreezy_app/auth/repositories/auth_repositories.dart';

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
      final String token = await authRepositories.signIn(event.body);
      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("USER_TOKEN", token);
        yield AuthSignInSuccess();
      } else {
        yield AuthSignInFailure();
      }
    }

    if (event is AuthSignedOut) {
      final isSignOut = await authRepositories.signOut();

      if (isSignOut) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove("USER_TOKEN");
        yield AuthSignOutSuccess();
      }
    }

    if (event is AuthChecked) {
      final response = await authRepositories.check();

      if (response != null) {
        final User user = User.fromJson(response);

        if (user != null) {
          yield AuthCheckSuccess(user: user);
        }
      } else {
        yield AuthCheckFailure();
      }
    }
  }
}
