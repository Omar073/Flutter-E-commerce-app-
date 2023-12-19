import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../Classes/User.dart';

class FirebaseAuthService{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // anon SignIn
  Future signInAnon() async {
    UserCredential userCredential = await firebaseAuth.signInAnonymously();
    print("userID ${userCredential.user}");
    thisuser.uid = userCredential.user!.uid; // * assign the firebase user uid to a class user
    thisuser.name = 'Guest';
    return userCredential.user != null;
  }

  // credential signup
  Future <bool> SignUp (String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      thisuser.updateUserInfo(uid: userCredential.user?.uid, email: email, password: password);
      return userCredential.user?.uid != null;
    } catch (e) {
      debugPrint("Error Signing up: $e");
      return false;
    }
  }

  // credential LogIn
}