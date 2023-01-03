import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:services_app/models/vehicul.dart';

class allVehicule extends StatelessWidget {
  allVehicule({Key? key}) : super(key: key);
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
    double padd = MediaQuery.of(context).size.width - 250;
    return DefaultTabController(
      length: mytabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Les Vehicules"),
          bottom: TabBar(tabs: mytabs),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              Expanded(
                child: StreamBuilder<List<vehicul>>(
                  stream: getVehicules(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                            if (snapshot.data![index].status == "encours") {
                              // if (snapshot.data![index].type == "Assurance") {
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
                                        snapshot.data![index].img != null
                                            ? Center(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  //height: 50,
                                                  child: Image.network(
                                                    "${snapshot.data![index].img}",
                                                    fit: BoxFit.cover,
                                                    // width: 20,
                                                    // height: 20,
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
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
                                            SizedBox(
                                              height: 10,
                                            ),
                                            snapshot.data![index].longitude !=
                                                        "0.0" &&
                                                    snapshot.data![index]
                                                            .latitude !=
                                                        "0.0"
                                                ? Text(
                                                    "position : { " +
                                                        "longitude = " +
                                                        "${snapshot.data![index].longitude} " +
                                                        "latitude = " +
                                                        "${snapshot.data![index].longitude}" +
                                                        "}",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ],
                                    ),
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
                child: StreamBuilder<List<vehicul>>(
                  stream: getVehicules(),
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
                                      snapshot.data![index].img != null
                                          ? Center(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                //height: 50,
                                                child: Image.network(
                                                  "${snapshot.data![index].img}",
                                                  fit: BoxFit.cover,
                                                  // width: 20,
                                                  // height: 20,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                          SizedBox(
                                            height: 10,
                                          ),
                                          snapshot.data![index].longitude !=
                                                      "0.0" &&
                                                  snapshot.data![index]
                                                          .latitude !=
                                                      "0.0"
                                              ? Text(
                                                  "position : { " +
                                                      "longitude = " +
                                                      "${snapshot.data![index].longitude} " +
                                                      "latitude = " +
                                                      "${snapshot.data![index].longitude}" +
                                                      "}",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )
                                              : Container(),
                                        ],
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
                        child: CircularProgressIndicator(),
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
                child: StreamBuilder<List<vehicul>>(
                  stream: getVehicules(),
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
                                      snapshot.data![index].img != null
                                          ? Center(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                //height: 50,
                                                child: Image.network(
                                                  "${snapshot.data![index].img}",
                                                  fit: BoxFit.cover,
                                                  // width: 20,
                                                  // height: 20,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                          SizedBox(
                                            height: 10,
                                          ),
                                          snapshot.data![index].longitude !=
                                                      "0.0" &&
                                                  snapshot.data![index]
                                                          .latitude !=
                                                      "0.0"
                                              ? Text(
                                                  "position : { " +
                                                      "longitude = " +
                                                      "${snapshot.data![index].longitude} " +
                                                      "latitude = " +
                                                      "${snapshot.data![index].longitude}" +
                                                      "}",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )
                                              : Container(),
                                        ],
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
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void _showDialog(BuildContext context, vehicul vec) {
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
                        changeStatus(0, vec);
                        Navigator.pop(context);
                      },
                      child: Text("Termine cette demande")),
                  ElevatedButton(
                    onPressed: () {
                      changeStatus(1, vec);
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

  Stream<List<vehicul>> getVehicules() => FirebaseFirestore.instance
      .collection('vehicule')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => vehicul.fromJson(doc.data())).toList());

  changeStatus(int option, vehicul vec) async {
    final doc_cat =
        FirebaseFirestore.instance.collection('vehicule').doc('${vec.id}');
    if (option == 0) {
      await doc_cat.update({'status': 'termine'});
    } else {
      await doc_cat.update({'status': 'annuler'});
    }
  }
}
