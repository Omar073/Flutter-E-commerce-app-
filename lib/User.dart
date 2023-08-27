import 'Product.dart';

class User{

  String name;
  String email;
  String password;
  List<Product> ShoppingCart = [];
  double CartSubtotal=0;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.ShoppingCart
  });

  void addToShoppingCart(Product product) {
      ShoppingCart.add(product);
  }

  void removeFromShoppingCart(Product product) {
    ShoppingCart.remove(product);
  }

  // bool isProductSaved(Product product) {
  //   return ShoppingCart.contains(product);
  // }

  // double getCartSubtotal(){
  //   double total =0;
  //   for(Product product in ShoppingCart){
  //     total += product.price;
  //   }
  //   return total;
  // }
  // TODO: we can replaced this fn with an attribute of the user class that is changed each time a product is added or removed

  void addToCartSubtotal(double price){
    CartSubtotal +=price;
  }

  void removeFromCartSubtotal(double price){
    CartSubtotal -=price;
  }
}
