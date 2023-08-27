import 'package:flutter/material.dart';
import 'Product.dart';
import 'ProductCard.dart';
import 'User.dart';
import 'LoginPage.dart';

class ProductsScreen extends StatefulWidget {
  // Product product;
  // ProductsScreen({Key? key, required this.product}) : super(key: key);
  final VoidCallback onChange;
  User user;
  ProductsScreen({Key? key, required this.user, required this.onChange}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    Product p1 = Product(name: "Product 1", imageURL: "assets/images/shoe1.jpg", price: 50, rating: 3.8);
    Product p2 = Product(name: "Product 2", imageURL: "assets/images/shoe3.png", price: 80, rating: 4.8);
    Product p3 = Product(name: "Product 3", imageURL: "assets/images/shoe2.jpeg", price: 90, rating: 1.8);
    List<Product> products = [p1, p2, p3];
    // widget.user.addToShoppingCart(products[0]);
    // u1.addToShoppingCart(p1);
    // List<Product> products = widget.user.SavedProducts; // Use user's saved products list

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.shopping_bag),
          title: const Text("Product Screen"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                spacing: 10, // spacing between items horizontally
                runSpacing: 10, // spacing between items vertically
                children: products.map((p) => ProductCard(product: p, user: widget.user, onChange: () { setState(() {}); widget.onChange(); },)).toList(), // ! thoroughly understand this line
                // Pass both product and user to ProductCard
              ),
              const SizedBox(height: 65), // Add spacing below the wrapped items
            ],
          ),
        ),
      ),
    );
  }
}
