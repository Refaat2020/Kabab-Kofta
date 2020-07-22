import 'package:flutter/material.dart';
import 'package:food/helper/locator.dart';
import 'package:food/screen/pages/signin_pagee.dart';

void main() {
 setupLocator();
 runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Kebab & Kofta",
  theme: ThemeData(primaryColor: Colors.blueAccent),

  home: SignIn(),
//  home: AddFoodItem(),
 ));

}