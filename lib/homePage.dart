import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:services_app/admin.dart';
import 'package:services_app/besoin.dart';
import 'package:services_app/domestique.dart';
import 'package:services_app/formulaire.dart';
import 'package:services_app/login.dart';
import 'package:services_app/maison.dart';
import 'package:services_app/ndor.dart';
import 'package:services_app/transport.dart';
import 'package:services_app/vehicule.dart';
import 'package:services_app/verifiedPage.dart';

import 'main.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedPref!.setInt("count", 0);
  }

  @override
  Widget build(BuildContext context) {
    final mytabs = [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Card(
          child: Container(
            // color: Colors.,
            child: ListView(
              children: [
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
                            width: (MediaQuery.of(context).size.width / 2) - 30,
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => vehicule()));
                                    Navigator.pushNamed(context, 'vec');
                                  },
                                  child: Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: SvgPicture.asset(
                                      'assets/icons2/icon37.svg',
                                      width: 60,
                                      // height: 50,
                                      color: Colors.orange,
                                    ),
                                    // Image.asset(
                                    //   'assets/icons/vehicule.png',
                                    //   width: 70,
                                    //   height: 60,
                                    // ),
                                  )),
                                ),
                                Text("Véhicule")
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 30,
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => domestique()));
                            },
                            child: Container(
                              width:
                                  (MediaQuery.of(context).size.width - 30) / 2,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white60),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: SvgPicture.asset(
                                      'assets/icons2/icon20.svg',
                                      width: 60,
                                      //height: 60,
                                      color: Colors.orange,
                                    ),
                                  )),
                                  Text("Domestique")
                                ],
                              ),
                            ),
                          ),
                        )),
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
                                            builder: (context) => formulaire(
                                                "Demenagement",
                                                "Demenagement")));
                                  },
                                  child: Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: SvgPicture.asset(
                                      'assets/icons2/icon11.svg',
                                      width: 60,
                                      // height: 60,
                                      color: Colors.orange,
                                    ),
                                  )),
                                ),
                                Text("Demenagement")
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 30,
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white60),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => formulaire(
                                                "Assistance administrative",
                                                "Assistance administrative")));
                                  },
                                  child: Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: SvgPicture.asset(
                                      'assets/icons2/icon2.svg',
                                      width: 60,
                                      // height: 60,
                                      color: Colors.orange,
                                    ),
                                  )),
                                ),
                                Text("Assistance administrative")
                              ],
                            ),
                          ),
                        )),
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
                                            builder: (context) => besoins()));
                                  },
                                  child: Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: SvgPicture.asset(
                                      'assets/icons2/icon4.svg',
                                      width: 60,
                                      // height: 60,
                                      color: Colors.orange,
                                    ),
                                    // Image.asset(
                                    //   'assets/icons/9ayti_svg.svg',
                                    //   width: 70,
                                    //   height: 60,
                                    //   //color: Colors.orange,
                                    // ),
                                  )),
                                ),
                                Text("9ayti")
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 30,
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white60),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => formulaire(
                                                "Location de voitures",
                                                "Location de voitures")));
                                  },
                                  child: Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: SvgPicture.asset(
                                      'assets/icons2/icon18.svg',
                                      width: 60,
                                      // height: 60,
                                      color: Colors.orange,
                                    ),
                                  )),
                                ),
                                Text("Location de voitures")
                              ],
                            ),
                          ),
                        )),
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => maison()));
                            },
                            child: Container(
                              width:
                                  (MediaQuery.of(context).size.width - 30) / 2,
                              height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: SvgPicture.asset(
                                      'assets/icons2/icon21.svg',
                                      width: 60,
                                      // height: 60,
                                      color: Colors.orange,
                                    ),
                                  )),
                                  Text("Maison")
                                ],
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 30,
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white60),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ndor()));
                                  },
                                  child: Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: SvgPicture.asset(
                                      'assets/icons2/icon23.svg',
                                      width: 60,
                                      // height: 60,
                                      color: Colors.orange,
                                    ),
                                  )),
                                ),
                                Text("ndor")
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
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
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => transport()));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon32.svg',
                                    width: 60,
                                    //height: 60,
                                    color: Colors.orange,
                                  ),
                                ))),
                            Text("la7agni")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // last of first tab
      Center(
        child: Container(
          child: Text(
              "7ALEN est une entreprise suffisament bien organisée pour répondre efficacement et rapidement a la demande de sa clientele.\n Pour cette raison,nous vous demandons de vous adresser a nous pour tous vos besoins. ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      Center(
        child: Container(
            // child: Icon(
            //   Icons.help,
            //   size: 80,
            // ),
            ),
      ),
      verifiedPage()
    ];
    return Scaffold(
      appBar: AppBar(
        title: _selectedIndex == 3
            ? Text(
                "Adminstration",
                style: TextStyle(fontSize: 25),
              )
            : Text(
                "Services",
                style: TextStyle(fontSize: 30),
              ),
      ),
      body: mytabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "A propos",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: "Aide",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Compte",
              backgroundColor: Colors.black),
        ],
      ),
    );
  }
}
