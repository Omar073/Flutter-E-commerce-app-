import 'Product.dart';

class ProductInCart{

  late Product product;
  int quantity = 1;

  ProductInCart({
    required this.product,
    required this.quantity
  });


}