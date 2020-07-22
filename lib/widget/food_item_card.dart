

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food/helper/constant.dart';
import 'package:food/widget/small_button.dart';

class FoodItemCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final String category;


  FoodItemCard({this.name, this.description, this.price , this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),

          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 120.0,
          constraints: BoxConstraints(minHeight: 120 , maxHeight: 150 , maxWidth:MediaQuery.of(context).size.width , minWidth: MediaQuery.of(context).size.width/2 ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                offset: Offset(0, 3),
                color: Colors.black38,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 90.0,
                width: 90.0,
                constraints: BoxConstraints(minHeight:90 ,maxHeight: 130 , minWidth: 90 , maxWidth: 130 ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/images/7mam.jpg"),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AutoSizeText("$name" , style: simpleStyle),
                  SizedBox(height: 10,),
                  AutoSizeText("$description  ",style:descriptionStyle,maxLines: 3,minFontSize: 10,maxFontSize: 25,),
                  SizedBox(height: 10,),

                  Row(

                    children: <Widget>[
                      AutoSizeText("EGP $price",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16),minFontSize: 10,),
                      SizedBox(width: 10,),
                      SmallButton(
                        nameOfButton: "Buy",
                        onTap: (){
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
