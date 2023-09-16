import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:product_cards/User.dart';
import 'ProductInCart.dart';

class ProductInCartCard extends StatefulWidget {
  ProductInCart productInCart;
  final VoidCallback onChange;
  ProductInCartCard({Key? key, required this.productInCart, required this.onChange})
      : super(key: key);

  @override
  State<ProductInCartCard> createState() => _ProductInCartCardState();
}

class _ProductInCartCardState extends State<ProductInCartCard> {
  double diam = 51;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const SizedBox(height: 10),
          Container(
            height: 90, //! 80
            // color: Colors.blue, // Set your desired background color
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.0),
            color: Colors.grey[300],
            ),
            child: Column(
              children: [
                ListTile(
                  // leading: CircleAvatar(
                  //   radius: 30,
                  //   backgroundColor: Colors.white,
                  //   // foregroundImage: AssetImage(widget.product.imageURL),
                  //   backgroundImage: AssetImage(widget.product.imageURL),
                  // ),
                  leading: Column(
                    children: [
                      const SizedBox(height: 5,),
                      ClipOval(
                        child: Image.asset(
                          // color: Colors.red, //! only used to see area of image remove later
                          widget.productInCart.product.imageURL,
                          width: diam, // Set the desired width of the circular image
                          height: diam, // Set the desired height of the circular image
                          fit: BoxFit.contain, // Use the 'cover' fit to make sure the image covers the circular boundary
                          //! need to work out filling the entire shoe in the circle
                        ),
                      ),
                    ],
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(widget.productInCart.product.name),
                  ),
                  subtitle: Text('${widget.productInCart.product.price} EGP'),
                  trailing: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 16.0).copyWith(bottom: 5),
                      //   //! switch the rating bar indicator with increasing or decreasing no of products
                      //   child: RatingBarIndicator(
                      //     rating: widget.product.rating,
                      //     itemCount: 5,
                      //     itemSize: 17.0,
                      //     physics: const BouncingScrollPhysics(),
                      //     itemBuilder: (context, _) =>
                      //     const Icon(
                      //       Icons.star,
                      //       color: Colors.amber,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 20.0),
                      //   child: Container(
                      //     height: 20,
                      //     // color: Colors.blue, // Set your desired background color
                      //     decoration: BoxDecoration(
                      //       border: Border.all(
                      //         color: Colors.blue,
                      //         width: 0.5,
                      //       ),
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       // color: Colors.grey[300],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0), //! 5
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.grey),
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(child: const Text("-", style: TextStyle(fontSize: 30),),
                                onTap: (){
                                  setState(() {
                                    if(widget.productInCart.quantity>1){
                                      widget.productInCart.quantity--;
                                      thisuser.CartSubtotal -= widget.productInCart.product.price;

                                    }
                                    else if(widget.productInCart.quantity ==1){
                                      thisuser.CartSubtotal -= widget.productInCart.product.price * widget.productInCart.quantity;
                                      thisuser.removeFromShoppingCart(widget.productInCart.product);
                                    }
                                    widget.onChange();
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Text('${widget.productInCart.quantity}', style: const TextStyle(fontSize: 17),),
                              ),
                              InkWell(child: const Text("+", style: TextStyle(fontSize: 20),),
                                onTap: (){
                                  setState(() {
                                    widget.productInCart.quantity++;
                                    thisuser.CartSubtotal += widget.productInCart.product.price;
                                    widget.onChange();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      // * GestureDetector is better than TextButton because it takes up less space
                      // * you can also replace the GestureDetector with icon button with trash icon or Inkwell
                      // InkWell(
                      //   onTap: () {
                      //     thisuser.removeFromShoppingCart(widget.productInCart.product);
                      //     setState(() {
                      //       widget.onChange(); // Call onChange after the state has been updated
                      //     });
                      //   },
                      //   child: const Text(
                      //     "remove",
                      //     style: TextStyle(
                      //       color: Colors.blue, // Set the desired text color
                      //       decoration: TextDecoration.underline,
                      //       fontSize: 10,
                      //     ),
                      //   ),
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     thisuser.removeFromShoppingCart(widget.productInCart.product);
                      //   },
                      //   child: const Text(
                      //     "remove",
                      //     style: TextStyle(
                      //       color: Colors.blue, // Set the desired text color
                      //       decoration: TextDecoration.underline,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 270.0).copyWith(bottom: 5),
                  child: InkWell(
                    onTap: () {
                      thisuser.CartSubtotal -= widget.productInCart.product.price * widget.productInCart.quantity;
                      thisuser.removeFromShoppingCart(widget.productInCart.product);
                      setState(() {
                        widget.onChange(); // Call onChange after the state has been updated
                      });
                    },
                    child: const Text(
                      "remove",
                      style: TextStyle(
                        color: Colors.blue, // Set the desired text color
                        decoration: TextDecoration.underline,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
