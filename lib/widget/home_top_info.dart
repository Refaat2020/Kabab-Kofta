
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTopInfo extends StatelessWidget {
  final textstyle = TextStyle(fontSize: 32.0 , fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('What would',style: GoogleFonts.acme(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22,
              ),),
              Text('you like to eat?',style:  GoogleFonts.zcoolXiaoWei(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 26,
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
