import 'Product.dart';
import 'ProductInCart.dart';

class User{

  String uid ='';
  String name;
  String email;
  String password;
  List<ProductInCart> ShoppingCart = [];
  double CartSubtotal=0;

  User({
    required this.uid,
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

  void clearCartSubtotal(){
    CartSubtotal = 0 ;
  }

  // Update user info function
  void updateUserInfo({
    String? uid,
    String? name,
    String? email,
    String? password,
  }) {
    this
      ..uid = uid ?? this.uid
      ..name = name ?? this.name
      ..email = email ?? this.email
      ..password = password ?? this.password;
  }
}


User u1 = User(uid: '1', name: "omar", email: "email1@gmail.com", password: "1234", ShoppingCart: [ProductInCart(product: p1, quantity: 1)]);
User u2 = User(uid: '2', name: "mohammed", email: "email2@gmail.com", password: "1234", ShoppingCart: []);
User u3 = User(uid: '3', name: "ali", email: "email3@gmail.com", password: "1234", ShoppingCart: []);
// ! try to make SavedProducts nullable in User class

List<User> users = [u1, u2, u3];

User thisuser = User(uid: '', name: "", email: "", password: "", ShoppingCart: []); // ! this is a temporary user that will be replaced by the user that logs in