import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:easybreezy_app/auth/bloc/auth_bloc.dart';
import 'package:easybreezy_app/auth/modals/modals.dart';
import 'package:easybreezy_app/widget/widgets.dart';

class AuthLoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignInSuccess) {
          Navigator.of(context).pushNamed('/');
        }
      },
      builder: (context, state) {
        final bool isAuthSignInFailure = state is AuthSignInFailure;
        return Padding(
            padding: EdgeInsets.all(16),
            child: FormBuilder(
                autovalidate: _autoValidate,
                key: _fbKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: "email",
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Email",
                        errorText: isAuthSignInFailure ? "" : null,
                      ),
                      validators: [
                        FormBuilderValidators.required(errorText: "Required"),
                        FormBuilderValidators.email(errorText: "Invalid"),
                      ],
                    ),
                    FormBuilderTextField(
                      attribute: "password",
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: "Password",
                        errorText: isAuthSignInFailure ? "" : null,
                      ),
                      validators: [
                        FormBuilderValidators.required(errorText: "Required"),
                      ],
                    ),
                    Container(
                      child: state is AuthSignInFailure
                          ? Error(
                              text: state.error,
                            )
                          : null,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: RaisedButton(
                        color: Theme.of(context).buttonColor,
                        onPressed: () => _validateInputs(),
                        child: Text("Log in"),
                      ),
                    ),
                  ],
                )));
      },
    );
  }

  void _validateInputs() {
    if (_fbKey.currentState.validate()) {
      _fbKey.currentState.save();
      BlocProvider.of<AuthBloc>(context).add(AuthSignedIn(
          body: AuthModal(
        email: _fbKey.currentState.value["email"],
        password: _fbKey.currentState.value["password"],
      )));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
