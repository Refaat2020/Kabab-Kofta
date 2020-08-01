
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food/helper/constant.dart';
import 'package:food/helper/locator.dart';
import 'package:food/screen/models/food_model.dart';
import 'package:food/state/foodMob.dart';
import 'package:food/widget/big_button.dart';
import 'package:food/widget/form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFoodItem extends StatefulObserverWidget {
  final FoodData food;

  AddFoodItem({this.food});

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
   String name ;
   String imagePath;

   _AddFoodItemState({this.name, this.imagePath, this.price, this.category,
      this.description, this.discount});

  String price ;
   String category;
   String description;
   String discount;
   GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

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
        leading: IconButton(icon: Icon(Icons.close,color: Colors.blueAccent,), onPressed:(){
          Navigator.pop(context);
        }),
        title: Text(widget.food !=null ?"Update Food Item" : "add Food Item" , style:GoogleFonts.acme(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 22),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                  initial: widget.food==null?"":widget.food.name,
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
                  initial: widget.food==null?"":widget.food.category,
                  save: ( value){
                    category = value;
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
                   initial: widget.food == null ?"":widget.food.description,
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
                  initial: widget.food==null?"":widget.food.price.toString(),
                  save: ( value){
                    price = value;
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
                  initial: widget.food== null ? "":widget.food.discount.toString(),
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

                  builder: (context){
                  return BigButton(
                    name: widget.food ==null ?"Add Food Item" : "Update Food Item",
                    onTap: ()async{


                      if(fbKey.currentState.validate())
                      {
                        fbKey.currentState.save();

                        if(widget.food!=null){
                       //i want update this item
                          Map<String,dynamic>updateFoodItem= {
                            "title":name,
                            "category":category,
                            "price":double.parse(price),
                            "description":description,
                            "discount":double.parse(discount),
                          };
                           await locator<FoodStore>().updateFood(updateFoodItem, widget.food.id , context).then((value) => Navigator.pop(context));

                        }else{
                          locator<FoodStore>().addFood(FoodData(
                            name: name,
                            description: description,
                            category: category,
                            discount: double.parse(discount),
                            price:double.parse(price) ,
                          ), context).then((value) => Navigator.pop(context));
                        }
                      }
                    },
                  );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
