import 'package:flutter/material.dart';
import '../Classes/Product.dart';
import '../CustomWidgets/ProductCard.dart';

class ProductsScreen extends StatefulWidget {
  // Product product;
  // ProductsScreen({Key? key, required this.product}) : super(key: key);
  final VoidCallback onChange;
  ProductsScreen({Key? key, required this.onChange}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {

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
                children: products.map((p) => ProductCard(product: p, onChange: () { setState(() {}); widget.onChange(); },)).toList(), // ! thoroughly understand this line
                // children: products.map((p) => ProductInCartCard(product: p, onChange: () { setState(() {}); widget.onChange(); },)).toList(), // ! thoroughly understand this line
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
