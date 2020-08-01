

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:food/screen/models/food_model.dart';
import 'package:http/http.dart'as http;
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:toast/toast.dart';

part 'foodMob.g.dart';

class FoodStore extends FoodMob with _$FoodStore{}



abstract class FoodMob with Store{

  GetIt locator = GetIt.instance;
  @observable
  List<FoodData> _foods = [];
  @observable
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<FoodData> get foods {
    return List.from(_foods);
  }
int get foodlength{
    return foods.length;
}
@action
  Future<bool> addFood(FoodData foodData , BuildContext context) async {
    _isLoading = true;
    try{
      final Map<String, dynamic> foodModel = {
        "title": foodData.name,
        "categories": foodData.category,
        "description": foodData.description,
        "price": foodData.price,
        "discount": foodData.discount,
      };

      final http.Response response = await http.post(
        "https://foodapp-5b755.firebaseio.com/foods.json",
        body: jsonEncode(foodModel));
    final Map<String, dynamic> responseData = await jsonDecode(response.body);
    FoodData foodWithID = FoodData(
      id: responseData["name"],
      name: foodData.name,
      category: foodData.category,
      price: foodData.price,
      discount: foodData.discount,
      description: foodData.description,
    );

    _foods.add(foodWithID);
    Toast.show("item added successfully", context,duration: Toast.LENGTH_SHORT,gravity: Toast.CENTER);
    _isLoading = false;
    return Future.value(true);
    }catch(e){
      _isLoading = false;
      return Future.value(false);
    }

  }
  @action
  Future fetchFoods()async {
    _isLoading = true;
    try {
      return http.get("https://foodapp-5b755.firebaseio.com/foods.json")
          .then((http.Response response) async{
        final Map<String, dynamic> fetchdata =   await json.decode(response.body);

        final List<FoodData> fetchFoodItem = [];

        fetchdata.forEach((String id, dynamic element) {
          fetchFoodItem.add(FoodData(
            id: id,
            name: element["title"],
            description: element["description"],
            price: double.parse(element["price"].toString()),
            discount: double.parse(element["discount"].toString()),
            category: element["category"],
//        imagePath: element["image_path"],
//        ratings: double.parse(element["rating"]),
          ));
          _foods = fetchFoodItem;

          _isLoading = false;
        });
      });
    } catch (e) {
      _isLoading = false;

      }
  }

  @action
  Future<bool>updateFood(Map<String,dynamic> foodData , String foodId,BuildContext context)async{
    _isLoading = true;
    FoodData theFood = getFoodById(foodId);
    int foodIndex  = _foods.indexOf(theFood);
    try{
      await http.put("https://foodapp-5b755.firebaseio.com/foods/$foodId.json",body: jsonEncode(foodData));

      FoodData updateFoodItem = FoodData(
        id: foodId,
        name: foodData["title"],
        description: foodData["description"],
        category: foodData["category"],
        discount: foodData["discount"],
        price: foodData["price"],
      );
    _foods[foodIndex] = updateFoodItem;
    _isLoading = true;
      Toast.show("The Item Updated successfully", context);
      return Future.value(true);
    }catch(e){
      _isLoading = false;
      Toast.show("failed to Update", context);

      return Future.value(false);
    }
  }
  @action
  Future<bool>deleteFoodItem(String foodId,BuildContext context)async{
      AwesomeDialog(
          context: context,
          title: "Delete Food Item",

          btnCancelOnPress: (){
            AwesomeDialog().dissmiss();
          },
          dialogType: DialogType.WARNING,
          animType: AnimType.TOPSLIDE,
          btnOkColor: Colors.blue,
          dismissOnBackKeyPress: false,
          dismissOnTouchOutside: false,
          btnOkText: "Delete",
          desc: "You really want to delete this item",
          btnCancelText: "Cancel",
          btnOkOnPress: ()async{
            try {
              final http.Response respone= await http.delete("https://foodapp-5b755.firebaseio.com/foods/$foodId.json");
            if (respone.statusCode == 200) {
              _foods.remove(foodId);
              Toast.show("The Item Deleted successfully", context,duration: Toast.LENGTH_SHORT);

            }
              return Future.value(true);
            } catch (e) {
              return Future.value(false);
            }
          }

      ).show();

  }

  FoodData getFoodById(String foodId){
    FoodData food;
    for(int i =0;i<_foods.length ; i++)
    {
      if(_foods[i].id==foodId){
        food = _foods[i];
        break;
      }
    }
    return food;
  }

}