import 'package:flutter/material.dart';
import 'package:product_cards/HomeScreen.dart';
import 'SignUpPage.dart';
import 'User.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Log-in Page'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Center the "Shopify" text at the top half of the screen
            const Expanded(
              flex: 1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_bag_outlined,
                    size: 50,
                    color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      "iBuzz",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              ),
            ),
            // Add spacing below the "Shopify" text
            // const SizedBox(
            //   height: 30,
            // ),
            // Use Expanded to take the remaining space for text fields and button
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                        // hintText: "MyEmail@gmail.com",
                        labelText: "Email or Username",
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 20), // Add spacing between text fields
                    TextField(
                      controller: _passwordController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: false, // Change it to true to hide entered text
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                        // hintText: "Password",
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.key),
                      ),
                    ),
                    const SizedBox(height: 20), // Add spacing between text fields and button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      ),
                      onPressed: () {
                        // final email = _emailController.text;
                        // final password = _passwordController.text;
                        //
                        // for(User user in users) {
                        //   if (user.email == email || user.name == email) {
                        //     if (user.password == password) {
                        //       thisuser = user;
                        //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        //     }
                        //   }
                        // }
                        thisuser = u1;
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                        // if (kDebugMode) {
                        //   print('Sign-in button pressed');
                        //   print('Email: $email');
                        //   print('Password: $password');
                        // }
                      },
                      child: const Text('Log-in'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        InkWell(
                          child: const Text("Sign Up", style: TextStyle(
                            color: Colors.blue, // Set the desired text color
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                          ),),
                          onTap: (){
                            // * go to Sign Up screen
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ! Note: I tried to make the "Shopify" text at the top half of the screen and the text fields and button at the bottom half of the screen but I couldn't do it

//original code

/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_cards/HomeScreen.dart';
import 'ProductCard.dart';
import 'User.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    User u1 = User(name: "omar", email: "email1@gmail.com", password: "1234");
    User u2 = User(name: "mohammed", email: "email2@gmail.com", password: "1234");
    User u3 = User(name: "ali", email: "email3@gmail.com", password: "1234");

    List<User> users = [u1, u2, u3];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Log-in Page'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                "Shopify",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _emailController,
                style: const TextStyle(
                  // fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: const EdgeInsets.all(20), // Set padding
                  hintText: "MyEmail@gmail.com",
                  labelText: "Email or Username",
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _passwordController,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                obscureText: false, // obscureText is used to hide the text
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // Set rounded corner radius
                  ),
                  contentPadding: const EdgeInsets.all(20), // Set padding
                  hintText: "Password",
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.add_box),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
                shape: const StadiumBorder(),
                backgroundColor: Colors.blue, // background
                foregroundColor: Colors.white, // foreground
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
                if (kDebugMode) {
                  print('Sign-in button pressed');
                  print('Email: $email');
                  print('Password: $password');
                }
              },
              child: const Text('Log-in'),
            ),
          ],
        ),
      ),
    );
  }
}

*/