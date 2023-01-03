import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:services_app/models/addrese.dart';
import 'package:services_app/models/transporte.dart';

class transport extends StatefulWidget {
  const transport({Key? key}) : super(key: key);

  @override
  _transportState createState() => _transportState();
}

class _transportState extends State<transport> {
  final _formKey3 = new GlobalKey<FormState>();
  TextEditingController dateInputController = TextEditingController();
  TextEditingController heure = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController prix = TextEditingController();
  TextEditingController type = TextEditingController();
  String? dropdown3;
  String? dropdown4;
  TextEditingController dateInputControllerrecherche = TextEditingController();
  TextEditingController prixrecherche = TextEditingController();
  Stream<List<transporte>>? transportes;
  @override
  Widget build(BuildContext context) {
    double padd = MediaQuery.of(context).size.width - 250;
    if (this.transportes == null) {
      this.transportes = getallTransports();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Transport"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 8,
                      child: ElevatedButton(
                        onPressed: () {
                          afficheDialog();
                        },
                        child: Text("Rechercher"),
                        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 8,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            this.transportes = getallTransports();
                          });
                        },
                        child: Text("Affiche tous"),
                        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<transporte>>(
              stream: transportes,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        DateTime dtt =
                            DateTime.parse(snapshot.data![index].dte!);
                        String dt = DateFormat("dd-MM-yyyy").format(dtt);
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white.withOpacity(1),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Depart : " +
                                      "${snapshot.data![index].depart}",
                                  // style: TextStyle(fontSize: 1),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text("Destination : " +
                                    "${snapshot.data![index].destination}"),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "prix : " + "${snapshot.data![index].prix}",
                                  // style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "date : " + "$dt",
                                  // style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),

                          //subtitle:
                        );
                      });
                } else {
                  return
                      //Container();
                      Center(
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDialog2();
        },
      ),
    );
  }

  String? dropdownValue1;
  String? dropdownValue2;
  void _showDialog2() {
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
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Form(
                      key: _formKey3,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          StreamBuilder<List<addrese>>(
                            stream: getAdreses(),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      // underline: Container(
                                      //   height: 3,
                                      //   color: Colors.deepPurpleAccent,
                                      // ),
                                      value: dropdownValue1,
                                      hint: Text("Depart"),
                                      onChanged: (value) {
                                        setState(() {
                                          dropdownValue1 = value as String;
                                        });
                                      },
                                      items: [
                                        for (var adrese in snapshot.data!)
                                          DropdownMenuItem(
                                            child: Text(adrese.nom!),
                                            value: adrese.nom,
                                          ),
                                      ],
                                    )
                                  : Container();
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          StreamBuilder<List<addrese>>(
                            stream: getAdreses(),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      // underline: Container(
                                      //   height: 3,
                                      //   color: Colors.deepPurpleAccent,
                                      // ),
                                      value: dropdownValue2,
                                      hint: Text("Destination"),
                                      onChanged: (value) {
                                        setState(() {
                                          dropdownValue2 = value as String;
                                        });
                                      },
                                      items: [
                                        for (var adrese in snapshot.data!)
                                          DropdownMenuItem(
                                            child: Text(adrese.nom!),
                                            value: adrese.nom,
                                          ),
                                      ],
                                    )
                                  : Container();
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: dateInputController,
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050));

                              if (pickedDate != null) {
                                dateInputController.text =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Entrer la date",
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
                            controller: heure,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Heure(h)",
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
                            controller: phone,
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
                            controller: place,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Nombre de place",
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
                            controller: prix,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Prix",
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
                            controller: type,
                            decoration: InputDecoration(
                                labelText: "Type de voiture",
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
                                  final form = _formKey3.currentState;
                                  if (form!.validate()) {
                                    transporte transp = transporte(
                                        depart: dropdownValue1,
                                        destination: dropdownValue2,
                                        heure: int.parse(heure.text),
                                        telephone: int.parse(phone.text),
                                        nombreplace: int.parse(place.text),
                                        prix: int.parse(prix.text),
                                        typevoiture: type.text,
                                        dte: dateInputController.text);
                                    createTransport(transp);
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text("Ajouter")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
      },
    );
  }

  Stream<List<addrese>> getAdreses() => FirebaseFirestore.instance
      .collection('addrese')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => addrese.fromJson(doc.data())).toList());

  Stream<List<transporte>> getallTransports() => FirebaseFirestore.instance
      .collection('transport')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => transporte.fromJson(doc.data())).toList());

  createTransport(transporte la7agn) async {
    final doc_transport =
        FirebaseFirestore.instance.collection('transport').doc();
    la7agn.id = doc_transport.id;
    final json = la7agn.toJson();
    //final json = {'nom': nom};
    await doc_transport.set(json);
  }

  getCasesRecherche(String? depart, String? arrive, String prix, String dte) {
    if (depart != null && arrive != null && prix.isNotEmpty && dte.isNotEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("depart", isEqualTo: depart)
          .where("destination", isEqualTo: arrive)
          .where("prix", isEqualTo: int.parse(prix))
          .where("dte", isEqualTo: dte)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    }
    // probabilite que deux ne sont pas null
    else if (depart != null && arrive != null && prix.isEmpty && dte.isEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("depart", isEqualTo: depart)
          .where("destination", isEqualTo: arrive)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart != null &&
        arrive == null &&
        prix.isNotEmpty &&
        dte.isEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("depart", isEqualTo: depart)
          .where("prix", isEqualTo: int.parse(prix))
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart != null &&
        arrive == null &&
        prix.isEmpty &&
        dte.isNotEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("depart", isEqualTo: depart)
          .where("dte", isEqualTo: dte)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart == null &&
        arrive != null &&
        prix.isNotEmpty &&
        dte.isEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("destination", isEqualTo: arrive)
          .where("prix", isEqualTo: int.parse(prix))
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart == null &&
        arrive != null &&
        prix.isEmpty &&
        dte.isNotEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("destination", isEqualTo: arrive)
          .where("dte", isEqualTo: dte)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart == null &&
        arrive == null &&
        prix.isNotEmpty &&
        dte.isNotEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("prix", isEqualTo: int.parse(prix))
          .where("dte", isEqualTo: dte)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    }
    // probabilite que 3 ne sont pas null
    else if (depart != null &&
        arrive != null &&
        prix.isNotEmpty &&
        dte.isEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("depart", isEqualTo: depart)
          .where("destination", isEqualTo: arrive)
          .where("prix", isEqualTo: int.parse(prix))
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart != null &&
        arrive != null &&
        prix.isEmpty &&
        dte.isNotEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("depart", isEqualTo: depart)
          .where("destination", isEqualTo: arrive)
          .where("dte", isEqualTo: dte)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart != null &&
        arrive == null &&
        prix.isNotEmpty &&
        dte.isNotEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("depart", isEqualTo: depart)
          .where("prix", isEqualTo: int.parse(prix))
          .where("dte", isEqualTo: dte)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart == null &&
        arrive != null &&
        prix.isNotEmpty &&
        dte.isNotEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("destination", isEqualTo: arrive)
          .where("prix", isEqualTo: int.parse(prix))
          .where("dte", isEqualTo: dte)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    }
    //probabilite que un suel n'est pas null
    else if (depart != null && arrive == null && prix.isEmpty && dte.isEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("depart", isEqualTo: depart)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart == null &&
        arrive != null &&
        prix.isEmpty &&
        dte.isEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("destination", isEqualTo: arrive)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart == null &&
        arrive == null &&
        prix.isNotEmpty &&
        dte.isEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("prix", isEqualTo: int.parse(prix))
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else if (depart == null &&
        arrive == null &&
        prix.isEmpty &&
        dte.isNotEmpty) {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .where("dte", isEqualTo: dte)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      setState(() {
        this.transportes = transports;
      });
    } else {
      Stream<List<transporte>> transports = FirebaseFirestore.instance
          .collection('transport')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => transporte.fromJson(doc.data()))
              .toList());
      return transports;
    }
  }

  void afficheDialog() {
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
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Form(
                      key: _formKey3,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          StreamBuilder<List<addrese>>(
                            stream: getAdreses(),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      // underline: Container(
                                      //   height: 3,
                                      //   color: Colors.deepPurpleAccent,
                                      // ),
                                      value: dropdown3,
                                      hint: Text("Depart"),
                                      onChanged: (value) {
                                        setState(() {
                                          dropdown3 = value as String;
                                        });
                                      },
                                      items: [
                                        for (var adrese in snapshot.data!)
                                          DropdownMenuItem(
                                            child: Text(adrese.nom!),
                                            value: adrese.nom,
                                          ),
                                      ],
                                    )
                                  : Container();
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          StreamBuilder<List<addrese>>(
                            stream: getAdreses(),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      // underline: Container(
                                      //   height: 3,
                                      //   color: Colors.deepPurpleAccent,
                                      // ),
                                      value: dropdown4,
                                      hint: Text("Destination"),
                                      onChanged: (value) {
                                        setState(() {
                                          dropdown4 = value as String;
                                        });
                                      },
                                      items: [
                                        for (var adrese in snapshot.data!)
                                          DropdownMenuItem(
                                            child: Text(adrese.nom!),
                                            value: adrese.nom,
                                          ),
                                      ],
                                    )
                                  : Container();
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: prixrecherche,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Prix",
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
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: dateInputControllerrecherche,
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050));

                              if (pickedDate != null) {
                                dateInputControllerrecherche.text =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Entrer la date",
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
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 110,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  getCasesRecherche(
                                      dropdown3,
                                      dropdown4,
                                      prixrecherche.text,
                                      dateInputControllerrecherche.text);

                                  Navigator.pop(context);
                                },
                                child: Text("Rechercher")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
      },
    );
  }
}
