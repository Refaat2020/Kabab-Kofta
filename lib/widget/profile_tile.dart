

import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  ProfileTile({this.icon, this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Icon(icon , color: Colors.blue,),
            SizedBox(width: 10,),
            Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
