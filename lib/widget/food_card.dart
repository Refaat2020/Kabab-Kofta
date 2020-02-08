
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItem;

  FoodCard({this.categoryName, this.imagePath, this.numberOfItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Card(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(imagePath),
                height: 85,
                width: 85,


              ),
              SizedBox(width: 20.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(categoryName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                  Text("$numberOfItem Kinds",)
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}
