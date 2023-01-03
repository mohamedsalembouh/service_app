import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:services_app/models/categorie.dart';
import 'package:services_app/models/service.dart';

class ndor extends StatefulWidget {
  const ndor({Key? key}) : super(key: key);

  @override
  _ndorState createState() => _ndorState();
}

class _ndorState extends State<ndor> {
  final _formKey2 = new GlobalKey<FormState>();
  String? dropdownValue;
  TextEditingController titre_controller = TextEditingController();
  TextEditingController cat_controller = TextEditingController();
  TextEditingController telephone_controller = TextEditingController();
  TextEditingController commentaire_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double padd = MediaQuery.of(context).size.width - 250;
    return Scaffold(
        appBar: AppBar(
          title: Text("Services"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: StreamBuilder<List<service>>(
            stream: getServices(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      if (snapshot.data![index].status == "public") {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white.withOpacity(1),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].titre}",
                                    // style:
                                    //     TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "categorie : " +
                                        "${snapshot.data![index].nomcat}",
                                    // style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "telephone : " +
                                        "${snapshot.data![index].telephone}",
                                    // style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "commentaire : " +
                                        "${snapshot.data![index].commentaire}",
                                    // style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // trailing: Text("gggg"),

                          //subtitle:
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: Icon(Icons.add),
        ));
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            // title: new Text("Alert Dialog title"),
            content: SingleChildScrollView(
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titre_controller,
                        decoration: InputDecoration(
                            labelText: "Titre",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.black),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Le champ est obligatoire";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      StreamBuilder<List<categorie>>(
                        stream: getCategories(),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? DropdownButtonFormField(
                                  decoration: InputDecoration(
                                      // labelText: "Destination",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      )),
                                  isExpanded: true,
                                  elevation: 16,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  value: dropdownValue,
                                  hint: Text("Categorie"),
                                  onChanged: (value) {
                                    setState(() {
                                      dropdownValue = value as String;
                                    });
                                  },
                                  items: [
                                    for (var adrese in snapshot.data!)
                                      DropdownMenuItem(
                                        child: Text(adrese.nom!),
                                        value: adrese.nom,
                                      ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return "Le champ est obligatoire";
                                    }
                                    return null;
                                  },
                                )
                              : Container();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: telephone_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Telephone",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.black),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Le champ est obligatoire";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: commentaire_controller,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 60.0, horizontal: 10.0),
                            labelText: "Commentaire",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.black),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Le champ est obligatoire";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 110,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              final form = _formKey2.currentState;
                              if (form!.validate()) {
                                service serv = service(
                                    titre: titre_controller.text,
                                    nomcat: dropdownValue,
                                    telephone:
                                        int.parse(telephone_controller.text),
                                    commentaire: commentaire_controller.text,
                                    status: "prive");
                                createService(serv);
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Envoyer")),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
      },
    );
  }
}

Stream<List<categorie>> getCategories() => FirebaseFirestore.instance
    .collection('categorie')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => categorie.fromJson(doc.data())).toList());

createService(service serv) async {
  final doc_service = FirebaseFirestore.instance.collection('ndor').doc();
  serv.id = doc_service.id;
  final json = serv.toJson();
  //final json = {'nom': nom};
  await doc_service.set(json);
}

Stream<List<service>> getServices() =>
    FirebaseFirestore.instance.collection('ndor').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => service.fromJson(doc.data())).toList());
