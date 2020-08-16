
import 'package:flutter/material.dart';
import 'package:food/screen/pages/explore_page.dart';
import 'package:food/screen/pages/home_page.dart';
import 'package:food/screen/pages/payment_page.dart';
import 'package:food/screen/pages/profile_page.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class DrawerIn extends StatefulWidget {
  @override
  _DrawerInState createState() => _DrawerInState();
}

class _DrawerInState extends State<DrawerIn> {
  List <ScreenHiddenDrawer> itens = List();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    itens.add(ScreenHiddenDrawer(ItemHiddenMenu(
      name: "Home",
      selected: false,

    ), HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      screenSelectedBuilder: (position,controller){
        Widget screen;
        switch(position){
          case 0 :
           screen = ProfilePage();
           break;
          case 1:
            screen = ExplorePage();
          break;

        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){}),
          ),
          body: screen,
        );
      },
      menu: ListView(

          children: <Widget>[
            PaymentCard(),
          ],
      ),
    ) ;
  }
}
