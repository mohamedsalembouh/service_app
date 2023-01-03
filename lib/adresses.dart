import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:services_app/formadmin.dart';

import 'models/addrese.dart';
import 'myMethodes.dart';

class adresses extends StatelessWidget {
  adresses({Key? key}) : super(key: key);
  final _formKey3 = new GlobalKey<FormState>();

  TextEditingController nom_adrese = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Les addresses")),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: StreamBuilder<List<addrese>>(
          stream: getAdreses(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              // List<addrese> alladreses = snapshot.data!;
              // return ListView(
              //   children: alladreses.map((e) =>buildAdrese(e) ).toList();
              // );
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white.withOpacity(1),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ListTile(
                        title: Text("${snapshot.data![index].nom}"),
                        trailing: GestureDetector(
                          onTap: () {
                            final doc_adrese = FirebaseFirestore.instance
                                .collection('addrese')
                                .doc(snapshot.data![index].id);
                            doc_adrese.delete();
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Container();
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => formAdmin("Ajouter addresse")));
          _showDialog(context);
        },
      ),
    );
  }

  Stream<List<addrese>> getAdreses() => FirebaseFirestore.instance
      .collection('addrese')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => addrese.fromJson(doc.data())).toList());

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            title: new Text("Ajouter un addresse"),
            content: SingleChildScrollView(
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  child: Form(
                    key: _formKey3,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nom_adrese,
                          decoration: InputDecoration(
                              labelText: "Nom de l'addresse",
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
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 6,
                            child: ElevatedButton(
                              onPressed: () {
                                final form = _formKey3.currentState;
                                if (form!.validate()) {
                                  createAdrese(context, nom_adrese.text);
                                  nom_adrese.clear();
                                }
                              },
                              child: Text("Ajouter"),
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder()),
                            )),
                      ],
                    ),
                  ),
                );
              }),
            ));
      },
    );
  }

  createAdrese(BuildContext context, String name) async {
    addrese adrese = addrese(nom: name);
    final doc_adrese = FirebaseFirestore.instance.collection('addrese').doc();
    adrese.id = doc_adrese.id;
    final json = adrese.toJson();
    bool a = await doesNumAlreadyExist(name);
    if (a == false) {
      await doc_adrese.set(json);
    } else {
      showText(context, "SVP", "cette nom exists");
    }
  }

  Future<bool> doesNumAlreadyExist(String name) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('addrese')
        .where('nom', isEqualTo: name)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.length >= 1) {
      return true;
    }
    return false;
  }
}
