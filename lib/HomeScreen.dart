import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:product_cards/ProductsScreen.dart';
import 'package:product_cards/ProfileScreen.dart';
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
    // Initialize Screens here based on widget.user.SavedProducts
    Screens = [
      ProductsScreen(onChange: () { setState(() {}); },),
      ShoppingCartScreen(onChange: () { setState(() {}); },),
      ProfileScreen(),
    ];

    // Product p1 = Product(name: "Product 1", imageURL: "assets/images/hoodie2.jpeg", price: 80, rating: 4.8);
    // Product p2 = Product(name: "Product 2", imageURL: "assets/images/shoe1.jpg", price: 50, rating: 3.8);
    // Product p3 = Product(name: "Product 3", imageURL: "assets/images/shoe2.jpeg", price: 10, rating: 1.8);
    // List<Product> products = [p1, p2, p3];
    //! not used

    return MaterialApp(
      home: Scaffold(
        // appBar: NavigationIndex == 0 ? AppBar(
        //   // leading: const Icon(Icons.home),
        //   // title: const Text("Home Screen"),
        //   leading: const Icon(Icons.shopping_bag, ),
        //   title: const Text("Product Screen"),
        // ) : null,

        /*
         A Stack is a widget in Flutter that allows you to layer multiple
         widgets on top of each other, similar to how you might stack cards
         on a table. Widgets placed in a Stack can be positioned using various
         properties to control their placement and alignment within the stack.
         The order in which widgets are added to the Stack determines their
         z-order, meaning the first widget added will be at the bottom, and
         subsequent widgets will be placed on top of it.*/

        body: Stack( // this is stack is made in order to see the screen behind the curved nav bar
          children: [
            Screens[NavigationIndex], // Display the current screen content
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

/*
class _HomeScreenState extends State<HomeScreen> {
  List<Widget> Screens = [ProductScreen(), SavedProductsScreen()];
  int NavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    Product p1 = Product(name: "Product 1", imageURL: "assets/images/hoodie2.jpeg", price: 80, rating: 4.8);
    Product p2 = Product(name: "Product 2", imageURL: "assets/images/shoe1.jpg", price: 50, rating: 3.8);
    Product p3 = Product(name: "Product 3", imageURL: "assets/images/shoe2.jpeg", price: 10, rating: 1.8);
    List<Product> products = [p1, p2, p3];

    return MaterialApp(
      home: Scaffold(
        appBar: NavigationIndex == 0 ? AppBar(
          // leading: const Icon(Icons.home),
          // title: const Text("Home Screen"),
          leading: const Icon(Icons.shopping_bag, ),
          title: const Text("Product Screen"),
        ) : null,

        body: Screens[NavigationIndex],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blue,
          height: 47,
          backgroundColor: Colors.white,
          items: const [
            Icon(Icons.home_rounded, size: 30, color: Colors.white),
            Icon(Icons.person_rounded, size: 30, color: Colors.white),
            // Icon(Icons.settings_rounded, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              NavigationIndex = index;
            });
          },
        ),
      ),
    );
  }
}
          ),*/