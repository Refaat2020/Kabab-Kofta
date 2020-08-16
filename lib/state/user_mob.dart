import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food/screen/models/user_model.dart';
import 'package:http/http.dart'as http;
import 'package:food/screen/pages/signin_pagee.dart';
import 'package:food/screen/src/main_screen.dart';
import 'package:mobx/mobx.dart';
import 'package:toast/toast.dart';
part 'user_mob.g.dart';

class UserStore extends UserMob with _$UserStore {}

abstract class UserMob with Store {
   @observable
   FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
   @observable
  http.Response response;
  @observable
  List<UserModel> _userList = [];
  @observable
  FlutterSecureStorage storage = FlutterSecureStorage();


  List<UserModel> get userList => _userList;
  String _apiKey = "AIzaSyBWUjpOv9q2b5F94mRXk8e-cGfgFEsTUvY";
  String _urlSignUP =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBWUjpOv9q2b5F94mRXk8e-cGfgFEsTUvY";
  String _urlLogin =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBWUjpOv9q2b5F94mRXk8e-cGfgFEsTUvY";

  String _urlDelete = "https://identitytoolkit.googleapis.com/v1/accounts:delete?key=AIzaSyBWUjpOv9q2b5F94mRXk8e-cGfgFEsTUvY";
  String _urlChangePass = "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyBWUjpOv9q2b5F94mRXk8e-cGfgFEsTUvY";
  UserModel _authenticatedUser;
  set authenticatedUser(UserModel value) {
    _authenticatedUser = value;
  }

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @observable
  String message;
  @observable
  bool hasError = false;

  @action
  Future addUserInfo(String email,String username,String phoneNumber,BuildContext context)async{
    try{
      Map<String,dynamic>userData={
        "email":email,
        "username":username,
        "phoneNumber":phoneNumber,
        "address":"",
      };

     response = await http.post(
        "https://foodapp-5b755.firebaseio.com/users.json",
        body: json.encode(userData));
    final Map<String, dynamic> responseData = await json.decode(response.body);

    UserModel user = UserModel(
      id: responseData['name'],
    phoneNumber: userData['phoneNumber'],
      email: userData['email'],
      username: userData['username'],
    );

    _userList.add(user);
    Toast.show("item added successfully", context,duration: Toast.LENGTH_SHORT,gravity: Toast.CENTER);
    _isLoading = false;
    return Future.value(true);
  }catch(e){
      print(e);
  _isLoading = false;
  return Future.value(false);
  }
  }
  @action
  Future signUp(String email, String pass,String username,String phoneNumber, BuildContext context) async {
      Map<String,dynamic>authData= {
        "email":email,
        "password":pass,
        "returnSecureToken":true,
      };

    try {
      response = await http.post(_urlSignUP,
          body: json.encode(authData),
          headers: {'Content-Type': 'application/json'});
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        await addUserInfo(email, username,phoneNumber, context);
        _authenticatedUser = UserModel(
          id: responseBody["localId"],
          email: responseBody["email"],
          idToken: responseBody["idToken"],
          userType: responseBody["customer"],
        );

        message = "SignUp successfully";
        Toast.show(message, context, duration: Toast.LENGTH_LONG);
        Future.delayed(Duration(milliseconds: 300),(){
          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
        });
      } else {
        print("$responseBody vv");
        switch (response.statusCode) {
          case 400:
            message = "Failed To Sign Up";
            Toast.show(message, context,
                duration: Toast.LENGTH_LONG,
                textColor: Colors.red,
                backgroundColor: Colors.white);
            break;
        }
      }
    } catch (e) {

    Toast.show("$e", context,duration: Toast.LENGTH_LONG);
    }
  }

  @action
  Future<void> login(String email, String pass, BuildContext context) async {
  Map<String,dynamic>authData= {
    "email":email,
    "password":pass,
    "returnSecureToken":true,
  };

    try {
      response = await http.post(_urlLogin,
          body:  json.encode(authData),
          headers: {'Content-Type': 'application/json'});
      print("object");

      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        _authenticatedUser = UserModel(
          id: responseBody["localId"],
          email: responseBody["email"],
          idToken: responseBody["idToken"],
          userType: responseBody["customer"],
        );
        String _token = responseBody["idToken"];
        storage.write(key: "idToken", value: _token);
        message = "Login successfully";
        Toast.show(message, context, duration: Toast.LENGTH_LONG);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MainScreen()));
      } else {
        print("$responseBody vv");
        switch (response.statusCode) {
          case 400:
            message = "Please Check The Email/Password";
            Toast.show(message, context,
                duration: Toast.LENGTH_LONG,
                textColor: Colors.red,
                backgroundColor: Colors.white);
            break;
        }
      }
    } catch (e) {

     print(e);
     Toast.show("$e", context,duration: Toast.LENGTH_LONG);


    }
  }

  @action///delete account work fine
  Future deleteAccount(BuildContext context)async{
    String idToken = await storage.read(key: "idToken");

    Map<String,dynamic>idTokens = {
      "idToken":idToken,
    };
    try{
    response = await http.post(
        _urlDelete,
        headers: {'Content-Type': 'application/json'},
      body: json.encode(idTokens),
    );
      Map<String,dynamic>responseBody = json.decode(response.body);
      if(response.statusCode==200)
        {
          print("delted");
          storage.delete(key: "idToken");
          userList.remove(idToken);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginPage()));

        }
    }catch(e){
      print(e);
    }
  }

  @action///change pass work fine
  Future changePass(String oldPass,String newPass)async{

   String idToken = await storage.read(key: "idToken");
    Map<String,dynamic>data = {
      "idToken":idToken,
      "password":newPass,
      "returnSecureToken":true,
    };
    try{
      response = await http.post(_urlChangePass,body: json.encode(data),headers: {'Content-Type': 'application/json'});

      Map<String,dynamic>responseBody = json.decode(response.body);
      if(response.statusCode ==200)
        {
          print("pass Change");
          _authenticatedUser = UserModel(
            idToken: responseBody["idToken"],
            id: responseBody["localId"],

          );
          print(responseBody);


        }
    }catch(e){
      print(e);
    }
  }

  @action///signout work fine
  Future signOut(BuildContext context) async {
    _fireBaseAuth.signOut();
    storage.delete(key: "idToken");
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginPage()));
    return Future.delayed(Duration.zero);
  }
}