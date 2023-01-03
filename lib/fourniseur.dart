import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:services_app/models/categorie.dart';
import 'package:services_app/models/fournisseur.dart';

class fourniseur extends StatelessWidget {
  final _formKey = new GlobalKey<FormState>();

  TextEditingController nom_fourniseur = TextEditingController();
  TextEditingController phone_fourniseur = TextEditingController();
  TextEditingController type_fourniseur = TextEditingController();
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Les Fournisseurs")),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: StreamBuilder<List<fournisseur>>(
          stream: getFournisseurs(),
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
                            final doc_four = FirebaseFirestore.instance
                                .collection('fournisseur')
                                .doc(snapshot.data![index].id);
                            doc_four.delete();
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

  Stream<List<fournisseur>> getFournisseurs() => FirebaseFirestore.instance
      .collection('fournisseur')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => fournisseur.fromJson(doc.data()))
          .toList());

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            title: new Text("Ajouter un fournisseur"),
            content: SingleChildScrollView(
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nom_fourniseur,
                          decoration: InputDecoration(
                              labelText: "Nom fournisseur",
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
                        TextFormField(
                          controller: phone_fourniseur,
                          decoration: InputDecoration(
                              labelText: "telephone",
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
                                    hint: Text("Type"),
                                    onChanged: (value) {
                                      setState(() {
                                        dropdownValue = value as String;
                                      });
                                    },
                                    items: [
                                      for (var cat in snapshot.data!)
                                        DropdownMenuItem(
                                          child: Text(cat.nom!),
                                          value: cat.nom,
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 6,
                            child: ElevatedButton(
                              onPressed: () {
                                final form = _formKey.currentState;
                                if (form!.validate()) {
                                  createfourniseur(
                                      context,
                                      nom_fourniseur.text,
                                      int.parse(phone_fourniseur.text),
                                      dropdownValue!);
                                  nom_fourniseur.clear();
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

  Stream<List<categorie>> getCategories() => FirebaseFirestore.instance
      .collection('categorie')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => categorie.fromJson(doc.data())).toList());

  createfourniseur(
      BuildContext context, String name, int phone, String type) async {
    fournisseur forns = fournisseur(nom: name, telephone: phone, type: type);
    final doc_fourn =
        FirebaseFirestore.instance.collection('fournisseur').doc();
    forns.id = doc_fourn.id;
    final json = forns.toJson();
    await doc_fourn.set(json);
    // bool a = await doesNumAlreadyExist(name);
    // if (a == false) {
    //   await doc_adrese.set(json);
    // } else {
    //   showText(context, "SVP", "cette nom exists");
    // }
  }

  // Future<bool> doesNumAlreadyExist(String name) async {
  //   final QuerySnapshot result = await FirebaseFirestore.instance
  //       .collection('addrese')
  //       .where('nom', isEqualTo: name)
  //       .get();
  //   final List<DocumentSnapshot> documents = result.docs;
  //   if (documents.length >= 1) {
  //     return true;
  //   }
  //   return false;
  // }
}
