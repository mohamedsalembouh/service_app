import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:services_app/main.dart';
import 'package:services_app/models/assistance.dart';
import 'package:services_app/models/categorie.dart';
import 'package:services_app/models/demenagement.dart';
import 'package:services_app/models/domestiqu.dart';
import 'package:services_app/models/location.dart';
import 'package:services_app/models/maisone.dart';
import 'package:services_app/models/vehicul.dart';
import 'package:services_app/myMethodes.dart';
import 'package:http/http.dart' as http;

class formulaire extends StatefulWidget {
  //const formulaire({ Key? key }) : super(key: key);
  String? nomForm;
  String? categrie;
  formulaire(this.categrie, this.nomForm);

  @override
  _formulaireState createState() =>
      _formulaireState(this.categrie, this.nomForm);
}

class _formulaireState extends State<formulaire> {
  String? nomForm;
  String? categorie;
  _formulaireState(this.categorie, this.nomForm);
  final _formKey = new GlobalKey<FormState>();
  bool check1 = false;
  Position? pos;
  double longitude = 0.0;
  double? latitude = 0.0;
  //int count = 0;
  XFile? image;
  String? imgUrl;
  TextEditingController nom_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController adrese_controller = TextEditingController();
  TextEditingController comentaire_controller = TextEditingController();
  TextEditingController depart_controller = TextEditingController();
  TextEditingController destination_controller = TextEditingController();
  TextEditingController duree_controller = TextEditingController();
  LocationPermission? perm;
  bool? service;
  String? mytoken = " ";
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //User user = FirebaseAuth.instance.currentUser!;
  // Stream<User?> snapshott = FirebaseAuth.instance.authStateChanges();

  //late final LocalNotificationService serviceNot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
    getToken();
    initInfo();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    } else {
      print("User not accept permission");
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mytoken = token;
        print("mytoken = $mytoken");
      });
    });
  }

  initInfo() {
    var androidInitialize =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = IOSInitializationSettings();
    var initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) async {
        try {
          if (payload != null && payload.isNotEmpty) {}
        } catch (e) {}
        return;
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("--------onMessage-----------");
      print(
          "onMessage: ${message.notification?.title}/${message.notification?.body}");
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContentTitle: true);
      AndroidNotificationDetails androidPlateformChannelSpecifics =
          AndroidNotificationDetails(
        'dbfood',
        'dbfood',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
      );
      NotificationDetails PlateformChannelSpecifics = NotificationDetails(
          android: androidPlateformChannelSpecifics,
          iOS: IOSNotificationDetails());
      await flutterLocalNotificationsPlugin.show(
          sharedPref!.getInt("count")!,
          message.notification?.title,
          message.notification?.body,
          PlateformChannelSpecifics,
          payload: message.data['body']);
    });
  }

  void sendPushMessage(String token, String body, String title) {
    try {
      http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAy9hpJ9E:APA91bFcANRjdw9M9wsSGeebCFj6TqjLcgYNChNR3pIv6Dol30hZs5nlmpfKevdv33lvw36lE-PJqW92EdtvpUx9V934ffgefo3ehKRV71QDusjUV0N3SmYQjSD2eJNn1yNhoL6mcWz6',
        },
        body: jsonEncode(<String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'status': 'done',
            'body': body,
            'title': title,
          },
          "notification": <String, dynamic>{
            "title": title,
            "body": body,
            "android_channel_id": "dbfood"
          },
          "to": token,
        }),
      );
    } catch (e) {
      if (kDebugMode) {
        print("error push notification");
      }
    }
  }

  // Future uploadImageCamera() async {
  //   try {
  //     final img = await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (img == null) return;
  //     final imgtemp = File(img.path);
  //     setState(() {
  //       this.image = imgtemp;
  //     });
  //   } on PlatformException catch (e) {
  //     print("no image uploaded: $e ");
  //   }
  // }

  // Future uploadImageGallery() async {
  //   try {
  //     final img = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (img == null) return;
  //     final imgtemp = File(img.path);
  //     setState(() {
  //       this.image = imgtemp;
  //     });
  //   } on PlatformException catch (e) {
  //     print("no image uploaded: $e ");
  //   }
  // }

  // getposition() async {
  //   service = await Geolocator.isLocationServiceEnabled();
  //   if (service == false) {
  //     showText(context, "SVP",
  //         "Activer la position sur votre appareil et autoriser la configuration de la position afin que vous puissiez nous envoyer votre emplacement");
  //   } else {
  //     perm = await Geolocator.checkPermission();
  //     if (perm == LocationPermission.denied) {
  //       perm = await Geolocator.requestPermission();
  //     } else {
  //       getLatandLong();
  //     }
  //     // else {
  //     //this.pos = await

  //     //}
  //   }
  // }

  // Future<Position> getLatandLong() async {
  //   return await Geolocator.getCurrentPosition().then((value) => value);
  // }

  // setPos() async {
  //   this.pos = await getLatandLong();
  //   // if (pos != null) {
  //   //   this.latitude = pos!.latitude;
  //   //   this.longitude = pos!.longitude;
  //   // } else {
  //   //   this.latitude = 0;
  //   //   this.longitude = 0;
  //   // }
  //   // if (pos != null) {
  //   //   this.latitude = pos!.latitude;
  //   //   this.longitude = pos!.longitude;
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.nomForm}"),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(child: myForm()))));
  }

  Widget myForm() {
    // if (categorie == "vehicule") {
    //   //showText(context, "", "hhhh");
    //   if (nomForm == "Assurance") {
    //     return Padding(
    //       padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
    //       child: Column(
    //         children: [
    //           //showText(context, title, msg),
    //           TextFormField(
    //             controller: nom_controller,
    //             decoration: InputDecoration(
    //                 labelText: "Nom",
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.white),
    //                 ),
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.black),
    //                 )),
    //             validator: (value) {
    //               if (value!.isEmpty) {
    //                 return "Le champ est obligatoire";
    //               }
    //             },
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           TextFormField(
    //             controller: phone_controller,
    //             keyboardType: TextInputType.number,
    //             decoration: InputDecoration(
    //               labelText: "Telephone",
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                 borderSide: BorderSide(color: Colors.white),
    //               ),
    //               enabledBorder: OutlineInputBorder(
    //                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                 borderSide: BorderSide(color: Colors.black),
    //               ),
    //               prefixIcon: Icon(Icons.phone),
    //             ),
    //             validator: (value) {
    //               if (value!.isEmpty) {
    //                 return "Le champ est obligatoire";
    //               }
    //             },
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           TextFormField(
    //             controller: adrese_controller,
    //             decoration: InputDecoration(
    //                 labelText: "Addresse",
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.white),
    //                 ),
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.black),
    //                 )),
    //             validator: (value) {
    //               if (value!.isEmpty) {
    //                 return "Le champ est obligatoire";
    //               }
    //               return null;
    //             },
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           //
    //           //add image picker
    //           FormBuilderImagePicker(
    //             name: "",
    //             decoration: InputDecoration(labelText: 'Ajouter image'),
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return "le champ est obligatoire";
    //               }
    //               return null;
    //             },
    //             cameraIcon: Icon(Icons.camera),
    //             maxImages: 1,
    //             onChanged: (value) {
    //               setState(() {
    //                 image = value!.first;
    //               });
    //             },
    //           ),

    //           // Container(
    //           //   margin: const EdgeInsets.all(15.0),
    //           //   padding: const EdgeInsets.all(3.0),
    //           //   decoration: BoxDecoration(
    //           //       border: Border.all(
    //           //         color: Colors.black,
    //           //       ),
    //           //       borderRadius: BorderRadius.all(Radius.circular(10))),
    //           //   child: ListTile(
    //           //     leading: GestureDetector(
    //           //       child: Icon(
    //           //         Icons.camera_alt_outlined,
    //           //         size: 30,
    //           //       ),
    //           //       onTap: () {
    //           //         uploadImageCamera();
    //           //       },
    //           //     ),
    //           //     title: Text("Ajouter une copie de carte grise"),
    //           //     trailing: GestureDetector(
    //           //       child: Icon(
    //           //         Icons.file_upload,
    //           //         size: 30,
    //           //       ),
    //           //       onTap: () {
    //           //         uploadImageGallery();
    //           //       },
    //           //     ),
    //           //   ),
    //           // ),

    //           SizedBox(
    //             height: 20,
    //           ),
    //           TextFormField(
    //             controller: comentaire_controller,
    //             decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.symmetric(
    //                     vertical: 60.0, horizontal: 10.0),
    //                 labelText: "Commentaire",
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.white),
    //                 ),
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.black),
    //                 )),
    //             validator: (value) {
    //               if (value!.isEmpty) {
    //                 return "Le champ est obligatoire";
    //               }
    //             },
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           // perm == LocationPermission.always ||
    //           //         perm == LocationPermission.unableToDetermine ||
    //           //         perm == LocationPermission.whileInUse
    //           //     ?
    //           Container(
    //             margin: const EdgeInsets.all(15.0),
    //             padding: const EdgeInsets.all(3.0),
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Colors.black,
    //                 ),
    //                 borderRadius: BorderRadius.all(Radius.circular(10))),
    //             child: CheckboxListTile(
    //               value: check1,
    //               onChanged: (bool? value) async {
    //                 setState(() {
    //                   check1 = value!;
    //                 });
    //               },
    //               title: Text("Ajouter localisation"),
    //             ),
    //           ),
    //           // : Text(
    //           //     "SVP activer la position sur votre appareil et autoriser la configuration de la position afin que vous puissiez nous envoyer votre emplacement"),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           SizedBox(
    //               width: MediaQuery.of(context).size.width / 3,
    //               height: MediaQuery.of(context).size.width / 6,
    //               child: ElevatedButton(
    //                 onPressed: () async {
    //                   final form = _formKey.currentState;
    //                   if (form!.validate()) {
    //                     if (check1 == true) {
    //                       if (service == false ||
    //                           perm == LocationPermission.denied ||
    //                           perm == LocationPermission.deniedForever) {
    //                         longitude = 0.0;
    //                         latitude = 0.0;
    //                       } else {
    //                         pos = await getLatandLong();
    //                         longitude = pos!.longitude;
    //                         latitude = pos!.latitude;
    //                       }
    //                     } else {
    //                       longitude = 0.0;
    //                       latitude = 0.0;
    //                     }
    //                     var storageImage =
    //                         FirebaseStorage.instance.ref().child(image!.path);
    //                     var task = storageImage.putFile(File(image!.path));
    //                     await task.whenComplete(() async {
    //                       var url = await storageImage.getDownloadURL();
    //                       imgUrl = url;
    //                     });
    //                     vehicul vec = vehicul(
    //                       nom: nom_controller.text,
    //                       telephone: int.parse(phone_controller.text),
    //                       addresse: adrese_controller.text,
    //                       comentaire: comentaire_controller.text,
    //                       longitude: longitude.toString(),
    //                       latitude: latitude.toString(),
    //                       type: nomForm,
    //                       status: "encours",
    //                       img: imgUrl,
    //                     );
    //                     createVehicule(vec);
    //                     if (sharedPref!.getBool("isAdmin") == true) {
    //                       sendPushMessage(
    //                           mytoken!,
    //                           "il y'a un demande de $nomForm",
    //                           "Nouveaux demande");
    //                       int count = sharedPref!.getInt("count")!;

    //                       int newcount = count + 1;
    //                       sharedPref!.setInt("count", newcount);
    //                     }
    //                     showText(context, "", "Votre demande est envoye");
    //                     nom_controller.clear();
    //                     phone_controller.clear();
    //                     adrese_controller.clear();
    //                     comentaire_controller.clear();
    //                   }
    //                 },
    //                 child: Text("Envoyer"),
    //                 style: ElevatedButton.styleFrom(shape: StadiumBorder()),
    //               )),
    //         ],
    //       ),
    //     );
    //   } else {
    //     return Padding(
    //       padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
    //       child: Column(
    //         children: [
    //           // pos==false?showText(context, "SVP", ""):Container(),
    //           TextFormField(
    //             controller: nom_controller,
    //             decoration: InputDecoration(
    //                 labelText: "Nom",
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.white),
    //                 ),
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.black),
    //                 )),
    //             validator: (value) {
    //               if (value!.isEmpty) {
    //                 return "Le champ est obligatoire";
    //               }
    //             },
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           TextFormField(
    //             controller: phone_controller,
    //             keyboardType: TextInputType.number,
    //             decoration: InputDecoration(
    //               labelText: "Telephone",
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                 borderSide: BorderSide(color: Colors.white),
    //               ),
    //               enabledBorder: OutlineInputBorder(
    //                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                 borderSide: BorderSide(color: Colors.black),
    //               ),
    //               prefixIcon: Icon(Icons.phone),
    //             ),
    //             validator: (value) {
    //               if (value!.isEmpty) {
    //                 return "Le champ est obligatoire";
    //               }
    //             },
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           TextFormField(
    //             controller: adrese_controller,
    //             decoration: InputDecoration(
    //                 labelText: "Addresse",
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.white),
    //                 ),
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.black),
    //                 )),
    //             validator: (value) {
    //               if (value!.isEmpty) {
    //                 return "Le champ est obligatoire";
    //               }
    //             },
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           TextFormField(
    //             controller: comentaire_controller,
    //             decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.symmetric(
    //                     vertical: 60.0, horizontal: 10.0),
    //                 labelText: "Commentaire",
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.white),
    //                 ),
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //                   borderSide: BorderSide(color: Colors.black),
    //                 )),
    //             validator: (value) {
    //               if (value!.isEmpty) {
    //                 return "Le champ est obligatoire";
    //               }
    //             },
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           // perm == LocationPermission.always ||
    //           //         perm == LocationPermission.unableToDetermine ||
    //           //         perm == LocationPermission.whileInUse
    //           //     ?
    //           Container(
    //             margin: const EdgeInsets.all(15.0),
    //             padding: const EdgeInsets.all(3.0),
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Colors.black,
    //                 ),
    //                 borderRadius: BorderRadius.all(Radius.circular(10))),
    //             child: CheckboxListTile(
    //               value: check1,
    //               onChanged: (bool? value) async {
    //                 setState(() {
    //                   check1 = value!;
    //                 });
    //               },
    //               title: Text("Ajouter localisation"),
    //             ),
    //           ),
    //           // : Text(
    //           //     "SVP activer la position sur votre appareil et autoriser la configuration de la position afin que vous puissiez nous envoyer votre emplacement"),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           SizedBox(
    //               width: MediaQuery.of(context).size.width / 3,
    //               height: MediaQuery.of(context).size.width / 6,
    //               child: ElevatedButton(
    //                 onPressed: () async {
    //                   final form = _formKey.currentState;
    //                   if (form!.validate()) {
    //                     if (check1 == true) {
    //                       if (service == false ||
    //                           perm == LocationPermission.denied ||
    //                           perm == LocationPermission.deniedForever) {
    //                         longitude = 0.0;
    //                         latitude = 0.0;
    //                       } else {
    //                         pos = await getLatandLong();
    //                         longitude = pos!.longitude;
    //                         latitude = pos!.latitude;
    //                       }
    //                     } else {
    //                       longitude = 0.0;
    //                       latitude = 0.0;
    //                     }
    //                     vehicul vec = vehicul(
    //                       nom: nom_controller.text,
    //                       telephone: int.parse(phone_controller.text),
    //                       addresse: adrese_controller.text,
    //                       comentaire: comentaire_controller.text,
    //                       longitude: longitude.toString(),
    //                       latitude: latitude.toString(),
    //                       type: nomForm,
    //                       status: "encours",
    //                     );

    //                     await createVehicule(vec);
    //                     if (sharedPref!.getBool("isAdmin") == true) {
    //                       sendPushMessage(
    //                           mytoken!,
    //                           "il y'a un demande de $nomForm",
    //                           "Nouveaux demande");
    //                       int count = sharedPref!.getInt("count")!;
    //                       int newcount = count + 1;
    //                       sharedPref!.setInt("count", newcount);
    //                     }
    //                     showText(context, "", "Votre demande est envoye");
    //                     nom_controller.clear();
    //                     phone_controller.clear();
    //                     adrese_controller.clear();
    //                     comentaire_controller.clear();
    //                   }
    //                 },
    //                 child: Text("Envoyer"),
    //                 style: ElevatedButton.styleFrom(shape: StadiumBorder()),
    //               )),
    //         ],
    //       ),
    //     );
    //   }
    // } else
    if (categorie == "domestique") {
      return Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              controller: nom_controller,
              decoration: InputDecoration(
                  labelText: "Nom",
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
            TextFormField(
              controller: phone_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Telephone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
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
              controller: adrese_controller,
              decoration: InputDecoration(
                  labelText: "Addresse",
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
            TextFormField(
              controller: comentaire_controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 10.0),
                  labelText: "Commentaire",
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
                  onPressed: () async {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      domestiqu dom = domestiqu(
                          nom: nom_controller.text,
                          telephone: int.parse(phone_controller.text),
                          addresse: adrese_controller.text,
                          comentaire: comentaire_controller.text,
                          type: nomForm,
                          status: "encours");
                      await createDomestique(dom);
                      if (sharedPref!.getBool("isAdmin") == true) {
                        sendPushMessage(
                            mytoken!,
                            "il y'a un demande de $nomForm",
                            "Nouveaux demande");
                        int count = sharedPref!.getInt("count")!;

                        int newcount = count + 1;
                        sharedPref!.setInt("count", newcount);
                      }
                      showText(context, "", "Votre demande est envoye");
                      nom_controller.clear();
                      phone_controller.clear();
                      adrese_controller.clear();
                      comentaire_controller.clear();
                    }
                  },
                  child: Text("Envoyer"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                )),
          ],
        ),
      );
    } else if (categorie == "Demenagement") {
      return Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              controller: nom_controller,
              decoration: InputDecoration(
                  labelText: "Nom",
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
            TextFormField(
              controller: phone_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Telephone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
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
              controller: depart_controller,
              decoration: InputDecoration(
                  labelText: "Addresse Depart",
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
            TextFormField(
              controller: destination_controller,
              decoration: InputDecoration(
                  labelText: "Addresse Destination",
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
            TextFormField(
              controller: comentaire_controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 10.0),
                  labelText: "Commentaire",
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
                  onPressed: () async {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      demenagement deme = demenagement(
                          nom: nom_controller.text,
                          telephone: int.parse(phone_controller.text),
                          depart: depart_controller.text,
                          destination: destination_controller.text,
                          comentaire: comentaire_controller.text,
                          status: "encours");
                      await createDemenagement(deme);
                      if (sharedPref!.getBool("isAdmin") == true) {
                        sendPushMessage(
                            mytoken!,
                            "il y'a un demande de $nomForm",
                            "Nouveaux demande");
                        int count = sharedPref!.getInt("count")!;
                        int newcount = count + 1;
                        sharedPref!.setInt("count", newcount);
                      }
                      showText(context, "", "Votre demande est envoye");
                      nom_controller.clear();
                      phone_controller.clear();
                      adrese_controller.clear();
                      comentaire_controller.clear();
                    }
                  },
                  child: Text("Envoyer"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                )),
          ],
        ),
      );
    } else if (categorie == "Location de voitures") {
      return Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              controller: nom_controller,
              decoration: InputDecoration(
                  labelText: "Nom",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: phone_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Telephone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
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
              controller: adrese_controller,
              decoration: InputDecoration(
                  labelText: "Addresse",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: duree_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Duree(nombres de jour)",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: comentaire_controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 10.0),
                  labelText: "Commentaire",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 6,
              child: ElevatedButton(
                onPressed: () async {
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    location loc = location(
                        nom: nom_controller.text,
                        telephone: int.parse(phone_controller.text),
                        addresse: adrese_controller.text,
                        duree: int.parse(duree_controller.text),
                        comentaire: comentaire_controller.text,
                        status: "encours");
                    await createLocation(loc);
                    if (sharedPref!.getBool("isAdmin") == true) {
                      sendPushMessage(mytoken!, "il y'a un demande de $nomForm",
                          "Nouveaux demande");
                      int count = sharedPref!.getInt("count")!;
                      int newcount = count + 1;
                      sharedPref!.setInt("count", newcount);
                    }
                    showText(context, "", "Votre demande est envoye");
                    nom_controller.clear();
                    phone_controller.clear();
                    adrese_controller.clear();
                    comentaire_controller.clear();
                  }
                },
                child: Text("Envoyer"),
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              ),
            ),
          ],
        ),
      );
    } else if (categorie == "maison") {
      return Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              controller: nom_controller,
              decoration: InputDecoration(
                  labelText: "Nom",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: phone_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Telephone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
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
              controller: adrese_controller,
              decoration: InputDecoration(
                  labelText: "Addresse",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: comentaire_controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 10.0),
                  labelText: "Commentaire",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 6,
                child: ElevatedButton(
                  onPressed: () async {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      maisone mais = maisone(
                          nom: nom_controller.text,
                          telephone: int.parse(phone_controller.text),
                          addresse: adrese_controller.text,
                          comentaire: comentaire_controller.text,
                          type: nomForm,
                          status: "encours");
                      await createMaison(mais);
                      if (sharedPref!.getBool("isAdmin") == true) {
                        sendPushMessage(
                            mytoken!,
                            "il y'a un demande de $nomForm",
                            "Nouveaux demande");
                        int count = sharedPref!.getInt("count")!;
                        int newcount = count + 1;
                        sharedPref!.setInt("count", newcount);
                      }
                      showText(context, "", "Votre demande est envoye");
                      nom_controller.clear();
                      phone_controller.clear();
                      adrese_controller.clear();
                      comentaire_controller.clear();
                    }
                  },
                  child: Text("Envoyer"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                )),
          ],
        ),
      );
    } else if (categorie == "Assistance administrative") {
      return Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              controller: nom_controller,
              decoration: InputDecoration(
                  labelText: "Nom",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: phone_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Telephone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
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
              controller: adrese_controller,
              decoration: InputDecoration(
                  labelText: "Addresse",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: comentaire_controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 10.0),
                  labelText: "Commentaire",
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
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 6,
                child: ElevatedButton(
                  onPressed: () async {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      assistance ass = assistance(
                          nom: nom_controller.text,
                          telephone: int.parse(phone_controller.text),
                          addresse: adrese_controller.text,
                          comentaire: comentaire_controller.text,
                          status: "encours");
                      await createAssistance(ass);
                      if (sharedPref!.getBool("isAdmin") == true) {
                        sendPushMessage(
                            mytoken!,
                            "il y'a un demande de $nomForm",
                            "Nouveaux demande");
                        int count = sharedPref!.getInt("count")!;
                        int newcount = count + 1;
                        sharedPref!.setInt("count", newcount);
                      }
                      showText(context, "", "Votre demande est envoye");
                      nom_controller.clear();
                      phone_controller.clear();
                      adrese_controller.clear();
                      comentaire_controller.clear();
                    }
                  },
                  child: Text("Envoyer"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                )),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  // Widget aaa() {
  //   return AlertDialog();
  // }

  createVehicule(vehicul vec) async {
    final doc_vec = FirebaseFirestore.instance.collection('vehicule').doc();
    vec.id = doc_vec.id;
    final json = vec.toJson();
    await doc_vec.set(json);
  }

  createDomestique(domestiqu dom) async {
    final doc_dom = FirebaseFirestore.instance.collection('domestique').doc();
    dom.id = doc_dom.id;
    final json = dom.toJson();
    await doc_dom.set(json);
  }

  createDemenagement(demenagement deme) async {
    final doc_dem = FirebaseFirestore.instance.collection('demenagement').doc();
    deme.id = doc_dem.id;
    final json = deme.toJson();
    await doc_dem.set(json);
  }

  createAssistance(assistance ass) async {
    final doc_ass = FirebaseFirestore.instance.collection('assistance').doc();
    ass.id = doc_ass.id;
    final json = ass.toJson();
    await doc_ass.set(json);
  }

  createLocation(location loc) async {
    final doc_loc = FirebaseFirestore.instance.collection('location').doc();
    loc.id = doc_loc.id;
    final json = loc.toJson();
    await doc_loc.set(json);
  }

  createMaison(maisone mais) async {
    final doc_mais = FirebaseFirestore.instance.collection('maison').doc();
    mais.id = doc_mais.id;
    final json = mais.toJson();
    await doc_mais.set(json);
  }
}
