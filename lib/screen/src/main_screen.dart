
import 'package:flutter/material.dart';
import 'package:food/screen/pages/favorit_page.dart';
import 'package:food/screen/pages/home_page.dart';
import 'package:food/screen/pages/order_page.dart';
import 'package:food/screen/pages/profile_page.dart';
import 'package:food/screen/pages/signin_pagee.dart';
import 'package:food/screen/pages/signup_page.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;
  HomePage _homePage;
  OrderPage _orderPage;
  FavoritPage _favoritPage;
  ProfilePage _profilePage;
  SignUp _signUp;
  SignIn _signIn;
  List<Widget> pages;//3mlt lista bel pages
  Widget currentPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //hna b5li el home page hia el current page
    _homePage = HomePage();
    _orderPage = OrderPage();
    _favoritPage = FavoritPage();
    _profilePage = ProfilePage();
    _signUp = SignUp();
    _signIn = SignIn();
    pages = [_homePage, _orderPage,_favoritPage,_profilePage];
    ///b5li el icon home selected ani fi el home page
    currentPage = _homePage;
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
        setState(() {//hna ba azbet el current page
          _currentTabIndex = index;
          currentPage = pages[index];
        });
        },
        currentIndex:_currentTabIndex ,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(

          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          title: Text('Oreders'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorite'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.face),
          title: Text('Profile'),
        ),
      ]),
      body: currentPage,
    );
  }

}
