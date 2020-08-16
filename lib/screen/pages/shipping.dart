
import 'package:flutter/material.dart';
import 'package:food/widget/shipping_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingPage extends StatefulWidget {
  @override
  _ShippingPageState createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.grey.shade50 ,
        centerTitle: true,
        title: Text("Shipping",style: GoogleFonts.acme(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        actionsIconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ShippingCard()));
            },
            child: Text(
              "Add New",
              style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600),
            ),
            color: Colors.grey.shade50,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: ShippingCard(

            ),
          ),
        ],
      ),
    );
  }
}
