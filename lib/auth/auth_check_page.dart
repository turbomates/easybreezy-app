import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easybreezy_app/auth/bloc/auth_bloc.dart';

class AuthCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignInSuccess) {
          context.bloc<AuthBloc>().add(AuthChecked());
        }

        if (state is AuthCheckSuccess) {
          Navigator.pushNamed(context, "/profile", arguments: state.user.id);
        }

        if (state is AuthCheckFailure) {
          Navigator.pushNamed(context, "/login");
        }
      },
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
