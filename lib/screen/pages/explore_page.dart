
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food/admin/add_food_item.dart';
import 'package:food/state/foodMob.dart';
import 'package:food/widget/food_item_card.dart';
import 'package:get_it/get_it.dart';

class ExplorePage extends StatefulObserverWidget {


  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  GetIt foodLocator = GetIt.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodLocator<FoodStore>().fetchFoods();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Observer(

          builder: (context ) {

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child:
              RefreshIndicator(
                onRefresh: foodLocator<FoodStore>().fetchFoods,

                child:
                ListView.builder(
                  itemCount: foodLocator<FoodStore>().foodlength,
                  itemBuilder: (context , index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddFoodItem(food:foodLocator<FoodStore>().foods[index])));
                      },
                      child: FoodItemCard(
                        name:foodLocator<FoodStore>().foods[index].name ,
                        price: foodLocator<FoodStore>().foods[index].price,
                        description: foodLocator<FoodStore>().foods[index].description,
                        category: foodLocator<FoodStore>().foods[index].category,

                      ),
                     onDoubleTap: (){
                        foodLocator<FoodStore>().deleteFoodItem(foodLocator<FoodStore>().foods[index].id,context);
                     },
                    );
                  },
                ),
              ),

            );
          }),
    );
  }
}
