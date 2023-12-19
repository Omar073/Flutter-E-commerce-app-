import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:product_cards/Classes/User.dart';
import '../Classes/ProductInCart.dart';

class ProductInCartCard extends StatefulWidget {
  ProductInCart productInCart;
  final VoidCallback onChange;
  ProductInCartCard({Key? key, required this.productInCart, required this.onChange})
      : super(key: key);

  @override
  State<ProductInCartCard> createState() => _ProductInCartCardState();
}

class _ProductInCartCardState extends State<ProductInCartCard> {
  late double diam;
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print("height ${height}");
    print("width ${width}");
    // diam = width/11.62790697672; //! DO NOT ASK WHAT THIS NUMBER IS
    diam = 70;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const SizedBox(height: 10),
          Container(
            height: 200, //! 80
            // color: Colors.blue, // Set your desired background color
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.0),
            color: Colors.grey[300],
            ),
            child: Container(
              height: 170,
              child: ListTile( //! TODO: replace with ROW
                // leading: CircleAvatar(
                //   radius: 30,
                //   backgroundColor: Colors.white,
                //   // foregroundImage: AssetImage(widget.product.imageURL),
                //   backgroundImage: AssetImage(widget.product.imageURL),
                // ),
                leading: ClipOval(
                  child: Image.asset(
                    // color: Colors.red, //! only used to see area of image remove later
                    widget.productInCart.product.imageURL,
                    width: diam, // Set the desired width of the circular image
                    height: diam, // Set the desired height of the circular image
                    // fit: BoxFit.contain, // Use the 'cover' fit to make sure the image covers the circular boundary
                    //! need to work out filling the entire product in the circle
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(widget.productInCart.product.name),
                ),
                subtitle: Text('${widget.productInCart.product.price} EGP'),
                trailing: Container(
                  color: Colors.red,
                  height: 100,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0).copyWith(right: 5),
                        child: Container(
                          height: 50,
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
                      // const SizedBox(height: 10,),
                      InkWell(
                        onTap: () {
                          thisuser.CartSubtotal -= widget.productInCart.product.price * widget.productInCart.quantity;
                          thisuser.removeFromShoppingCart(widget.productInCart.product);
                          setState(() {
                            widget.onChange(); // Call onChange after the state has been updated
                          });
                        },
                        child: const Text(
                          "remove",
                          // textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.blue, // Set the desired text color
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     thisuser.CartSubtotal -= widget.productInCart.product.price * widget.productInCart.quantity;
                      //     thisuser.removeFromShoppingCart(widget.productInCart.product);
                      //     setState(() {
                      //       widget.onChange(); // Call onChange after the state has been updated
                      //     });
                      //   },
                      //   icon: const Icon(Icons.restore_from_trash), // Place the icon parameter here
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
