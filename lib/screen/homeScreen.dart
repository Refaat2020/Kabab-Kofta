
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/screen/data/food_data.dart';
import 'package:food/screen/models/food_model.dart';
import 'package:food/widget/bought_food.dart';
import 'package:food/widget/food_category.dart';
import 'package:food/widget/home_top_info.dart';
import 'package:food/widget/search_filed.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FoodData>_foods = foods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        padding: EdgeInsets.only(top: 50 , left: 20 , right: 20),
        children: <Widget>[
        HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 20,),
          SearchField(),
          SizedBox(height: 18,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){},
                  child: Text(
                    'Frequently Bought Meals',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),)),
              Text(
                "View All",
                style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.orange.shade400
                ),
                ),

            ],
          ),
          SizedBox(height: 15.0,),
          Column(
            children:
              _foods.map(_builldFoodItems).toList(),

          ),
        ],
      ),
    );

  }
  Widget _builldFoodItems(FoodData food){
    return Container(
    margin: EdgeInsets.only(bottom: 20.0),
      child: BoughtFood(
        id: food.id,
        name: food.name,
        Price: food.Price,
        imagePath: food.imagePath,
        Category: food.Category,
        discount: food.discount,
        ratings: food.ratings,

      ),
    );
  }
}


