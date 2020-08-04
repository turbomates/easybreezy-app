import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:easybreezy_app/auth/modals/modals.dart';
import 'package:easybreezy_app/auth/repositories/auth_repositories.dart';
import 'package:easybreezy_app/constants.dart';

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
      try {
        final response = await authRepositories.signIn(event.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(userToken, response.data["data"]);
        yield AuthSignInSuccess();
      } catch (e) {
        if (e.response.statusCode == 401) {
          yield AuthSignInFailure(error: "bad_credentials");
        } else {
          yield AuthSignInFailure(error: "unexpected_server_error");
        }
      }
    }

    if (event is AuthSignedOut) {
      try {
        await authRepositories.signOut();

        yield AuthSignOutSuccess();
      } catch (e) {
        yield AuthSignOutFailure(error: "unexpected_server_error");
      }
    }

    if (event is AuthChecked) {
      try {
        final response = await authRepositories.check();

        yield AuthCheckSuccess(user: User.fromJson(response.data["data"]));
      } catch (e) {
        yield AuthCheckFailure(error: "unexpected_server_error");
      }
    }
  }
}
