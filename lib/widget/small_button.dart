
import 'package:flutter/material.dart';
import 'package:food/screen/pages/signin_pagee.dart';

class SmallButton extends StatelessWidget {
  String nameOfButton;
  Function onTap;

  SmallButton({this.nameOfButton,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 40,
      decoration: BoxDecoration(),
      child: RaisedButton(
        onPressed: onTap,
        color: Colors.white,
        focusColor: Colors.blue,
        child: Text(nameOfButton , style: TextStyle(fontWeight: FontWeight.bold),),
//                        hoverColor: Colors.blueAccent,
        textColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(width: 50.0,color: Colors.white),

        ),
      ),
    );
  }
}
