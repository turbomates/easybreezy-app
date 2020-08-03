import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easybreezy_app/auth/bloc/auth_bloc.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignOutSuccess) {
          Navigator.pushNamed(context, "/login");
        }
      },
      builder: (context, state) {
        final String email = state is AuthCheckSuccess ? state.user.email : "";
        final String status =
            state is AuthCheckSuccess ? state.user.status : "";

        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _createDrawerHeader(email, status),
              _createDrawerItem(
                  title: "Profile",
                  icon: Icons.person,
                  onTap: () => Navigator.pushNamed(context, "/profile")),
              _createDrawerItem(
                  title: "Projects",
                  icon: Icons.folder,
                  onTap: () {}),
              Divider(),
              _createDrawerItem(
                  title: "Log out",
                  icon: Icons.exit_to_app,
                  onTap: () => context.bloc<AuthBloc>().add(AuthSignedOut()))
            ],
          ),
        );
      },
    );
  }

  Widget _createDrawerHeader(String email, String status) {
    return Container(
      height: 120,
      child: DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _createDrawerHeaderEmail(email),
              _createDrawerHeaderStatus(status),
            ],
          ),
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(0.0)),
    );
  }

  Widget _createDrawerHeaderEmail(String email) {
    return Container(
      padding: EdgeInsets.only(left: 16.0),
      margin: EdgeInsets.only(bottom: 8.0),
      child: Text(
        email,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _createDrawerHeaderStatus(String status) {
    return Container(
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        status,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

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
}
