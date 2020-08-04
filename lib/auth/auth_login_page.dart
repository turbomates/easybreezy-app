import 'package:flutter/material.dart';

import 'package:easybreezy_app/auth/auth_login_form.dart';

class AuthLoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: AuthLoginForm(),
        )
    );
  }
}