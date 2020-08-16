import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food/helper/locator.dart';
import 'package:food/screen/pages/signin_pagee.dart';
import 'package:food/state/user_mob.dart';
import 'package:food/widget/big_button.dart';
import 'package:food/widget/login_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
String username;
String phoneNumber;
String email;
String pass;
String confirmPassword;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("asset/images/back.png"),fit: BoxFit.cover),
              color: Colors.black,
            ),
            child: ListTile(

              contentPadding: EdgeInsets.only(left: 0,top: 30),
              title: Container(

                margin:  EdgeInsets.symmetric(horizontal: 120,vertical: 10),
                child:Text("Sign Up",style: GoogleFonts.aBeeZee(
                    color: Colors.white,fontSize: 40),),
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
                    autovalidate: true,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40,),
                        LoginCard(
                          obscure: false,
                          textInputType: TextInputType.text,
                          name: "Username",
                          valid: [
                            FormBuilderValidators.required(errorText: "This field required"),
                          ],
                          save: (value){
                            username =value;
                          },
                        ),
                        SizedBox(height: 10,),
                        LoginCard(
                          obscure: false,
                          textInputType: TextInputType.text,
                          name: "Phone Number",
                          valid: [
                            FormBuilderValidators.required(errorText: "This field required"),
                          ],
                          save: (value){
                            phoneNumber =value;
                          },
                        ),
                        SizedBox(height: 10,),

                        LoginCard(
                          obscure: false,
                          textInputType: TextInputType.emailAddress,
                          name: "Email",
                          valid: [
                            FormBuilderValidators.email(errorText: "this field is requires is valid email")
                          ],
                          save: (value){
                            email =value;
                          },
                        ),
                        SizedBox(height: 10,),
                        LoginCard(
                          obscure: true,
                          textInputType: TextInputType.visiblePassword,
                          name: "Password",
                          valid: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                          ],
                          save: (value){
                            pass =value;
                          },
                        ),

                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Observer(

                            builder: (context){
                              return BigButton(
                                name: "Sign Up",
                                color: Colors.black,
                                onTap: ()async{
                                  validate();

                                    await locator<UserStore>().signUp(email, pass,username,phoneNumber,context);

                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                          },
                          child: RichText(text: TextSpan(
                            text: "Already have any account? Sign In",
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
  void validate(){
    if(fbKey.currentState.validate()) {
      fbKey.currentState.save();
    }
  }
}
