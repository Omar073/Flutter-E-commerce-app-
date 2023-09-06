import 'package:product_cards/ProductInCart.dart';
import 'Product.dart';
import 'ProductInCart.dart';

class User{

  String name;
  String email;
  String password;
  List<ProductInCart> ShoppingCart = [];
  double CartSubtotal=0;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.ShoppingCart
  });

  void addToShoppingCart(Product product) {
    ShoppingCart.add(ProductInCart(product: product, quantity: 1));
  }

  void removeFromShoppingCart(Product product) {
    // * see if you can make this fn take productInCart
    ShoppingCart.removeWhere((element) => element.product.ID == product.ID);
  }

  void clearShoppingCart(){
    ShoppingCart = [];
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

  void clearCartSubtotal(){
    CartSubtotal = 0 ;
  }
}


User u1 = User(name: "omar", email: "email1@gmail.com", password: "1234", ShoppingCart: []);
User u2 = User(name: "mohammed", email: "email2@gmail.com", password: "1234", ShoppingCart: []);
User u3 = User(name: "ali", email: "email3@gmail.com", password: "1234", ShoppingCart: []);
// ! try to make SavedProducts nullable in User class

List<User> users = [u1, u2, u3];

User thisuser = User(name: "", email: "", password: "", ShoppingCart: []); // ! this is a temporary user that will be replaced by the user that logs in