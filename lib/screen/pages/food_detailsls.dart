

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food/screen/models/food_model.dart';
import 'package:food/widget/big_button.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetails extends StatefulWidget {
  final FoodData foodData;

  FoodDetails({this.foodData});

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blueAccent,),
          elevation: 0,
          centerTitle: true,
          title: Text("Food Details",style: GoogleFonts.acme(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("asset/images/bata.jpg",fit: BoxFit.cover,),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("${widget.foodData.name
                  }",style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  ),
                  Text("${widget.foodData.price} EGP",style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent,
                  ),
                  ),
                ],
              ),
              SizedBox(height: 18,),
              Text("Description : ",style: GoogleFonts.actor(
                fontSize: 16,
                color: Colors.black,
              ),
              ),
              SizedBox(height: 5,),
              AutoSizeText("${widget.foodData.description}",
                minFontSize: 12,
                textAlign: TextAlign.justify,
                style: GoogleFonts.actor(
                fontSize: 16,
                color: Colors.black,
              ),
              ),
              SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(icon: Icon(Icons.add_circle , color: Colors.blueAccent,), onPressed: (){}),
                Text("1",style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold),),
                IconButton(icon: Icon(Icons.remove_circle,color: Colors.blueAccent), onPressed: (){}),
              ],
            ),
              SizedBox(height: 12,),
              BigButton(name: "Add To Cart",onTap: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
