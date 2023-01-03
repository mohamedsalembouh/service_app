import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:services_app/admin.dart';
import 'package:services_app/login.dart';
import 'package:services_app/main.dart';

class verifiedPage extends StatelessWidget {
  const verifiedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            sharedPref!.setBool("isAdmin", true);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => admin()));
            return admin();
          } else {
            return loginPage();
          }
        },
      ),
    );
  }
}
