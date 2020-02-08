
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoughtFood extends StatefulWidget {
  final String name;
  final String id;
  final String imagePath;
  final double Price ;
  final String Category;
  final double discount;
  final double ratings;

  BoughtFood({this.name, this.id, this.imagePath, this.Price, this.Category,
    this.discount, this.ratings});

  @override
  _BoughtFoodState createState() => _BoughtFoodState();
}

class _BoughtFoodState extends State<BoughtFood> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Stack(//for show images and description in stack view
        children: <Widget>[
          Container(
            height:200.0 ,
            width: 340.0,
            child: Image.asset(widget.imagePath,fit: BoxFit.cover,),//box fit for fit the pic
          ),
          Positioned(//for position of shadow
            left: 0.0,
            bottom: 0.0,
            child: Container(//for shadow on pic

              height: 60.0,
              width: 340,//the same width of pic
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black,Colors.black12],
                  begin: Alignment.bottomCenter,//the start of shadow
                  end: Alignment.topCenter,//the end of shadow
                )
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Row(//for text on pic and stars
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18 ),),
                    Row(
                      children: <Widget>[
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        SizedBox(width: 20.0,),
                        Text("( "+widget.ratings.toString()+"Reviews)",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 13),)
                      ],
                    ),
                  ],
                ),
                Column(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(''+widget.Price.toString()+'EGP',style: TextStyle(fontSize: 18,color: Colors.limeAccent,fontWeight: FontWeight.bold),),
                    Text('Min order',style: TextStyle(fontSize: 10,color: Colors.white70),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
