

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food/helper/constant.dart';
import 'package:food/screen/models/food_model.dart';
import 'package:food/widget/big_button.dart';
import 'package:food/widget/form_field.dart';

class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
   String name;
   String imagePath;
   String Price ;
   String Category;
   String description;
   String discount;
   GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  FoodData foodData;
//  TextEditingController _foodTitleController = TextEditingController();
//  TextEditingController _categoriesController = TextEditingController();
//  TextEditingController _foodDescriptionController = TextEditingController();
//  TextEditingController _PriceController = TextEditingController();
//  TextEditingController _discountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,

        title: Text("Add Food" , style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(

        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0 , horizontal: 16.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FormBuilder(
            key: fbKey,
            readOnly: false,
            autovalidate: false,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170.0,
                  decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage("asset/images/noimage.jpg"),),

                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 20,),
                BuildForm(
                 save: ( value){
                 name = value;
                 },
                  valid: [
                    FormBuilderValidators.required(errorText: "Please enter the food name"),
                    FormBuilderValidators.minLength(3,errorText: "the name is too little"),
                  ],
//                editingController: _foodTitleController,
                  maxLines: 1,
                  style: simpleStyle,
                  action: TextInputAction.next,
                  icon: Icons.fastfood,
                  hintText: "Food Title",
                  inputType: TextInputType.text,
                ),
                 SizedBox(height: 10,),
                BuildForm(
                  save: ( value){
                    Category = value;
                  },
                  valid: [
                  FormBuilderValidators.required(errorText: "please add the categories number"),
                  ],
//                editingController: _categoriesController,
                  maxLines: 1,
                  action: TextInputAction.next,
                  style: simpleStyle,
                  icon: Icons.category,
                  hintText: "Categories",
                  inputType: TextInputType.text,
                ),
                SizedBox(height: 10,),
                 BuildForm(
                   save: ( value){
                     description = value;
                   },
                   valid: [
                     FormBuilderValidators.required(errorText: "please add the description"),
                     FormBuilderValidators.maxLength(255,errorText: "Description can't be more than 255 word"),
                   ],
//                 editingController: _foodDescriptionController,
                  maxLines: 3,
                   action: TextInputAction.newline,
                  style: simpleStyle,
                  icon: Icons.description,
                  hintText: "Food Description",
                  inputType: TextInputType.text,
                ),
                SizedBox(height: 10,),
                BuildForm(
                  save: ( value){
                    Price = value;
                  },
                  valid: [
                  FormBuilderValidators.required(errorText: "please add the price for this item"),
                  FormBuilderValidators.min(5,errorText: "the price can't be less than 5 "),
                  ],
//                editingController: _PriceController,
                  maxLines: 1,
                  action: TextInputAction.next,

                  style: simpleStyle,
                  icon: Icons.attach_money,
                  hintText: "Price",
                  inputType: TextInputType.numberWithOptions(),
                ),
                SizedBox(height: 10,),
                BuildForm(
                  save: ( value){
                    discount = value;
                  },
                  valid: [
                  FormBuilderValidators.minLength(1,allowEmpty: true),
                  ],
//                editingController: _discountController,
                  maxLines: 1,
                  style: simpleStyle,
                  icon: Icons.money_off,
                  action: TextInputAction.done,
                  hintText: "Discount",
                  inputType: TextInputType.numberWithOptions(),
                ),
                SizedBox(height: 20,),
                Observer(
                  builder: (contex){
                  return BigButton(
                    name: "Add Food Item",
                    onTap: (){


                      if(fbKey.currentState.validate())
                      {
                        fbKey.currentState.save();

//                        model.addFood(FoodData(
//                          name: name,
//                          description: description,
//                          Category: Category,
//                          discount: double.parse(discount),
//                          Price:double.parse(Price) ,
//                        ),context).then((value) => Navigator.pop(context));

                      }
                    },
                  );
                  },

                ),
              ],
            ),
          )

        ),
      ),
    );
  }
  void onSubmit(Function addFood){

  }
}
