class Product {
  String name;
  String imageURL;
  double price;
  double rating;

  Product({
    required this.name,
    required this.imageURL,
    required this.price,
    required this.rating,
  });

  //
  // List<Product> products = [
  //   Product(name: "Product 1", imageURL: "assets/images/shoe1.jpeg", price: 100, rating: 4.5),
  //   Product(name: "Product 2", imageURL: "assets/images/shoe2.jpeg", price: 200, rating: 3.5),
  //   Product(name: "Product 3", imageURL: "assets/images/shoe3.jpeg", price: 300, rating: 2.5),
  // ];

  // static final Product p4 = Product(
  //   name: "Product 4",
  //   imageURL: "assets/images/shoe1.jpg",
  //   price: 100,
  //   rating: 4.5,
  // );
  // static final Product p5 = Product(
  //   name: "Product 5",
  //   imageURL: "assets/images/shoe2.jpg",
  //   price: 200,
  //   rating: 3.5,
  // );
  // static final Product p6 = Product(
  //   name: "Product 6",
  //   imageURL: "assets/images/shoe3.jpg",
  //   price: 300,
  //   rating: 2.5,
  // );
  //
  // static final List<Product> products = [p4, p5, p6];

}
