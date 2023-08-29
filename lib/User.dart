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


User u1 = User(name: "omar", email: "email1@gmail.com", password: "1234", ShoppingCart: []);
User u2 = User(name: "mohammed", email: "email2@gmail.com", password: "1234", ShoppingCart: []);
User u3 = User(name: "ali", email: "email3@gmail.com", password: "1234", ShoppingCart: []);
// ! try to make SavedProducts nullable in User class

List<User> users = [u1, u2, u3];

User thisuser = User(name: "", email: "", password: "", ShoppingCart: []); // ! this is a temporary user that will be replaced by the user that logs in