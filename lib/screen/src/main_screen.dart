import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food/screen/pages/explore_page.dart';
import 'package:food/screen/pages/home_page.dart';
import 'package:food/screen/pages/order_page.dart';
import 'package:food/screen/pages/profile_page.dart';
import 'package:food/widget/bottomNavigation.dart';

class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentTabIndex = 0;
  HomePage _homePage;
  OrderPage _orderPage;
  ExplorePage _favoritPage;
  ProfilePage _profilePage;
  List<Widget> pages; //3mlt lista bel pages
  Widget currentPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    widget.foodModel.fetchFoods();
    //hna b5li el home page hia el current page
    _homePage = HomePage();
    _favoritPage = ExplorePage();
    _orderPage = OrderPage();
    _profilePage = ProfilePage();
    pages = [_homePage, _favoritPage,_orderPage, _profilePage];

    ///b5li el icon home selected ani fi el home page
    currentPage = _homePage;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: CurvedNavigationBar(
      onTap: (int index) {

        setState(() {
          //hna ba azbet el current page
          _currentTabIndex = index;
          currentPage = pages[index];
        });
      },

          height: 45,
          index: _currentTabIndex,
          color: Colors.blue.shade800,
          backgroundColor: Colors.black38,
          buttonBackgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          items: <Widget>[
            BottomBar(
              icon: Icons.home,
              name: "Home",
            ),
            BottomBar(
              icon: Icons.explore,
              name: "Explore",
            ),
            BottomBar(
              icon: Icons.fastfood,
              name: "Orders",
            ),
            BottomBar(
              icon: Icons.person,
              name: "Profile",
            ),
          ],
    ),
      body:currentPage ,
    );
  }
}
