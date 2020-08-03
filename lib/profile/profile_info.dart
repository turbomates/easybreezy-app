import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easybreezy_app/profile/bloc/profile_bloc.dart';

class ProfileInfo extends StatelessWidget {
  final String id;

  ProfileInfo({@required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial) {
          context.bloc<ProfileBloc>().add(FetchedProfile(id: id));
        }

        if (state is ProfileFetchSuccess) {
          return ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text(
                      "${state.profile.firstName} ${state.profile.lastName}"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Birthday ${state.profile.birthday}"),
                ),
              ),
              Card(
                child: _getSkills(state.profile.skills),
              )
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  _getSkills(List<String> skills) {
    return ListTile(
      title: Row(
          children: skills
              .map((skill) => Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Chip(
                      label: Text(skill),
                    ),
                  ))
              .toList()),
    );
  }
}
