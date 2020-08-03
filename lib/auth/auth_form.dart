import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easybreezy_app/auth/bloc/auth_bloc.dart';
import 'package:easybreezy_app/auth/modals/modals.dart';

class AuthForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _checkFormField(String value) {
    if (value.isEmpty) {
      return "Required";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignInSuccess) {
          Navigator.of(context).pushNamed('/profile');
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person), labelText: "Email"),
                        validator: _checkFormField,
                      ),
                      TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock), labelText: "Password"),
                          validator: _checkFormField),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: RaisedButton(
                          color: Theme.of(context).buttonColor,
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(AuthSignedIn(
                                body: AuthModal(
                                    email: _emailController.text,
                                    password: _passwordController.text)));
                          },
                          child: Text("Log in"),
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}
