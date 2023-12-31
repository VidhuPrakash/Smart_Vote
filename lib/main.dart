import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_vote_/firebase_options.dart';
import 'package:smart_vote_/screens/home_screen.dart';
import 'package:smart_vote_/screens/login_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      home: Login(),
      routes: {'/home': (context) => HomeScreen()},
    );
  }
}
