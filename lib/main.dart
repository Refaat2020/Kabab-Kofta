import 'package:flutter/material.dart';
import 'package:food/screen/pages/signin_pagee.dart';


void main() => runApp(MaterialApp(

 debugShowCheckedModeBanner: false,

 title: "Kebab & Kofta",
  theme: ThemeData(

    primaryColor: Colors.blueAccent

  ),

  home: SignIn(),
//  home: AddFoodItem(),

));




