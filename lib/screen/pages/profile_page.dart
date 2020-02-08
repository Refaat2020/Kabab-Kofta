

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:food/screen/pages/signin_pagee.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Profile',style: TextStyle(fontSize: 36,color: Colors.black45),),
       actions: <Widget>[
         IconButton(icon: Icon(Icons.exit_to_app,color: Colors.grey,), onPressed: null)
       ],
        iconTheme: IconThemeData(color: Colors.grey.shade600),
      ),
        drawer: Drawer(child: Text("jkjkjljl"),),
        body: Padding(
          padding: const EdgeInsets.only(left: 90.0,top:  0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 110.0,
                width: 110.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  image: DecorationImage(image: AssetImage('asset/images/7mam.jpg'),fit: BoxFit.fill),
                ),

              ),
              SizedBox(width: 30,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text('Refaat Taha',style: TextStyle(color: Colors.black87,fontSize: 18.0,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10.0,),
                  Text("01009856754"),
                  SizedBox(height: 20.0,),
                  Container(
                    width:70,
                    height: 40,
                    child: RaisedButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SignIn()));
                    },
                      color: Colors.blueAccent.shade100,
                      focusColor: Colors.blue,
                      child: Text('Edit'),
                      hoverColor: Colors.blueAccent,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),side: BorderSide(width: 70.0)),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      );


  }
}
