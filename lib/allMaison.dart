import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:services_app/models/maisone.dart';

class allMaison extends StatelessWidget {
  allMaison({Key? key}) : super(key: key);

  final List<Tab> mytabs = [
    Tab(
      text: "En cours",
    ),
    Tab(
      text: "Termine",
    ),
    Tab(
      text: "Annuler",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: mytabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Maison"),
            bottom: TabBar(tabs: mytabs),
          ),
          body: TabBarView(children: [
            Column(
              children: [
                Expanded(
                  child: StreamBuilder<List<maisone>>(
                    stream: getMaisons(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) {
                              if (snapshot.data![index].status == "encours") {
                                return GestureDetector(
                                  onTap: () {
                                    _showDialog(context, snapshot.data![index]);
                                  },
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.white.withOpacity(1),
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "nom : " +
                                                      "${snapshot.data![index].nom}",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "${snapshot.data![index].type}",
                                                    textAlign: TextAlign.end,
                                                  )),
                                            ],
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
                                            "addresse : " +
                                                "${snapshot.data![index].addresse}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "commentaire : " +
                                                "${snapshot.data![index].comentaire}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //  Container(
                                    //   child: ListTile(
                                    //     title: Padding(
                                    //       padding: const EdgeInsets.only(),
                                    //       child: Column(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.start,
                                    //         children: [
                                    //           Text("nom : " +
                                    //               "${snapshot.data![index].nom}",
                                    //               style: TextStyle(fontSize: 18),
                                    //               ),
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
                                    //             "addresse : " +
                                    //                 "${snapshot.data![index].addresse}",
                                    //             style: TextStyle(fontSize: 18),
                                    //           ),
                                    //           SizedBox(
                                    //             height: 10,
                                    //           ),
                                    //           Text(
                                    //             "commentaire : " +
                                    //                 "${snapshot.data![index].comentaire}",
                                    //             style: TextStyle(fontSize: 18),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     trailing:
                                    //         Text("${snapshot.data![index].type}"),
                                    //     onTap: () {
                                    //       _showDialog(
                                    //           context, snapshot.data![index]);
                                    //     },
                                    //   ),
                                    // ),
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
                  child: StreamBuilder<List<maisone>>(
                    stream: getMaisons(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) {
                              if (snapshot.data![index].status == "termine") {
                                return Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.white.withOpacity(1),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.check),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "nom : " +
                                                    "${snapshot.data![index].nom}",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "${snapshot.data![index].type}",
                                                  textAlign: TextAlign.end,
                                                )),
                                          ],
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
                                          "addresse : " +
                                              "${snapshot.data![index].addresse}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "commentaire : " +
                                              "${snapshot.data![index].comentaire}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
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
                  child: StreamBuilder<List<maisone>>(
                    stream: getMaisons(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) {
                              if (snapshot.data![index].status == "annuler") {
                                return Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.white.withOpacity(1),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "nom : " +
                                                    "${snapshot.data![index].nom}",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "${snapshot.data![index].type}",
                                                  textAlign: TextAlign.end,
                                                )),
                                          ],
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
                                          "addresse : " +
                                              "${snapshot.data![index].addresse}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "commentaire : " +
                                              "${snapshot.data![index].comentaire}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
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
          ]),
        ));
  }

  void _showDialog(BuildContext context, maisone mais) {
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
                        changeStatus(0, mais);
                        Navigator.pop(context);
                      },
                      child: Text("Termine cette demande")),
                  ElevatedButton(
                    onPressed: () {
                      changeStatus(1, mais);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Annuler cette demande",
                    ),
                  ),
                ],
              ),
            ),
            actions: [],
          );
        });
  }

  changeStatus(int option, maisone mais) async {
    final doc_cat =
        FirebaseFirestore.instance.collection('maison').doc('${mais.id}');
    if (option == 0) {
      await doc_cat.update({'status': 'termine'});
    } else {
      await doc_cat.update({'status': 'annuler'});
    }
  }

  Stream<List<maisone>> getMaisons() => FirebaseFirestore.instance
      .collection('maison')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => maisone.fromJson(doc.data())).toList());
}
