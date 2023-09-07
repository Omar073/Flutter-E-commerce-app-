import 'package:flutter/material.dart';
import 'ProductInCartCard.dart';
import 'User.dart';

class ShoppingCartScreen extends StatefulWidget {
  final VoidCallback onChange;
  const ShoppingCartScreen({Key? key, required this.onChange}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Center(
                child: Wrap(
                  spacing: 10, // spacing between items horizontally
                  runSpacing: 10, // spacing between items vertically
                  // children: thisuser.ShoppingCart.map<Widget>((p) => ProductCard(product: p, onChange: () { setState(() {}); widget.onChange(); },)).toList(), // ! thoroughly understand this line
                  children: thisuser.ShoppingCart.map<Widget>((p) => ProductInCartCard(productInCart: p, onChange: () { setState(() {}); widget.onChange(); },)).toList(), // ! thoroughly understand this line
                  // Pass both product and user to ProductCard
                ),
              ),
              // const SizedBox(height: 20),
              // Center(
              //   child: Text('Cart subtotal: ${thisuser.CartSubtotal}',
              //     style: const TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 30,
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 65),
            ],
          ),
        ),
    );
  }
}


