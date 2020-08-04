import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String text;

  ErrorMessage({@required this.text});

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
