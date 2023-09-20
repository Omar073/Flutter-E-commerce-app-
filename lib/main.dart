import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Screens/LoginPage.dart';
import 'Firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// com.example.iBuzz

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool shouldShowDebugBanner = kDebugMode; // Set to opposite of kDebugMode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // TODO: add a landing page
      home: LoginPage(),
    );
  }
}
