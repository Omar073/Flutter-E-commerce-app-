import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// pub add

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late double width = 100;
  late double height = 300;
  FocusNode _nameFieldFocus = FocusNode();
  FocusNode _emailFieldFocus = FocusNode();
  FocusNode _passwordFieldFocus = FocusNode();
  bool KeyboardOn = false;

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   super.dispose();
  // }

  @override
  void dispose() {
    _nameFieldFocus.dispose();
    _emailFieldFocus.dispose();
    _passwordFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    KeyboardOn = (_nameFieldFocus.hasFocus || _emailFieldFocus.hasFocus || _passwordFieldFocus.hasFocus);

//     return MaterialApp(
//       home: Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: Container(
//           // color: Colors.green,
//           height: height,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               colors: [
//                 Colors.orange.shade900,
//                 Colors.orange.shade800,
//                 Colors.orange.shade400,
//               ],
//             ),
//           ),
//           child: Column(
//             children: [
//               // Container(
//               //   // width: width,
//               //   width: 420,
//               //   height: 300,
//               //   // color: Colors.orangeAccent,
//               //   // color: const Color.fromARGB(220, 243,119,6),
//               //   decoration: BoxDecoration(
//               //     gradient: LinearGradient(
//               //       begin: Alignment.topCenter,
//               //       colors: [
//               //         Colors.orange.shade900,
//               //         Colors.orange.shade800,
//               //         Colors.orange.shade400,
//               //       ],
//               //     ),
//               //   ),
//               const SizedBox(height: 70,),
//               const Row(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(width: 15),
//                   Text(
//                     "Sign Up\nWelcome",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 35,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40,),
//               Positioned(
//                 top: 400,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   height: height - 200,
//                   // height: 500,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     // borderRadius: BorderRadius.circular(70.0),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(70.0),
//                       topRight: Radius.circular(70.0),
//                     ),
//                   ),
//                   // child: const Center(child: Text("Sign Up")),
//
//                   // Positioned(
//                   //   top: 200,
//                   //   left: 0,
//                   //   right: 0,
//                   //   child: Container(
//                   //     // height: height - 200,
//                   //     height: 500,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.red,
//                   //       borderRadius: BorderRadius.circular(70.0),
//                   //     ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // const SizedBox(height: 180),
//                         const SizedBox(height: 300),
//                         // Padding(
//                         //   padding: const EdgeInsets.symmetric(horizontal: 12.0)
//                         //       .copyWith(bottom: 12.0),
//                         //   child: TextField(
//                         //     // * Name text field
//                         //     controller: _nameController,
//                         //     style: const TextStyle(
//                         //       color: Colors.black,
//                         //       fontWeight: FontWeight.bold,
//                         //     ),
//                         //     decoration: InputDecoration(
//                         //       border: OutlineInputBorder(
//                         //         borderRadius: BorderRadius.circular(30),
//                         //       ),
//                         //       contentPadding: const EdgeInsets.all(20),
//                         //       labelText: "Name",
//                         //     ),
//                         //   ),
//                         // ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(bottom: 12.0),
//                           child: TextField(
//                             // * Email text field
//                             controller: _emailController,
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             decoration: InputDecoration(
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: (BorderSide(color: Colors.orange.shade900, width: 1)),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: (BorderSide(color: Colors.orange.shade900, width: 1)),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               contentPadding: const EdgeInsets.all(20),
//                               prefixIcon: const Icon(Icons.email),
//                               labelText: "Email",
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(bottom: 12.0),
//                           child: TextField(
//                             // * password text field
//                             controller: _passwordController,
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               contentPadding: const EdgeInsets.all(20),
//                               labelText: "Password",
//                               prefixIcon: const Icon(Icons.key),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             textStyle: const TextStyle(fontSize: 15),
//                             shape: const StadiumBorder(),
//                             backgroundColor: Colors.orange.shade900,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 15),
//                           ),
//                           onPressed: () {
//                             final enteredEmail = _emailController.text;
//                             if (emailRegex.hasMatch(enteredEmail)) {
//                               // Email is valid
//                               showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     title: const Text('Valid Email'),
//                                     content: const Text(
//                                       'The email address is valid.',
//                                     ),
//                                     actions: [
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                         },
//                                         child: const Text('OK'),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             } else {
//                               // Email is not valid
//                               showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     title: const Text('Invalid Email'),
//                                     content: const Text(
//                                       'Please enter a valid email address.',
//                                     ),
//                                     actions: [
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                         },
//                                         child: const Text('OK'),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             }
//                           },
//                           child: const Text('Submit'),
//                         ),
//                         // Container(
//                         //   color: Colors.white,
//                         //   height: 300,
//                         // )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          // color: Colors.green,
          height: height,
          child: Stack(
            children: [
              Container(
                // width: width,
                width: 420,
                height: double.infinity,
                // color: Colors.orangeAccent,
                // color: const Color.fromARGB(220, 243,119,6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.orange.shade900,
                      Colors.orange.shade800,
                      Colors.orange.shade400,
                    ],
                  ),
                ),
                child:
                const Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 15),
                        Text(
                          "Sign Up\nWelcome",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              Positioned
                (top: 210,//!why does it need left and right = 0
                left: 0,right: 0,
                child: Container(
                  height: height / (1.2),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70.0),
                      topRight: Radius.circular(70.0),

                    ),
                  ),
                  child: Column(
                    mainAxisAlignment:KeyboardOn?MainAxisAlignment.start: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 50,),
                      // const SizedBox(height: 180),
                      // const SizedBox(height: 350),Expanded(
                      //
                      //                       child: Container(color: Colors.pink,)),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0)
                            .copyWith(bottom: 12.0),
                        child: TextFormField(
                          // * Name text field
                          focusNode: _nameFieldFocus,
                          controller: _nameController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            labelText: "Name",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0)
                            .copyWith(bottom: 12.0),
                        child: TextField(
                          // * Email text field
                          focusNode: _emailFieldFocus,
                          controller: _emailController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange.shade900,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange.shade900,
                                width: 1,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            prefixIcon: const Icon(Icons.email),
                            labelText: "Email",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0)
                            .copyWith(bottom: 12.0),
                        child: TextField(
                          // * password text field
                          focusNode: _passwordFieldFocus,
                          controller: _passwordController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.key),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.orange.shade900,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                        ),
                        onPressed: () {
                          final enteredEmail = _emailController.text;
                          if (emailRegex.hasMatch(enteredEmail)) {
                            // Email is valid
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Valid Email'),
                                  content:
                                  const Text('The email address is valid.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            // Email is not valid
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Invalid Email'),
                                  content: const Text(
                                      'Please enter a valid email address.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                      // Container(
                      //   color: Colors.white,
                      //   height: 300,
                      // )

                    ],
                  ),
                  // child: const Center(child: Text("Sign Up")),

                  // Positioned(
                  //   top: 200,
                  //   left: 0,
                  //   right: 0,
                  //   child: Container(
                  //     // height: height - 200,
                  //     height: 500,
                  //     decoration: BoxDecoration(
                  //       color: Colors.red,
                  //       borderRadius: BorderRadius.circular(70.0),
                  //     ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
