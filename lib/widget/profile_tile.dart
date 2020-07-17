

import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  IconData icon;
  String text;

  ProfileTile({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Icon(icon , color: Colors.blue,),
          SizedBox(width: 10,),
          Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),

        ],
      ),
    );
  }
}
