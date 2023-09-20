import 'package:flutter/material.dart';
import '../CustomWidgets/ProductInCartCard.dart';
import '../Classes/User.dart';

class ShoppingCartScreen extends StatefulWidget {
  final VoidCallback onChange;
  const ShoppingCartScreen({Key? key, required this.onChange})
      : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.shopping_cart),
          title: const Text("Shopping Cart"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    spacing: 10, // spacing between items horizontally
                    runSpacing: 15, // spacing between items vertically
                    children: thisuser.ShoppingCart.map<Widget>(
                        (p) => ProductInCartCard(
                              productInCart: p,
                              onChange: () {
                                setState(() {});
                                widget.onChange();
                              },
                            )).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0).copyWith(bottom: 70),
              child: Text(
                'Cart subtotal: ${thisuser.CartSubtotal}',
                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ));
  }
}
