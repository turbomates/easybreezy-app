import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easybreezy_app/auth/bloc/auth_bloc.dart';

class AppDrawer extends StatelessWidget {
  Widget _createDrawerItem(
      {String title, IconData icon, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(title),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignOutSuccess) {
          Navigator.pushReplacementNamed(context, "/login");
        }
      },
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            _createDrawerItem(
                title: "Profile",
                icon: Icons.person,
                onTap: () =>
                    Navigator.pushReplacementNamed(context, "/profile")),
            Divider(),
            _createDrawerItem(
                title: "Log out",
                icon: Icons.exit_to_app,
                onTap: () =>
                    BlocProvider.of<AuthBloc>(context).add(AuthSignedOut()))
          ],
        ),
      ),
    );
  }
}

//BlocProvider.of<AuthBloc>(context).add(AuthSignedOut())
