import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'ProductsScreen.dart';
import 'ProfileScreen.dart';
import 'ShoppingCartScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> Screens = [];
  int NavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    Screens = [
      ShoppingCartScreen(onChange: () { setState(() {}); },),
      ProductsScreen(onChange: () { setState(() {}); },),
      ProfileScreen(),
    ];

    return MaterialApp(
      home: Scaffold(

        /*
         A Stack is a widget in Flutter that allows you to layer multiple
         widgets on top of each other, similar to how you might stack cards
         on a table. Widgets placed in a Stack can be positioned using various
         properties to control their placement and alignment within the stack.
         The order in which widgets are added to the Stack determines their
         z-order, meaning the first widget added will be at the bottom, and
         subsequent widgets will be placed on top of it.*/

        body: Stack( // this is stack is made in order to set the screen behind the curved nav bar
          children: [
            Screens[NavigationIndex], // Display the current screen content
            //CurvedNavigationBar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CurvedNavigationBar(
                color: Colors.blue,
                height: 47,
                backgroundColor: Colors.transparent, // Set background color to transparent
                items: const [
                  Icon(Icons.home_outlined, size: 30, color: Colors.white),
                  Icon(Icons.shopping_cart_outlined, size: 30, color: Colors.white),
                  Icon(Icons.person_outline_rounded, size: 30, color: Colors.white),
                ],
                onTap: (index) {
                  setState(() {
                    NavigationIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}