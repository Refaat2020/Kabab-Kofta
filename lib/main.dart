 import 'package:flutter/material.dart';
import 'package:food/screen/homeScreen.dart';
import 'package:food/screen/pages/signin_pagee.dart';
import 'package:food/screen/src/main_screen.dart';

void main() => runApp(MaterialApp(


 debugShowCheckedModeBanner: false,
 title: "Kebab & Kofta",
  theme: ThemeData(
    primaryColor: Colors.blueAccent
  ),
  home: SignIn(),
));




