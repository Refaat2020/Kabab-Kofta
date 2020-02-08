
import 'package:flutter/material.dart';
//Model
import 'package:food/screen/models/category_model.dart';
import 'package:food/widget/food_card.dart';
// Data
import '../screen/data/category_data.dart';


class FoodCategory extends StatelessWidget {
  final List<Category> _categores = categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categores.length,
        itemBuilder: (BuildContext context , int index){
          return FoodCard(
              categoryName: _categores[index].categoryName,
            imagePath: _categores[index].imagePath,
            numberOfItem: _categores[index].numberOfItem,
          );
        },
      ),
    );
  }
}
