import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:services_app/formadmin.dart';
import 'package:services_app/models/categorie.dart';

import 'myMethodes.dart';

class allcategories extends StatelessWidget {
  allcategories({Key? key}) : super(key: key);
  final _formKey3 = new GlobalKey<FormState>();
  TextEditingController nom_cat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: StreamBuilder<List<categorie>>(
          stream: getCategories(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
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
                          final doc_categorie = FirebaseFirestore.instance
                              .collection('categorie')
                              .doc(snapshot.data![index].id);
                          doc_categorie.delete();
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                });
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => formAdmin("Ajouter categorie")));
          _showDialog(context);
        },
      ),
    );
  }

  Stream<List<categorie>> getCategories() => FirebaseFirestore.instance
      .collection('categorie')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => categorie.fromJson(doc.data())).toList());

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            title: new Text("Ajouter une categorie"),
            content: SingleChildScrollView(
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  child: Form(
                    key: _formKey3,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nom_cat,
                          decoration: InputDecoration(
                              labelText: "Nom categorie",
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
                                  createCategorie(context, nom_cat.text);
                                  nom_cat.clear();
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

  createCategorie(BuildContext context, String name) async {
    categorie cat = categorie(nom: name);
    final doc_cat = FirebaseFirestore.instance.collection('categorie').doc();
    cat.id = doc_cat.id;
    final json = cat.toJson();
    bool a = await doesNumAlreadyExist(name);
    if (a == false) {
      await doc_cat.set(json);
    } else {
      showText(context, "SVP", "cette nom exists");
    }
  }

  Future<bool> doesNumAlreadyExist(String name) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('categorie')
        .where('nom', isEqualTo: name)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.length >= 1) {
      return true;
    }
    return false;
  }
}
