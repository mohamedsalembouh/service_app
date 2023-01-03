import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:services_app/domestique.dart';
import 'package:services_app/formadmin.dart';
import 'package:services_app/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:services_app/vehicule.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPref;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: homePage(),
      ),
      routes: {
        'vec': (context) => vehicule(),
        'dom': (context) => domestique(),
        //'dem':(context) => formAdmin(),
      },
    );
  }
}
