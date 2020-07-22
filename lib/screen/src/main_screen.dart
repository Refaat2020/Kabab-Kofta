import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food/admin/add_food_item.dart';
import 'package:food/screen/pages/explore_page.dart';
import 'package:food/screen/pages/home_page.dart';
import 'package:food/screen/pages/order_page.dart';
import 'package:food/screen/pages/profile_page.dart';
import 'package:food/widget/bottomNavigation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;
  HomePage _homePage;
  OrderPage _orderPage;
  ExplorePage _favoritPage;
  GetIt foodLocator = GetIt.instance;
  ProfilePage _profilePage;
  List<Widget> pages; //3mlt lista bel pages
  Widget currentPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //hna b5li el home page hia el current page
    _homePage = HomePage();
    _favoritPage = ExplorePage();
    _orderPage = OrderPage();
    _profilePage = ProfilePage();
    pages = [_homePage, _favoritPage, _orderPage, _profilePage];

    ///b5li el icon home selected ani fi el home page
    currentPage = _homePage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            _currentTabIndex == 0
                ? "Food Delivery App"
                : _currentTabIndex == 1
                    ? "All Food Items"
                    : _currentTabIndex == 2 ? "Orders" : "profile",
            style: GoogleFonts.acme(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: (){}
                ),
            Badge(
              badgeColor: Colors.red,
              showBadge: true,
              badgeContent: Text("2",style: TextStyle(fontSize: 12,color: Colors.white),),
              toAnimate: true,
              animationDuration: Duration(milliseconds: 300),
              position: BadgePosition.topRight(top: 3 ,right: 5),
              shape: BadgeShape.circle,
              elevation: 0,
              animationType: BadgeAnimationType.fade,
              child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: (){}
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddFoodItem()));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    label: Text("Add Food Item")),
              ],
            ),
          ),
        ),
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
        body: currentPage,
      ),
    );
  }
}
