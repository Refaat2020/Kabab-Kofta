
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  IconData icon;

  BottomBar({this.icon, this.name});

  String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),

        Icon(icon,),
        Text(name),
      ],
    );
  }
}
