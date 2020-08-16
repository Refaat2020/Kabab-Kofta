import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food/db/creditcard_info.dart';
import 'package:food/helper/locator.dart';
import 'package:food/screen/pages/signin_pagee.dart';
import 'package:food/state/payment_mob.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart'as pathPathProvider;

//void ins()async {
//
//}
void main() async{
WidgetsFlutterBinding.ensureInitialized();
Directory directory = await pathPathProvider
    .getApplicationDocumentsDirectory();
Hive.init(directory.path);
Hive.registerAdapter(CreditInfoAdapter(),);
 setupLocator();

// ins();
 runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Kebab & Kofta",
  theme: ThemeData(primaryColor: Colors.blueAccent),

  home: LoginPage(),
//  home: AddFoodItem(),
 ));
 locator<PaymentStore>().openBox();
}