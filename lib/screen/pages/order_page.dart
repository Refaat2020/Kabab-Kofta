
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/screen/pages/signin_page.dart';
import 'package:food/screen/pages/signin_pagee.dart';
import 'package:food/widget/order_card.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Order Details',style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              OrderCard(),
              OrderCard(),
              OrderCard(),
              OrderCard(),
            ],
          ),

        ],
      ),
     bottomNavigationBar: _buildTotalContainer(),

    );

  }

 Widget _buildTotalContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Text('Total Price',style: TextStyle( color: Colors.grey,fontSize: 16.0,fontWeight: FontWeight.bold),),
              Text('500 EGP',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              Text('Discount',style: TextStyle( color: Colors.grey,fontSize: 16.0,fontWeight: FontWeight.bold),),
              Text('0.0 EGP',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 10.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Text('Tax',style: TextStyle( color: Colors.grey,fontSize: 16.0,fontWeight: FontWeight.bold),),
              Text('15 EGP',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: 10.0,),

          Divider(height: 20.0,color: Colors.grey.shade700,),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('SubTotal',style: TextStyle( color: Colors.grey,fontSize: 16.0,fontWeight: FontWeight.bold),),
              Text('515 EGP',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 15.0,),

          Container(
            height: 40,
                child: RaisedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SignIn()));
                },
                  color: Colors.blue,
                  focusColor: Colors.blue,
                  child: Text('Check Out'),
                  hoverColor: Colors.blueAccent,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),side: BorderSide(width: 80.0)),
                ),
          ),
        ],
      ),
    );
 }
}
