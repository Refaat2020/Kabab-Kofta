

import 'package:flutter/material.dart';
import 'package:food/screen/pages/edit_profile.dart';
import 'package:food/screen/pages/payment_page.dart';
import 'package:food/widget/profile_tile.dart';
import 'package:food/widget/small_button.dart';

class ProfilePage extends StatefulWidget {
  bool appNotification = true;
  bool locationTracking = true;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey.shade50,
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 17.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    image: DecorationImage(
                        image: AssetImage('asset/images/7mam.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      'Refaat Taha',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("01009856754"),
                    SizedBox(
                      height: 20.0,
                    ),
                    SmallButton(
                    nameOfButton: "edit",
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>EditProfile()));
                    },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,),
            child: Text("Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  ProfileTile(
                    icon: Icons.location_on,
                    text: "Location",
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.blueGrey,
                  ),
                  ProfileTile(
                    text: "Change Password",
                    icon: Icons.visibility,
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.blueGrey,
                  ),
                  ProfileTile(
                    text: "Shipping",
                    icon: Icons.shopping_cart,
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.blueGrey,
                  ),
                  ProfileTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentCard()));
                    },
                    text: "Payment",
                    icon: Icons.payment,
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,),
            child: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          "App Notification",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Switch(
                          value: widget.appNotification,
                          onChanged: (bool value){
                            setState(() {
                              widget.appNotification = value;
                            });
                          },
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.blueGrey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Location Tracking",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Switch(
                        value: widget.locationTracking,
                        onChanged: (bool value){
                          setState(() {
                            widget.locationTracking = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,),
            child: Text("Other",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileTile(
                    icon: null,
                    text: "language",
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.blueGrey,
                  ),
                  ProfileTile(
                    text: "Currency",
                    icon: null,
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.blueGrey,
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
