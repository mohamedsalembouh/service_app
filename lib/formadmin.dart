import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:services_app/models/addrese.dart';
import 'package:services_app/models/categorie.dart';
import 'package:services_app/myMethodes.dart';

class formAdmin extends StatefulWidget {
  String? nomForm;
  formAdmin(this.nomForm);

  @override
  _formAdminState createState() => _formAdminState(nomForm);
}

class _formAdminState extends State<formAdmin> {
  String? nomForm;
  _formAdminState(this.nomForm);
  final _formKey3 = new GlobalKey<FormState>();

  TextEditingController nom_adrese = TextEditingController();
  TextEditingController nom_cat = TextEditingController();

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

  createAdrese(String name) async {
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

  createCategorie(String name) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$nomForm"),
        ),
        body: Form(
            key: _formKey3,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(child: myForm2()))));
  }

  Widget myForm2() {
    if (widget.nomForm == "Ajouter addresse") {
      return Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              controller: nom_adrese,
              decoration: InputDecoration(
                  labelText: "Nom de l'addresse",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                      createAdrese(nom_adrese.text);
                    }
                  },
                  child: Text("Ajouter"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                )),
          ],
        ),
      );
    } else if (nomForm == "Ajouter categorie") {
      return Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              controller: nom_cat,
              decoration: InputDecoration(
                  labelText: "Nom categorie",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                      createCategorie(nom_cat.text);
                    }
                  },
                  child: Text("Ajouter"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                )),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
