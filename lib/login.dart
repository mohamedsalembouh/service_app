import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'admin.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey3 = new GlobalKey<FormState>();

  TextEditingController email_controller = TextEditingController();

  TextEditingController pass_controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    email_controller.dispose();
    pass_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: TextFormField(
                    controller: email_controller,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(Icons.mail),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Le champ est obligatoire";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextFormField(
                    controller: pass_controller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Mot de passe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Le champ est obligatoire";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: SizedBox(
                    width: 110,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: ()
                            // => signIn(),
                            {
                          final form = _formKey3.currentState!;
                          if (form.validate()) {
                            signIn();
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => admin()));
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signIn() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email_controller.text.trim(),
        password: pass_controller.text.trim());
  }

  signFournisseur() {}
}
