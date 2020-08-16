
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food/db/creditcard_info.dart';
import 'package:food/helper/constant.dart';
import 'package:food/helper/locator.dart';
import 'package:food/screen/pages/signup_page.dart';
import 'package:food/screen/src/main_screen.dart';
import 'package:food/state/user_mob.dart';
import 'package:food/widget/big_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food/widget/login_widget.dart';
import 'package:hive/hive.dart';
class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  FlutterSecureStorage storage = FlutterSecureStorage();

  String _password;

  String _email;
void navi()async{
  String value = await storage.read(key: "idToken",);
  print("id:::$value");
  if(value != null)
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MainScreen()));
  }else{
    return;
  }

}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navi();
  }
  bool secure = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("asset/images/back.png"),fit: BoxFit.cover),

                color: Colors.black,

//                borderRadius: BorderRadius.all( Radius.circular(40)),
              ),
              child: ListTile(

                contentPadding: EdgeInsets.only(left: 0,top: 30),
                title: Container(

                  margin:  EdgeInsets.symmetric(horizontal: 40,vertical: 50),
                  child:Text("Food Delivery App",style: GoogleFonts.aBeeZee(
                      color: Colors.white,fontSize: 35),),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 800,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                      color: Colors.white,
                    ),
                    child: FormBuilder(
                     key: fbKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 50),
                            child: Text("Login",style: GoogleFonts.aBeeZee(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          LoginCard(
                            obscure: false,
                            textInputType: TextInputType.emailAddress,
                            name: "Email",
                            valid: [
                              FormBuilderValidators.email(errorText: "This field requiers a vaild email address"),
//                              FormBuilderValidators.pattern("/^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})i",),
                            ],
                            save: (value){
                              _email = value;
                            },
                          ),
                          SizedBox(height: 20,),
                          LoginCard(
                            obscure: secure,
                            textInputType: TextInputType.visiblePassword,
                            name: "Password",
                            valid: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ],
                            save: (value){
                              _password = value;
                            },
                          ),
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Observer(
                              builder: (BuildContext context){
                                return BigButton(
                                  name: "Login",
                                  color: Colors.black,
                                  onTap: (){
                                    if(fbKey.currentState.validate())
                                    {
                                      fbKey.currentState.save();
//                                      checkInternet(context);
                                  locator<UserStore>().login(_email.trim(), _password, context ,);
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 50,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                            },
                            child: RichText(text: TextSpan(
                              text: "Don't have any account? Sign Up",
                              style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),

                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
    );
  }
}