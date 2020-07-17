
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/screen/models/food_model.dart';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
import 'package:toast/toast.dart';

part 'mobb.g.dart';

class FoodStore = mobb with _$FoodStore;

abstract class mobb extends Store{


//  @observable
//  List<FoodData> _foods = [];
//  @observable
//  bool _isLoading = false;
//
//  bool get isLoading => _isLoading;
//
//  List<FoodData> get foods {
//    return List.from(_foods);
//  }
//int get foodlength{
//    return foods.length;
//}
//@action
//  Future<bool> addFood(FoodData foodData , BuildContext context) async {
//    _isLoading = true;
//    try{
//      final Map<String, dynamic> foodModel = {
//        "title": foodData.name,
//        "categories": foodData.Category,
//        "description": foodData.description,
//        "price": foodData.Price,
//        "discount": foodData.discount,
//      };
//
//      final http.Response response = await http.post(
//        "https://foodapp-5b755.firebaseio.com/foods.json",
//        body: jsonEncode(foodModel));
//    final Map<String, dynamic> responseData = await jsonDecode(response.body);
//    FoodData foodWithID = FoodData(
//      id: responseData["name"],
//      name: foodData.name,
//      Category: foodData.Category,
//      Price: foodData.Price,
//      discount: foodData.discount,
//      description: foodData.description,
//    );
//
//    _foods.add(foodWithID);
//    Toast.show("item added successfully", context,duration: Toast.LENGTH_SHORT,gravity: Toast.CENTER);
//    _isLoading = false;
//    return Future.value(true);
//    }catch(e){
//      _isLoading = false;
//    }
//
//  }
//  @action
//  Future fetchFoods()async {
//    _isLoading = true;
//    try {
//      return http.get("https://foodapp-5b755.firebaseio.com/foods.json")
//          .then((http.Response response) async{
//        final Map<String, dynamic> fetchdata =   await json.decode(response.body);
//
//        final List<FoodData> fetchFoodItem = [];
//
//        fetchdata.forEach((String id, dynamic element) {
//          fetchFoodItem.add(FoodData(
//            id: id,
//            name: element["title"],
//            description: element["description"],
//            Price: double.parse(element["price"].toString()),
//            discount: double.parse(element["discount"].toString()),
//            Category: element["category"],
////        imagePath: element["image_path"],
////        ratings: double.parse(element["rating"]),
//          ));
//          _foods = fetchFoodItem;
//
//          _isLoading = false;
//        });
//      });
//    } catch (e) {
//      _isLoading = false;
//
//      }
//  }

}