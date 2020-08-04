import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String text;

  Error({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
      ),
    );
  }
}
