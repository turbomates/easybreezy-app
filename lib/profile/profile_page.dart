import 'package:flutter/material.dart';

import 'package:easybreezy_app/widget/drawer.dart';
import 'package:easybreezy_app/profile/profile_info.dart';

class ProfilePage extends StatelessWidget {
  final String id;

  ProfilePage({@required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      drawer: AppDrawer(),
      body: ProfileInfo(id: id),
    );
  }
}
