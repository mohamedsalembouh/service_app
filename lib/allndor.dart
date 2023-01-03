import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'models/service.dart';

class allndor extends StatefulWidget {
  allndor({Key? key}) : super(key: key);

  @override
  State<allndor> createState() => _allndorState();
}

class _allndorState extends State<allndor> {
  final List<Tab> mytabs = [
    Tab(
      text: "privee",
    ),
    Tab(
      text: "Fournisseur",
    ),
    Tab(
      text: "public",
    )
  ];

  @override
  Widget build(BuildContext context) {
    double padd = MediaQuery.of(context).size.width - 250;
    return DefaultTabController(
      length: mytabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text("List ndor"),
            bottom: TabBar(tabs: mytabs),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  Expanded(
                    child: StreamBuilder<List<service>>(
                      stream: getServices(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) {
                                if (snapshot.data![index].status == "prive") {
                                  return GestureDetector(
                                    onTap: () {
                                      _showDialog1(txt_public, txt_fourniseur,
                                          0, 2, snapshot.data![index]);
                                    },
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.white.withOpacity(1),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${snapshot.data![index].titre}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "categorie : " +
                                                  "${snapshot.data![index].nomcat}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "telephone : " +
                                                  "${snapshot.data![index].telephone}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "commentaire : " +
                                                  "${snapshot.data![index].commentaire}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //  Padding(
                                      //   padding: EdgeInsets.only(right: padd),
                                      //   child: Container(
                                      //     child: ListTile(
                                      //       title: Column(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.start,
                                      //         children: [
                                      //           Text(
                                      //               "${snapshot.data![index].titre}"),
                                      //           Text(
                                      //             "categorie : " +
                                      //                 "${snapshot.data![index].nomcat}",
                                      //             style: TextStyle(fontSize: 18),
                                      //           ),
                                      //           SizedBox(
                                      //             height: 10,
                                      //           ),
                                      //           Text(
                                      //             "telephone : " +
                                      //                 "${snapshot.data![index].telephone}",
                                      //             style: TextStyle(fontSize: 18),
                                      //           ),
                                      //           SizedBox(
                                      //             height: 10,
                                      //           ),
                                      //           Text(
                                      //             "commentaire : " +
                                      //                 "${snapshot.data![index].commentaire}",
                                      //             style: TextStyle(fontSize: 18),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       onTap: () {
                                      //         _showDialog(
                                      //             txt1, 0, snapshot.data![index]);
                                      //       },
                                      //     ),
                                      //   ),
                                      // ),

                                      //subtitle:
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              });
                        } else {
                          return Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: StreamBuilder<List<service>>(
                      stream: getServices(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) {
                                if (snapshot.data![index].status ==
                                    "fournisseur") {
                                  return GestureDetector(
                                    onTap: () {
                                      _showDialog1(fourn_public, fourn_prive, 0,
                                          1, snapshot.data![index]);
                                    },
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.white.withOpacity(1),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${snapshot.data![index].titre}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "categorie : " +
                                                  "${snapshot.data![index].nomcat}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "telephone : " +
                                                  "${snapshot.data![index].telephone}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "commentaire : " +
                                                  "${snapshot.data![index].commentaire}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //subtitle:
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              });
                        } else {
                          return Container();
                        }
                      }),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: StreamBuilder<List<service>>(
                      stream: getServices(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) {
                                if (snapshot.data![index].status == "public") {
                                  return GestureDetector(
                                    // onTap: () {
                                    //   _showDialog(
                                    //       txt2, 1, snapshot.data![index]);
                                    // },
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.white.withOpacity(1),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${snapshot.data![index].titre}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "categorie : " +
                                                  "${snapshot.data![index].nomcat}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "telephone : " +
                                                  "${snapshot.data![index].telephone}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "commentaire : " +
                                                  "${snapshot.data![index].commentaire}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //subtitle:
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              });
                        } else {
                          return Container();
                        }
                      }),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  String txt_public = "change le status de prive a public";
  String txt_prive = "change le status de public a prive";
  String txt_fourniseur = "deplacer vers le fournisseur";
  String fourn_public = "deplacer vers public";
  String fourn_prive = "deplacer vers privee";
  void _showDialog1(
      String txt1, String txt2, int option1, int option2, service serv) {
    // flutter defined function
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            // title: new Text("Alert Dialog title"),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      changeStatus(option1, serv);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "$txt1",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      changeStatus(option2, serv);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "$txt2",
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showDialog2(String txt1, int option1, service serv) {
    // flutter defined function
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            // title: new Text("Alert Dialog title"),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      changeStatus(option1, serv);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "$txt1",
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Stream<List<service>> getServices() =>
    FirebaseFirestore.instance.collection('ndor').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => service.fromJson(doc.data())).toList());

changeStatus(int option, service serv) async {
  final doc_cat =
      FirebaseFirestore.instance.collection('ndor').doc('${serv.id}');
  if (option == 0) {
    await doc_cat.update({'status': 'public'});
  } else if (option == 1) {
    await doc_cat.update({'status': 'prive'});
  } else if (option == 2) {
    await doc_cat.update({'status': 'fournisseur'});
  }
}
