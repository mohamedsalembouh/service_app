import 'dart:async';

import 'package:flutter/material.dart';
import 'package:services_app/homePage.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);
  //final void Function(Locale locale) setLocale;

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      // image: AssetImage("assets/images/img_tesyir.jpg"),
                      image: AssetImage("assets/images/7alen.jpg"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            // Text(
            //   "",
            //   style: TextStyle(
            //       color: Colors.green,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 50),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 40),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CircularProgressIndicator(),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
