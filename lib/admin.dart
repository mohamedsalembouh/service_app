import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:services_app/adresses.dart';
import 'package:services_app/allAssistance.dart';
import 'package:services_app/allDemenagement.dart';
import 'package:services_app/allDomestique.dart';
import 'package:services_app/allLocation.dart';
import 'package:services_app/allMaison.dart';
import 'package:services_app/allVehicule.dart';
import 'package:services_app/alllcategories.dart';
import 'package:services_app/fourniseur.dart';
import 'package:services_app/main.dart';
import 'allndor.dart';

class admin extends StatelessWidget {
  admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Administration"),
      // ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 4,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => adresses()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/addresse_svg.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("addresse"),
                          //Text("${user!.email}")
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 4,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => allcategories()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/category_svg.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Categorie"),
                          //Text("${user!.email}")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 4,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => allVehicule()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/icon37.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Vehicule"),
                          //Text("${user!.email}")
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 4,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => allDomestique()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/icon20.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Domestique"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 4,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => allDemenagement()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/icon11.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Demenagement"),
                          //Text("${user!.email}")
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 4,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => allAssistance()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/icon2.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Assistance administrative"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 4,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => allLocation()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/icon18.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Location de voitures"),
                          //Text("${user!.email}")
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 4,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => allMaison()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/icon21.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Maison"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => allndor()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/icon23.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("ndor"),
                          //Text("${user!.email}")
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => fourniseur()));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/icon2.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Fournisseur"),
                          //Text("${user!.email}")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white.withOpacity(1),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SvgPicture.asset(
                            'assets/icons2/logout.svg',
                            width: 30,
                            color: Colors.orange,
                          ),
                        )),
                      ),
                      Text("Se déconnecter"),
                      //Text("${user!.email}")
                    ],
                  ),
                ),
              ),
            ]),
            //     //    SizedBox(
            //     // width: MediaQuery.of(context).size.width / 3,
            //     // height: MediaQuery.of(context).size.width / 6,
            //     // child: ElevatedButton(
            //     //   onPressed: () {

            //     //   },
            //     //   child: Text("lo"),
            //     //   style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            //     // )),
            //     SizedBox(
            //       width: 20,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
