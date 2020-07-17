
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food/widget/food_item_card.dart';

class ExplorePage extends StatefulWidget {


  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("data"),

      ),
        appBar: AppBar(
          elevation: 0,
          title:AutoSizeText(
            "All Food Items",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26.0,
              color: Colors.black
            ),
            minFontSize: 20,
            maxFontSize: 32,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.access_time),
                onPressed: (){},
              color: Colors.black38,
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black38),
        ),
      body: Observer(
        builder: (context ) {
//          model.fetchFoods(); //fetch everyTime
//          List<FoodData> foods = model.foods;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child:
            RefreshIndicator(
//              onRefresh: model.fetchFoods,

//              child:
//                   ListView.builder(
//                    itemCount: model.foodlength,
//                    itemBuilder: (context , index){
//                      return FoodItemCard(
//                        name:model.foods[index].name ,
//                        price: model.foods[index].Price,
//                        description: model.foods[index].description,
//                      );
//                    },
//                  ),
            ),

          );
        }),
    );
  }
}
