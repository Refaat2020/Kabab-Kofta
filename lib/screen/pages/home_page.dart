
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food/screen/models/food_model.dart';
import 'package:food/screen/pages/food_detailsls.dart';
import 'package:food/state/foodMob.dart';
import 'package:food/widget/bought_food.dart';
import 'package:food/widget/food_category.dart';
import 'package:food/widget/home_top_info.dart';
import 'package:food/widget/search_filed.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {




  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  List<FoodData>_foods = foods;
  GetIt locator = GetIt.instance;


  @override
  void initState() {
    // TODO: implement initState
    locator<FoodStore>().fetchFoods();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.only(top: 10 , left: 20 , right: 20),
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
          Observer(
            builder: (context){
              return Column(
                children:
                locator<FoodStore>().foods.map(_buildFoodItems).toList(),
              );
            },


          ),
        ],
      ),
    );

  }
  Widget _buildFoodItems(FoodData food){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>FoodDetails(
          foodData: food,
        )));
      },
      autofocus: true,
      splashColor: Colors.blue,
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFood(
          id: food.id,
          name: food.name,
          Price: food.price,
          imagePath: "asset/images/bata.jpg",
          Category: food.category,
          discount: food.discount,
          ratings: food.ratings,

        ),
      ),
    );
  }
}


