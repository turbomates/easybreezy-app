import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:easybreezy_app/auth/auth_check_page.dart';
import 'package:easybreezy_app/auth/auth_form.dart';
import 'package:easybreezy_app/auth/bloc/auth_bloc.dart';
import 'package:easybreezy_app/auth/repositories/auth_repositories.dart';
import 'package:easybreezy_app/profile/bloc/profile_bloc.dart';
import 'package:easybreezy_app/profile/profile_page.dart';
import 'package:easybreezy_app/profile/repositories/repository.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final AuthRepositories authRepository = AuthRepositories();
  final ProfileRepository profileRepository = ProfileRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AuthBloc(authRepositories: authRepository)..add(AuthChecked())),
        BlocProvider(
          create: (context) =>
              ProfileBloc(profileRepository: profileRepository),
        )
      ],
      child: Route(),
    );
  }
}

class Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == "/profile") {
          final id = settings.arguments;

          return MaterialPageRoute(builder: (context) {
            return ProfilePage(id: id);
          });
        }

        return MaterialPageRoute(builder: (context) {
          return Text("Not found");
        });
      },
      initialRoute: "/",
      routes: {
        "/": (context) => AuthCheckPage(),
        "/login": (context) => AuthForm(),
//        "/profile": (context) => ProfilePage(),
      },
    );
  }
}
