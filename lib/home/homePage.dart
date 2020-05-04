import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Moshions/cart.dart';
import 'package:Moshions/shop/shop.dart';

import 'home.dart';

// creating the screen

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // current index on the bottom navigation
  final List<Widget> _childrenWidgetHome = <Widget>[
    Home(),
    Shop(),
    CartList(),
    Center(child: Text('Profile under development')),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   title: Text('My Flutter App'),
        // ),
        body: _childrenWidgetHome.elementAt(_currentIndex),
        // new
        bottomNavigationBar: new Theme(

          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.black,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Color.fromRGBO(255, 165, 16, 1),
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Color.fromRGBO(255, 165, 16, 1)))),

          child:
          BottomNavigationBar(

            backgroundColor: Colors.black,
            selectedItemColor: Color.fromRGBO(255, 165, 16, 1),
            onTap: onTabTapped,
            // new
            currentIndex: _currentIndex,
            // new
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                title: Text('Store'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text('Bag'),
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Profile'))
            ],
          ),
        ));
  }
}
