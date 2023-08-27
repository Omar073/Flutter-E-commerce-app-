import 'package:flutter/material.dart';
import 'ProductCard.dart';
import 'User.dart';

class ShoppingCartScreen extends StatefulWidget {
  User user;
  final VoidCallback onChange;
  ShoppingCartScreen({Key? key, required this.user, required this.onChange}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (
        leading: const Icon(Icons.shopping_cart),
        title: const Text("Shopping Cart"),
        centerTitle: true,
      ),
      body:
        SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                spacing: 10, // spacing between items horizontally
                runSpacing: 10, // spacing between items vertically
                children: widget.user.ShoppingCart.map<Widget>((p) => ProductCard(product: p, user: widget.user, onChange: () { setState(() {}); widget.onChange(); },)).toList(), // ! thoroughly understand this line
                // Pass both product and user to ProductCard
              ),
              const SizedBox(height: 65), // Add spacing below the wrapped items
            ],
          ),
        )
    );
  }
}


